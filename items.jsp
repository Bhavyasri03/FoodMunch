<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String userEmail = (String) session.getAttribute("Email");
String username = "";
if (userEmail != null) {
    username = userEmail.substring(0, userEmail.indexOf("@"));
}
%>
<style>
button {
  background-color:#ffc40c ; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>
<%
// Establish the database connection
Connection conn = null;
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbusername = "system";
    String password = "system";
    conn = DriverManager.getConnection(dbURL, dbusername, password);

    // Create a SQL statement to retrieve the data
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM item";
    ResultSet rs = stmt.executeQuery(sql);

    // Iterate through the result set and generate the HTML markup for each card
    while (rs.next()) {
        String name= rs.getString("name");
        String description = rs.getString("description");
        String img=rs.getString("img");
        // Generate the HTML markup for the card
        %>
<center>
        <div class="container">
            <div class="row">
                <div class="col-3">
			
  <div class="column">

                    <p>Name: <%= name %></p>
                    <p><%= description %></p>
                    <img src="<%= img %>" width="20%" height="200px"><br>
                    <br><button onclick="redirectToBooking()">goback</button>
 </div>  </center>                 
                    <script>
                    function redirectToBooking() {
                      window.location.href = "home.html";
                    }
                    </script>
            </div></div></div>

       
        <%
    }

    // Close the result set, statement, and connection
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>  

