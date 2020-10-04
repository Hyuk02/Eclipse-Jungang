<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String kb="갈축,청축,적축"; 
   String ms="광마우스,유선마우스,비싼마우스,미키마우스";
%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="select1" onchange="itemChange()">
<option>키보드</option>
<option>마우스</option>
<option></option>
</select>
 
<select id="select2">
</select>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function itemChange(){
	var kk='<%=kb%>'.split(',');
 for(var i=0;i<kk.length;i++){
	 alert(kk[i]);
 }
var keyboard = ["갈축","청축","적축"];
var mouse = ["광마우스","유선마우스","비싼마우스","미키마우스"];
var monitor = ["17인치","22인치","24인치","26인치"];
 
var selectItem = $("#select1").val();
 
var changeItem;
  
if(selectItem == "키보드"){
  changeItem = keyboard;
}
else if(selectItem == "마우스"){
  changeItem = mouse;
}
else if(selectItem == "모니터"){
  changeItem =  monitor;
}
 
$('#select2').empty();
 
for(var count = 0; count < changeItem.length; count++){                
                var option = $("<option>"+changeItem[count]+"</option>");
                $('#select2').append(option);
            }
}
</script>
</body>
</html>
