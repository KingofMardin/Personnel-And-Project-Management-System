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
                    Connection con;
                    String msg = "";
                    String color = "";
                    if (request.getMethod().compareToIgnoreCase("post") == 0) {
                        try {
                            String isimp = request.getParameter("isimp");
                            String soyisimp = request.getParameter("soyisimp");
                            String kullaniciAdip = request.getParameter("kullaniciAdip");
                            String emailp = request.getParameter("emailp");
                            String sifrep = request.getParameter("sifrep");
                            String adresp = request.getParameter("adresp");
                            String telp = request.getParameter("telp");

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim", "root", "root");
                            String query = "INSERT INTO personelreg(isimp,soyisimp,kullaniciAdip,emailp,sifrep,adresp,telp) VALUES (?,?,?,?,?,?,?)";

                            PreparedStatement pst = con.prepareStatement(query);

                            pst.setString(1, isimp);
                            pst.setString(2, soyisimp);
                            pst.setString(3, kullaniciAdip);
                            pst.setString(4, emailp);
                            pst.setString(5, sifrep);
                            pst.setString(6, adresp);
                            pst.setString(7, telp);

                            pst.executeUpdate();

                            color = "green";
                            msg = "Personel Olarak Kaydınız Başarıyla Gerçekleştirilmiştir. Artık Sisteme Giriş Yapabilirsiniz...";

                        } catch (Exception ex) {
                            ex.printStackTrace();
                            color = "red";
                            msg = "Personel Olarak Kaydınız Oluşturulurken Beklenmedik Bir Sorun Çıktı, Daha Sonra Tekrar Deneyiniz...";
                        }
                    }
                %>         

                <div class="form-group col-12 p-0">
                    <h4 style="color:<%= color%>"><%= msg%></h4>
                </div>

                <form id="form" method="post" action="personelekleY.jsp" class="form-horizontal">
                    <hr/>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">Yeni Personel Ekle</div>
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <form class="form-horizontal">    


                                    <div class="form-group">
                                        <label >Adınız:</label>
                                        <input type="text" name="isimp" class="form-control" id="isimp" placeholder="Adınızı giriniz"/>
                                    </div>

                                    <div class="form-group">
                                        <label >Soyadınız:</label>
                                        <input type="text" name="soyisimp" class="form-control" id="soyisimp" placeholder="Soyadınızı giriniz"/>
                                    </div>

                                    <div class="form-group">
                                        <label>Kullanıcı Adınız:</label>
                                        <input type="text" name="kullaniciAdip" class="form-control" id="kullaniciAdip" placeholder="Kullanıcı adınızı belirleyiniz"/>
                                    </div>


                                    <div class="form-group">
                                        <label>E-Posta Adresiniz:</label>
                                        <input type="text" name="emailp" class="form-control" id="emailp" placeholder="E-Posta adresinizi giriniz">
                                    </div>

                                    <div class="form-group">
                                        <label>Şifreniz:</label>
                                        <input type="password" name="sifrep" class="form-control" id="sifrep" placeholder="Şifrenizi oluşturunuz">
                                    </div>

                                    <div class="form-group">
                                        <label>Adresiniz:</label>
                                        <input type="text" name="adresp" class="form-control" id="adresp" placeholder="Adres bilgilerinizi giriniz">
                                    </div>

                                    <div class="form-group">
                                        <label>Telefon Numaranız:</label>
                                        <input type="text" name="telp" class="form-control" id="telp" placeholder="Telefon numaranızı giriniz">
                                    </div>

                                    <div class="line"></div><br>


                                    <div class="form-group row">
                                        <div class="col-sm-4 offset-sm-2">
                                            <a href="anasayfaY.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfa</button></a>
                                            <a href="personelekleY.jsp"><button type="submit" class="btn btn-primary mb-2"><i class="fas fa-save"></i> Kaydet</button></a>
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