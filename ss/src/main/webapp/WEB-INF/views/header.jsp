<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <div class="header">

	<!-- 메뉴 아이콘 -->
	<div class="menu-icon" style="margin-top: -10px;">≡</div>

	  <!-- 메뉴 팝업 -->
	<div class="menu-popup">
	  <div class="menu-item"><a href="/" style = "color : black;">메인페이지</a></div>
		<!-- 메뉴 아이템 -->
		<div class="menu-item"><a href="/board/list" style = "color : black;">게시판</a></div>
 	<c:choose>
        <c:when test="${hos.code != null}">
		<div class="menu-item"><a href="/hospital/myhos" style = "color : black;">내병원</a></div>
	    </c:when>
        <c:otherwise>   
        	<div class="menu-item"><a href="/hospital" style = "color : black;">동물병원</a></div>
        </c:otherwise>
    </c:choose>
		<div class="menu-item"><a href="/shopping/list" style = "color : black;">쇼핑</a></div>
		<div class="menu-item"><a href="/auction/list" style = "color : black;">경매</a></div>
		<div class="menu-item"><a href="/shelter/list" style = "color : black;">유기견 보호소</a></div>
	</div>

            <c:choose>
                <c:when test="${hos.code != null}">
                    <a href="/profile/hos" class="login-text" style = "color : white;">${hos.hostitle}</a>
                    <a href="/logout" class="login-text" style = "color : white;">로그아웃</a>
                </c:when>
                <c:when test="${mb.id == null}">
                    <a href="/login" class="login-text" style = "color : white;">로그인</a>
                </c:when>
                <c:when test="${mb.type eq 'admin'}">
                    <a href="/admin/list" class="login-text" style = "color : white;">관리자</a>
                    <a href="/logout" class="login-text" style = "color : white;">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="/member/detail" class="login-text" style = "color : white;">${mb.name}</a>
                    <a href="/logout" class="login-text" style = "color : white;">로그아웃</a>
                </c:otherwise>
            </c:choose>
	</div>
   
