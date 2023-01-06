<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="College.aspx.cs" Inherits="GTU_Portal.College" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validate() {
            debugger;

            var cname = document.getElementById("<%= CollegeNameTextBox.ClientID%>").value;

            if (cname == "") {
                alert("Enter College Name");
                return false;
            }

            if (!isNaN(cname)) {
                alert("Enter Valid College Name");
                return false;
            } 
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="content-wrapper">
            <section class="content-header">
                <h1>College</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li class="active">College</li>
                </ol>
            </section>
            <section class="content">

                <div class="row ">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Search</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>College Name</label>
                                            <asp:TextBox ID="CollegeNameTextBox" runat="server" CssClass="form-control" placeholder="Enter College Name"></asp:TextBox> 
                                        </div>
                                    </div>
                                    <%--<div class="col-md-4">
                                        <div class="form-group">
                                            <label>City<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="City_name" DataValueField="City_name"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [City_name] FROM [CITY_MAST] ORDER BY [City_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Zone<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="State_name" DataValueField="State_name"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [State_name] FROM [STATE_MAST] ORDER BY [State_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="CollegeButton" CssClass="btn btn-primary"  runat="server" Text="Search" onclick="CollegeButton_Click" OnClientClick="return Validate();"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of College</h3>
                                <div class="box-tools pull-right">
                                    <asp:Button ID="AddCollege" class="btn btn-primary" runat="server" Text="Add College" Onclick="AddCollege_Click"/>
                                    <%--<button id="Button2" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                    <a class="btn btn-primary btn-sm" href="addCollege.aspx"><i class="fa-plus fa"></i>Add College</a>--%>
                                </div>
                            </div>
                            <br />
                            <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="C_id" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="C_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="C_id" />
                                    <asp:BoundField DataField="C_name" HeaderText="College name" InsertVisible="False" ReadOnly="True" SortExpression="C_name" />
                                    <asp:BoundField DataField="City_name" HeaderText="City name" InsertVisible="False" ReadOnly="True" SortExpression="City_name" />
                                    <asp:BoundField DataField="Zone_name" HeaderText="Zone name" InsertVisible="False" ReadOnly="True" SortExpression="Zone_name" />                                    
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="edit" ImageUrl="~/Image/edit1.png" Width="20" Height="20" CommandArgument='<%#Eval("C_id") %>' />
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("C_id") %>' />
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
                                <%--<asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"  OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
                                    <Columns>
                                        <%--<asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                        <asp:BoundField DataField="Zone" HeaderText="Zone" SortExpression="Zone" />

                                      <asp:BoundField DataField="C_id" SortExpression="C_id" />
                                        <asp:BoundField DataField="C_name" SortExpression="C_name" />
                                        <asp:BoundField DataField="City_name" SortExpression="City_name" />
                                        <asp:BoundField DataField="Zone_name" SortExpression="Zone_name" /> 
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
                                </asp:GridView>--%>                                
                            </div>

                        </div>
                    </section>
                </div>
            </section>
        </div>
    
</asp:Content>
