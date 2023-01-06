<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UploadResult.aspx.cs" Inherits="GTU_Portal.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Events</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>GTU Event</a></li>
                <li class="active">Events</li>
            </ol>
        </section>
        <section class="content">

            <section class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Search</h3>
                        <div class="box-tools pull-right">
                            <button id="Button1" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Winner Name<span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="Winner" placeholder="Winner Team_id" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>1st Runner-Up Name<span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="Fstrunner" placeholder="Winner Team_id" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>2nd Runner-Up Name<span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="Sndrunner" placeholder="Winner Team_id" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <asp:Button ID="Submit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Submit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </div>
</asp:Content>
