<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
StringBuffer temp = new StringBuffer();
Random rnd = new Random();
for (int i = 0; i < 20; i++) {
    int rIndex = rnd.nextInt(3);
    switch (rIndex) {
    case 0:
        // a-z
        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
        break;
    case 1:
        // A-Z
        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
        break;
    case 2:
        // 0-9
        temp.append((rnd.nextInt(10)));
        break;
    }
}
%>
<%=temp%>
<form name="contact-form" class="form" action="MailSencerController" method="POST">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group">
            <label for="message">내용:</label>
            <textarea id="message" name="message" rows="4" placeholder="메시지" required></textarea>
        <button type="submit" class="button">
            <span class="default">Send <i class="icon fa fa-paper-plane"></i></span>
        </button>
    </div>
</form>
</body>
</html>