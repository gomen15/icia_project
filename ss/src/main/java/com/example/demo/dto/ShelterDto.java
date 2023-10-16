package com.example.demo.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ShelterDto {

	private int snum;
	private String s_title;
	private Date s_date;
	private Date s_date2;
	private int s_age;
	private String s_genetic;
	private String s_gender;
	private String s_weight;
	private int s_views;
	private String OriFileName;
	private String SysFileName;
	private String filePath;
}
