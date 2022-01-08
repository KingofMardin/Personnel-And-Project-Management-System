<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>

<html>
    <head>    
    <title>Proje / Personel Yönetim Sistemi</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>        
    <link href="assets/css/style.css" rel="stylesheet">
    </head>

    <style>
        img {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <div class="container phome">
        <div class="admin-page-title">
            <h2>Proje / Personel Yönetim Sistemi</h2>
        </div>
        <div class="row page-card">
            <div class="col-lg-8 offset-1">                    
                <ul class="nav nav-pills nav-fill">                  
                    <li class="nav-item">
                        <a class="nav-link unactive" href="yoneticiKaydol.jsp">Yönetici Kayıt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="personelKaydol.jsp">Personel Kayıt</a>
                    </li>                
                </ul>                       
            </div>           
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


        <div class="row page-card">
            <div class="col-lg-8 offset-1 jumbotron">
                <h3 class="text-primary">Personel Olarak Kaydol</h3><br />

                <form id="form" method="post" action="personelKaydol.jsp" class="form-horizontal">
                    <hr/>       

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

                    <a href="personelKaydol.jsp"><button type="submit" class="btn btn-primary ">KAYDOL</button><a/>

                        <br>

                        </form>

                        <a>Zaten bir hesabınız var mı? <a href="personelGiris.jsp">Giriş Yap!</a></a>
                        </html>