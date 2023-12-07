package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.ProductDTO;

public interface ProductService {

	List<ProductDTO> getProductList();

	List<ProductDTO> getNewProductList();

	ProductDTO getProductByUid(long uid);

	// 상품목록 카테고리별 출력 (페이징,정렬 완료)
	List<ProductDTO> getProductListByCategory(long category, String order, int currentPage, Integer offset,
			Integer pageSize);

	List<ProductDTO> getBestProductListByCategory(long category);

	List<ProductDTO> getBestProductList(String order, int currentPage, Integer offset, Integer pageSize);

	int getTotalItems(long category);

	int getTotalItems();

	List<ProductDTO> getProductListOrderByRegDate(String order, int currentPage, Integer offset, Integer pageSize);

	CategoryDTO getCategoryByUid(long category);

	List<CategoryDTO> getSubCategoryListByTopCtgUid(long category);

}