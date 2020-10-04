<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%><%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Locale locale = request.getLocale();
    
    String date = DateFormat
    		      .getDateTimeInstance(DateFormat.FULL,
    		    		               DateFormat.SHORT,
    		    		               locale)
    		      .format(new Date());
    /* 통화 */
    NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
    String fcurrency = currency.format(123456);
%>
<p>로케일의 날짜 형식
<p><%=locale %>
<p><%=date %>
<p><%=fcurrency %>
</body>
</html>