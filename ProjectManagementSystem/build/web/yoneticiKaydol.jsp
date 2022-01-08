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
                        <a class="nav-link active" href="yoneticiKaydol.jsp">Yönetici Kayıt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link unactive" href="personelKaydol.jsp">Personel Kayıt</a>
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
                    String isim = request.getParameter("isim");
                    String soyisim = request.getParameter("soyisim");
                    String kullaniciAdi = request.getParameter("kullaniciAdi");
                    String email = request.getParameter("email");
                    String sifre = request.getParameter("sifre");
                    String adres = request.getParameter("adres");
                    String tel = request.getParameter("tel");

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim", "root", "root");
                    String query = "INSERT INTO yoneticireg(isim,soyisim,kullaniciAdi,email,sifre,adres,tel) VALUES (?,?,?,?,?,?,?)";

                    PreparedStatement pst = con.prepareStatement(query);

                    pst.setString(1, isim);
                    pst.setString(2, soyisim);
                    pst.setString(3, kullaniciAdi);
                    pst.setString(4, email);
                    pst.setString(5, sifre);
                    pst.setString(6, adres);
                    pst.setString(7, tel);

                    pst.executeUpdate();

                    color = "green";
                    msg = "Yönetici Olarak Kaydınız Başarıyla Gerçekleştirilmiştir. Artık Sisteme Giriş Yapabilirsiniz...";

                } catch (Exception ex) {
                    ex.printStackTrace();
                    color = "red";
                    msg = "Yönetici Olarak Kaydınız Oluşturulurken Beklenmedik Bir Sorun Çıktı, Daha Sonra Tekrar Deneyiniz...";
                }
            }
        %>       

        <div class="form-group">
            <h4 style="color:<%= color%>"><%= msg%></h4>
        </div>
        <div class="row page-card">
            <div class="col-lg-8 offset-1 jumbotron">
                <h3 class="text-primary">Yönetici Olarak Kaydol</h3><br />

                <form id="form" method="post" action="yoneticiKaydol.jsp" class="form-horizontal">
                    <hr/>

                    <div class="form-group">
                        <label >Adınız:</label>
                        <input type="text" name="isim" class="form-control" id="isim" placeholder="Adınızı giriniz"/>
                    </div>

                    <div class="form-group">
                        <label >Soyadınız:</label>
                        <input type="text" name="soyisim" class="form-control" id="soyisim" placeholder="Soyadınızı giriniz"/>
                    </div>

                    <div class="form-group">
                        <label>Kullanıcı Adınız:</label>
                        <input type="text" name="kullaniciAdi" class="form-control" id="kullaniciAdi" placeholder="Kullanıcı adınızı belirleyiniz"/>
                    </div>


                    <div class="form-group">
                        <label>E-Posta Adresiniz:</label>
                        <input type="text" name="email" class="form-control" id="email" placeholder="E-Posta adresinizi giriniz">
                    </div>

                    <div class="form-group">
                        <label>Şifreniz:</label>
                        <input type="password" name="sifre" class="form-control" id="sifre" placeholder="Şifrenizi oluşturunuz">
                    </div>

                    <div class="form-group">
                        <label>Adresiniz:</label>
                        <input type="text" name="adres" class="form-control" id="adres" placeholder="Adres bilgilerinizi giriniz">
                    </div>

                    <div class="form-group">
                        <label>Telefon Numaranız:</label>
                        <input type="text" name="tel" class="form-control" id="tel" placeholder="Telefon numaranızı giriniz">
                    </div>

                    <a href="index.jsp"><button type="submit" class="btn btn-primary ">KAYDOL</button><a/>

                        <br>

                        </form>

                        <a>Zaten bir hesabınız var mı? <a href="yoneticiGiris.jsp">Giriş Yap!</a></a>
                        </html>