<%@ page import="java.sql.*"%>

<%!
    String name,email,psw;
%>
<%
  //  out.println("hi sai");
//    name=request.getParameter("name");
    email=request.getParameter("name");
    psw=request.getParameter("pass");

    try{
        
		Class.forName("oracle.jdbc.OracleDriver");
       
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		out.println("success connected");
        Statement st= con.createStatement();

        ResultSet rs = st.executeQuery("select * from signuptable where email like '"+email+"' and password like '"+psw+"'");
        session.setAttribute("user",email);
        if(rs.next())            
            response.sendRedirect("home.html");
        else      
        {  
            if(email.equals("admin@gmail.com") && psw.equals("admin"))
                response.sendRedirect("admin.html");
        }	 
	}catch(Exception ee)
	{
		ee.printStackTrace();
	}
%>
