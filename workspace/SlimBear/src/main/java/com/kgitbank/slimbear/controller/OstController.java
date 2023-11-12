package com.kgitbank.slimbear.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.service.OstSerivceImpl;
import com.kgitbank.slimbear.vo.MemberCartVO;


@Controller
public class OstController {
	
	@Autowired
	private OstSerivceImpl ostService;
	
	@RequestMapping("cart")
	public String cartPage(Model model) {
		List<MemberCartVO> cardlist = ostService.getCart();
		
		int totalPrice = 0;
		for(int i=0; i<cardlist.size(); ++i) {
			totalPrice += cardlist.get(i).getPrice();
		}
		
		model.addAttribute("cartList",cardlist);
		model.addAttribute("totalprice",totalPrice);
		
		return "cart"; 
	}
	
	@RequestMapping(value = "/deleteSelectedItems", method = RequestMethod.POST)
	@ResponseBody
	public List<MemberCartVO> deleteSelectedItems(@RequestParam List<Long> ctg_uid) {
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









