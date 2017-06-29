<html>
    <head>
        <TITLE>Librería SUDAMERICANA</TITLE>
        <META id="_TopLeft_metaTitle" NAME="Title" content="SUDAMERICANA"></META>
        <META id="_TopLeft_metaSubject" NAME="Subject" content="SUDAMERICANA"></META>
        <META id="_TopLeft_metaDescription" NAME="Description" content="La mejor librería de Chile"></META>
        <META id="_TopLeft_metaLanguage" NAME="Language" content="español - spanish"></META>
        <META id="_TopLeft_metaRobots" NAME="Robots" content="All"></META>
        <link href="css/ie.css" rel="stylesheet" type="text/css">

        <SCRIPT language=javaScript>
            function openHelp()
            {
                str = "help.aspx"
                var newWindow = null
                newWindow = window.open(str, "", "width=400,height=400,resizable=no,scrollbars=yes,status=no");
                if (newWindow.focus)
                    newWindow.focus();
            }
        </SCRIPT>
        <SCRIPT language=javaScript>
            function submitForm(activity)
            {
                str = "signupNewsletter.aspx?customer_email=" + document.newsletterForm.customer_email.value + "&activity=" + activity;
                var newWindow = null
                newWindow = window.open(str, "", "width=300,height=300,resizable=no,scrollbars=no,status=no");
                if (newWindow.focus)
                    newWindow.focus();
            }
        </SCRIPT>
        <SCRIPT LANGUAGE="JavaScript">
            function popUp(url) {
                sealWin = window.open(url, "win", 'toolbar=0,location=0,directories=0,status=1,menubar=1,scrollbars=1,resizable=1,width=500,height=450');
                self.name = "mainWin";
            }
        </SCRIPT>

        <script type="text/javascript">
            _uacct = "UA-28875143-1";
            urchinTracker();
        </script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-28875143-1']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>


    </head>
    <?php
    require './marcoSuperior.php';
    ?>

    <script type="text/javascript">
        window.onload = function () {
            if (geoip_country_code() == "ES" && getCookie('aviso') != "1") {
                document.getElementById("barritaloca").style.display = "block";
            }
        }
        function getCookie(c_name) {
            var c_value = document.cookie;
            var c_start = c_value.indexOf(" " + c_name + "=");
            if (c_start == -1) {
                c_start = c_value.indexOf(c_name + "=");
            }
            if (c_start == -1) {
                c_value = null;
            } else {
                c_start = c_value.indexOf("=", c_start) + 1;
                var c_end = c_value.indexOf(";", c_start);
                if (c_end == -1) {
                    c_end = c_value.length;
                }
                c_value = unescape(c_value.substring(c_start, c_end));
            }
            return c_value;
        }
        function setCookie(c_name, value, exdays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
            document.cookie = c_name + "=" + c_value;
        }
        function PonerCookie() {
            setCookie('aviso', '1', 365);
            document.getElementById("barritaloca").style.display = "none";
        }
    </script>


    <?php
    require './marcoInferior.php';
    ?>

</html>