package com.kgitbank.slimbear.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.slimbear.admin.command.ProductUpdateCMD;
import com.kgitbank.slimbear.admin.service.AdminServiceImpl;
import com.kgitbank.slimbear.controller.SanghyukController;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.ProductServiceImpl;
import com.kgitbank.slimbear.service.SangyhyukServiceImpl;

//ADMIN작업중....
//DAO, DTO는 DB테이블과 1대1로 맵핑될 수도있지만 프로젝트 크기가 커지면 
//	DAO는 기능별, DTO는 쿼리별로 나눠지는 듯하다
//VO는 Srping 에서는 controler에서 model에 해당한다고 생각하자 
//DTO자체를 view로 넘기며 버려지는 데이터가 있어도 되된다(view에서 필요한것만 사용하면되니깐)하지만 성능저하가 발생하기
//	때문에 어느정도 DTO를 나눠줘야 한다

@Controller
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductServiceImpl productService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private SangyhyukServiceImpl sanghService;

	@RequestMapping("home")
	public String homePage() {
		return "index";
	}

	@RequestMapping("home/board/member")
	public String boardMember(Model model) {

		model.addAttribute("memberList", memberService.getMemberList());

		return "tables-member";
	}

	@RequestMapping("home/board/product")
	public String boardProduct(Model model) {

		model.addAttribute("productList", adminService.getProductTotalListDTO());

		return "tables-product";
	}

	@RequestMapping("home/member")
	public String memberPage(@RequestParam(name="memberID", required = false) String memberID, Model model) {
		if(memberID != null) {
			MemberDTO member = memberService.getMemberById(memberID);
			if(member == null) {
				model.addAttribute("member", -1);
				model.addAttribute("beforeID", memberID);
			}else {
				model.addAttribute("member", member);
			}
		}else {
			model.addAttribute("member", null);
		}
		
		return "member-detail";
	}

	@GetMapping("/home/product/add")
	public String productAddPage(HttpServletRequest request) {
		return "product-add";
	}

	@PostMapping("/home/product/add")
	public String productAddPage(HttpServletRequest request, ProductUpdateCMD product){
		adminService.addProduct(product, request.getSession().getServletContext().getRealPath("/resources/images"));
		return "product-add";
	}
	
	@RequestMapping("home/product")
	public String productPage(@RequestParam(name="productUID", required = false) Long productUID, Model model) {
		if(productUID != null) {
			ProductDTO product = productService.getProductByUid(productUID);
			if(product == null) {
				return "redirect:/admin/home/board/product";
			}else {
				
				List<ProductDetailDTO> detailList = sanghService.getProductDetailList(product.getUid());
				
				model.addAttribute("product", product);
				model.addAttribute("detailList", detailList);
				return "product-detail";
			}
		}else {
			return "redirect:/admin/home/board/product";
		}
	}
	
	@PostMapping("/home/product/update")
	public String producUpdate(HttpServletRequest request, ProductUpdateCMD product, Model model){
		
		adminService.updateProduct(product, request.getSession().getServletContext().getRealPath("/resources/images"));
		
		model.addAttribute("productUID", product.getUid());
		return "redirect:/admin/home/product";

	}
}
