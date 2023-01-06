<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="State.aspx.cs" Inherits="GTU_Portal.State" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
        <div class="content-wrapper">
            <section class="content-header">
                <h1>State</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li class="active">State</li>
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
                                            <label>State<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="State_name" DataValueField="State_name"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [State_name] FROM [STATE_MAST]"></asp:SqlDataSource>
                                            <%--<asp:DropDownList ID="StateDropDownList" runat="server" class="form-control" DataSourceID="SqlDataSource1">
                                                <asp:ListItem>--Select State--</asp:ListItem>
                                                <asp:ListItem Value="1">Gujarat</asp:ListItem>
                                                <asp:ListItem Value="2">Maharashtra</asp:ListItem>
                                                <asp:ListItem Value="3">Rajastan</asp:ListItem>
                                                <asp:ListItem Value="4">Punjab</asp:ListItem>
                                                <asp:ListItem Value="5">Hariyana</asp:ListItem>
                                                <asp:ListItem Value="6">Delhi</asp:ListItem>
                                                <asp:ListItem Value="7">Madhyapradesh</asp:ListItem>
                                                <asp:ListItem Value="8">Kerala</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [State_name] FROM [STATE_MAST]"></asp:SqlDataSource>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="StateButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="StateButton_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of State</h3>
                                <div class="box-tools pull-right">
                                     <asp:Button ID="addState" CssClass="btn btn-primary" runat="server" Text="Add State" OnClick="AddState_Click" />
                                    <button id="Button2" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive no-padding">

                                 <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="State_id" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="GridView1_RowCommand">
                                     <Columns>
                                    <asp:BoundField DataField="State_id" HeaderText="State_id" InsertVisible="False" ReadOnly="True" SortExpression="State_id" />
                                    <asp:BoundField DataField="State_name" HeaderText="State_name" SortExpression="State_name" />
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="edit" ImageUrl="~/Image/edit1.png" Width="20" Height="20" CommandArgument='<%#Eval("State_id") %>' />
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("State_id") %>' />
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

                                <%--<asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="State_id" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="State_id" HeaderText="No." InsertVisible="False" ReadOnly="True" SortExpression="State_id" />
                                        <asp:BoundField DataField="State_name" HeaderText="Name" SortExpression="State_name" />
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
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
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB %>" DeleteCommand="DELETE FROM [STATE_MAST] WHERE [State_id] = @original_State_id AND [State_name] = @original_State_name" InsertCommand="INSERT INTO [STATE_MAST] ([State_name]) VALUES (@State_name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [STATE_MAST] ORDER BY [State_id]" UpdateCommand="UPDATE [STATE_MAST] SET [State_name] = @State_name WHERE [State_id] = @original_State_id AND [State_name] = @original_State_name">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_State_id" Type="Int32" />
                                        <asp:Parameter Name="original_State_name" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="State_name" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="State_name" Type="String" />
                                        <asp:Parameter Name="original_State_id" Type="Int32" />
                                        <asp:Parameter Name="original_State_name" Type="String" />
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