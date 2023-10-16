package com.example.demo.dto;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class BoardDto {
	private String id;
	private int bnum;
	private String b_title;
	private String b_content;
	private int likes;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Timestamp b_date;
	private int b_views;
	private String boardtype;
	private String OriFileName;
	private String SysFileName;
	private String filePath;
}
