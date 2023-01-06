<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="GTU_Portal.aboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {
            debugger;
            var name = document.getElementById("<%= TextArea.ClientID%>").value;            

            if (name == "") {
                alert("Enter Message");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-wrapper">
            <section class="content-header">
                <h1>About Us</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>GTU EVENT</a></li>
                    <li><a href="Events.aspx">CMS</a></li>
                    <li class="active">About Us</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Description for About Us<span class="m-color-red">*</span>:</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:TextBox id="TextArea" TextMode="multiline" placeholder="Enter Description for About Us page..." CssClass="form-control" Rows="20" runat="server" />
                                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="AboutUsButton" runat="server" CssClass="btn btn-primary" Text="Submit" Onclick="AboutUsButton_Click"/>
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
