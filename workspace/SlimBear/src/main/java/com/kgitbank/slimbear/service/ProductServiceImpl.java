package com.kgitbank.slimbear.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.CategoryDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO prodDAO;
	@Autowired
	private CategoryDAO ctgDAO;

	@Override
	public List<ProductDTO> getProductList(){
		return prodDAO.getProductList();
	}
	
	@Override
	public List<ProductDTO> getNewProductList(){
		return prodDAO.getNewProductList();
	}
	
	@Override
	public ProductDTO getProductByUid(long uid) {
		return prodDAO.getProductByUid(uid);
	}


	// 상품목록 카테고리별 출력 (페이징,정렬 완료)
	@Override
	public List<ProductDTO> getProductListByCategory(long category, String order, int currentPage, Integer offset,
			Integer pageSize) {
		if (order == null) {
			order = "";
		}
		offset = (currentPage - 1) * pageSize;

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ctg_uid", category);
		paramMap.put("order", order);
		paramMap.put("offset", offset);
		paramMap.put("pageSize", pageSize);

		

		// 가격순 정렬
		switch (order) {
		case "PRICE_ASC":
			return prodDAO.getProductByCategoryOrderByPrice(paramMap);
		case "PRICE_DESC":
			return prodDAO.getProductByCategoryOrderByPriceDesc(paramMap);
		case "REG_DATE":
			return prodDAO.getProductByCategoryOrderByRegDate(paramMap);
		default:
			return prodDAO.getProductByCategory(paramMap);
		}
	}

	@Override
	public List<ProductDTO> getBestProductListByCategory(long category) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ctg_uid", category);
		
		return prodDAO.getBestProductByCategory(paramMap);
	}

	@Override
	public List<ProductDTO> getBestProductList(String order, int currentPage, Integer offset, Integer pageSize) {
		if (order == null) {
			order = "";
		}
		offset = (currentPage - 1) * pageSize;

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("order", order);
		paramMap.put("offset", offset);
		paramMap.put("pageSize", pageSize);
		return prodDAO.getBestProductList(paramMap);
	}

	@Override
	public int getTotalItems(long category) {
		int prod = prodDAO.selectTotalItems(category);
		return prod; // 카테고리 내 총 상품 수
	}

	@Override
	public int getTotalItems() {
		int prod = prodDAO.selectTotalItems();
		return prod; // 메인페이지 전체 상품 수
	}

	@Override
	public List<ProductDTO> getProductListOrderByRegDate(String order, int currentPage, Integer offset,
			Integer pageSize) {
		if (order == null) {
			order = "";
		}
		offset = (currentPage - 1) * pageSize;

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("order", order);
		paramMap.put("offset", offset);
		paramMap.put("pageSize", pageSize);
		// 가격순 정렬
		switch (order) {
		case "PRICE_ASC":
			return prodDAO.getProductOrderByPrice(paramMap);
		case "PRICE_DESC":
			return prodDAO.getProductOrderByPriceDesc(paramMap);
		case "REG_DATE":
			return prodDAO.getProductOrderByRegDate(paramMap);
		default:
			return prodDAO.getProductOrderByRegDate(paramMap);
		}
	}

	@Override
	public CategoryDTO getCategoryByUid(long category) {
		CategoryDTO ctg = ctgDAO.getCategoryByUid(category);
		return ctg; // 카테고리 가져오기 (uid기반)
	}

	@Override
	public List<CategoryDTO> getSubCategoryListByTopCtgUid(long category) {
		List<CategoryDTO> subCtg = ctgDAO.getSubCategoryListByTopCtgUid(category);
		return subCtg;// 하위 카테고리 가져오기 (상위 카테고리 기반)
	}

}