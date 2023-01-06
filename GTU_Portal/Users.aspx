<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="GTU_Portal.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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
                                <h3 class="box-title">User Detail</h3>
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
                                            <label>User Name:</label>
                                            <asp:TextBox CssClass="form-control" ID="UserNameTextBox" placeholder="Enter User Name" runat="server"></asp:TextBox>
                                         </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>User Mobile no.:</label>
                                            <asp:TextBox CssClass="form-control" ID="UserMobileTextBox" placeholder="Enter User Mobile Number" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">  
                                            <label>User Email-id:</label>
                                            <asp:TextBox CssClass="form-control" ID="UserEmailTextBox" placeholder="Enter User Email" runat="server"></asp:TextBox>
                                         </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>College Name:</label>
                                            <asp:DropDownList ID="CollegeDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="C_name" DataValueField="C_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [C_id], [C_name] FROM [COLLEGE_MAST] ORDER BY [C_id]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>User Type:</label>
                                            <asp:DropDownList ID="UserTypeDropDownList" CssClass="form-control" runat="server">
                                                <asp:ListItem>--Select Type--</asp:ListItem>
                                                <asp:ListItem Value="1">GTU Sports Officer</asp:ListItem>
                                                <asp:ListItem Value="2">College Manager</asp:ListItem>
                                                <asp:ListItem Value="3">GTU Observer</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                             <asp:Button ID="CollegeButton" CssClass="btn btn-primary"  runat="server" Text="Search" OnClick="UserButton_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Users Information</h3>
                                <div class="box-tools pull-right">
                                    <asp:Button ID="AddUser" class="btn btn-primary" runat="server" Text="Add User" Onclick="AddUser_Click"/>
                                    <%--<button id="Button2" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                        <i class="fa fa-minus"></i>
                                    </button>--%>                                  
                                </div>
                            </div>
                            <br />
                            <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="U_username" HeaderText="User Name" SortExpression="U_username" />
                                        <asp:BoundField DataField="U_usertype" HeaderText="User Type" SortExpression="U_usertype" />
                                        <asp:BoundField DataField="U_mobile" HeaderText="Contact No" SortExpression="U_mobile" />
                                        <asp:BoundField DataField="U_email" HeaderText="Email ID" SortExpression="U_email" />
                                        <asp:BoundField DataField="C_name" HeaderText="College Name" SortExpression="C_id" />
                                        <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="edit" ImageUrl="~/Image/edit1.png" Width="20" Height="20" CommandArgument='<%#Eval("U_email") %>' />
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("U_email") %>' />
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
                                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="select u.U_username AS UserName, u.U_mobile AS ContactNo, u.U_email AS EmailId, clg.C_name from User_Table u join COLLEGE_MAST clg on u.C_id=clg.C_id"></asp:SqlDataSource>--%>

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