package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class hosRatingDto {
	private String code;
	private String id;
	private int rating;
	private String review;
	private Timestamp DateTime;
	private String ratingdate;
	
    public Timestamp getCheckDateTime() {
        return DateTime;
    }

    public void setCheckDateTime(Timestamp checkDateTime) {
        this.DateTime = checkDateTime;
    }
}
