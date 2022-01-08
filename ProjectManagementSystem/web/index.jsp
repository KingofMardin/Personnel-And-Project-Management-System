<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html

<html>
<jsp:include page="header.jsp"/>
        
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        
                       
                    </ul>
                </div>
            </nav>
            <div class="content phome">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 page-header">

                            <h2 class="page-title" >Proje / Personel Yönetim Sistemine Hoş Geldiniz!</h2>
                        </div>
                    </div>
                    
                   <div class="row">
                        
                        
                       
                        <div class="col-md-12">
                            <div class="mb-3">
                                <div class="home-card">                                    
                                    <h5 class="home-card-text">Proje / Personel Yönetim Sistemi; görev yönetimi, proje planlama, takım işbirliği ve müşterilerinizi tek bir platformda birleştirir.</h5>
                                    <p class="home-card-text"><small class="text-muted">"İşinizi yönetin, uygulamaları değil!"</small></p>
                                    <p class="home-card-title"> Şimdi Kaydolarak <a href="personelKaydol.jsp">Proje / Personel Yönetim Sistemi</a>'ni İnceleyin!</p>
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
    <script src="https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.js" data-cfasync="false"></script>
<script>
    window.cookieconsent.initialise({
        "palette": {
            "popup": {
                // Uyarının arkaplan rengini belirtiyoruz.
                "background": "#222"
            },
            // Uyarı butonunun rengini belirtiyoruz.
            "button": {
                "background": "#E83C4D"
            }
        },
        "theme": "classic",

        // Bu alanda; uyarı mesajını, Buton adını, Url adını ve hedef adresi belirtiyoruz.
        "content": {
            "message": "Bu sitede, kullanıcı deneyimini geliştirmek ve internet sitesinin verimli çalışmasını sağlamak amacıyla çerezler kullanılmaktadır.",
            "dismiss": "Tamam",
            "link": "Ayrıntıları inceleyiniz",
            "href": ""
        }
    });
</script>
</body>

</html>