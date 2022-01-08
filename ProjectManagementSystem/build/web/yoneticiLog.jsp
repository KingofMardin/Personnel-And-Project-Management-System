<%@ page import ="java.sql.*" %>
        <%
            String kullaniciAdi = request.getParameter("kullaniciAdi");    
            String sifre = request.getParameter("sifre");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from yoneticireg where kullaniciAdi='" + kullaniciAdi + "' and sifre='" + sifre + "'");
                if (rs.next()) {
                    session.setAttribute("kullaniciAdi", kullaniciAdi);

                    response.sendRedirect("anasayfaY.jsp");
                } else {
                    out.println("Hatali bir sifre girdiniz, <a href='yoneticiGiris.jsp'>Lutfen tekrar deneyin..</a>");
                }
        %>