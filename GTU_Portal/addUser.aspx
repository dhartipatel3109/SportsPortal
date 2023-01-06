<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addUser.aspx.cs" Inherits="GTU_Portal.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="addUserForm" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Add User</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li><a href="Users.aspx">User</a></li>
                    <li class="active">Add User</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add User</h3>
                                <div class="box-tools pull-right">
                                    <a href="User.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="UserNameLabel" runat="server">User Name<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="UserNameTextBox" class="form-control" placeholder="Enter User Name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="UserIdLabel" runat="server">User ID<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="UserIdTextBox" class="form-control" placeholder="Enter UserID" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="PasswordLabel" runat="server">Password<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="PasswordTextBox" class="form-control" placeholder="Enter Password" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="UserEmailLabel" runat="server">User Email<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="UserEmailTextBox" class="form-control" placeholder="Enter User Email-id" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="UserMobileLabel" runat="server">User Mobile No.<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="UserMobileTextBox" class="form-control" placeholder="Enter User Mobile no." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="CollegeLabel" runat="server">College Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="CollegeDropDownList" class="form-control" runat="server">
                                                    <asp:ListItem>--Select College--</asp:ListItem>
                                                    <asp:ListItem Value="051">Alpha College of Engineering &amp; Technology</asp:ListItem>
                                                    <asp:ListItem Value="067">Sal Institute of Technology &amp; Research</asp:ListItem>
                                                    <asp:ListItem Value="067">L.D Engineering College</asp:ListItem>
                                                    <asp:ListItem Value="032">L.J Institute of Engineering &amp; Technology</asp:ListItem>
                                                    <asp:ListItem Value="113">Sal College of Engineering</asp:ListItem>
                                                    <asp:ListItem Value="126">Sal Engineering &amp; Technical Institute</asp:ListItem>
                                                    <asp:ListItem Value="077">Silver Oak College of Engineering &amp; Technology</asp:ListItem>
                                             </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="UserTypeLabel" runat="server">User Type<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="UserTypeDropDownList" runat="server" class="form-control">
                                                <asp:ListItem>--Select Type--</asp:ListItem>
                                                <asp:ListItem Value="1">GTU Sports Officer</asp:ListItem>
                                                <asp:ListItem Value="2">College Manager</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <button id="userSubmitButton" type="submit" class="btn btn-primary" runat="server">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </section>
        </div>
    </form>
</asp:Content>
