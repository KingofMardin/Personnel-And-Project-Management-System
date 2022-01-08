<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>

<!doctype html>
<html>
<jsp:include page="headery.jsp"/>
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        
                        <li class="nav-item dropdown">
                            <div class="nav-dropdown">
                                <a href="" class="nav-item nav-link dropdown-toggle text-secondary" data-toggle="dropdown"><i class="fas fa-user"></i> <span>Yönetici</span> <i style="font-size: .8em;" class="fas fa-caret-down"></i></a>
                                <div class="dropdown-menu dropdown-menu-right nav-link-menu">
                                    <ul class="nav-list">
                                        <li><a href="cikisyapY.jsp" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Çıkış Yap</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="content">
                <div class="container">
                    <div class="row">
                        
                    </div>
                    
 <%
    if("POST".equalsIgnoreCase(request.getMethod()))
    {
        if(request.getParameter("sifreDegis")!=null)
        {
            if(request.getParameter("sifreDegis").equals("Sifre Degistir"))
            {
                String kullaniciAdi = request.getParameter("kullaniciAdi");
                String yenisifre = request.getParameter("yenisifre");
                String yenisifretekrar = request.getParameter("yenisifretekrar");
                
                if((!kullaniciAdi.isEmpty()) && (!yenisifre.isEmpty()) && (!yenisifretekrar.isEmpty()))
                {
                    if(yenisifre.equals(yenisifretekrar))
                    {
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                        String query;
                        
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                        }
                        catch(Exception e)
                        {
                            System.out.println(e);
                            
                        }
                        try
                        {
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                            query = "select * from yoneticireg where kullaniciAdi=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, kullaniciAdi);

                            
                            rs = ps.executeQuery();
                            
                            if(rs.next())
                            {
                                query = "update yoneticireg set sifre=? where kullaniciAdi=?";
                                ps = con.prepareStatement(query);
                                ps.setString(1,yenisifre);
                                ps.setString(2,request.getParameter("kullaniciAdi"));
                                ps.executeUpdate();
                                out.println("<br> Sifreniz Basariyla Guncellendi.. Dilerseniz <a href=\"anasayfaY.jsp\"> Buradan </a> Anasayfaya Gidebilirsiniz... <br>");
                            }
                            else
                            {
                                out.println("Bir aksilik Olustu. Sireniz Degistirilemedi!!!!");
                            }

                        }
                        catch(SQLException e)
                        {
                            System.out.println(e);
                        }
                        
                        
                        
                        
                    }
                }
            }
        }
    }
    
    
%>  

    
    <form id="form" method="post" action="" class="form-horizontal">
            <hr/>
 
                    <div class="col-lg-12">
                            <div class="card">
                                 <div class="card-header">Şifrenizi Değiştirin!</div>
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <form class="form-horizontal">
                                        
                                        
                                      
                                        <div class="form-group row">
                                            <label class="col-sm-2">Kullanıcı Adınız </label>
                                            <div class="col-sm-10">
                                                <input  type="text" name="kullaniciAdi" class="form-control"   size="50"/>
                                                <small class="form-text text-muted">Kullanıcı adınızı yazınız...</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Yeni Şifreniz </label>
                                            <div class="col-sm-10">
                                                <input  type="password" name="yenisifre" class="form-control"  size="50">
                                                <small class="form-text text-muted">Yeni bir şifre belirleyiniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Yeni Şifreniz </label>
                                            <div class="col-sm-10">
                                                <input  type="password" name="yenisifretekrar" class="form-control"   size="50">
                                                <small class="form-text text-muted">Belirlediğiniz şifreyi tekrar giriniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                        
                                        
                                        
                                          
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                              
                                                            <br><br>            
                                            <input type="submit" name="sifreDegis" value="Sifre Degistir">
                                                
                                            </div>
                                        </div>

                                        
                                    </form>
                                    
                                </div>
                            </div>
                    </div>       
                    
                </div>
            </div>
            
           
        </div>
    </div>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chartsjs/Chart.min.js"></script>
    <script src="assets/js/dashboard-charts.js"></script>
    <script src="assets/js/script.js"></script>
</body>

</html>