<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>지역 통화</title>
</head>
<body>
<%
	Locale locale = request.getLocale();
	NumberFormat currency
	      =NumberFormat.getCurrencyInstance(locale);//지역통화정보
	NumberFormat percentage
	      =NumberFormat.getPercentInstance(locale);//지역비율정보
	
	String fcurrency=currency.format(1234567);
	String fpercentage=percentage.format(0.25);
%>
<p>로케일의 통화 형식:<%  out.print(fcurrency); %>
<p>로케일의 비율 형식:<%=fpercentage %>
</body>
</html>