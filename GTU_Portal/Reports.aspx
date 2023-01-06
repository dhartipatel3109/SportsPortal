<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="GTU_Portal.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function(){
            $(".datepicker").datepicker({
                changeMonth : true,
                changeYear : true
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Report</h1>
                <ol class="breadcrumb">
                    <li><a href="?????.aspx"><i class="fa fa-dashboard"></i>GTU EVENT</a></li>
                    <li class="active">Reports</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">

                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <%--<div class="box-header with-border">
                                <h3 class="box-title">Add College</h3>
                                <div class="box-tools pull-right">
                                    <a href="College.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>
                            </div>--%>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Event Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="EventDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Event_name" DataValueField="Event_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [Event_id], [Event_name] FROM [Event] ORDER BY [Event_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label1" runat="server">Game Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="GameDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Game_name" DataValueField="Game_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [GAME_MAST] ORDER BY [Game_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label" runat="server">From Date<span class="m-color-red">*</span></label>
                                            <input type="date" name="datepicker" class="form-control" runat="server" /> 

                                            <%--<asp:TextBox ID="FromDateTextBox" CssClass="form-control" placeholder="???????? fornat" runat="server"></asp:TextBox>--%>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label3" runat="server">To Date<span class="m-color-red">*</span></label>
                                            <input id="Date1" type="date" name="datepicker" class="form-control" runat="server" /> 

                                            <%--<asp:TextBox ID="ToDateTextBox" class="form-control" placeholder="???? format" runat="server"></asp:TextBox>--%>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label4" runat="server">College Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="CollegeDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="C_name" DataValueField="C_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [C_id], [C_name] FROM [COLLEGE_MAST] ORDER BY [C_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label5" runat="server">City<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="CityDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="City_name" DataValueField="City_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [City_id], [City_name] FROM [CITY_MAST] ORDER BY [City_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label7" runat="server">Zone<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="ZoneDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="State_name" DataValueField="State_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [STATE_MAST] ORDER BY [State_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="Label2" runat="server">Gender<span class="m-color-red">*</span></label>
                                            <asp:CheckBoxList ID="CheckBoxList1" RepeatDirection="Horizontal" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="1">Boys &nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                                <asp:ListItem Value="2">Girls</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Submit" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Detail</h3>
                            </div>
                            <div class="box-body table-responsive no-padding">
                                <%--<asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="State_id" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">--%>
                                   

                                <%--<table id="Table1" class="table table-bordered table-hover table-striped">
                                    <thead class="thead" style="background-color: #3c8dbc; color: #fff">
                                        <tr>
                                            <th>No.</th>
                                            <th>College Name</th>
                                            <th>City</th>
                                            <th>Zone</th>
                                            <th>Pincode</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Alpha College</td>
                                            <td>Ahmedabad</td>
                                            <td>North</td>
                                            <td>382445</td>
                                            <td>
                                                <button title="Edit" type="button" class="btn btn-primary btn-sm"><i class="fa-edit fa"></i></button>
                                                <button title="Delete" type="button" class="btn btn-primary btn-sm"><i class="fa-trash fa"></i></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>NICM</td>
                                            <td>Gandhinagar</td>
                                            <td>North</td>
                                            <td>382110</td>
                                            <td>
                                                <button title="Edit" type="button" class="btn btn-primary btn-sm"><i class="fa-edit fa"></i></button>
                                                <button title="Delete" type="button" class="btn btn-primary btn-sm"><i class="fa-trash fa"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>--%>
                            </div>

                        </div>
                    </section>
                </div>
            </section>
        </div>
    
</asp:Content>
