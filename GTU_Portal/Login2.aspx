<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="GTU_Portal.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div role="main" class="main">

            <section class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 order-2 order-md-1 align-self-center p-static">
                            <h1>Login</h1>
                        </div>
                        <div class="col-md-4 order-1 order-md-2 align-self-center">
                            <ul class="breadcrumb d-block text-md-right">
                                <li><a href="#">Home</a></li>
                                <li class="active">Login</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <div class="container">
                <div class="row">
                    <div class="col">

                        <div class="featured-boxes">
                            <div class="row">
                                <div class="offset-3 col-md-6">
                                    <div class="featured-box featured-box-primary text-left mt-5">
                                        <div class="box-content">
                                            <h4 class="color-primary font-weight-semibold text-4 text-uppercase text-center mb-3">LOGIN</h4>
                                                <div class="form-row">
                                                    <div class="form-group col">
                                                        <label class="font-weight-bold text-dark text-2">UserID</label>
                                                        <asp:TextBox ID="TextBoxuserid" runat="server" CssClass="form-control" ></asp:TextBox>
                                                        
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col">
                                                        <%--<a class="float-right" href="#">Forgot Password?</a>--%>
                                                        <label class="font-weight-bold text-dark text-2">Password</label>
                                                        <asp:TextBox ID="TextBoxpassword" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox>
                                                   
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col">
                                                        <label class="font-weight-bold text-dark text-2">User Type</label>
                                                        <asp:DropDownList ID="UsertypeDropDownList" runat="server" CssClass="form-control">
                                                            <%--<asp:ListItem>--Select User type--</asp:ListItem>--%>
                                                            <asp:ListItem Value="2">College Manager</asp:ListItem>                                                            
                                                            <asp:ListItem Value="1">GTU Sports Officer</asp:ListItem>
                                                            <asp:ListItem Value="3">Observer</asp:ListItem>                                                            
                                                        </asp:DropDownList>
                                                        
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                                    <div class="text-center form-group col-lg-12">
                                                        <asp:Button ID="Buttonlogin" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Buttonlogin_Click" />
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

        </div>
</asp:Content>
