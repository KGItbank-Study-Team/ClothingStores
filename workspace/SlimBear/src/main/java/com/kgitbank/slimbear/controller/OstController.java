package com.kgitbank.slimbear.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.OstSerivceImpl;
import com.kgitbank.slimbear.vo.MemberCartVO;


@Controller
public class OstController {
	
	@Autowired
	private OstSerivceImpl ostService;
	
	@RequestMapping("cart")
	public String cartPage(Authentication authentication ,Model model) {
		
		
		if(authentication != null) {
			SecurityUser user = (SecurityUser)authentication.getPrincipal();
			System.out.println(user.getUid());
			System.out.println(user.getUsername());
			
			List<MemberCartVO> cardlist = ostService.getCartList(user.getUid());
			
			int totalPrice = 0;
			for(int i=0; i<cardlist.size(); ++i) {
				totalPrice += cardlist.get(i).getPrice();
			}
			
			model.addAttribute("cartList",cardlist);
			model.addAttribute("totalprice",totalPrice);
		}

		return "cart"; 
	}
	
	public int insertAddress(CartDTO cart, HttpServletRequest request) {
		
//		SlimBearUtil.appendProductCode(request.getAttribute("productUID"), request.getAttribute("color"), request.getAttribute("size"));
		
		CartDTO cartList = new CartDTO();
		cartList.setMem_uid(9767);
		cartList.setCnt(1);
		cartList.setProd_code("productCode");
		cartList.setReg_date(new Date(System.currentTimeMillis()));
		return ostService.insertAddress(cartList);
	}


	@PostMapping("/deleteSelectedItems")
	@ResponseBody
	public List<MemberCartVO> deleteSelectedItems(@RequestBody List<MemberCartVO> ctg_uid) {
	    // ctg_uid가 올바르게 전송되는지 로그로 확인
	    System.out.println("Received ctg_uid: " + ctg_uid);
	    
	    // ctg_uid에 해당하는 상품들을 삭제하고, 업데이트된 장바구니 정보를 반환
	    List<MemberCartVO> updatedCart = ostService.deleteSelectedItems(ctg_uid);

	    return updatedCart;
	}

	@PostMapping("/updateQuantity")
    @ResponseBody
    public String updateQuantity(@RequestParam long productId, @RequestParam int newQuantity) {
        // TODO: 서비스를 호출하여 해당 제품의 수량을 업데이트
        // ostService.updateQuantity(productId, newQuantity);
        
        return "Quantity updated successfully";
    }



}









