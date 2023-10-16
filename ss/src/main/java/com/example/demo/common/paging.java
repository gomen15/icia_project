package com.example.demo.common;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class paging {
    private int totalNum;
    private int pageNum;
    private int listCnt;
    private int pageCnt;
    private String listUrl;

    @SuppressWarnings("unused")
    public String makeHtmlPaging(){
        int totalPage = (totalNum % listCnt > 0)
            ?totalNum/listCnt+1 : totalNum/listCnt;
        
        int totalGroup = (totalPage % pageCnt >0)
            ?totalPage/pageCnt+1 : totalPage/pageCnt;

        int currentGroup = (pageNum % pageCnt >0)
            ?pageNum/pageCnt+1 : pageNum/pageCnt;
        return makeHtml(currentGroup,totalGroup,listUrl);
    }

    private String makeHtml(int currentGroup, int totalPage, String listUrl){
        StringBuffer sb = new StringBuffer();
        int start = (currentGroup * pageCnt)
            - (pageCnt -1);
        int end = (currentGroup * pageCnt >= totalPage)
            ? totalPage
            : currentGroup * pageCnt;
        if(start !=1){
            sb.append("<a class='pno' href='"+listUrl+"pageNum=" + (start -1) + "'>");
            sb.append("[이전]");
			sb.append("</a>");
        }    
        for (int i = start; i <= end; i++) {
			if (pageNum != i) {
				sb.append("<a class='pno' href='"+listUrl+"pageNum=" + i + "'>");
				sb.append(" [ ");
				sb.append(i);
				sb.append(" ] ");
				sb.append("</a>");
			} else {
				sb.append("<font style='color:red;'>");
				sb.append(" [ ");
				sb.append(i);
				sb.append(" ] ");
				sb.append("</font>");
			}
		}
        if (end != totalPage) {
			sb.append("<a class='pno' href='"+listUrl+"pageNum=" + (end + 1) + "'>");
			sb.append("[다음]");
			sb.append("</a>");
		}
		return sb.toString();
    }
}
