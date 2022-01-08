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
                            String kayitNo = request.getParameter("kayitNo");
                            String projeAdi = request.getParameter("projeAdi");
                            String projeTuru = request.getParameter("projeTuru");
                            String projeAciklama = request.getParameter("projeAciklama");
                            String durum = request.getParameter("durum");
                            String kullanim = request.getParameter("kullanim");
                            String personelAdi = request.getParameter("personelAdi");
                            String personelSoyadi = request.getParameter("personelSoyadi");
                            String departman = request.getParameter("departman");

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim", "root", "root");
                            String query = "INSERT INTO raporlar(kayitNo,projeAdi,projeTuru,projeAciklama,durum,kullanim,personelAdi,personelSoyadi,departman) VALUES (?,?,?,?,?,?,?,?,?)";

                            PreparedStatement pst = con.prepareStatement(query);

                            pst.setString(1, kayitNo);
                            pst.setString(2, projeAdi);
                            pst.setString(3, projeTuru);
                            pst.setString(4, projeAciklama);
                            pst.setString(5, durum);
                            pst.setString(6, kullanim);
                            pst.setString(7, personelAdi);
                            pst.setString(8, personelSoyadi);
                            pst.setString(9, departman);

                            pst.executeUpdate();

                            color = "green";
                            msg = "Yeni Projenizin Raporu Başarıyla Oluşturuldu...";

                        } catch (Exception ex) {
                            ex.printStackTrace();
                            color = "red";
                            msg = "İşlem başarısız...";
                        }
                    }
                %>        

                <div class="form-group col-12 p-0">
                    <h4 style="color:<%= color%>"><%= msg%></h4>
                </div>

                <form id="form" method="post" action="projeekleY.jsp" class="form-horizontal">
                    <hr/>

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">Yeni Proje Raporu Oluştur</div>
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <form class="form-horizontal">    
                                    <div class="form-group row">
                                        <label class="col-sm-2">Projenin Kayıt Numarası </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="kayitNo" class="form-control" id="kayitNo"/>
                                            <small class="form-text text-muted">Yeni Proje Raporunun kayıt numarasını giriniz...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br>

                                    <div class="form-group row">
                                        <label class="col-sm-2">Projenin Adı </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="projeAdi" class="form-control" id="projeAdi">
                                                <small class="form-text text-muted">Projenin adını yazınız...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br>

                                    <div class="form-group row">
                                        <label class="col-sm-2">Projenin Türü </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="projeTuru" class="form-control" id="projeTuru">
                                                <small class="form-text text-muted">Projenin türünü yazınız...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br>

                                    <div class="form-group row">
                                        <label class="col-sm-2">Projenin Açıklaması </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="projeAciklama" class="form-control" id="projeAciklama">
                                                <small class="form-text text-muted">Proje hakkında kısa bir açıklama yazınız...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br>

                                    <div class="form-group row">
                                        <label class="col-sm-2">Projenin Şu anki Durumu </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="durum" class="form-control" id="durum">
                                                <small class="form-text text-muted">Projenin Şu anki durumu hakkında bilgi veriniz...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br><!-- comment -->

                                    <div class="form-group row">
                                        <label class="col-sm-2">Projede Kullanılan Teknolojiler </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="kullanim" class="form-control" id="kullanim">
                                                <small class="form-text text-muted">Proje yapılırken kullanılan teknolojilerden bahsediniz...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br><!-- comment -->

                                    <div class="form-group row">
                                        <label class="col-sm-2">Personelin Adı </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="personelAdi" class="form-control" id="personelAdi">
                                                <small class="form-text text-muted">Proje Raporunu oluşturan Personelin adını yazınız...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br><!-- comment -->

                                    <div class="form-group row">
                                        <label class="col-sm-2">Personelin Soyadı </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="personelSoyadi" class="form-control" id="personelSoyadi">
                                                <small class="form-text text-muted">Proje Raporunu oluşturan Personelin soyadını yazınız...</small>
                                        </div>
                                    </div><!-- comment -->

                                    <div class="line"></div><br><!-- comment -->

                                    <div class="form-group row">
                                        <label class="col-sm-2">Personelin Çalıştığı Departman </label>
                                        <div class="col-sm-10">
                                            <input type="text" name="departman" class="form-control" id="departman">
                                                <small class="form-text text-muted">Proje Raporunu oluşturan Personelin çalıştığı departmanı yazınız...</small>
                                        </div>
                                    </div>

                                    <div class="line"></div><br>


                                    <div class="form-group row">
                                        <div class="col-sm-4 offset-sm-2">
                                            <a href="anasayfaP.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfa</button></a>
                                            <a href="projeekleY.jsp"><button type="submit" class="btn btn-primary mb-2"><i class="fas fa-save"></i> Kaydet</button></a>
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