<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
body{
          
	  
  min-height: 45rem;
  background-image: url("f.jpg");
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
}
h2 {
    display: block;
    font-size: 2.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    text-align:center;
}
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: gray;
    width:50%;
    height: 100px;
    text-align:center;
    font-size: 16px;
}
.center {
  margin-left: auto;
  margin-right: auto;
}
button {
  background-color: #666600; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
tr:nth-child(even) {
  background-color: #D6EEEE;
}
</style>
    <title>Item List</title>
</head>
<body>
    <h2>Item</h2><center>
    <table border=2px solid black cellpadding="5">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Image</th>
          
        </tr></center>
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Establish database connection
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

                // Execute SELECT query
                String selectQuery = "SELECT * FROM item";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(selectQuery);

                // Iterate over the ResultSet and display the data
                while (rs.next()) {
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String img=rs.getString("img");
                    // Display the data row in the HTML table
                    
                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + "img" + "</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close database resources
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </table><br><br>
<center><a href="items.jsp" ><button>Watch Items</button></a></center><br><br>
<center><a href="additem.html" ><button>goback</button></a></center>


</body>
</html>
