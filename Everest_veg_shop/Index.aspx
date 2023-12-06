<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Everest_veg_shop.View.Index" %>



<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">

    <title>Everest Vegetables-Home</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" href="images/fevicon.png" type="image/gif" />

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="css/responsive.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">

    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>


<body class="main-layout">
    <!-- loader  -->
    <div class="loader_bg">
        <div class="loader">
            <img src="images/loading.gif" alt="#" />
        </div>
    </div>
    <!-- end loader -->
    <!-- header -->
    <header>
        <!-- header inner -->
        <div class="header-top">
            <div class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <!--<a href="index.html"><img src="images/logo.png" alt="#" /></a>-->
                                        <h2>Everest Vegetables</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-9">

                            <div class="menu-area">
                                <div class="limit-box">
                                    <nav class="main-menu ">
                                        <ul class="menu-area-main">
                                            <li class="active"><a href="index.aspx">Home</a> </li>
                                            <li><a href="#about">About</a> </li>
                                            <li><a href="#vegetable">Vegetable</a> </li>
                                            <li><a href="#testimonial">Testomonial</a> </li>
                                            <li><a href="#contact">Contact Us</a> </li>


                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header inner -->
        <!-- end header -->
        <section class="slider_section">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">

                        <div class="container-fluid padding_dd">
                            <div class="carousel-caption">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="text-bg">
                                            <span>Welcome To </span>

                                            <h1>Everest Vegetables</h1>
                                            <p>
                                                At Everest vegetables Shop,
                                                    we are passionate about providing the freshest and highest quality
                                                    vegetables to our valued customers.
                                                    We believe that a healthy and balanced diet begins with fresh,
                                                    locally sourced produce.
                                            </p>



                                            <a href="#contact">Contact Us</a>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="images_box">
                                            <figure>
                                                <img src="images/img2.png">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">

                        <div class="container-fluid padding_dd">
                            <div class="carousel-caption">

                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="text-bg">
                                            <span>Welcome To Everest Vegetables</span>
                                            <h1>Customer Service</h1>
                                            <p>
                                                At Everest Vegetables, we believe in providing an exceptional shopping
                                                    experience.
                                                    Our friendly and knowledgeable staff is always ready to assist you,
                                                    whether you need guidance in selecting the perfect ingredients for a
                                                    recipe or recommendations on how to best store and prepare your
                                                    vegetables.
                                                    We value your feedback and strive to continuously improve our
                                                    services to meet your needs.
                                            </p>

                                            <a href="#contact">Contact Us</a>
                                        </div>

                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="images_box">
                                            <figure>
                                                <img src="images/immune-boosting.jpg">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="carousel-item">

                        <div class="container-fluid padding_dd">
                            <div class="carousel-caption ">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="text-bg">
                                            <span>Welcome To Everest Vegetables</span>
                                            <h1>Vegetables Shop</h1>
                                            <p></p>
                                            <a href="#contact">Contact Us</a>
                                        </div>

                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="images_box">
                                            <figure>
                                                <img src="images/vegetables.jpg">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>

        </section>
        </div>
    </header>



    <!-- about  -->
    <div id="about" class="about">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                    <div class="about-box">
                        <h2>About us</h2>
                        <p>
                            We take pride in sourcing our vegetables from local farms and trusted suppliers who
                                share our commitment to sustainable and environmentally friendly farming practices.
                                Our team carefully selects each vegetable,
                                ensuring that only the finest and freshest produce makes it to our shelves.
                                We prioritize quality and freshness above all else,
                                so you can trust that every purchase you make at Everest vegetables Shop is of the
                                highest standard.
                        </p>

                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 padding_rl">
                    <div class="about-box_img">
                        <figure>
                            <img src="images/about.jpg" alt="#" />
                        </figure>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- end abouts -->
    <!-- vegetable -->
    <div id="vegetable" class="vegetable">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Fresh <strong class="llow">vegetable</strong> </h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-5 col-sm-12 ">
                    <div class="vegetable_shop">
                        <h3>Best Vegetables Shop</h3>
                        <p>
                            Variety for Every Taste:
                                We understand that every customer has unique tastes and preferences when it comes to
                                vegetables.
                                That's why we offer a wide variety of vegetables to cater to different culinary needs
                                and dietary preferences.
                                From leafy greens bursting with nutrients to vibrant and flavorful heirloom tomatoes,
                                our shelves are stocked with an array of options to satisfy even the most discerning
                                palates.
                                We also take pride in offering seasonal produce,
                                allowing you to enjoy the best flavors nature has to offer throughout the year.
                        </p>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-7 col-sm-12 ">
                    <div class="vegetable_img">
                        <figure>
                            <img src="images/v1.jpg" alt="#" />
                        </figure>
                        <span>01</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 ">

                        <div class="vegetable_img margin_top mt-4">
                            <figure>
                                <img src="images/v2.jpg" alt="#" />
                            </figure>
                            <span>02</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- end vegetable -->
    <!-- clients -->
    <div id="testimonial" class="clients">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Feedbacks</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clients_red">
        <div class="container">
            <div id="testimonial_slider" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#testimonial_slider" data-slide-to="0" class=""></li>
                    <li data-target="#testimonial_slider" data-slide-to="1" class="active"></li>
                    <li data-target="#testimonial_slider" data-slide-to="2" class=""></li>
                </ul>
                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <div class="testomonial_section">

                            <div class="full testimonial_cont">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 pa_right">
                                        <div class="testomonial_img">
                                            
                                            <i>
                                                <img src="images/test_con.png" alt="#" /></i>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 pa_left">
                                        <div class="cross_inner">
                                            <h3>Arun<br />
                                                <strong class="ornage_color">review</strong></h3>
                                            <p>
                                                One of the best place to buy fresh fruits and vegetables. All varieties of fruits or vegetables are available here.
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item active">

                        <div class="testomonial_section">
                            <div class="full center">
                            </div>
                            <div class="full testimonial_cont ">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 pa_right">
                                        <div class="testomonial_img">
                                           
                                            <i>
                                                <img src="images/test_con.png" alt="#" /></i>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 pa_left">
                                        <div class="cross_inner">
                                            <h3>Bastin<br />
                                                <strong class="ornage_color">review</strong></h3>
                                            <p>
                                                One place to buy vegetables and fruits. Everything is fresh.From the moment I stepped in, I was greeted by a vibrant display of colorful and fresh vegetables that were meticulously arranged. It was evident that the shop takes great pride in maintaining the highest quality produce. The aroma of freshly harvested greens was inviting and reassuring.

                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="carousel-item">

                        <div id="testomonial" class="testomonial_section">
                            <div class="full center">
                            </div>
                            <div class="full testimonial_cont ">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 pa_right">
                                        <div class="testomonial_img">
                                            
                                            <i>
                                                <img src="images/test_con.png" alt="#" /></i>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 pa_left">
                                        <div class="cross_inner">
                                            <h3>Guru<br />
                                                <strong class="ornage_color">review</strong></h3>
                                            <p>
                                            I recently had the pleasure of visiting [Everest Vegetables], and I must say, it was an absolute treat for my senses. This gem of a vegetable shop left a lasting impression on me for all the right reasons.
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- end clients -->
    <!-- contact -->
    <div id="contact" class="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Contact <strong class="llow">us</strong></h2>
                    </div>
                </div>

            </div>
            <div class="white_color">
                <div class="row">

                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                        
                        <form class="contact_bg" runat="server" method="post">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="col-md-12">
                                        <asp:TextBox ID="txt_contact_name" class="contactus" placeholder="Your Name" type="text" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txt_contact_email" class="contactus" placeholder="Email" type="text" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txt_contact_phonenumber" class="contactus" placeholder="Phone Number" type="text" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox class="textarea" ID="txt_contact_msg" placeholder="Write here" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                        <label id="SuccessMsg" class="text-success" runat="server"></label>
                                        <label id="ErrMsg" class="text-danger" runat="server"></label>
                                        <asp:Button class="send btn" ID="btn_contact_send" runat="server" Text="Send" OnClick="btn_contact_send_Click"  />
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="col-xl-8 col-lg-6 col-md-6 col-sm-12">
                    <div id="map">
                    </div>
                </div>


                

                </div>
            </div>
        </div>

    </div>





    <!--  footer -->
    <footer>
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h1 class="footerlogo text-center">Everest vegetables</h1>

                    </div>
                    <div class="col-md-4"></div>
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 ">
                        <div class="row justify-content-around">
                            <div class="col-sm-9 ">
                                <div class="address">
                                    <h3>Address </h3>
                                    <ul class="local">
                                        <li>
                                            <a href="#"></a>It is a long established fact
                                                <br>
                                            that a reader will be
                                        </li>
                                        <li>
                                            <a href="#"></a>(+71 1234567890)
                                        </li>
                                        <li>
                                            <a href="#"></a>everestveg@gmail.com
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="address">
                                    <h3>Social Link</h3>
                                    <ul class="Menu_footer">
                                        <li class="active"><a href="#"><i class="fa-brands fa-twitter" style="color: #16aed4;"></i> Twitter</a> </li>
                                        <li><a href="#"><i class="fa-brands fa-facebook" style="color: #476fe6;"></i> Facebook</a> </li>
                                        <li><a href="#"><i class="fa-brands fa-instagram" style="color: #e4405f;"></i> Instagram</a> </li>
                                        
                                    </ul>
                                </div>
                            </div>


                            
                            </div>
                        
                    </div>

                </div>

            </div>
            <div class="copyright">
                <div class="container">
                    <p>Copyright © 2023 Design by Arun Bastin </p>
                    <br />
                    <p>Email: arun.fastin@gmail.com</p>
                    <p class="text-end"><asp:HyperLink ID="txt_login_admin" runat="server" NavigateUrl="~/View/Login.aspx">admin</asp:HyperLink></p>

                </div>
            </div>
        </div>
    </footer>



    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>


    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {
                    lat: 40.645037,
                    lng: -73.880224
                },
            });

            var image = 'images/maps-and-flags.png';
            var beachMarker = new google.maps.Marker({
                position: {
                    lat: 40.645037,
                    lng: -73.880224
                },
                map: map,
                icon: image
            });
        }
    </script>
    <!-- google map js -->
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
    <!-- end google map js -->

    <!-- Contact form send button ajax-->
    



</body>

</html>
