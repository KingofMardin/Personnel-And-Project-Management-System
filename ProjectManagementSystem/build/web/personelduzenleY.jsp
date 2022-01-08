<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>

<html>
<jsp:include page="headery.jsp"/>
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        
                        <li class="nav-item dropdown">
                            <div class="nav-dropdown">
                                <a href="" class="nav-item nav-link dropdown-toggle text-secondary" data-toggle="dropdown"><i class="fas fa-user"></i> <span>Yonetici</span> <i style="font-size: .8em;" class="fas fa-caret-down"></i></a>
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

                       if(request.getMethod().compareToIgnoreCase("post")==0)
                           {
                                try
                                {
                                        String kayitNo = request.getParameter("kayitNo");
                                        String isimp = request.getParameter("isimp");
                                        String soyisimp = request.getParameter("soyisimp");
                                        String emailp = request.getParameter("emailp");
                                        String telp = request.getParameter("telp");

                                         Class.forName("com.mysql.jdbc.Driver");
                                         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                                         String query = "update personelreg set isimp = ?, soyisimp = ?, emailp= ?, telp= ? where kayitNo = ?";

                                        PreparedStatement pst = con.prepareStatement(query);


                                        pst.setString(1, isimp);
                                        pst.setString(2, soyisimp);
                                        pst.setString(3, emailp);
                                        pst.setString(4, telp);
                                        pst.setString(5, kayitNo);
                                        pst.executeUpdate();

                                        color = "green";
                                        msg = "Seçilen Personel Başarıyla Düzenlendi ve Kaydedildi...";


                                }catch(Exception ex){
                                        ex.printStackTrace();
                                        color = "red";
                                        msg = "Kayıtlı Personel Üzerinde Yapılan değişiklikler Kaydolurken Bir Hata Oluştu...";
                                }
                           }
                   %>    
        
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
        <a href="anasayfaY.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfaya Dön</button></a>
        <a href="personelgoruntuleY.jsp"><button  class="btn btn-primary mb-2"><i class="fas fa-save"></i> Personelleri Görüntüle</button></a>
    </div>
        
        <form id="form" method="post" action="personelduzenleY.jsp" class="form-horizontal">
            
                                <% 

                                   PreparedStatement pst;
                                   ResultSet rs;

                                   Class.forName("com.mysql.jdbc.Driver");
                                   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");

                                   String id = request.getParameter("id");

                                   pst = con.prepareStatement("select * from personelreg where kayitNo = ?");
                                   pst.setString(1, id);
                                   rs = pst.executeQuery();

                                   while(rs.next())
                                   {

                                %>   
         	
                            <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">Kayıtlı Personelin Üzerinde Değişiklikler Yapın...</div>
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <form class="form-horizontal">

                                        <div class="form-group row">
                                            <label class="col-sm-2">Kayıt Numarası</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="kayitNo" class="form-control" id="kayitNo" value="<%= rs.getString("kayitNo") %>"
                                                <small class="form-text text-muted">Yeni personelin kayıt numarasını yazınız...</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Personelin Adı </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="isimp" class="form-control" id="personelAdi" value="<%= rs.getString("isimp") %>"
                                                <small class="form-text text-muted">Yeni personelin adını yazınız...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Soyadı </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="soyisimp" class="form-control" id="personelSAdi"  value="<%= rs.getString("soyisimp") %>">
                                                <small class="form-text text-muted">Yeni personelin soyadını yazınız...</small>
                                            </div>
                                        </div>
                                                                                
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin E-Mail Adresi</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="emailp" class="form-control" id="email" value="<%= rs.getString("emailp") %>">
                                                <small class="form-text text-muted">Yeni personele ait E-mail adresini yazınız...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br><!-- comment -->
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Telefon Numarası </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="telp" class="form-control" id="tel" value="<%= rs.getString("telp") %>">
                                                <small class="form-text text-muted">Yeni personele ait iletisim numarasını yazınız...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                        
                                          
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                                <a href="anasayfaY.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfa</button></a>
                                                <a href="personelduzenleY.jsp"><button  class="btn btn-primary mb-2"><i class="fas fa-save"></i> Kaydet</button></a>
                                            </div>
                                        </div>

                                        
                                    </form>
                                </div>
                            </div>
                        </div> 
            <br/>

                                    <%
                                        }
                                    %>
        </form>

    </body>
</html>