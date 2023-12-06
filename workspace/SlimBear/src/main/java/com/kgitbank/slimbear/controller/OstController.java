package com.kgitbank.slimbear.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.OstSerivceImpl;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;
import com.kgitbank.slimbear.vo.MemberCartVO;


@Controller
public class OstController {
	
	@Autowired
	private OstSerivceImpl ostService;
	
	@Autowired
	private SangyhyukServiceImpl sanghService;
	
	@RequestMapping("cart")
	public String cartPage(Authentication authentication ,Model model) {
		//cartpage 메서드는 사용자의 인증 정보를 받아 해당 사용자의 장바구니 정보를 조회하고,모델에 필요한데이터를 추가함
		
		if(authentication != null) {
			SecurityUser user = (SecurityUser)authentication.getPrincipal();
			
			
			
			List<MemberCartVO> cartlist = ostService.getCartList(user.getUid());
			
			 int totalPrice = ostService.calculateTotalPrice(cartlist);
			 String formattedTotalPrice = ostService.formatPrice(totalPrice);
			 
			 
			model.addAttribute("cartList",cartlist);
			model.addAttribute("totalprice",totalPrice);
		}
		
		return "cart"; 
	}
	

	
	@RequestMapping(value = "/updateQuantity", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateQuantity(@RequestParam long productId, @RequestParam int newQuantity, Model model, Authentication authentication) {
	    if (authentication != null) {
	        SecurityUser user = (SecurityUser) authentication.getPrincipal();

	        // 서비스를 호출하여 수량을 업데이트
	        ostService.updateCartItem(productId, newQuantity);

	        // "cart" 페이지로 리다이렉션
	        return "redirect:/app/cart";
	    } else {
	        // 사용자 정보가 없을 경우 처리 (예: 로그인 페이지로 리다이렉션)
	        return "redirect:/app/login";
	    }
	}
	
	@PostMapping("/app/updateQuantity")
	@ResponseBody
	public ResponseEntity<String> updateQuantity(@RequestParam long productId, @RequestParam int quantity) {
	    // 여기에 수량 업데이트 로직을 추가하고 성공 여부에 따라 응답을 보냄
	    ostService.updateCartItemQuantity(productId, quantity);
	    return new ResponseEntity<>("수량이 업데이트되었습니다.", HttpStatus.OK);
	}
	// OstController.java

	@PostMapping("/deleteSelectedItems")
    @ResponseBody
    public ResponseEntity<String> deleteItems(@RequestParam("selectedItems") String selectedItems) {
        List<Long> itemIds = Arrays.stream(selectedItems.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());

        int deletedItemCount = ostService.deleteSelectedItems(itemIds);

        if (deletedItemCount > 0) {
            return new ResponseEntity<>("선택된 상품이 삭제되었습니다.", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("선택된 상품 삭제에 실패했습니다.", HttpStatus.BAD_REQUEST);
        }
    }
	@GetMapping("/cartList")
    public String getCartList(Model model) {
        // 여기서 서비스의 메서드를 호출하여 데이터를 가져옵니다.
        List<MemberCartVO> cartList = ostService.getCartList(1); // 여기에 회원 UID를 넣어주세요.
        
        List<String> sizeOptionList = ostService.getSizeOptionList();

        // 모델에 데이터를 추가하여 화면으로 전달합니다.
        model.addAttribute("cartList", cartList);
        model.addAttribute("sizeOptionList", sizeOptionList);
        // "cartList"는 Thymeleaf에서 사용할 변수 이름입니다.
        return "cartList";
    }
	@PostMapping("/updateCartItemOptions")
    @ResponseBody
    public ResponseEntity<String> updateCartItemOptions(@RequestParam long cartUid,@RequestParam long productUid,
            @RequestParam String color, @RequestParam String size) {
        // 여기에 옵션 업데이트 로직을 추가하고 성공 또는 실패에 따라 응답을 보냄
        ostService.updateCartItemOptions(cartUid, productUid,color, size);
        return new ResponseEntity<>("옵션이 업데이트되었습니다.", HttpStatus.OK);
    }
	@PostMapping("/addChangedOptions")
	@ResponseBody
	public ResponseEntity<String> addChangedOptions(@RequestParam long cartUid, @RequestParam long productUid,
	        @RequestParam String color, @RequestParam String size) {
	    // 추가적인 로직을 여기에 추가하고 성공 또는 실패에 따른 응답을 반환합니다.
	    ostService.addChangedOptions(cartUid, productUid, color, size);
	    return new ResponseEntity<>("변경된 옵션이 추가되었습니다.", HttpStatus.OK);
	}
	@PostMapping("/addCartItem")
	@ResponseBody
	public ResponseEntity<String> addCartItem(
	        @RequestParam long cartUid,
	        @RequestParam long productUid,
	        @RequestParam String color,
	        @RequestParam String size,
	        Authentication authentication) {

	    if (authentication != null) {
	        SecurityUser user = (SecurityUser) authentication.getPrincipal();
	       

	        // 여기에서 memUid 값을 사용하여 로직을 처리
	        //ostService.addCartItem(cartUid, productUid, color, size);

	        return new ResponseEntity<>("카트에 상품이 추가되었습니다.", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
	    }
	}
	@PostMapping("/deleteOldItems")
	public ResponseEntity<?> deleteOldItems(@RequestParam("deleteBefore") String deleteBefore) {
	    try {
	        // deleteBefore 문자열을 Date로 변환
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
	        Date deleteBeforeDate = dateFormat.parse(deleteBefore);

	        // 30일 이전 제품 삭제 로직 추가
	        // 예를 들어, CartDAO에서 해당 날짜 이전의 장바구니 아이템을 삭제하는 메서드를 호출하는 등

	        return ResponseEntity.ok("Success");
	    } catch (ParseException e) {
	        return ResponseEntity.badRequest().body("Invalid date format");
	    }
	}

}

