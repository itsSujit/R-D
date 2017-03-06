<%@page import="com.javapapers.java.social.facebook.FBConnection"%>
<%@page import="com.javapapers.java.social.facebook.FBGraph"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>Your Sample Facebook Information</h2>
	</div>
	<br><br><br>
	<%
		String code = request.getParameter("code");
		FBConnection fbConnection = new FBConnection();
		String accessToken = fbConnection.getAccessToken(code);
	

		FBGraph fbGraph = new FBGraph(accessToken);
		String graph = fbGraph.getFBGraph();
		Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
		String first_name = fbProfileData.get("first_name");
		String last_name = fbProfileData.get("last_name");
		String gender = fbProfileData.get("gender");
		String email = fbProfileData.get("email");
		String id = fbProfileData.get("id");
	%>
	<div align="center">
		<table border="2.0" class="table table-hover" style="background-color:orange;width:500px">
			<tr>
				<td>ID &nbsp;&nbsp;</td>
				<td><%=id%></td>
			</tr>
			
			<tr>
				<td>First Name &nbsp;&nbsp;</td>
				<td><%=first_name%></td>
			</tr>
			
			<tr>
				<td>Last Name &nbsp;&nbsp;</td>	
				<td><%=last_name%></td>
			</tr>	
			
			<tr>
				<td>Gender &nbsp;&nbsp;</td>
				<td><%=gender%></td>
			</tr>	
			
			<tr>
				<td>Email &nbsp;&nbsp;</td>
				<td><%=email%></td>
			</tr>		
		</table>
	</div>
	<br><br><br><br><br><br><br><br>	
	<div align="center">
		<h3>Facebook OAuth Successfull</h3>
	</div>
</body>

</html>