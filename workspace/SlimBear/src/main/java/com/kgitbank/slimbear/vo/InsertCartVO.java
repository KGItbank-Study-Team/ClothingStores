package com.kgitbank.slimbear.vo;

import java.util.ArrayList;
import java.util.HashMap;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InsertCartVO {
	ArrayList<HashMap<String,Object>> selectProduct = new ArrayList<>();

	public HashMap<String, Object>[] entrySet() {
		return null;
	}
}
