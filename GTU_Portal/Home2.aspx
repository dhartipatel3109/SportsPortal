<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="Home2.aspx.cs" Inherits="GTU_Portal.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            function openTab(th)
            {
                debugger;
                window.open(th.name,'_blank');
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div role="main" class="main">
                <div class="nivo-slider">
                    <div class="slider-wrapper theme-default">
                        <div id="nivoSlider" class="nivoSlider">
                            <img src="img/1.jpg" data-thumb="img/1.jpg" alt="" />
                            <img src="img/2.jpg" data-thumb="img/2.jpg" alt="" />
                        </div>
                        <div id="htmlcaption" class="nivo-html-caption"></div>
                    </div>
                </div>
                <!-- <section class="section bg-color-light border-0 m-0"> 
                
				 <div class="container"> 
                    <div class="heading text-primary heading-border heading-bottom-border">
                        <h2 class="text-primary"><strong>Heading H2</strong></h2>
                    </div>
                    <div class="row text-center text-md-left mt-4">
                        <div class="col-md-4 mb-3">
                            <a href="#">
                                <div class="row m-2 pt-4 justify-content-md-start" style="background-color: #f5f5f5; border: 1px solid #ccc">
                                    <div class="col-4">
                                        <img class="img-fluid mb-4" src="img/logos/List_of_event.png" alt="">
                                    </div>
                                    <div class="col-lg-8">
                                        <h2 class="font-weight-bold text-5 line-height-5 mt-4">List of Events</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 mb-3">
                            <a href="#">
                                <div class="row m-2 pt-4 justify-content-md-start" style="background-color: #f5f5f5; border: 1px solid #ccc">
                                    <div class="col-4">
                                        <img class="img-fluid mb-4" src="img/logos/Upload_event.png" alt="">
                                    </div>
                                    <div class="col-lg-8">
                                        <h2 class="font-weight-bold text-5 line-height-5 mt-4">Upload Events</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 mb-3">
                            <a href="#">
                                <div class="row m-2 pt-4 justify-content-md-start" style="background-color: #f5f5f5; border: 1px solid #ccc">
                                    <div class="col-4">
                                        <img class="img-fluid mb-4" src="img/logos/event_request.png" alt="">
                                    </div>
                                    <div class="col-lg-8">
                                        <h2 class="font-weight-bold text-5 line-height-5 mt-4">Event Request</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 mb-3">
                            <a href="#">
                                <div class="row m-2 pt-4 justify-content-md-start" style="background-color: #f5f5f5; border: 1px solid #ccc">
                                    <div class="col-4">
                                        <img class="img-fluid mb-4" src="img/logos/event_assign.png" alt="">
                                    </div>
                                    <div class="col-lg-8">
                                        <h2 class="font-weight-bold text-5 line-height-5 mt-4">Event Assign</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 mb-3">
                            <a href="#">
                                <div class="row m-2 pt-4 justify-content-md-start" style="background-color: #f5f5f5; border: 1px solid #ccc">
                                    <div class="col-4">
                                        <img class="img-fluid mb-4" src="img/logos/gallery2.png" alt="">
                                    </div>
                                    <div class="col-lg-8">
                                        <h2 class="font-weight-bold text-5 line-height-5 mt-4">Add Photos</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 mb-3">
                            <a href="#">
                                <div class="row m-2 pt-4 justify-content-md-start" style="background-color: #f5f5f5; border: 1px solid #ccc">
                                    <div class="col-4">
                                        <img class="img-fluid mb-4" src="img/logos/add_college.png" alt="">
                                    </div>
                                    <div class="col-lg-8">
                                        <h2 class="font-weight-bold text-5 line-height-5 mt-4">Edit College List</h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>-->
                <section class="section section-height-3 bg-color-grey-scale-1 m-0 border-1">
                    <div class="container">
                        <div class="row">                            
                            <div class="col-lg-6">
                                <h2 class="text-color-dark font-weight-normal text-6 mb-2 border-1"><strong class="font-weight-extra-bold">Updates</strong></h2>
                                <%--<marquee direction="up">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget.</marquee>--%>

                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="panel1" runat="server" BorderStyle="Solid" Height="300px">
                                            <%--<marquee direction="up" scrolldelay="500" hspace="10" style="height: 290px; width : 100%; padding-top : 0px;" onmouseover="this.stop()" onmouseout="this.start()"> --%>
                                            <div style="height: 290px;">
                                                <marquee id="myMarquee" scrolldelay="200" direction="up" hspace="10" height="290px" loop="infinite" style="overflow: hidden;" onmouseover="this.stop()" onmouseout="this.start()">
                                                    <label id="N1" runat="server" style="font-weight:bold; font-size:large;"></label><br />
                                                    <label id="N2" runat="server" style="font-weight:bold; font-size:large;"></label><br />
                                                    <label id="N3" runat="server" style="font-weight:bold; font-size:large;"></label><br />
                                                    <label id="N4" runat="server" style="font-weight:bold; font-size:large;"></label><br />
                                                    <label id="N5" runat="server" style="font-weight:bold; font-size:large;"></label><br />                                                
                                                    <label id="N6" runat="server" style="font-weight:bold; font-size:large;"></label><br />                                          
                                                    <label id="N7" runat="server" style="font-weight:bold; font-size:large;"></label>                                                
                                                </marquee>
                                            </div>
                                        </asp:Panel>
                                        <%--<asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <%--<a href="about-us.html" class="btn-lg btn btn-dark">LEARN MORE</a>--%>
                            </div>
                            <div class="col-lg-6">
                                <img src="img/Sports.png" class="img-fluid" alt="" />
                            </div>
                        </div>
                    </div>
                </section>
                <section class="section section-height-3 bg-color-grey-scale-1 m-0 border-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <img src="img/Sports.png" class="img-fluid" alt="" />
                            </div>
                            <div class="col-lg-6">
                                <h2 class="text-color-dark font-weight-normal text-6 mb-2 border-1"><strong class="font-weight-extra-bold">Game Circular</strong></h2>
                                <asp:Panel ID="panel2" runat="server" BorderStyle="Solid" Height="300px">
                                    <div style="height: 290px;">
                                        <marquee scrolldelay="200" direction="up" hspace="10" height="290px" loop="infinite" style="overflow: hidden;" onmouseover="this.stop()" onmouseout="this.start()">
                                            <a id="A1" href="#" onclick="openTab(this)" runat="server"><label id="G1" runat="server" style="font-weight:bold; font-size:large;"></label></a><br />
                                            <a id="A2" href="#" onclick="openTab(this)" runat="server"><label id="G2" runat="server" style="font-weight:bold; font-size:large;"></label></a><br />
                                            <a id="A3" href="#" onclick="openTab(this)" runat="server"><label id="G3" runat="server" style="font-weight:bold; font-size:large;"></label></a><br />
                                            <a id="A4" href="#" onclick="openTab(this)" runat="server"><label id="G4" runat="server" style="font-weight:bold; font-size:large;"></label></a><br />
                                            <a id="A5" href="#" onclick="openTab(this)" runat="server"><label id="G5" runat="server" style="font-weight:bold; font-size:large;"></label></a><br />                                                
                                            <a id="A6" href="#" onclick="openTab(this)" runat="server"><label id="G6" runat="server" style="font-weight:bold; font-size:large;"></label></a><br />                                          
                                            <a id="A7" href="#" onclick="openTab(this)" runat="server"><label id="G7" runat="server" style="font-weight:bold; font-size:large;"></label></a>                                                
                                        </marquee>
                                    </div>
                                </asp:Panel>
                            </div>                            
                        </div>
                    </div>
                </section>
                <section class="section section-height-3 bg-color-grey-scale-1 m-0 border-0">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <h2 class="text-color-dark font-weight-normal text-6 mb-2"><strong class="font-weight-extra-bold">Who We Are</strong></h2>
                                <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc. Vivamus bibendum magna ex, et faucibus lacus venenatis eget.</p>
                                <a href="about-us.html" class="btn-lg btn btn-dark">LEARN MORE</a>
                            </div>
                            <div class="col-lg-6">
                                <img src="img/gtu.jpg" class="img-fluid " alt="" />
                            </div>
                        </div>
                    </div>
                </section>
            </div>
</asp:Content>
