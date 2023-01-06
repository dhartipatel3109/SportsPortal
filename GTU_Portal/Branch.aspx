<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Branch.aspx.cs" Inherits="GTU_Portal.Branch1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Branch</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Branch</li>
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
                                        <label>Branch Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Branch_name" DataValueField="Branch_id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB %>" DeleteCommand="DELETE FROM [BRANCH_MAST] WHERE [Branch_id] = @original_Branch_id AND [Branch_name] = @original_Branch_name" InsertCommand="INSERT INTO [BRANCH_MAST] ([Branch_name]) VALUES (@Branch_name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [BRANCH_MAST] ORDER BY [Branch_id]" UpdateCommand="UPDATE [BRANCH_MAST] SET [Branch_name] = @Branch_name WHERE [Branch_id] = @original_Branch_id AND [Branch_name] = @original_Branch_name">
                                            <DeleteParameters>
                                                <asp:Parameter Name="original_Branch_id" Type="Int32" />
                                                <asp:Parameter Name="original_Branch_name" Type="String" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Branch_name" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Branch_name" Type="String" />
                                                <asp:Parameter Name="original_Branch_id" Type="Int32" />
                                                <asp:Parameter Name="original_Branch_name" Type="String" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="BranchButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="BranchButton_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of Branch</h3>
                            <div class="box-tools pull-right">
                                <asp:Button ID="AddBranch" class="btn btn-primary btn-sm" runat="server" Text="Add Branch" Onclick="AddBranch_Click"/>
                                <button id="Button2" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <asp:Label ID="Label1" Visible="true" runat="server" Text=""></asp:Label>
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Branch_id" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Branch_id" HeaderText="No." InsertVisible="False" ReadOnly="True" SortExpression="Branch_id" />
                                    <asp:BoundField DataField="Branch_name" HeaderText="Branch Name" SortExpression="Branch_name" />
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="edit" ImageUrl="~/Image/edit1.png" Width="20" Height="20" CommandArgument='<%#Eval("Branch_id") %>' />
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Branch_id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--  <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
                                    <%--<asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />--%>
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


                            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" DeleteCommand="DELETE FROM [BRANCH_MAST] WHERE [Branch_id] = @original_Branch_id AND [Branch_name] = @original_Branch_name" InsertCommand="INSERT INTO [BRANCH_MAST] ([Branch_name]) VALUES (@Branch_name)" SelectCommand="SELECT * FROM [BRANCH_MAST] ORDER BY [Branch_id]" UpdateCommand="UPDATE [BRANCH_MAST] SET [Branch_name] = @Branch_name WHERE [Branch_id] = @original_Branch_id AND [Branch_name] = @original_Branch_name" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>--%>
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
