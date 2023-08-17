<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.health.Credentials"%>



<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ruralhealth";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con;
Statement statement;
ResultSet resultSet;
%>



<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="css/morris.css" type="text/css"/>

</head>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>Id</td>
<td>Name</td>
<td>Age</td>
<td>Gender</td>
<td>Contact</td>
<td>Address</td>
<td>Email</td>
<td>Symptom1</td>
<td>Symptom2</td>
<td>Symptom3</td>
<td>Symptom4</td>
<td>Doctor name</td>
<td>Disease</td>
<td>Aarogya id</td>
<td>Comment</td>
<td>Prescription</td>

</tr>
<%

try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=con.createStatement();
String sql ="select * from patient";

resultSet = statement.executeQuery(sql);
while(resultSet.next())
{	

	if(resultSet.getString(13).equals(Credentials.getDdisease()))
	{
		int Pids = resultSet.getInt(1);
		Credentials.setPid(Pids);
		String Dname = resultSet.getString(12);
		Credentials.setDname(Dname);
	

%>
<tr>
<td><%=resultSet.getInt(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getInt(3) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getString(5)%></td>
<td><%=resultSet.getString(6) %></td>
<td><%=resultSet.getString(7) %></td>
<td><%=resultSet.getString(8) %></td>
<td><%=resultSet.getString(9) %></td>
<td><%=resultSet.getString(10) %></td>
<td><%=resultSet.getString(11) %></td>
<td><%=resultSet.getString(12) %></td>
<td><%=resultSet.getString(13) %></td>
<td><%=resultSet.getInt(14) %></td>
<td><a href ="Comment.jsp?Pid=<%=resultSet.getString(1)%>">Comment</a></td>
<td><a href ="Prescription.jsp?Pid=<%=resultSet.getString(1)%>">Prescription</a></td>

</tr>
<%
}
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>

</body>
</html>
