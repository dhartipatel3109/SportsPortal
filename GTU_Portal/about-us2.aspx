<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="about-us2.aspx.cs" Inherits="GTU_Portal.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                <li class="active">About Us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section section-height-3 bg-color-grey-scale-1 m-0 border-0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <h2 class="text-color-dark font-weight-normal text-6 mb-2"><strong class="font-weight-extra-bold">Who We Are</strong></h2>
                            <div class="text-justify">
                                <asp:Label ID="description" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img src="img/gtu.jpg" class="img-fluid " alt="" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
</asp:Content>
