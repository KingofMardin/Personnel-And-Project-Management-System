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
<jsp:include page="headerp.jsp"/>
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
                <button type="button" id="sidebarCollapse" class="btn btn-light"><i class="fas fa-bars"></i><span></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        
                        <li class="nav-item dropdown">
                            <div class="nav-dropdown">
                                <a href="" class="nav-item nav-link dropdown-toggle text-secondary" data-toggle="dropdown"><i class="fas fa-user"></i> <span>Personel</span> <i style="font-size: .8em;" class="fas fa-caret-down"></i></a>
                                <div class="dropdown-menu dropdown-menu-right nav-link-menu">
                                    <ul class="nav-list">
                                        <li><a href="cikisyapP.jsp" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Çıkış Yap</a></li>
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
                String kullaniciAdip = request.getParameter("kullaniciAdip");
                String yenisifrep = request.getParameter("yenisifrep");
                String yenisifretekrarp = request.getParameter("yenisifretekrarp");
                
                if((!kullaniciAdip.isEmpty()) && (!yenisifrep.isEmpty()) && (!yenisifretekrarp.isEmpty()))
                {
                    if(yenisifrep.equals(yenisifretekrarp))
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
                            query = "select * from personelreg where kullaniciAdip=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, kullaniciAdip);

                            
                            rs = ps.executeQuery();
                            
                            if(rs.next())
                            {
                                query = "update personelreg set sifrep=? where kullaniciAdip=?";
                                ps = con.prepareStatement(query);
                                ps.setString(1,yenisifrep);
                                ps.setString(2,request.getParameter("kullaniciAdip"));
                                ps.executeUpdate();
                                out.println("<h4 style='color:rgba(88, 255, 0, 0.8);text-align:center;'><br> Şifreniz başarıyla güncellendi! Dilerseniz <a href=\"anasayfaP.jsp\" style='color:white;'> buradan </a> Anasayfaya gidebilirsiniz... <br></h4>");
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
                                                <input  type="text" name="kullaniciAdip" class="form-control"   size="50"/>
                                                <small class="form-text text-muted">Kullanıcı adınızı yazınız...</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Yeni Şifreniz </label>
                                            <div class="col-sm-10">
                                                <input  type="password" name="yenisifrep" class="form-control"  size="50">
                                                <small class="form-text text-muted">Yeni bir şifre belirleyiniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Yeni Şifreniz </label>
                                            <div class="col-sm-10">
                                                <input  type="password" name="yenisifretekrarp" class="form-control"   size="50">
                                                <small class="form-text text-muted">Belirlediğiniz şifreyi tekrar giriniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                        
                                        
                                        
                                          
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                              
                                                            <br><br>            
                                            <input class="btn btn-primary mb-2" style="background-color: rgba(115, 0, 160, 0.8); border-color: rgba(115, 0, 160, 0.8);" type="submit" name="sifreDegis" value="Şifreyi Değiştir">
                                                
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