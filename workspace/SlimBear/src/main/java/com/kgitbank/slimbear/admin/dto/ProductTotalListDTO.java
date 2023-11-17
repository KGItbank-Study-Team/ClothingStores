package com.kgitbank.slimbear.admin.dto;

import com.kgitbank.slimbear.dto.ProductDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ProductTotalListDTO extends ProductDTO {
	public int toc;
	public int tpc;
}
