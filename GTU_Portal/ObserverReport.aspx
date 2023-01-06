<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ObserverReport.aspx.cs" Inherits="GTU_Portal.ObserverReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
        <section class="content-header">
            <h1>Observer Report</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Observer Report</li>
            </ol>
        </section>

        <section class="content">
            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Report</h3>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row" style="text-align:center">
                            <h3>ગુજરાત ટેકનોલોજીકલ યુનિવર્સિટી</h3>
                            <h3>ઓબ્સર્વેર રિપોર્ટ</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>ઓબ્સર્વેરનું નામ: <span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="observername" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>ઓબ્સર્વેરની સંસ્થા: <span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="observeroffice" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>ઓબ્સર્વેરનો હોદ્દો: <span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="observerpost" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>ઓબ્સર્વેર મોબાઈલ નંબર: <span class="m-color-red">*</span></label>
                                    <asp:TextBox ID="observermobile" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>
</asp:Content>
