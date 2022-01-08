<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <div id="cookie-box" class="cookie-consent"> <span>Proje / Personel Yönetim Sistemi'ne Hoş Geldiniz! <%=rs.getString("isimp")%> <%=rs.getString("soyisimp")%></span>
        <button class="allow-button mr-1" onclick="acceptCookies()">Bir Daha Gösterme!</button> 
        <button class="allow-button" onclick="closeBox()">Kapat</button>
    </div>

    <%
        }
    %> 
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
        <div class="content phome">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 page-header">

                        <h2 class="page-title">Proje / Personel Yönetim Sistemine Hoş Geldiniz! </h2>
                    </div>
                </div>

                <div class="row">   
                    <div class="col-md-12">
                        <div class="home-card mb-3">
                            <div>
                                <h5 class="home-card-title">Personellerinizi ve Projelerini Görüntüleyin, Düzenleyin!</h5>
                                <p class="home-card-text">"İşinizi yönetin, uygulamaları değil!"</p>
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
<script src="assets/vendor/chartsjs/Chart.min.js"></script>
<script src="assets/js/dashboard-charts.js"></script>
<script src="assets/js/script.js"></script>

<script>
            function setCookie(cname, cvalue, exdays) {
                const d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                let expires = "expires=" + d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            }
            function getCookie(cname) {
                let name = cname + "=";
                let decodedCookie = decodeURIComponent(document.cookie);
                let ca = decodedCookie.split(';');
                for (let i = 0; i < ca.length; i++) {
                    let c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            if (getCookie('boxClosed')) {
                closeBox();
            }
            function closeBox() {
                document.getElementById('cookie-box').remove();
            }

            function acceptCookies() {
                setCookie("boxClosed", "true", 365);
                closeBox();
            }
</script>
</body>
</html>