package com.kgitbank.slimbear.service;

import java.util.List;

import com.kgitbank.slimbear.admin.dto.BannerTopDTO;

public interface PageConfigService {

	List<BannerTopDTO> getProductBannerTop();

	String getBannerText();

}