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
    <jsp:include page="headerp.jsp"/>
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
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

                       Connection con;     
                       String msg = "";
                       String color = "";


                       if(request.getMethod().compareToIgnoreCase("post")==0)
                           {
                        try
                        {
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
                                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                                 String query = "update projepersonel set projeAdi= ?, projeTuru =?, projeAciklama =?, durum =?, kullanim =?, personelAdi =?, personelSoyadi =?, departman = ? where kayitNo = ?";

                                PreparedStatement pst = con.prepareStatement(query);



                                pst.setString(1, projeAdi);
                                pst.setString(2, projeTuru);
                                pst.setString(3, projeAciklama);
                                pst.setString(4, durum);
                                pst.setString(5, kullanim);
                                pst.setString(6, personelAdi);
                                pst.setString(7, personelSoyadi);
                                pst.setString(8, departman);
                                pst.setString(9, kayitNo);

                                pst.executeUpdate();

                                color = "green";
                                msg = "Seçilen Proje Başarıyla Düzenlendi ve Kaydedildi...";


                        }catch(Exception ex){
                                ex.printStackTrace();
                                color = "red";
                                msg = "Kayıtlı Proje Üzerinde Yapılan değişiklikler Kaydolurken Bir Hata Oluştu...";
                        }
                           }
                   %>    
        
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
        <a href="anasayfaP.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfaya Dön</button></a>
        <a href="projeraporlariP.jsp"><button  class="btn btn-primary mb-2"><i class="fas fa-save"></i> Tüm Raporlar</button></a>
    </div>
        
        <form id="form" method="post" action="raporduzenleP.jsp" class="form-horizontal">
            
            <% 
                          
                PreparedStatement pst;
                ResultSet rs;

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://eu-cdbr-west-03.cleardb.net:3306/heroku_601e272c485ad47","b1b5e4dbb545d7","a66fbac1");

                String id = request.getParameter("id");

                pst = con.prepareStatement("select * from projepersonel where kayitNo = ?");
                pst.setString(1, id);
                rs = pst.executeQuery();

                while(rs.next())
                {
                    
            %>   
         	
                            <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">Daha Önce Oluşturulmuş Projenin Üzerinde Değişiklikler Yapın...</div>
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <form class="form-horizontal">
                                        
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Projenin Kayıt Numarası </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="kayitNo" class="form-control" id="kayitNo" value="<%= rs.getString("kayitNo") %>">
                                                <small class="form-text text-muted">Kayıtlı Proje Raporunun kayıt numarasını giriniz..</small>
                                            </div>
                                        </div><!-- comment -->
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Projenin Adı </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeAdi" class="form-control" id="projeAdi" value="<%= rs.getString("projeAdi") %>">
                                                <small class="form-text text-muted">Projenin adını yazınız....</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Projenin Türü  </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeTuru" class="form-control" id="projeTuru" value="<%= rs.getString("projeTuru") %>">
                                                <small class="form-text text-muted">Projenin türünü yazınız...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Aciklamasi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeAciklama" class="form-control" id="projeAciklama"  value="<%= rs.getString("projeAciklama") %>">
                                                <small class="form-text text-muted">Proje hakkinda kisa bir aciklama yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Şu anki Durumu </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="durum" class="form-control" id="durum" value="<%= rs.getString("durum") %>">
                                                <small class="form-text text-muted">Projenin Şu anki durumu hakkında bilgi veriniz....</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projede Kullanılan Teknolojiler </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="kullanim" class="form-control" id="kullanim" value="<%= rs.getString("kullanim") %>">
                                                <small class="form-text text-muted">Proje yapılırken kullanılan teknolojilerden bahsediniz...</small>
                                            </div>
                                        </div>
                                          
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Adı </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="personelAdi" class="form-control" id="personelAdi" value="<%= rs.getString("personelAdi") %>">
                                                <small class="form-text text-muted">Proje Raporunu oluşturan Personelin adını yazınız...</small>
                                            </div>
                                        </div>
                                                
                                        <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Soyadı </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="personelSoyadi" class="form-control" id="personelSoyadi" value="<%= rs.getString("personelSoyadi") %>">
                                                <small class="form-text text-muted">Proje Raporunu oluşturan Personelin soyadını yazınız...</small>
                                            </div>
                                          </div><!-- comment -->
                                          
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Çalıştığı Departman</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="departman" class="form-control" id="departman" value="<%= rs.getString("departman") %>">
                                                <small class="form-text text-muted">Proje Raporunu oluşturan Personelin çalıştığı departmanı yazınız...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br><!-- comment -->
                                          
                                       
                                        
                                          
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                                <a href="anasayfaP.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfa</button></a>
                                                <a href="raporduzenleP.jsp"><button  class="btn btn-primary mb-2"><i class="fas fa-save"></i> Kaydet</button></a>
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
        </div>
            </div>

    </body>
</html>