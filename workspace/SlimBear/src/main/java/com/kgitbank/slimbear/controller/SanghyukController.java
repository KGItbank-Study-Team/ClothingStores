package com.kgitbank.slimbear.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.dto.WishDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.RSYServiceImpl;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;
import com.kgitbank.slimbear.vo.InsertCartVO;

@Controller
public class SanghyukController {
	
	@Autowired
	private SangyhyukServiceImpl sanghService;
	
	/* 상품 상세 데이터 CONTROLLER */
	@RequestMapping("product")
	public String productPage(@RequestParam("p")long productUid, HttpSession session, Model model)  {
		
		// 제품 상세 정보 조회
		ProductDTO product = sanghService.getProductByUid(productUid);	
		System.out.println("productUid: " + productUid);
		System.out.println("product: " + product);
		// 잘못된 UID일 경우 메인페이지로
		if(product == null) {
			return "redirct:/";
		}
		
		// 제품 옵션 조회
		List<ProductDetailDTO> productDetailList = sanghService.getProductDetailList(productUid);
		System.out.println("productDetailList: " + productDetailList);
		
		// 제품 색상 옵션 조회
		List<String> colorList = sanghService.getColorOptions(productUid);
		System.out.println("colorList: " + colorList);
		
		// 제품 사이즈 옵션 조회
		List<String> sizeList = sanghService.getSizeOptions(productUid);
		System.out.println("sizeList: " + sizeList);
		
		// Model에 데이터 추가
		model.addAttribute("product", product); // 상품정보
		model.addAttribute("colorList", colorList); // color 옵션리스트
		model.addAttribute("sizeList", sizeList); // size 옵션리스트

		return "productInfo"; // .jsp 생략 
	}
	
	/* 리뷰 데이터 조회 */
	@RequestMapping("product/getReview/{uid}")
	@ResponseBody
	public List<ReviewDTO> getReviews(@PathVariable("uid")long productUid, HttpSession session) {
		System.out.println("productUid: " + productUid);
		List<ReviewDTO> reviewList = sanghService.getReviewListByUid(productUid);
		System.out.println("reviewList : " + reviewList);
		return reviewList;	
	}

	/* 상품 문의 데이터 조회 */
	@RequestMapping("product/inquiry/{prod_uid}")
	@ResponseBody
	public List<Integer> getInquiryAnswerByInqrUid(@PathVariable("prod_uid")Long productUid) {
		List<Integer> inquiryList = sanghService.getInquiryListByProdUid(productUid);
		System.out.println("문의리스틔 uid : " + inquiryList);
		return inquiryList;
	}
	
	/* 문의 답변 데이터 조회 */
	@RequestMapping("product/answer")
	@ResponseBody
	public List<InquiryAnswerDTO> getInquiryAnswerByInqrUid(@RequestParam("uidList") List<Integer> uidList) {
		System.out.println("uids: " + uidList);
		
		 List<InquiryAnswerDTO> answerList = new ArrayList<>();

		    for (long uid : uidList) {
		        // 각 uid에 대한 처리
		    	List<InquiryAnswerDTO> answer = sanghService.getInquiryAnswerByInqrUid(uid);
		        answerList.addAll(answer);
		    }

		    System.out.println("answerList: " + answerList);
		    return answerList;
	}
	
	/* 장바구니 상품 추가 */
	@RequestMapping(value="insert/cart/{uid}", method=RequestMethod.POST)
	@ResponseBody
	public String insertInCart(@PathVariable("uid") long uid, InsertCartVO data, Authentication authentication) throws Exception {
		System.out.println("========장바구니 추가메서드=========");
		SecurityUser user = (SecurityUser)authentication.getPrincipal(); // 현재 로그인 되어 있는 사용자의 uid를 불러옴
		long mem_uid = user.getUid();
		// 테스트 코드
		//System.out.println("mem_uid: " + mem_uid);
		//System.out.println("data: " + data);

		String prod_code = null;
		ArrayList<HashMap<String, Object>> selectOptionList = data.getSelectOptionList();
		System.out.println("selectOptionList = " + selectOptionList);
		for(HashMap<String, Object> options : selectOptionList) {
			String color = options.get("color").toString();
			String size = options.get("size").toString();
			String cntValue = options.get("cnt").toString();
			System.out.println("cntValue: " + cntValue);
			int cnt = Integer.parseInt(cntValue);
			System.out.println("cnt: " + cnt);
			prod_code = SlimBearUtil.appendProductCode(uid, color, size);
			
			
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMem_uid(mem_uid); // Cart 테이블의 mem_uid == Member 테이블의 uid와 매칭 cartDTO 객체에 현재 로그인되어 있는 사용자의 정보 담기
			cartDTO.setProd_code(prod_code); // 상품 코드 설정
			cartDTO.setCnt(cnt);
			
			System.out.println("cartDTO: " + cartDTO);
			
			int isAreadyExited = sanghService.findCartProducts(cartDTO);
			
			System.out.println("isAreadyExited: " + isAreadyExited);
			
			if(isAreadyExited>=1) {
				return "already_existed";
			} else {
				sanghService.insertInCart(cartDTO);
				System.out.println("cartDTO" + cartDTO);
				return "addCart";
			}
		}
		return "add_success"; 
	}
	
