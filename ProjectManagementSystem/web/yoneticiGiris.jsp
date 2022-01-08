<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <title>Proje / Personel Yönetim Sistemi</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    
    <body>
    <div class="container">

        <div class="admin-page-title">
            <h2>Proje / Personel Yönetim Sistemi</h2>
        </div>

        <div class="row page-card">
            <div class="col-lg-8 offset-1">                    
                <ul class="nav nav-pills nav-fill">                  
                    <li class="nav-item">
                        <a class="nav-link active" href="yoneticiGiris.jsp">Yönetici</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link unactive" href="personelGiris.jsp">Personel</a>
                    </li>                
                </ul>                       
            </div>
        </div> 
        <div class="row page-card">
            <div class="col-lg-8 offset-1 jumbotron">                   
                <h3 class="text-primary">Hesabınıza giriş yapın</h3><br />
                <form action="yoneticiLog.jsp">
                    <div class="form-group">
                        <label for="inputName">Kullanıcı Adı</label>
                        <input class="form-control" type="text" name="kullaniciAdi" placeholder="Kullanıcı adınızı giriniz" />
                    </div>
                    <div class="form-group">
                        <label for="inputPass">Şifre</label>
                        <input class="form-control" type="password" name="sifre" placeholder="Şifrenizi giriniz" />
                    </div>                    

                    <button type="submit" class="btn btn-primary btn-hover">Giriş Yap</button>
                    <br><br>
                    <a class="bottom-title" >Buralarda yeni misiniz?<a href="yoneticiKaydol.jsp"> Kaydol!</a></a>
                </form>                    
            </div>
        </div>        
    </div>
</body>
</html>
