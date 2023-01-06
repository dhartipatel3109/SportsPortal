<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="GTU_Portal.Game" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="content-wrapper">
            <section class="content-header">
                <h1>Game</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li class="active">Game</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">

                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Search</h3>
                                <div class="box-tools pull-right">
                                    <button id="Button1" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Game Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="GameDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Game_name" DataValueField="Game_name" AutoPostBack="True" AppendDataBoundItems="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [GAME_MAST]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="GameButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="GameButton_Click" />
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of Game</h3>
                                <div class="box-tools pull-right">                                    
                                    <%--<i class="fa-plus fa"></i>--%>
                                    <asp:Button ID="AddGame" class="btn btn-primary btn-sm" runat="server" Text="Add Game" Onclick="AddGame_Click"/>
                                    <button id="Button2" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" DataKeyNames="Game_id" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="Game_id" HeaderText="No." InsertVisible="False" ReadOnly="True" SortExpression="Game_id" />
                                        <asp:BoundField DataField="Game_name" HeaderText="Game Name" SortExpression="Game_name" />
                                        <asp:TemplateField HeaderText="Operations">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="edit" ImageUrl="~/Image/edit1.png" Width="20" Height="20" CommandArgument='<%#Eval("Game_id") %>' />
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Game_id") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>
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
