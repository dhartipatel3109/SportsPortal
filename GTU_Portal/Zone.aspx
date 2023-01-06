<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Zone.aspx.cs" Inherits="GTU_Portal.Zone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Zone</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li class="active">Zone</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">

                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Zone Detail</h3>
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
                                            <label>Zone Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Zone_name" DataValueField="Zone_name"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [Zone_name] FROM [ZONE_MAST] ORDER BY [Zone_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="ZoneButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="ZoneButton_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of Zone</h3>
                                <div class="box-tools pull-right">
                                    <asp:Button ID="addZone" CssClass="btn btn-primary" runat="server" Text="Add Zone" OnClick="AddZone_Click" />
                                    <button id="Button2" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="Zone_id" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="GridView1_RowCommand">
                                     <Columns>
                                    <asp:BoundField DataField="Zone_id" HeaderText="Zone_id" InsertVisible="False" ReadOnly="True" SortExpression="Zone_id" />
                                    <asp:BoundField DataField="Zone_name" HeaderText="Zone_name" SortExpression="Zone_name" />
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="edit" ImageUrl="~/Image/edit1.png" Width="20" Height="20" CommandArgument='<%#Eval("Zone_id") %>' />
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Zone_id") %>' />
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
                                <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" DeleteCommand="DELETE FROM [ZONE_MAST] WHERE [Zone_id] = @Zone_id" InsertCommand="INSERT INTO [ZONE_MAST] ([Zone_name]) VALUES (@Zone_name)" SelectCommand="SELECT * FROM [ZONE_MAST] ORDER BY [Zone_id]" UpdateCommand="UPDATE [ZONE_MAST] SET [Zone_name] = @Zone_name WHERE [Zone_id] = @Zone_id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Zone_id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Zone_name" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Zone_name" Type="String" />
                                        <asp:Parameter Name="Zone_id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>--%>
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
