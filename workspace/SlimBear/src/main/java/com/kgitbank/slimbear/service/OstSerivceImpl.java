package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dao.CartDAO;
import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dao.ProductDetailDAO;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.vo.MemberCartVO;

@Service
public class OstSerivceImpl {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private MemberDAO memDAO;
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductDetailDAO productdetailDAO;
	public List<MemberCartVO> getCartList(long memberUID ) {// getCartList(long memberUID) 메서드는 회원의 장바구니 목록을 가져오는 역할
		ArrayList<MemberCartVO> list = new ArrayList<MemberCartVO>();// 원의 장바구니에 담긴 각 상품의 가격 정보를 포함한 MemberCartVO 리스트를
																		// 반환

		List<CartDTO> memberCartList = cartDAO.getCartListByMemberUID(memberUID);

		System.out.println(memberCartList);
		for (CartDTO i : memberCartList) {
			MemberCartVO vo = new MemberCartVO();

			vo.setUid(i.getUid());
			vo.setCnt(i.getCnt());

			 String[] prodctInfos = SlimBearUtil.splitProductDetail(i.getProd_code());
	            if (prodctInfos.length >= 3) {
	                vo.setColor(prodctInfos[1]);
	                vo.setSize(prodctInfos[2]);
	            }
	            long productUID = Long.valueOf(prodctInfos[0]);
			ProductDTO product = productDAO.getProductByUid(productUID);
			vo.setPrice(product.getPrice() * i.getCnt());
		
			/* vo.setPrice(product.getPrice()); */
			vo.setDesc(product.getDesc());
			vo.setName(product.getName());
			vo.setMaker(product.getMaker());
			vo.setMain_image(product.getMain_image());
			
			
			// 상품의 색상 옵션 리스트 추가
		    vo.setColorOptions(productdetailDAO.getColorOptions(productUID));

		    // 상품의 크기 옵션 리스트 추가
		    vo.setSizeOptions(productdetailDAO.getSizeOptions(productUID));
		    
		    
		    
			list.add(vo);

		}

		return list;
	}
	public void updateCartItemOptions(long uid, String color, String size) {
        // 여기에 실제 업데이트 로직을 추가하세요.
        // 새로운 prod_code 생성 및 업데이트
		String updatedProdCode = SlimBearUtil.appendProductCode(uid, color, size);
        cartDAO.updateCartItemOptions(uid, updatedProdCode);
    }
	/*
	 * public void updateCartItemOptions(long uid, String color, String size) { //
	 * 여기에 실제 업데이트 로직을 추가하세요. cartDAO.updateCartItemOptions(uid, color, size); }
	 */



	


	public int calculateTotalPrice(List<MemberCartVO> cartList) {
		int totalPrice = 0;
		for (MemberCartVO cartItem : cartList) {
			totalPrice += cartItem.getPrice();
		}
		return totalPrice;
	}

	public String formatPrice(int price) {
		// 필요한 포맷팅 로직 추가
		return String.format("%,d원", price);
	}

	public int deleteSelectedItems(List<Long> itemIds) {
		int deletedItemCount = 0;
		for (Long itemId : itemIds) {
			deletedItemCount += cartDAO.deleteCartItem(itemId);
		}
		return deletedItemCount;
	}

	public void deleteCartItem(long cartUId) {
		// 여기에 삭제 로직 구현
		cartDAO.deleteCartItem(cartUId);
	}

	public void updateCartItemQuantity(long productId, int newQuantity) {
		cartDAO.updateCartItemQuantity(productId, newQuantity);
	}

	public void updateCartItem(long productId, int newQuantity) {
		cartDAO.updateCartItemQuantity(productId, newQuantity);
	}
	// 새로 추가된 메서드
    public List<CartDTO> getCartListByMemberUID(long memberUID) {
        return cartDAO.getCartListByMemberUID(memberUID);
    }

    public List<ProductDetailDTO> getProductDetailList() {
        return cartDAO.getproductdetail();
    }
    public List<String> getSizeOptionList() {
        // 여기에서 적절한 방식으로 사이즈 옵션 리스트를 가져오는 코드를 구현해야 합니다.
        // 예를 들어, ProductDetailDAO나 ProductService를 이용하여 데이터를 가져올 수 있습니다.
        // 아래는 가상의 코드이며, 실제로는 데이터를 어떻게 가져올지에 따라 수정해야 합니다.
        return Arrays.asList(); // 가상의 리스트를 반환하고 있습니다.
    }
    
}
