<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%><%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>지역 정보 출력</title>
</head>
<body>
<%
	Locale locale = request.getLocale();
   //현지 날짜시간정보
    String date=DateFormat.getDateTimeInstance(
    		     DateFormat.FULL, DateFormat.FULL, locale)
    		.format(new Date());
  //현지 통화,%정보 
  NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
  NumberFormat percent=NumberFormat.getPercentInstance(locale);
  String fcurrency=currency.format(1234567);
  String fpercent=percent.format(0.25);
  
%>
로케일의 날짜 형식:<%=date %><br>
로케일의 통화 형식:<%=fcurrency %><br>
로케일의 %형식:<%=fpercent %><br>

</body>
</html>