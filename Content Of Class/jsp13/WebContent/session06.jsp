<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<h4>------ 세션 삭제 전 --------</h4>
<%
	String user_id=(String)session.getAttribute("userID");
    String user_pw=(String)session.getAttribute("userPW");
    
    out.print("설정된 세션 이름:userID:"+user_id+"<br>");
    out.print("설정된 세션 값:userPW:"+user_pw+"<br>");
    
    //세션 유효성 검사
    if(request.isRequestedSessionIdValid()==true){
    	out.print("세션이 유효합니다");
    }else{
    	out.print("세션이 유효하지 않습니다.");
    }
    
    //세션정보 삭제
    session.invalidate();
%>

<h4>------ 세션 삭제 후 --------</h4>
<%
if(request.isRequestedSessionIdValid()==true){
	out.print("세션이 유효합니다");
}else{
	out.print("세션이 유효하지 않습니다.");
}
    //이미제건된 속성 이므로 추출불가
   // user_id=(String)session.getAttribute("userID");
   // out.print("설정된 세션 이름:userID:"+user_id+"<br>");
%>
</body>
</html>