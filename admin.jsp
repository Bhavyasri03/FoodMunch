<%@page import="java.sql.*"%>
<%
	String mail=request.getParameter("email");
	String pswd=request.getParameter("pwd");
	try
	{
			String errorMessage = "";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
			 PreparedStatement stmt = con.prepareStatement("SELECT * FROM registration WHERE email=? AND passward=?");
			stmt.setString(1, mail);
			stmt.setString(2, pswd);
			ResultSet rs = stmt.executeQuery();
			// If a matching record is found, redirect the user to the home page
			int x=0;
			if(rs.next()) {
				x++;
					response.sendRedirect("adminpage.html");
			} else{
					// If no matching record is found, display an error message
				out.println("<p style='color:red;'>Invalid username or password. Please try again.</p>");
								//response.sendRedirect("home.html");
				%>
				<jsp:include page="admin.html"/>
			<%}
			rs.close();
			stmt.close();
			con.close();
	}
		catch(Exception e)
		{
			out.println(e);
	}
%>