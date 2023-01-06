<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addEvent.aspx.cs" Inherits="GTU_Portal.addEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {

            var name = document.getElementById("<%= AddEventTextBox.ClientID%>").value;

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
                <h1>Add Event</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>GTU EVENT</a></li>
                    <li><a href="Event.aspx">Events</a></li>
                    <li class="active">Add Events</li>
                </ol>
            </section>

            <section class="content">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Events</h3>
                                <div class="box-tools pull-right">
                                    <a href="Event.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Event Name<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="AddEventTextBox" runat="server" class="form-control" placeholder="Enter Event Name"></asp:TextBox>
                                         </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-primary" OnClick="Button1_Click" OnClientClick="return Validate()"/>
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
