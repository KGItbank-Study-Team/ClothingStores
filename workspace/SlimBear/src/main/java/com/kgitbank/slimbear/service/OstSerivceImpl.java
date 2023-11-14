package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dao.CartDAO;
import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.vo.MemberCartVO;

@Service
public class OstSerivceImpl {

    private List<MemberCartVO> cartList = new ArrayList<>();
    
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private MemberDAO memDAO;
    @Autowired
    private ProductDAO productDAO;
    
    public List<MemberCartVO> getCartList(long memberUID) {
    	ArrayList<MemberCartVO> list = new ArrayList<MemberCartVO>();
    	
    	List<CartDTO> memberCartList = cartDAO.getCartListByMemberUID(memberUID);
    	
    	System.out.println(memberCartList);
    	for(CartDTO i : memberCartList) {
    		MemberCartVO vo = new MemberCartVO();
    		
    		vo.setUid(i.getUid());
    		
    	  	String[] prodctInfos = SlimBearUtil.splitProductDetail(i.getProd_code());
    	  	long productUID =  Long.valueOf(prodctInfos[0]);
    	  	
    	  	ProductDTO product = productDAO.getProductByUid(productUID);
    	  	vo.setPrice(product.getPrice());
    	  	
    	  	list.add(vo);
    	  	
    	}
		
    	return list;
    }
    public int insertAddress(CartDTO cart) {
    	return cartDAO.insertAddress(cart);
    }
    
    public List<MemberCartVO> getCart() {
        return cartList;
    }

    public List<MemberCartVO> deleteSelectedItems(List<MemberCartVO> ctg_uid) {
        System.out.println("Received ctg_uid: " + ctg_uid);

        List<MemberCartVO> updatedCart = new ArrayList<>();

        // ctg_uid에 해당하는 상품들을 삭제하고, 업데이트된 장바구니 정보를 반환
        for (MemberCartVO cartItem : cartList) {
            if (!ctg_uid.contains(cartItem.getUid())) {
                updatedCart.add(cartItem);
            }
        }
        cartList = updatedCart;

        return updatedCart;
    }

    // 해당 제품의 수량을 업데이트하는 메서드 추가
    public void updateQuantity(long productId, int newQuantity) {
        for (MemberCartVO cartItem : cartList) {
            if (cartItem.getUid() == productId) {
                // 수량을 업데이트하고 totalprice도 다시 계산
                int quantityDiff = newQuantity - cartItem.getQuantity();
                cartItem.setQuantity(newQuantity);
                cartItem.setTotalprice(cartItem.getTotalprice() + (quantityDiff * cartItem.getPrice()));
                break;  // 해당 제품을 찾았으므로 반복 중단
            }
        }
        //ostRepository.updateQuantity(productId, newQuantity); 데이터베이스 업데이트 로직을 추가할 수 있음
    }
  
}
