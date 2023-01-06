<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="GTU_Portal.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".datepicker").datepicker({
                changeMonth: true,
                changeYear: true
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Users</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Users</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <section class="col-lg-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Manage Event</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="box-body">

                            <div class="row">

                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <label>Event Name:</label>
                                        <asp:TextBox CssClass="form-control" ID="EventNameTextBox" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" style="margin-left: 10%; table-layout: auto; right: 10%;">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_id" DataSourceID="SqlDataSource1" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" Width="1000px">
                                            <Columns>
                                                 <asp:TemplateField HeaderText="Game ID">
                                                    <ItemTemplate>
                                                       <%-- <asp:Label ID="Label1" runat="server" Text='<%#Eval("Game_id") %>'></asp:Label>--%>
                                                        <asp:TextBox ID="Label1" runat="server" Text='<%#Eval("Game_id") %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Game Name">
                                                    <ItemTemplate>
                                                        <%--<asp:Label ID="Label2" runat="server" Text='<%#Eval("Game_name") %>'></asp:Label>--%>
                                                        <asp:TextBox ID="Label2" runat="server" Text='<%#Eval("Game_name") %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Event for">
                                                    <ItemTemplate>
                                                        <asp:CheckBoxList ID="EventForCheckBoxList" RepeatDirection="Horizontal" CssClass="" runat="server" AutoPostBack="false" CellSpacing="10" CellPadding="10">
                                                            <asp:ListItem Value="1">Boys</asp:ListItem>
                                                            <asp:ListItem Value="2">Girls</asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="GameDate">
                                                    <ItemTemplate>
                                                        <%--<input id="Date1" type="date" name="datepicker" class="form-control" runat="server" />--%>
                                                        <asp:TextBox ID="txtdate" type="date" runat="server"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [GAME_MAST] ORDER BY [Game_id]"></asp:SqlDataSource>

                                    </div>
                                </div>
                            </div>

                            <%--<div class="rows">
                                <asp:Label ID ="Label1" CssClass="form-control" runat="server"></asp:Label>
                            </div>--%>
                             
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="CollegeButton" CssClass="btn btn-primary" runat="server" Text="Publish" OnClick="CollegeButton_Click" />
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
