<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
        <%
            Connection con;     

                String kayitNo = request.getParameter("id");

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                String query = "delete from  projepersonel where kayitNo = ?";

                PreparedStatement pst = con.prepareStatement(query);


                pst.setString(1, kayitNo);
                pst.executeUpdate();
        %>   
    
    <script>
          window.location.replace("projeraporlariP.jsp");             
    </script>