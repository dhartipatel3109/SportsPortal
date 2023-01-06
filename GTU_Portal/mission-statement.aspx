<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mission-statement.aspx.cs" Inherits="GTU_Portal.mission_statement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Gujarat Technological University</title>
     <link rel="icon" type="png" href="img/logo.png"/>
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="vendor/fontawesome-free/css/all.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/style1.css"/>
    <link rel="stylesheet" href="vendor/nivo-slider/nivo-slider.css"/>
    <link rel="stylesheet" href="vendor/nivo-slider/themes/default/default.css"/>
    <link rel="stylesheet" href="css/color.css"/>
</head>
<body>
    <div class="body">
        <header id="header" data-plugin-options="{'stickyEnabled': true, 'stickyStartAt': 158, 'stickySetTop': '-158px', 'stickyChangeLogo': true}">
            <div class="header-body border-color-primary border-top-0 box-shadow-none">
                <div class="header-container container z-index-2">
                    <div class="header-row py-2">
                        <div class="header-column">
                            <div class="header-row">
                                <div class="header-logo header-logo-sticky-change">
                                    <a href="index.html">
                                        <img class="header-logo-non-sticky opacity-0" alt="Gujarat Technological University" width="100" height="110" src="img/logo.png"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="header-column">

                            <h1 style="line-height: 20px; padding-top: 25px;"><strong>Gujarat Technical University</strong></h1>
                            <br />
                            <p style="font-size: 25px; line-height: 30px;">Sports Portal</p>

                        </div>
                               <div class="header-column justify-content-end">
                            <div class="float-rightr header-row">
                                <img src="img/bg.png" />
                                <h2 style="line-height: 40px; font-size: 25px; margin-top: 25px; position: absolute; color: red"><strong>Healthy Youth,</strong><br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Healthy Nation</strong>
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-nav-bar bg-primary">
                    <div class="container">
                        <div class="header-row">
                            <div class="header-column">
                                <div class="header-row justify-content-end">
                                    <div class="header-nav header-nav-force-light-text justify-content-start py-2 py-lg-3">
                                        <div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
                                            <nav class="collapse">
                                                <ul class="nav nav-pills" id="mainNav">
                                                    <li class="dropdown dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle active" href="index.html">Home</a>
                                                        <!-- <ul class="dropdown-menu"> 
                                                            <li><a class="dropdown-item" href="index.html">Landing Page</a></li>
                                                            <li class="dropdown-submenu"><a class="dropdown-item" href="#">One Page</a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a class="dropdown-item" href="index-one-page.html" data-thumb-preview="img/previews/preview-one-page.jpg">One Page Original</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>-->
                                                    </li>
                                                    <!--<li class="dropdown-full-color dropdown-light active">
                                                        <a class="dropdown-item dropdown-toggle" href="index.html">Home</a>
                                                    </li>-->
                                                    <li class="dropdown dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle" href="about-us.html">About Us</a>
                                                        <!-- <ul class="dropdown-menu"> 
                                                            <li><a class="dropdown-item" href="#">Menu 1</a></li>
                                                            <li><a class="dropdown-item" href="#">Menu 2</a></li>
                                                        </ul>-->
                                                    </li>
                                                    <li class=" dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle" href="#">Mission Statement</a>
                                                    </li>
                                                    <li class=" dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle" href="#">Gallery</a>
                                                    </li>
                                                    <li class=" dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle" href="#">Results</a>
                                                    </li>
                                                    <li class="dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle" href="#">Contact Us</a>
                                                    </li>
                                                    <li class="dropdown-full-color dropdown-light">
                                                        <a class="dropdown-item dropdown-toggle" href="#"><i class="fa-sign-in-alt fa mr-1 "></i>Login</a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <button class="btn header-btn-collapse-nav my-2" data-toggle="collapse" data-target=".header-nav-main nav">
                                            <i class="fas fa-bars"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div role="main" class="main">
            <section class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 order-2 order-md-1 align-self-center p-static">
                            <h1>About Us</h1>
                        </div>
                        <div class="col-md-4 order-1 order-md-2 align-self-center">
                            <ul class="breadcrumb d-block text-md-right">
                                <li><a href="#">Home</a></li>
                                <li class="active">Mission Statement</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section section-height-3 bg-color-grey-scale-1 m-0 border-0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <h2 class="text-color-dark font-weight-normal text-6 mb-2"><strong class="font-weight-extra-bold">Mission</strong></h2>
                            <div class="text-justify">
                                <asp:Label ID="desc1" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img src="img/gtu.jpg" class="img-fluid " alt="" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <h2 class="text-color-dark font-weight-normal text-6 mb-2"><strong class="font-weight-extra-bold">Vision</strong></h2>
                            <div class="text-justify">
                                <asp:Label ID="desc2" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </section>
        </div>
        <footer id="footer" class="mt-0">
            <div class="container">
                <div class="footer-copyright footer-copyright-style-2">
                    <div class="py-2">
                        <div class="row py-4">
                            <div class="col d-flex align-items-center justify-content-center mb-4 mb-lg-0">
                                <h4>Copyright © 2020. Gujarat Technological University. All Rights Reserved.</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script src="vendor/nivo-slider/jquery.nivo.slider.min.js"></script>
    <script src="js/nivo-sliser.js"></script>
</body>
</html>