<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GTU_Portal.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Dashboard</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li class="active">Dashboard</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3><asp:Label ID="clg" runat="server"></asp:Label></h3>
                                <p>
                                    Total Collage(s)<br />
                                    &nbsp;
                                </p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-university"></i>
                            </div>
                            <a href="college.html" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3><asp:Label ID="newevent" runat="server"></asp:Label></h3>
                                <p>
                                    Total Upcomming<br />Event(s)
                                </p>
                            </div>
                            <div class="icon">
                                <i class="fa-star-o fa"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3><asp:Label ID="oldevent" runat="server"></asp:Label></h3>
                                <p>
                                    Total Past<br />
                                    Events
                                </p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-list-ul"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>44</h3>
                                <p>
                                    Total Images<br />
                                    In Gallery
                                </p>
                            </div>
                            <div class="icon">
                                <i class="fa-photo fa"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa-arrow-circle-right fa"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <div class="row">
                    
                </div>

                
            </section>
        </div>
</asp:Content>
