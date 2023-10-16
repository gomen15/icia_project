package com.example.demo.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ProfileDto {
	
	private String id;
	private String animal;
	private String p_name;
	private String p_gender;
	private int p_age;
	private String oriFileName;
	private String sysFileName;
	private String filePath;
}
