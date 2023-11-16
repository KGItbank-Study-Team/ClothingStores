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

   
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private MemberDAO memDAO;
    @Autowired
    private ProductDAO productDAO;
    
    public List<MemberCartVO> getCartList(long memberUID) {//getCartList(long memberUID) 메서드는 회원의 장바구니 목록을 가져오는 역할
    	ArrayList<MemberCartVO> list = new ArrayList<MemberCartVO>();//원의 장바구니에 담긴 각 상품의 가격 정보를 포함한 MemberCartVO 리스트를 반환
    	
    	List<CartDTO> memberCartList = cartDAO.getCartListByMemberUID(memberUID);
    	
    	System.out.println(memberCartList);
    	for(CartDTO i : memberCartList) {
    		MemberCartVO vo = new MemberCartVO();
    		
    		vo.setUid(i.getUid());
    		vo.setCnt(i.getCnt());
    		
    	  	String[] prodctInfos = SlimBearUtil.splitProductDetail(i.getProd_code());
    	  	long productUID =  Long.valueOf(prodctInfos[0]);
    	  	
    	  	ProductDTO product = productDAO.getProductByUid(productUID);
    	  	vo.setPrice(product.getPrice() * i.getCnt());
    	  	
			/* vo.setPrice(product.getPrice()); */
    	  	vo.setDesc(product.getDesc());
    	  	vo.setName(product.getName());
    	  	vo.setMaker(product.getMaker());
    	  	vo.setMain_image(product.getMain_image());
    	  	
    	  	list.add(vo);
    	  	
    	}
		
    	return list;
    }
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

}
