package com.kgitbank.slimbear.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;

@Repository
public class ProductDetailDAO {

	@Autowired
	protected SqlSessionTemplate template;

	public List<ProductDetailDTO> getProductDetailList(long prod_uid) {
		ProductDetailDTO info = new ProductDetailDTO();
		info.setProd_uid(prod_uid);
		return template.selectList("com.slimbear.mapper.Product.SELECT_PRODUCT_DETAIL_LIST", info);
	}

	public ProductDetailDTO getProductDetail(long prod_uid, String color, String size) {
		ProductDetailDTO info = new ProductDetailDTO();
		info.setProd_uid(prod_uid);
		info.setColor(color);
		info.setSize(size);
		return template.selectOne("com.slimbear.mapper.Product.SELECT_PRODUCT_DETAIL", info);
	}
	
	public int addProductDetail(ProductDetailDTO productDetail) {		
		return template.insert("com.slimbear.mapper.Product.INSERT_PRODUCT_DETAIL", productDetail);
	}
	
	public int updateProductDetail(ProductDetailDTO productDetail) {
		return template.update("com.slimbear.mapper.Product.UPDATE_PRODUCT_DETAIL", productDetail);
	}
	
	public int deleteProductDetail(ProductDetailDTO productDetail) {
		return template.delete("com.slimbear.mapper.Product.DELETE_PRODUCT_DETAIL", productDetail);
	}
	public List<String> getColorOptions(long productUID) {
        return template.selectList("com.slimbear.mapper.Product.getColorOptions", productUID);
    }

    public List<String> getSizeOptions(long productUID) {
        return template.selectList("com.slimbear.mapper.Product.getSizeOptions", productUID);
    }
    
}
