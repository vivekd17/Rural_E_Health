<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<center>
        <form method="post" action="FileUploadDBServlet" enctype="multipart/form-data">
            		<h1 style="color:green"><b>Upload Image</b></h1><br/><br/>
                    
                    <input type="file" name="photo" size="50"/><br/><br/><br/>
                    <div class="tp">
							<input type="submit" value="Upload" style="background-color:brown;color:white;height:50px;width:100px;border-radius:5px">								
					</div>
                	
        </form>
    </center>


</body>
</html>