package com.kgitbank.slimbear.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CategoryDTO {
	private long uid;
	private Long top_ctg_uid;
	private String name;
}
