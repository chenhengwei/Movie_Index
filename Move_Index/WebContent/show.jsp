<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.Movie.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var sel = document.getElementsByName('ticketQuantity');
var sv = sel.value;
alert(sel);


</script>

</head>
<body>
<%=new String(request.getParameter("mgId").getBytes( "ISO-8859-1"), "UTF-8")%>

 <%=request.getParameter("ticketQuantity")%>

<%=request.getParameter("sessionTimeStart")%>
<%=request.getParameter("sessionTimeEnd")%>

</body>
</html>