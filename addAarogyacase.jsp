<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.health.DbConnection"%>
<%@page import="com.health.Credentials"%>


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


<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
            
                <li>
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                </li>
                
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span> Aarogya Vibhag </span>
                    </a>
                    <ul class="sub">
						<li><a href="addAarogyacase.jsp">Add case</a></li>
						<li><a href="viewAarogyacase.jsp">View/Delete case</a></li>
						<li><a href="viewParticularcase.jsp">View Particular Patient Case</a></li>
						
                    </ul>
                </li>
                
                <li>
                    <a href="index.html">
                        <i class="fa fa-user"></i>
                        <span>Logout</span>
                    </a>
                </li>
  				
                
            </ul>           
         </div>
        <!-- sidebar menu end-->
    </div>
</aside>


<div class="reg-w3">
<div class="w3layouts-main">
	<h2>Add Patient</h2>
		<form>
			<input type="text" class="ggg" name="Pname" placeholder="NAME" required="">
			<input type="text" class="ggg" name="Page" placeholder="AGE" required="">
			<input type="text" class="ggg" name="Pgender" placeholder="GENDER" required="">
			<input type="text" class="ggg" name="Pcontact" placeholder="CONTACT" required="">
			<input type="text" class="ggg" name="Paddress" placeholder="ADDRESS" required="">
			<input type="email" class="ggg" name="Pemail" placeholder="E-MAIL" required="">
			<label>Sympton_1</label>
			<select name=Symptom1>
			<% 
			try
			{
				Connection con =DbConnection.connect();
				PreparedStatement pstmt = con.prepareStatement("select distinct Symptom_1,Symptom_2,Symptom_3, Symptom_4 from dataset");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next())
				{
					
				%>
				
				<option value="<%= rs.getString("Symptom_1")%>" ><%=rs.getString("Symptom_1")%></option>
				<%
				}
				%>
			
				
				</select>
				
				<label>Sympton_2</label>
				<select name=Symptom2>
				<%
				ResultSet rs2 = pstmt.executeQuery();
				while(rs2.next())
				{
					
				%>
				<option value="<%= rs2.getString("Symptom_2")%>" ><%=rs2.getString("Symptom_2")%></option>
				<%
				}
				%>
				</select>
				
				<label>Sympton_3</label>
				<select name=Symptom3>
				<%
				ResultSet rs3 = pstmt.executeQuery();
				while(rs3.next())
				{
					
				%>
				<option value="<%= rs3.getString("Symptom_3")%>" ><%=rs3.getString("Symptom_3")%></option>
				<%
				}
				%>
				</select>
				
				<label>Sympton_4</label>
				<select name=Symptom4>
				<%
				ResultSet rs4 = pstmt.executeQuery();
				while(rs4.next())
				{
					
				%>
				<option value="<%= rs4.getString("Symptom_4")%>" ><%=rs4.getString("Symptom_4")%></option>
				<%
				}
				%>
				</select>
				
				<%
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}%>
				
			
			<%
			String Pname = request.getParameter("Pname");
			String Page = request.getParameter("Page");
			String Pgender = request.getParameter("Pgender");
			String Pcontact = request.getParameter("Pcontact");
			String Paddress = request.getParameter("Paddress");
			String Pemail = request.getParameter("Pemail");
			String PSymptom1 = request.getParameter("Symptom1");
			
			String PSymptom2 = request.getParameter("Symptom2");
			String PSymptom3 = request.getParameter("Symptom3");
			String PSymptom4 = request.getParameter("Symptom4");
			String Dname="";
			String Pdisease="";
			
			try{
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("select * from dataset where Symptom_1 = ? and Symptom_2 = ? and Symptom_3 = ? and Symptom_4 = ?");
			pstmt.setString(1, PSymptom1);
			pstmt.setString(2, PSymptom2);
			pstmt.setString(3, PSymptom3);
			pstmt.setString(4, PSymptom4);
			ResultSet resultSet = pstmt.executeQuery();
			if(resultSet.next())
			{
				Pdisease = resultSet.getString(1);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		try{
			Connection con = DbConnection.connect();
			PreparedStatement pstmt2 = con.prepareStatement("select Dname from specialistdoctor where Ddiseasetreat = ?");
			pstmt2.setString(1,Pdisease);
		
			ResultSet resultSets = pstmt2.executeQuery();
			//Doctor = resultSets.getString("Dname");
			if(resultSets.next())
			{	
				
				Dname = resultSets.getString("Dname");
				
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
			
			int Pid = 0;
			
			try
			{
				Connection con =DbConnection.connect();
				PreparedStatement pstmt = con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				
				pstmt.setInt(1, Pid);
				pstmt.setString(2, Pname);
				pstmt.setString(3, Page);
				pstmt.setString(4, Pgender);
				pstmt.setString(5, Pcontact);
				pstmt.setString(6, Paddress);
				pstmt.setString(7, Pemail);
				pstmt.setString(8, PSymptom1);
				pstmt.setString(9, PSymptom2);
				pstmt.setString(10, PSymptom3);
				pstmt.setString(11, PSymptom4);
				pstmt.setString(12, Dname);
				pstmt.setString(13,Pdisease);
				pstmt.setInt(14,Credentials.getArid());
				int i = pstmt.executeUpdate();
				
				if(i>0)
				{
					System.out.println("Account created succesfully ");
					response.sendRedirect("PatientAdded.html");
				}
				else
				{
					response.sendRedirect("ErrorAarogyaAdded.html");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			%>
			
				<div class="clearfix"></div>
				<input type="submit" value="submit" name="register">
		</form>
		<p>Back to Aarogya Vibhag DashBoard - <a href="AarogyaVibhag.html">DashBoard</a></p>
</div>
</div>





<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>

</body>
</html>
