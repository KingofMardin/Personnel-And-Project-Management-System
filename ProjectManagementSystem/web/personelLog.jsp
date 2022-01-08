<%@ page import ="java.sql.*" %>

<%@page import="java.util.Date"%>

<%
    String kullaniciAdip = request.getParameter("kullaniciAdip");
    String sifrep = request.getParameter("sifrep");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from personelreg where kullaniciAdip='" + kullaniciAdip + "' and sifrep='" + sifrep + "'");
    if (rs.next()) {
        session.setAttribute("kullaniciAdip", kullaniciAdip);

        response.sendRedirect("anasayfaP.jsp");
    } else {
        out.println("Hatali bir sifre girdiniz, <a href='personelGiris.jsp'>Lutfen tekrar deneyin...</a>");
    }
%>
