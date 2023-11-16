package com.kgitbank.slimbear.admin.command;

import org.springframework.web.multipart.MultipartFile;

import groovy.transform.ToString;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ToString
public class ProductUpdateCMD {
	
	private String name;
	private String description;
	private int price;
	private long category;
	private MultipartFile main_image;

}
