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
public class RSYServiceImpl {
	@Autowired
	private ProductDAO prodDAO;
	@Autowired
	private CategoryDAO ctgDAO;
	
	public List<ProductDTO> getProductListByCategory(long category, String order, int currentPage, Integer offset, Integer pageSize) {
	    if (order == null) {
	        order = "";
	    }

	    offset = (currentPage - 1) * pageSize;
	    
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("ctg_uid", category);
	    paramMap.put("order", order);
	    paramMap.put("offset", offset);
	    paramMap.put("pageSize", pageSize);
	    
	    System.out.println(paramMap);

	    switch (order) {
	        case "PRICE_ASC":
	            return prodDAO.getProductByCategoryOrderByPrice(paramMap);
			case "PRICE_DESC":
				return prodDAO.getProductByCategoryOrderByPriceDesc(paramMap);
			default:
				return prodDAO.getProductByCategory(paramMap);
		}
	}
	
	public int getTotalItems(long category) {
		int prod = prodDAO.selectTotalItems(category);
        return prod; // 총 아이템 수를 가져오는 메서드 호출
    }
	

	
	public CategoryDTO getCategoryByUid(long category){
		CategoryDTO ctg = ctgDAO.getCategoryByUid(category);
		return ctg;
	}
	
	public List<CategoryDTO> getSubCategoryListByTopCtgUid(long category) {
		List<CategoryDTO> subCtg = ctgDAO.getSubCategoryListByTopCtgUid(category);
		return subCtg;
	}
}
