package com.kgitbank.slimbear.admin.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RSYAdminDTO {
	private long uid;
	private long review_uid;
	private String title;
	private String content;
	private String mem_id;
}
