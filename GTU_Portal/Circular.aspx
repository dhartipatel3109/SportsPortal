<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="Circular.aspx.cs" Inherits="GTU_Portal.WebForm15" %>
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
            </div>

</asp:Content>
