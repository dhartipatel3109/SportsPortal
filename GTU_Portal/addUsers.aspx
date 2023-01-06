<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addUsers.aspx.cs" Inherits="GTU_Portal.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {
            debugger;

            var id = document.getElementById("<%= UserIdTextBox.ClientID%>").value;
            var name = document.getElementById("<%= UserNameTextBox.ClientID%>").value;
            var password = document.getElementById("<%= PasswordTextBox.ClientID%>").value;
            var mobile = document.getElementById("<%= UserMobileTextBox.ClientID%>").value;
            var email = document.getElementById("<%= UserEmailTextBox.ClientID%>").value;            
            var filter = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;            

            if (id == "" || name == "" || password == "" || mobile == "" || email == "") {
                alert("Enter Required Field");
                return false;
            }                        

            if (mobile.length <10 || mobile.length > 12) {
                alert("Enter Valid Mobile Number");
                return false;
            }

            if (password.length < 6 || password.length > 8) {
                alert("Password Should In 6-8 Long");
                return false;
            }

            if (!filter.test(email)) {
                alert('Enter Valid Email Address');
                email.focus;
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                                <a href="Users.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
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
                                        <asp:DropDownList ID="CollegeDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_name" DataValueField="C_id">
                                            <asp:ListItem>--Select Type--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [C_id], [C_name] FROM [COLLEGE_MAST] ORDER BY [C_id]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="UserTypeLabel" runat="server">User Type<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="UserTypeDropDownList" runat="server" class="form-control">
                                            <asp:ListItem>--Select Type--</asp:ListItem>
                                            <asp:ListItem Value="1">GTU Sports Officer</asp:ListItem>
                                            <asp:ListItem Value="2">College Manager</asp:ListItem>
                                            <asp:ListItem Value="3">Observer</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="Button1_Click" OnClientClick="return Validate();" />
                                        <asp:Label ID="Label1" runat="server" value="0" Text="0" Visible="false"></asp:Label>
                                        <%--<asp:Label ID="Label2" runat="server" value="0" Text="Label" Visible="false"></asp:Label>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>

</asp:Content>
