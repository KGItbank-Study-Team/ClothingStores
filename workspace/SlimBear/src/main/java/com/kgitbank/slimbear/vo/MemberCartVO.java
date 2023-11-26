package com.kgitbank.slimbear.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter

@ToString
public class MemberCartVO {
	
	private long uid;
	private int price;
	
	private String name;
	 private String maker; // 제조사 추가
	    private String main_image; // 상품 이미지 추가
	private int addprice;
	private String desc;
	private String infoo;
	private int totalprice;
	private int maybeprice;
	private int baedalprice;
	private int quantity;
	private int productId;
	private long productUid;
	private int cnt;
	private String color;
	private String size;
	 private List<String> ColorOptions;
	 private List<String> SizeOptions;
	
	private String ProdCode;
}
