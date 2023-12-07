package com.kgitbank.slimbear.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.slimbear.common.SlimBearS3;
import com.kgitbank.slimbear.common.SlimBearUtil;
import com.kgitbank.slimbear.dto.CartDTO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.InquiryAnswerDTO;
import com.kgitbank.slimbear.dto.InquiryDTO;
import com.kgitbank.slimbear.dto.OrderDetailDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.dto.ReviewDTO;
import com.kgitbank.slimbear.dto.WishDTO;
import com.kgitbank.slimbear.security.SecurityUser;
import com.kgitbank.slimbear.service.ProductService;
import com.kgitbank.slimbear.service.ReviewService;
import com.kgitbank.slimbear.vo.InsertCartVO;

@Controller
@RequestMapping("")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private SlimBearS3 slimbearS3;
		
	@RequestMapping("")
	public String productPage(@RequestParam("p")long productUid, Model model) {
		
		ProductDTO product = productService.getProductByUid(productUid);
		
		
		// 잘못된 UID일 경우 메인페이지로
		if(product == null) {
			return "redirct:/";
		}
		
		model.addAttribute("product", product);
		
		return "productInfo";
	}
	
	@RequestMapping("product/category") // 상품 목록
	public String categoryPage01(@RequestParam(name = "category", required=false) Long category,
			@RequestParam(name = "order", required = false) String order,
			@RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset,
			Integer pageSize, Model model) {

		if (offset == null) {
			offset = 0;
		}
		pageSize = 12; // 페이지 당 아이템 수

		// 페이징에 관련된 정보 추가
		int totalItems = productService.getTotalItems(category); // 전체아이템 수
		int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 전체 페이지 수
		int pageBlockSize = 5; // 보여질 페이지 블록 크기

		// 현재 페이지 블록의 시작 페이지와 끝 페이지 계산
		int startPage = ((currentPage - 1) / pageBlockSize) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPages);

		// 다음 페이지 블록이 있는지 여부
		boolean hasNextBlock = endPage < totalPages;

		List<ProductDTO> productList = productService.getProductListByCategory(category, order, currentPage, offset,
				pageSize);

		model.addAttribute("order", order);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("hasNextBlock", hasNextBlock);
		model.addAttribute("productList", productList);
		model.addAttribute("totalItems", totalItems);

		List<CategoryDTO> categoryList = productService.getSubCategoryListByTopCtgUid(category);

		model.addAttribute("categoryList", categoryList);

		List<ProductDTO> bestProductList = productService.getBestProductListByCategory(category);

		model.addAttribute("bestProductList", bestProductList);

		CategoryDTO topCategory = productService.getCategoryByUid(category);
		model.addAttribute("category", topCategory);

		
		return "category";
	}
	
	/* 상품 상세 데이터 CONTROLLER */
	@RequestMapping("product")
	public String productPage(@RequestParam("p")long productUid, HttpSession session, Model model)  {
		
		// 제품 상세 정보 조회
		ProductDTO product = reviewService.getProductByUid(productUid);	
		
		
		// 잘못된 UID일 경우 메인페이지로
		if(product == null) {
			return "redirct:/";
		}
		
		// 제품 옵션 조회
		List<ProductDetailDTO> productDetailList = reviewService.getProductDetailList(productUid);
		
		
		// 제품 색상 옵션 조회
		List<String> colorList = reviewService.getColorOptions(productUid);
		
		
		// 제품 사이즈 옵션 조회
		List<String> sizeList = reviewService.getSizeOptions(productUid);
		
		
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
		
		List<ReviewDTO> reviewList = reviewService.getReviewListByUid(productUid);
		
		return reviewList;	
	}

	/* prod_uid에 대한 상품 문의 데이터 조회 */
	@RequestMapping("product/inquiry/{prod_uid}")
	@ResponseBody
	public List<InquiryDTO> getInquiryListByProdUid(@PathVariable("prod_uid")Long productUid) {
		List<InquiryDTO> inquiryList = reviewService.getInquiryListByProdUid(productUid);
		
		return inquiryList;
	}
	
	/* 문의 답변 데이터 조회 */
	@RequestMapping(value = "product/answer", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody	
	public List<InquiryAnswerDTO> getInquiryAnswerByInqrUid(@RequestBody List<InquiryDTO> inquiryList) {
		
		
		 List<InquiryAnswerDTO> answerList = new ArrayList<>();

		    for (InquiryDTO inquiry : inquiryList) {
		        long uid = inquiry.getUid();
		    	List<InquiryAnswerDTO> answer = reviewService.getInquiryAnswerByInqrUid(uid);
		        answerList.addAll(answer);
		        
		    }
		    
		    return answerList;
	}
	
	/* 장바구니 상품 추가 */
	@RequestMapping(value="insert/cart/{uid}", method=RequestMethod.POST)
	@ResponseBody
	public String insertInCart(@PathVariable("uid") long uid, InsertCartVO data, Authentication authentication) throws Exception {
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal(); // 현재 로그인 되어 있는 사용자의 uid를 불러옴
		long mem_uid = user.getUid();

		String prod_code = null;
		ArrayList<HashMap<String, Object>> selectOptionList = data.getSelectOptionList();
		
		for(HashMap<String, Object> options : selectOptionList) {
			String color = options.get("color").toString();
			String size = options.get("size").toString();
			String cntValue = options.get("cnt").toString();
			
			int cnt = Integer.parseInt(cntValue);
			
			prod_code = SlimBearUtil.appendProductCode(uid, color, size); //상품코드, 색상, 사이즈
			
			
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMem_uid(mem_uid); // Cart 테이블의 mem_uid == Member 테이블의 uid와 매칭 cartDTO 객체에 현재 로그인되어 있는 사용자의 정보 담기
			cartDTO.setProd_code(prod_code); // 상품 코드 설정
			cartDTO.setCnt(cnt);
			
			
			
			int isAreadyExited = reviewService.findCartProducts(cartDTO);
			
			
			
			if(isAreadyExited>=1) {
				return "already_existed";
			} else {
				reviewService.addCartItem(mem_uid, prod_code, cnt);
				
				return "add_success";
			}
		}
		return "add_success"; 
	}
	
	/* 결제버튼 클릭 시 cart에도 추가 */
	@RequestMapping(value="insert/payCart/{uid}", method=RequestMethod.POST )
	@ResponseBody
	public ArrayList<HashMap<String, Object>> insertCartWhenPay(@PathVariable("uid") long uid, InsertCartVO data, Authentication authentication) throws Exception {
		HashMap<String, Object> res = new HashMap<String, Object>();
		
		
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		long mem_uid = user.getUid();
		
		
		String prod_code = null;
		ArrayList<HashMap<String, Object>> selectOptionList = data.getSelectOptionList();
		
		
		for(HashMap<String, Object> options : selectOptionList) { // 옵션요소값을 받아 prod_code를 만듬
			String color = options.get("color").toString();
			String size = options.get("size").toString();
			String cntValue = options.get("cnt").toString();
			int cnt = Integer.valueOf(cntValue);
			
			
			prod_code = SlimBearUtil.appendProductCode(uid, color, size);
			
			
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMem_uid(mem_uid); // Cart 테이블의 mem_uid == Member 테이블의 uid와 매칭 cartDTO 객체에 현재 로그인되어 있는 사용자의 정보 담기
			cartDTO.setProd_code(prod_code); // 상품 코드 설정
			cartDTO.setCnt(cnt);
			cartDTO.setUid(uid);
			cartDTO.setReg_date(new Date(System.currentTimeMillis()));
			
			
			//선택한 옵션과 같은 옵션이 장바구니에 몇개 있는지 조회
            CartDTO containCart = reviewService.getCartByProdCode(mem_uid, prod_code); 
			
			
			if(containCart != null) {
				// 장바구니에 이미 해당 상품이 존재할 경우
				// 장바구니에 있던 동일 상품은 삭제해주기 -> 이유: 같이 결제할 예정이니까(삭제 메서드 구현해야함)
				options.put("containCnt", containCart.getCnt());
			} 
			
			reviewService.addCartItem(mem_uid, prod_code, cnt);
		}
		
		return data.getSelectOptionList();
	}	
	
	/* 위시리스트 추가 */
	@RequestMapping(value="insert/wish/{uid}", method=RequestMethod.POST)
	@ResponseBody
	public String insertInWish(@PathVariable("uid") long uid, Authentication authentication) {
		SecurityUser user = (SecurityUser)authentication.getPrincipal();
		long mem_uid = user.getUid();
		
		WishDTO wishDTO = new WishDTO();
		wishDTO.setMem_uid(mem_uid);
		wishDTO.setUid(uid);
		
		wishDTO.setProd_code(String.valueOf(uid));
		wishDTO.setReg_date(new Date());
		
		
		int isAreadyExited = reviewService.findWishProduct(wishDTO);
		
		if(isAreadyExited>0) {
			return "already_existed";
		} else {
			reviewService.insertInWish(wishDTO);
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
	    

	    // DAO로 전달
	    reviewService.insertInquiry(inquiryDTO);
	    return "redirect:/app/product?p=" + uid;
	}
	// 게시글 작성 페이지
	@GetMapping(value = "/product/write")
	public String getBoardWriteForm() {
		return "productWrite";
	}
	
	@RequestMapping("/member/reviewWrite/{orderUID}/{productCode}/{cnt}")
	public String getOrderDetail(@PathVariable long orderUID, @PathVariable String productCode, @PathVariable int cnt, Authentication authentication, Model model) {
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		
		String[] productCodeInfo = SlimBearUtil.splitProductDetail(productCode);
		Long ProductUID = Long.valueOf(productCodeInfo[0]);
		String productColor = productCodeInfo[1];
		String productSize = productCodeInfo[2];
		
		ProductDTO product = reviewService.getProduct(ProductUID);
		
		
		model.addAttribute("prodCode", productCode);
		model.addAttribute("product", product);
		model.addAttribute("color", productColor);
		model.addAttribute("size", productSize);
		model.addAttribute("cnt", cnt);
		model.addAttribute("order_uid", orderUID);
		return "reviewWrite";
	}
	
	@PostMapping("/review/upload")
	public void reviewUpload (
			@ModelAttribute ReviewDTO review,
			@ModelAttribute OrderDetailDTO orderDetail,
			@RequestParam("order_uid")long order_uid,
			@RequestParam("file1")MultipartFile  file1,
			@RequestParam("file2")MultipartFile  file2,
			@RequestParam("file3")MultipartFile  file3,
			@RequestParam("file4")MultipartFile  file4,
			Authentication authentication,
			HttpServletResponse response) {
		
		SecurityUser user = (SecurityUser) authentication.getPrincipal();
		
		
		review.setReg_date(new Date());
		review.setMem_id(user.getUsername());
		
		if(!file1.isEmpty()) {
			String filePath1 = slimbearS3.saveImage(file1);
			
			review.setImage1(filePath1);
		}
		if(!file2.isEmpty()) {
			String filePath2 = slimbearS3.saveImage(file2);
			review.setImage2(filePath2);
		}
		if(!file3.isEmpty()) {
			String filePath3 = slimbearS3.saveImage(file3);
			review.setImage3(filePath3);
		}
		if(!file4.isEmpty()) {
			String filePath4 = slimbearS3.saveImage(file4);
			review.setImage4(filePath4);
		}		
		// DAO로 전달!
		Long reviewUid = reviewService.insertReview(review);
		
		
		orderDetail.setReview_uid(reviewUid.intValue());
		orderDetail.setOrder_uid(order_uid);
		reviewService.updateOrderDetail(orderDetail);
		
		response.setStatus(HttpServletResponse.SC_OK);
	}
}
