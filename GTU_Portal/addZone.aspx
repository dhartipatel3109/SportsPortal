<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addZone.aspx.cs" Inherits="GTU_Portal.addZone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {

            var name = document.getElementById("<%= ZoneTextBox.ClientID%>").value;

            if (name == "") {
                alert("Enter Name");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Add Zone</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li><a href="Zone.aspx">Zone</a></li>
                    <li class="active">Add Zone</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Zone</h3>
                                <div class="box-tools pull-right">
                                    <a href="Zone.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Zone<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="ZoneTextBox" placeholder="Enter new Zone-Name" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="Button1_Click" OnClientClick="return Validate();"/>
                                            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
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
