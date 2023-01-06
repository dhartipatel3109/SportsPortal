<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="contact-us2.aspx.cs" Inherits="GTU_Portal.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <h3 class="mb-3" id="universityName" runat="server"><img src="img/logo.png" height="30px" width="25px"/>&nbsp;Gujarat Technical University</h3>
                                    <p id="universityAddress" class="text-4 text-dark" runat="server">
                                        Nr.Vishwakarma Government Engineering
                                        <br />
                                        College Nr.Visat Three Roads,<br />
                                        Visat - Gandhinagar Highway
                                        <br />
                                        Chandkheda, Ahmedabad – 382424 - Gujarat
                                    </p>
                                    <p id="universityPhone" class="text-4 text-dark text-justify" runat="server"><i class="fa fa-phone"></i>&nbsp;&nbsp;&nbsp;079-23267521/570</p>
                                    <p id="universityEmail" class="text-4 text-dark text-justify" runat="server"><i class="fa fa-envelope"></i>&nbsp;&nbsp;&nbsp;info@gtu.ac.in</p>
                                    <hr style="border:1px solid black;"/>
                                    <div class="row mt-5">
                                        <div class="img col-md-4">
                                            <asp:Image ID="OfficerPhoto" Height="150px" Width="150px" runat="server" />
                                            <p id="officerName" class="text-center text-4 text-dark hodsName" runat="server"><b>Dr. Akash Gohil</b></p>
                                        </div>
                                        <ul class="col-md-8 mt-4" style="list-style-type: none;">
                                            <strong>Designation: </strong><li id="officerDesignation" class="mb-2 text-4 text-dark" runat="server">GTU Sports Officer</li>
                                            <strong>Phone: </strong><li id="officerPhoneNo" class="mb-2 text-4 text-dark" runat="server">079 - 23288604</li>
                                            <strong>Mobile: </strong><li id="officerMobile" class="mb-2 text-4 text-dark" runat="server">+91 - 9712989788</li>
                                            <strong>Email: </strong><li id="officerEmail" class="mb-2 text-4 text-dark" runat="server"><a href="mailto:vc-sgsu@gujarat.gov.in" title="vc-sgsu@gujarat.gov.in">vc-sgsu@gujarat.gov.in</a></li>
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
</asp:Content>
