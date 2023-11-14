package com.kgitbank.slimbear.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.OstSerivceImpl;
import com.kgitbank.slimbear.vo.MemberCartVO;


@Controller
public class OstController {
	
	@Autowired
	private OstSerivceImpl ostService;
	
	@RequestMapping("cart")
	public String cartPage(Authentication authentication ,Model model) {
		//cartpage 메서드는 사용자의 인증 정보를 받아 해당 사용자의 장바구니 정보를 조회하고,모델에 필요한데이터를 추가함
		
		if(authentication != null) {
			SecurityUser user = (SecurityUser)authentication.getPrincipal();
			System.out.println(user.getUid());
			System.out.println(user.getUsername());
			
			List<MemberCartVO> cartlist = ostService.getCartList(user.getUid());
			
			 int totalPrice = ostService.calculateTotalPrice(cartlist);
			 String formattedTotalPrice = ostService.formatPrice(totalPrice);
			 
			 
			model.addAttribute("cartList",cartlist);
			model.addAttribute("totalprice",totalPrice);
		}

		return "cart"; 
	}
	
	/*
	 * public int insertAddress(CartDTO cart, HttpServletRequest request) {
	 * 
	 * // SlimBearUtil.appendProductCode(request.getAttribute("productUID"),
	 * request.getAttribute("color"), request.getAttribute("size"));
	 * 
	 * CartDTO cartList = new CartDTO(); cartList.setMem_uid(9767);
	 * cartList.setCnt(1); cartList.setProd_code("productCode");
	 * cartList.setReg_date(new Date(System.currentTimeMillis())); return
	 * ostService.insertAddress(cartList); }
	 */

	
	@PostMapping("/app/deleteSelectedItems")
	public String deleteSelectedItems(@RequestParam("selectedItems") String selectedItems) {
	    // 쉼표로 구분된 선택된 상품의 UID를 리스트로 변환
	    List<Long> itemIds = Arrays.stream(selectedItems.split(","))
	                                 .map(Long::parseLong)
	                                 .collect(Collectors.toList());

	    // 서비스 레이어를 통해 선택된 상품들을 삭제
	    ostService.deleteSelectedItems(itemIds);

	    return "redirect:/cart"; // 삭제 후 장바구니 페이지로 리다이렉트
	}


	@PostMapping("/updateQuantity")
    @ResponseBody
    public String updateQuantity(@RequestParam long productId, @RequestParam int newQuantity) {
        // TODO: 서비스를 호출하여 해당 제품의 수량을 업데이트
        // ostService.updateQuantity(productId, newQuantity);
        
        return "Quantity updated successfully";
    }



}









