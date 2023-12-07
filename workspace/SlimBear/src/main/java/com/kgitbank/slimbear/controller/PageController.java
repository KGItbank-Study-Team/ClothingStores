package com.kgitbank.slimbear.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.admin.dto.AdminDTO;
import com.kgitbank.slimbear.admin.service.AdminServiceImpl;
import com.kgitbank.slimbear.common.SlimBearEnum.MEMBER_TYPE;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.PageConfigService;
import com.kgitbank.slimbear.service.ProductService;

@Controller
public class PageController {

	@Autowired
	private PageConfigService pageConfigService;

	@Autowired
	private ProductService productService;
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired 
	AdminServiceImpl adminService;
	
	@RequestMapping("main")
	public String mainePage(@RequestParam(name = "category", required = false)Long category,
			@RequestParam(name = "order", required = false) String order,
			@RequestParam(name = "currentPage", defaultValue = "1", required = false) int currentPage, Integer offset,
			Integer pageSize, Model model) {

		if (offset == null) {
			offset = 0;
		}
		pageSize = 12; // 페이지 당 아이템 수

		// 페이징에 관련된 정보 추가
//		int totalItems = memberService.getTotalItems(category); // 전체아이템 수
		int totalItems = productService.getTotalItems(); //전체 상품 개수 
		int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 전체 페이지 수
		int pageBlockSize = 5; // 보여질 페이지 블록 크기

		// 현재 페이지 블록의 시작 페이지와 끝 페이지 계산
		int startPage = ((currentPage - 1) / pageBlockSize) * pageBlockSize + 1;
		int endPage = Math.min(startPage + pageBlockSize - 1, totalPages);

		// 다음 페이지 블록이 있는지 여부
		boolean hasNextBlock = endPage < totalPages;

//		List<ProductDTO> productList = memberService.getProductListByCategory(category, order, currentPage, offset,
//				pageSize);

		model.addAttribute("order", order);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("hasNextBlock", hasNextBlock);
//		model.addAttribute("productList", productList);
		model.addAttribute("totalItems", totalItems);
		
		model.addAttribute("productBannerTop", pageConfigService.getProductBannerTop());
		model.addAttribute("bannerText", pageConfigService.getBannerText());
		model.addAttribute("newMainProductList", productService.getNewProductList());

//		List<CategoryDTO> categoryList = memberService.getSubCategoryListByTopCtgUid(category);

//		model.addAttribute("categoryList", categoryList);

		List<ProductDTO> bestProductList = productService.getBestProductList(order, currentPage, offset, pageSize);

		model.addAttribute("bestProductList", bestProductList);

//		CategoryDTO topCategory = memberService.getCategoryByUid(category);
//		model.addAttribute("category", topCategory);
		
		List<ProductDTO> newProductList = productService.getProductListOrderByRegDate(order, currentPage, offset,
				pageSize);
		model.addAttribute("newProductList",newProductList);

//		System.out.println(categoryList);
		return "main";
	}

	@RequestMapping("login")
	public String loginPage(@RequestParam(required = false) String id, @RequestParam(required = false) String pwd, @RequestParam(required = false) String error, HttpServletRequest request) {

		if (error != null) {
			request.setAttribute("error", "error");
		}
		
		if(id != null && pwd != null) {
			request.setAttribute("id", id);
			request.setAttribute("pwd", pwd);
		}
		
		return "login";
	}
	
	@RequestMapping("slimbear/login")
	public String slimbearLogin(String id, String pwd, Model model) {
		
		AdminDTO admin = adminService.getAdminByID(id);
		if(admin != null) {
			model.addAttribute("id", id);
			model.addAttribute("pwd", pwd);
			
			return "redirect:/app/login";
		}
	
		MemberDTO member = memberService.getMemberById(id);
		
		if(member == null) {
			// 회원아님
			return "redirect:/app/login";
		}
		
		if(member.getLogin_type().equals(MEMBER_TYPE.SLIMBEAR.toString())) {
    		// 로그인
			model.addAttribute("id", id);
			model.addAttribute("pwd", pwd);
			
			return "redirect:/app/login";
    	}else {
    		// 다른 로그인타입으로 사용중
    		return "redirect:/app/login";
    	}
	}

	@RequestMapping("login/success")
	public String loginSuccessPage(Authentication authentication, HttpServletRequest request) {
		if (authentication.getAuthorities().contains(AuthorityUtils.createAuthorityList("ADMIN").get(0))) {
			return "redirect:/admin/home";
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("join")
	public String joinPage(HttpServletRequest request) {
		return "join";
	}
}
