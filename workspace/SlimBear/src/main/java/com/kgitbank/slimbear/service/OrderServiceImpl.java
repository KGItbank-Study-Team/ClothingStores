package com.kgitbank.slimbear.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.common.SlimBearEnum;
import com.kgitbank.slimbear.common.SlimBearImportPayment;
import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dao.CartDAO;
import com.kgitbank.slimbear.dao.MemberCouponDAO;
import com.kgitbank.slimbear.dao.OrderDAO;
import com.kgitbank.slimbear.dao.OrderDetailDAO;
import com.kgitbank.slimbear.dao.OrderPaymentDAO;
import com.kgitbank.slimbear.dao.ProductDetailDAO;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.MemberCouponDTO;
import com.kgitbank.slimbear.dto.OrderDTO;
import com.kgitbank.slimbear.dto.OrderDetailDTO;
import com.kgitbank.slimbear.dto.OrderPaymentDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.exception.SlimBearException;
import com.kgitbank.slimbear.vo.MemberCartVO;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private SlimBearImportPayment slimBearImportPayment;

	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	@Autowired
	private OrderPaymentDAO paymentDAO;
	@Autowired
	private ProductDetailDAO productDetailDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private MemberCouponDAO memCouponDAO;

	@Override
	public void productOrder(long mem_uid, String imp_uid, OrderDTO order, OrderPaymentDTO payment, List<MemberCartVO> carts, long applyCouponUID) {
		try {
			IamportResponse<Payment> realPayment = slimBearImportPayment.getPaymentRecord(imp_uid);

			// 주문정보과 결제정보 비교
			if (realPayment.getResponse().getAmount().intValue() == payment.getPrice()) { // 주문정보 저장 실행

				orderDAO.insertOrder(order);
				payment.setOrder_uid(order.getUid());
				paymentDAO.insertOrder(payment);
				
				// 쿠폰 사용처리
				MemberCouponDTO memCoupon = new MemberCouponDTO();
				memCoupon.setUid(applyCouponUID);
				memCoupon.setUse_date(new Date(System.currentTimeMillis()));
				memCouponDAO.updateUseDate(memCoupon);

				// 제품 확인 및 재고 수정
				for (int i = 0; i < carts.size(); ++i) {
					ProductDetailDTO productDetail = productDetailDAO.getProductDetail(carts.get(i).getProductUid(),
							carts.get(i).getColor(), carts.get(i).getSize());

					if (productDetail == null) {
						throw new SlimBearException("주문실패 : 없는 제품");
					}

					if (productDetail.getCnt() < carts.get(i).getCnt()) {
						throw new SlimBearException("주문실패 : 재고 부족");
					}

					productDetail.setCnt(productDetail.getCnt() - carts.get(i).getCnt());
					productDetailDAO.updateProductDetail(productDetail);

					OrderDetailDTO orderDetail = new OrderDetailDTO();
					orderDetail.setOrder_uid(order.getUid());
					orderDetail.setProd_code(SlimBearUtil.appendProductCode(carts.get(i).getProductUid(),
							carts.get(i).getColor(), carts.get(i).getSize()));
					orderDetail.setCnt(carts.get(i).getCnt());
					orderDetail.setTotal_price(carts.get(i).getTotalprice());
					orderDetailDAO.insertOrder(orderDetail);

					// 카트수정
					CartDTO cart = cartDAO.getCartByProdCode(SlimBearUtil.appendProductCode(carts.get(i).getProductUid(), carts.get(i).getColor(), carts.get(i).getSize()));
					if (cart != null) {
						if (cart.getCnt() <= productDetail.getCnt()) {
							cartDAO.deleteCartItem(cart.getUid());
						} else {
							cart.setCnt(cart.getCnt() - productDetail.getCnt());
							cartDAO.updateCartItemQuantity(cart.getUid(), cart.getCnt());
						}
					}
				}

			} else {
				throw new SlimBearException("유효하지 않은 주문 정보");
			}
		} catch (Exception e) {
			try {
				slimBearImportPayment.refundRequest(order.getCode(), "주문정보 저장실패");
				throw new SlimBearException("주문정보 저장실패");
			} catch (Exception e2) {
				throw new SlimBearException(e2.getMessage());
			}
		}
	}
	
	@Override
	public void orderCancel(long order_uid, String reason) {
		OrderDTO order = orderDAO.getOrderByUID(order_uid);
		if(order == null) 
			throw new SlimBearException("잘못된 주문 정보");
		
		order.setStatus(SlimBearEnum.ORDER_STATUS.CANCEL.toString());
		
		
		OrderPaymentDTO payment = paymentDAO.getPaymentByOrderUID(order_uid);
		if(payment == null) 
			throw new SlimBearException("잘못된 주문 정보");
		
		payment.setStatus(SlimBearEnum.PAYMENT_STATUS.CANCEL.toString());
		

		// 물품 반환
	    List<OrderDetailDTO> orderProducts =	orderDetailDAO.getOrderListByMemberUID(order_uid);
	    for(OrderDetailDTO orderProduct : orderProducts) {
	    	String[] prodInfo = SlimBearUtil.splitProductDetail( orderProduct.getProd_code());
	    	ProductDetailDTO productDetail = productDetailDAO.getProductDetail(Long.valueOf(prodInfo[0]),prodInfo[1], prodInfo[2]);
	    	if(productDetail == null) {
	    		throw new SlimBearException("잘못된 주문 정보");
	    	}
	    	
	    	productDetail.setCnt(productDetail.getCnt() + orderProduct.getCnt());
			productDetailDAO.updateProductDetail(productDetail);
	    }
	    
		orderDAO.updateOrderStatus(order);
		paymentDAO.updatePaymentStatus(payment);
		
		try {
			slimBearImportPayment.refundRequest(order.getCode(), reason);
		} catch (Exception e2) {
			throw new SlimBearException("주문 취소 실패");
		}
	}
	
	@Override
	public void orderReturn(long order_uid, String reason) {
		OrderDTO order = orderDAO.getOrderByUID(order_uid);
		if(order == null) 
			throw new SlimBearException("잘못된 주문 정보");
		
		order.setStatus(SlimBearEnum.ORDER_STATUS.RETURN.toString());
		
		OrderPaymentDTO payment = paymentDAO.getPaymentByOrderUID(order_uid);
		if(payment == null) 
			throw new SlimBearException("잘못된 주문 정보");
		
		payment.setStatus(SlimBearEnum.PAYMENT_STATUS.RETURN.toString());
		
		// 물품 반환
	    List<OrderDetailDTO> orderProducts =	orderDetailDAO.getOrderListByMemberUID(order_uid);
	    for(OrderDetailDTO orderProduct : orderProducts) {
	    	String[] prodInfo = SlimBearUtil.splitProductDetail( orderProduct.getProd_code());
	    	ProductDetailDTO productDetail = productDetailDAO.getProductDetail(Long.valueOf(prodInfo[0]),prodInfo[1], prodInfo[2]);
	    	if(productDetail == null) {
	    		throw new SlimBearException("잘못된 주문 정보");
	    	}
	    	
	    	productDetail.setCnt(productDetail.getCnt() + orderProduct.getCnt());
			productDetailDAO.updateProductDetail(productDetail);
	    }
		
		orderDAO.updateOrderStatus(order);
		paymentDAO.updatePaymentStatus(payment);
		
		try {
			slimBearImportPayment.refundRequest(order.getCode(), reason);
		} catch (Exception e2) {
			throw new SlimBearException("반품 실패");
		}
	}

	@Override
	public void orderStatusChange(Long orderUID, String status) {
		OrderDTO order = orderDAO.getOrderByUID(orderUID);
		if(order == null) 
			throw new SlimBearException("잘못된 주문 정보");
	
		order.setStatus(status);
		
		orderDAO.updateOrderStatus(order);
	}
}
