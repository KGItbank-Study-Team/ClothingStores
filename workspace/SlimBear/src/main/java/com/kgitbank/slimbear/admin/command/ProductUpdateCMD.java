package com.kgitbank.slimbear.admin.command;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import groovy.transform.ToString;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ToString
public class ProductUpdateCMD {
	
	private long uid;
	private String name;
	private String description;
	private int price;
	private long category;
	private MultipartFile main_image;
	
	List<String> colors = new ArrayList<String>();
	List<String> sizes= new ArrayList<String>();
}
