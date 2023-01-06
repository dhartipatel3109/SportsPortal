<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addCity.aspx.cs" Inherits="GTU_Portal.addBranch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {

            var name = document.getElementById("<%= CityTextBox.ClientID%>").value;

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
                <h1>Add City</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li><a href="City.aspx">City</a></li>
                    <li class="active">Add City</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add City</h3>
                                <div class="box-tools pull-right">
                                    <a href="City.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>City Name<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="CityTextBox" class="form-control" placeholder="Enter City Name" runat="server"/>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>State Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="StateDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="State_name" DataValueField="State_id" ></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [STATE_MAST] ORDER BY [State_id]"></asp:SqlDataSource>
                                            
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