package com.kgitbank.slimbear.admin.dto;

import com.kgitbank.slimbear.common.SlimBearEnum;

import lombok.Data;

@Data
public class StatisticsMemberDTO extends StatisticsDTO {
	private SlimBearEnum.MEMBER_TYPE login_type;
}
