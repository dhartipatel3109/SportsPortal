<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="GTU_Portal.contact_us" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Gujarat Technological University</title>
    <link rel="icon" type="png" href="img/logo.png" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="vendor/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="vendor/nivo-slider/nivo-slider.css" />
    <link rel="stylesheet" href="vendor/nivo-slider/themes/default/default.css" />
    <link rel="stylesheet" href="css/color.css" />
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
                                        <img class="header-logo-non-sticky opacity-0" alt="Gujarat Technological University" width="100" height="110" src="img/logo.png" />
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


        <%--<div class="container content">
            <div class="breadcrumbOuter">
                <ul class="breadcrumb">
                    <li>

                        <span id="ContentPlaceHolder1_BreadCrumbControl1_SiteMapPath1" class="PathSeparator"><span>
                            <a class="fIcon" href="/index.htm" title="Home">Home</a>
                        </span><span></span><span>

                            <span id="ContentPlaceHolder1_BreadCrumbControl1_SiteMapPath1_txtlabel_1" class="currentPage fIcon">Contact Us</span></span></span>
                    </li>
                </ul>
            </div>

            <div class="contactArea">
                <div class="address cf">
                    <div class="row">
                        <div class="cols5">
                            <h3>Gujarat Technical University</h3>
                            <div class="addressCol">
                                <p>
                                    Gujarat Technological University
Nr.Vishwakarma Government <br />Engineering College
Nr.Visat Three Roads, Visat - Gandhinagar<br />Highway
Chandkheda, Ahmedabad – 382424 - Gujarat 
                                </p>
                            </div>
                            <ul class="addressList">
                                <li><span class="fa fa-phone-square"></span>079-23267521/570 </li>
                                <li><span class="fa fa-envelope"></span><a href="mailto:info@gtu.ac.in" title="info@gtu.ac.in">info@gtu.ac.in</a>
                                </li>
                            </ul>
                            <h3>Contact Details</h3>
                            <div class="secretaryInfo">
                                <div class="officerBlock cf">
                                    <div class="imgTitle wrap25">
                                        <div class="img">
                                            <img src="img/AkashSir.jpg" alt="Mr. Akash Gohil" title="Mr. Akash Gohil" width="90" height="90"/></div>
                                        <p class="hodsName">Mr. Akash Gohil</p>
                                    </div>
                                    <div class="wrap75 officerDetails equalHeights">
                                        <p><strong>Designation</strong> : Vice Chancellor</p>
                                        <p><strong>Phone</strong> : 079 - 23288604</p>
                                        <p><strong>Mobile</strong> : +91 -</p>
                                        <p>
                                            <strong>Email</strong> : <a href="mailto:vc-sgsu@gujarat.gov.in" title="vc-sgsu@gujarat.gov.in">vc-sgsu@gujarat.gov.in</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cols7">
                            <div class="cf">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3669.3023269866726!2d72.57992721408341!3d23.122622084902503!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e82457313a8ff%3A0xaf3992de90969d7c!2sGujarat%20Technological%20University%20(Gtu)!5e0!3m2!1sen!2sin!4v1584439854585!5m2!1sen!2sin" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="displayNone">
                <span id="lang">23.231414</span> <span id="lati">72.639381</span>
                <div id="contentString">
                    <div id="mapContant">
                        <strong>Swarnim Gujarat Sports University</strong>
                        <div id="bodyContent">
                            Sector-15, G-Road, Nr. Mahatma Mandir,<br>
                            Govt. Commerce College Campus,<br>
                            Bh. College Building, Opp. Youth Hostel,<br>
                            Gandhinagar. 382016.
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <div role="main" class="main">
            <section class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 order-2 order-md-1 align-self-center p-static">
                            <h1>Contact Us</h1>
                        </div>
                        <div class="col-md-4 order-1 order-md-2 align-self-center">
                            <ul class="breadcrumb d-block text-md-right">
                                <li><a href="#">Home</a></li>
                                <li class="active">Contact Us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section section-height-3 bg-color-grey-scale-1 m-0 border-0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div>
                                <div class="text-justify">
                                    <h3 class="mb-3" id="universityName">Gujarat Technical University</h3>
                                    <p id="universityAddress" class="text-4 text-dark">
                                        Nr.Vishwakarma Government Engineering
                                        <br />
                                        College Nr.Visat Three Roads,<br />
                                        Visat - Gandhinagar Highway
                                        <br />
                                        Chandkheda, Ahmedabad – 382424 - Gujarat
                                    </p>

                                    <p id="universityMobile" class="text-4 text-dark text-justify"><i class="fa fa-phone"></i>&nbsp;&nbsp;&nbsp;079-23267521/570</p>
                                    <p id="universityEmail" class="text-4 text-dark text-justify"><i class="fa fa-envelope"></i>&nbsp;&nbsp;&nbsp;info@gtu.ac.in</p>

                                    <hr />
                                    <div class="row mt-5">
                                        <div class="img col-md-4">
                                            <img id="OfficerPhoto" src="img/AkashSir.jpg" class="img-fluid" alt="Dr. Akash Gohil" title="Dr. Akash Gohil" />
                                            <p id="OfficerName" class="text-center text-4 text-dark hodsName"><b>Dr. Akash Gohil</b></p>
                                        </div>
                                        <ul class="col-md-8 mt-4" style="list-style-type: none;">
                                            <li id="officerDesignation" class="mb-2 text-4 text-dark"><strong>Designation</strong> : GTU Sports Officer</li>
                                            <li id="officerPhoneNo" class="mb-2 text-4 text-dark"><strong>Phone</strong> : 079 - 23288604</li>
                                            <li id="officerMobile" class="mb-2 text-4 text-dark"><strong>Mobile</strong> : +91 - 9712989788</li>
                                            <li id="officerEmail" class="mb-2 text-4 text-dark"><strong>Email</strong> : <a href="mailto:vc-sgsu@gujarat.gov.in" title="vc-sgsu@gujarat.gov.in">vc-sgsu@gujarat.gov.in</a></li>
                                        </ul>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3669.3023269866726!2d72.57992721408341!3d23.122622084902503!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e82457313a8ff%3A0xaf3992de90969d7c!2sGujarat%20Technological%20University%20(Gtu)!5e0!3m2!1sen!2sin!4v1584439854585!5m2!1sen!2sin" width="100%" height="500" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
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