	/* 결제버튼 클릭 시 cart에도 추가 */
	@RequestMapping(value="insert/payCart/{uid}", method=RequestMethod.POST )
	@ResponseBody
	public ArrayList<HashMap<String, Object>> insertCartWhenPay(@PathVariable("uid") long uid, InsertCartVO data, Authentication authentication) throws Exception {
		System.out.println("=========결제 버튼 메서드=========");
		HashMap<String, Object> returnList = new HashMap<>();
		ArrayList<HashMap<String, Object>> arr = new ArrayList<>();
		int totalCnt = 0;
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		long mem_uid = user.getUid();
		System.out.println("mem_uid: " + mem_uid);

		String prod_code = null;
		ArrayList<HashMap<String, Object>> selectOptionList = data.getSelectOptionList();
		System.out.println("selectOptionList = " + selectOptionList);
		
		for(HashMap<String, Object> options : selectOptionList) {
			String color = options.get("color").toString();
			String size = options.get("size").toString();
			String cntValue = options.get("cnt").toString();
			int cnt = Integer.valueOf(cntValue);
			System.out.println("cnt(현재선택한개수): " + cnt);
			
			prod_code = SlimBearUtil.appendProductCode(uid, color, size);
			System.out.println("pord_code: " + prod_code);
			
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMem_uid(mem_uid); // Cart 테이블의 mem_uid == Member 테이블의 uid와 매칭 cartDTO 객체에 현재 로그인되어 있는 사용자의 정보 담기
			cartDTO.setProd_code(prod_code); // 상품 코드 설정
			cartDTO.setCnt(cnt);
			cartDTO.setUid(uid);
			cartDTO.setReg_date(new Date(System.currentTimeMillis()));
			System.out.println("cartDTO: " + cartDTO);
			
			Integer isAreadyExited = sanghService.equalProdCnt(cartDTO); // 선택한 옵션의 상품이 카트에 몇개 있는지 확인
			System.out.println("isAreadyExited: " + isAreadyExited); 
			if(isAreadyExited > 0) {
				// 장바구니에 이미 해당 상품이 존재할 경우
				// 장바구니에 있던 동일 상품은 삭제해주기 -> 이유: 같이 결제할 예정이니까(삭제 메서드 구현해야함)
				totalCnt =  cnt + isAreadyExited;
				returnList.put("color", color);
				returnList.put("size", size);
				returnList.put("cnt", totalCnt);
				arr.add(returnList);
				System.out.println("returnList: " + arr);
				
			} else {
				sanghService.insertInCart(cartDTO);
			}
		}
		return arr;
	}	
	
	/* 위시리스트 추가 */
	@RequestMapping(value="insert/wish/{uid}", method=RequestMethod.POST)
	@ResponseBody
	public String insertInWish(@PathVariable("uid") long uid, Authentication authentication) {
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		long mem_uid = user.getUid();
		System.out.println("mem_uid: " + mem_uid);
		WishDTO wishDTO = new WishDTO();
		wishDTO.setMem_uid(mem_uid);
		wishDTO.setUid(uid);
		wishDTO.setProd_code("Test3");
		wishDTO.setReg_date(new Timestamp(System.currentTimeMillis()));
		System.out.println(wishDTO);
		int isAreadyExited = sanghService.findWishProduct(wishDTO);
		System.out.println("isAreadyExited: " + isAreadyExited);
		if(isAreadyExited>0) {
			return "already_existed";
		} else {
			sanghService.insertInWish(wishDTO);
		}
		return "add_success";
	}
	
	// 문의게시글 작성
	@PostMapping("/product/write/{uid}")
	public String submitInquiry(@ModelAttribute InquiryDTO inquiryDTO, @PathVariable("uid")long uid) {
	    // Spring Security를 통해 현재 로그인한 사용자의 ID 조회
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String currentUserId = authentication.getName();
	    
	    // 현재 로그인한 사용자의 ID를 MemberDTO의 name으로 설정
	    inquiryDTO.setWriter_id(currentUserId);
	    inquiryDTO.setReg_date(new Date());
	    inquiryDTO.setProd_uid(uid);
	    System.out.println("게시글의 상품 uid: " + uid);

	    // DAO로 전달
	    sanghService.insertInquiry(inquiryDTO);
	    
	    return "redirect:/app/board/inquiry";
	}
	// 게시글 작성 페이지
	@GetMapping(value = "/product/write")
	public String getBoardWriteForm() {
		return "productWrite";
	}
}