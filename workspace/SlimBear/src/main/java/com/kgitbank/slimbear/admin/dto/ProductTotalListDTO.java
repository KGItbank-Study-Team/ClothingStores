package com.kgitbank.slimbear.admin.dto;

import java.util.List;

import com.kgitbank.slimbear.dto.ProductDTO;
import com.kgitbank.slimbear.dto.ProductDetailDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ProductTotalListDTO extends ProductDTO {
	public int toc;
	public int tpc;
	
	public List<ProductDetailDTO> options;
}
