<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>함수 사용</title></head>
<body>
<c:set var="str1" value=" Functions <태그>를 사용합니다. "/>
<c:set var="str2" value="사용"/>
<c:set var="tokens" value="1,2,3,4,5,6,7,8,10"/>

length(str1)=${fn:length(str1)}<br><%--문자열길이 --%>
toUpperCase(str1)=${fn:toUpperCase(str1) }<br><%--대문자 --%>
toLowCaset(str1)=${fn:toLowerCase(str1) }<br><%--소문자 --%>
substring(str1,3,6) =${fn:substring(str1,3,6)}<br><%--자르기 --%>
substringAfter(str1,str2)=${fn:substringAfter(str1,str2)}<br><%--자르기 --%>
trim(str1)=${fn:trim(str1) }<br><%-- 앞뒤 공백제거 --%>
replace(str1,src,dest)=${fn:replace(str1," ","-") }<br><%--문자변환 --%>
indexOf(str1,str2)=${fn:indexOf(str1,str2) }<br><%-- 문자열내의 특정문자 위치 번호 값 확인 --%>
startsWith(str1,str2)=${fn:startsWith(str1,str2) }<br><%-- 특정문장로 시작여부 true/false --%>
endsWith(str1,str2)=${fn:endsWith(str1,str2) }<br><%--특정문자로 끝나는지 여부 true/false --%>
containts(str1,str2)=${fn:contains(str1,str2) }<br><%-- 특정문자가 포함되어있는지 여부확인 true/false --%>
containsIgnoreCase(str1,str2)=${fn:containsIgnoreCase(str1,str2) }<br><%--대소문자 구분없이 특정문자 포함여부확인 --%>

<%-- 구분자를 기준으로 문자열을 문자열 배열로 생성  --%>
<c:set var="array" value="${fn:split(tokens,',') }"/>

<%-- 문자열 배열을 구분자을 기준으로 하나의 문자열합치기 --%>
join(array,'=') =${fn:join(array,"-") }<br>
<%-- 소스코드의 특수문자코드를 사용 --%>
escapeXml(str1)=${fn:escapeXml(str1) }<br>


</body>
</html>