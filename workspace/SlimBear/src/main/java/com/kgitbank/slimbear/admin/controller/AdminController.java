package com.kgitbank.slimbear.admin.controller;

import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.kgitbank.slimbear.admin.service.StatisticsServiceImpl;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;
import com.kgitbank.slimbear.service.MemberService;
import com.kgitbank.slimbear.service.ProductService;
import com.kgitbank.slimbear.service.ReviewService;

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
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private StatisticsServiceImpl statSearvice;

	@RequestMapping("home")
	public String homePage(Model model) {
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		int month = Calendar.getInstance().get(Calendar.MONTH) + 1;

		model.addAttribute("totalMemberCount", statSearvice.getTotalMemberCount());
		model.addAttribute("curYearMemberCount", statSearvice.getTotalMemberCount(year));
		model.addAttribute("curMonthMemberCount", statSearvice.getTotalMemberCount(year, month));
		
		model.addAttribute("totalPayamount", statSearvice.getTotalOrder().getPay_amount());
		model.addAttribute("curYearPayamount", statSearvice.getTotalOrder(year).getPay_amount());
		model.addAttribute("curMonthPayamount", statSearvice.getTotalOrder(year, month).getPay_amount());
		
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
	
	@RequestMapping("/home/board/order")
	public String boardOrder(HttpServletRequest request, ProductUpdateCMD product, Model model) {
		return  "tables-order";
	}

	@RequestMapping("home/member")
	public String memberPage(@RequestParam(name = "memberID", required = false) String memberID, Model model) {
		if (memberID != null) {
			MemberDTO member = memberService.getMemberById(memberID);
			if (member == null) {
				model.addAttribute("member", -1);
				model.addAttribute("beforeID", memberID);
			} else {
				model.addAttribute("member", member);
			}
		} else {
			model.addAttribute("member", null);
		}

		return "member-detail";
	}

	@GetMapping("/home/product/add")
	public String productAddPage(HttpServletRequest request) {
		return "product-add";
	}

	@PostMapping("/home/product/add")
	public String productAddPage(HttpServletRequest request, ProductUpdateCMD product) {
		adminService.addProduct(product);
		return "product-add";
	}

	@RequestMapping("home/product")
	public String productPage(@RequestParam(name = "productUID", required = false) Long productUID, Model model) {
		if (productUID != null) {
			ProductDTO product = productService.getProductByUid(productUID);
			if (product == null) {
				return "redirect:/admin/home/board/product";
			} else {

				List<ProductDetailDTO> detailList = reviewService.getProductDetailList(product.getUid());

				// 카테고리
				List<Long> ctgList = new ArrayList<Long>();
				CategoryDTO ctg = productService.getCategoryByUid(product.getCtg_uid());
				if (ctg != null) {
					ctgList.add(0, ctg.getUid());

					// 상위 카테고리 존재
					while (ctg != null && ctg.getTop_ctg_uid() != null) {
						ctg = productService.getCategoryByUid(ctg.getTop_ctg_uid());
						ctgList.add(0, ctg.getUid());
					}
				}

				model.addAttribute("product", product);
				model.addAttribute("detailList", detailList);
				model.addAttribute("ctgList", ctgList);
				return "product-detail";

			}
		} else {
			return "redirect:/admin/home/board/product";
		}
	}

	@PostMapping("/home/product/update")
	public String producUpdate(HttpServletRequest request, ProductUpdateCMD product, Model model) {

		adminService.updateProduct(product);

		model.addAttribute("productUID", product.getUid());
		return "redirect:/admin/home/product";

	}
	
	
}
