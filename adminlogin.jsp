w<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String Email = request.getParameter("email");
    String Password = request.getParameter("pwd");

    try{
        
        if(Email != null && Password != null && Email.equals("darabhavyasri@gmail.com") && Password.equals("bhavya")){
            response.sendRedirect("adminpage.html");
        
        }
        else{ %>
            <script>alert("Invalid Credentials")</script>
            <jsp:include page="admin.html" />
<%
        }

        
    }
    catch(Exception e){ %>
        
<%
            out.println(e);

    }
%>
