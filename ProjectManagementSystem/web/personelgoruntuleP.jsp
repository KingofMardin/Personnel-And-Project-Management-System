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

                <div class="content">
                    <div class="container">
                        <div class="page-title">
                            <h3>Personel Listesi</h3>
                            </h3>
                        </div>

                        <div class="box box-primary">
                            <div class="box-body">
                                <table width="100%" class="table table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Kayıt Num.</th>
                                            <th>Adı</th>
                                            <th>Soyadı</th>
                                            <th>Kullanıcı Adı</th>
                                            <th>E-Posta Adresi</th>
                                            <th>Şifre</th>
                                            <th>Adres</th>
                                            <th>Telefon No</th>

                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>


                                        <%
                                            Connection con;
                                            PreparedStatement pst;
                                            ResultSet rs;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim", "root", "root");

                                            String query = "Select * from personelreg";
                                            pst = con.prepareStatement(query);
                                            rs = pst.executeQuery();

                                            while (rs.next()) {
                                        %>

                                        <tr>
                                            <td scope="row"><%= rs.getString("kayitNo")%></td>
                                            <td><%=rs.getString("isimp")%></td>
                                            <td><%=rs.getString("soyisimp")%></td>
                                            <td><%=rs.getString("kullaniciAdip")%></td>
                                            <td><%=rs.getString("emailp")%></td>
                                            <td><%=rs.getString("sifrep")%></td>
                                            <td><%=rs.getString("adresp")%></td>
                                            <td><%=rs.getString("telp")%></td>

                                        </tr>

                                        <%
                                            }
                                        %>  

                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>       
            </div>
        </div>
    </div>
</div>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/datatables/datatables.min.js"></script>
<script src="assets/js/initiate-datatables.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>