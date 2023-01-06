<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeFile="RESULT.aspx.cs" Inherits="GTU_Portal.WebForm27" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div role="main" class="main">
        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 order-2 order-md-1 align-self-center p-static">
                        <h1>Results</h1>
                    </div>
                    <div class="col-md-4 order-1 order-md-2 align-self-center">
                        <ul class="breadcrumb d-block text-md-right">
                            <li><a href="Home2.aspx">Home</a></li>
                            <li class="active">Results</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <div class="container">
            <%--<div class="row">
                <div class="col">
                    <div class="featured-boxes">
                        <div class="row">
                            <div class="offset-0 col-md-12">
                                <div class="featured-box featured-box-primary text-left mt-5">
                                    <div class="box-content">
                                        <h4 class="color-primary font-weight-semibold text-4 text-uppercase text-center mb-3">Information</h4>
                                        <div class="form-row">
                                            <div class="form-group col">
                                                <label class="font-weight-bold text-dark text-2">User Name</label>
                                                <asp:TextBox ID="TextBoxuserid" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>


            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label id="Label2" runat="server">Event Name:<span class="m-color-red">*</span></label><br />
                        <asp:DropDownList ID="EventDropdownList" AutoPostBack="true" runat="server" DataTextField="Event_name" DataValueField="Event_id" OnSelectedIndexChanged="EventDropdownList_SelectedIndexChanged1"></asp:DropDownList>                        
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label id="Label1" runat="server">Game Name:<span class="m-color-red">*</span></label><br/>
                        <asp:DropDownList ID="GameDropdownList" AutoPostBack="true" runat="server"></asp:DropDownList>                        
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label id="Label3" runat="server">Gender:<span class="m-color-red">*</span></label><br />
                        <asp:DropDownList ID="GenderDropdownList" runat="server">
                            <asp:ListItem>--Select Gender--</asp:ListItem>
                            <asp:ListItem Value="Boys">Boy</asp:ListItem>
                            <asp:ListItem Value="Girls">Girl</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label id="Label4" runat="server">Event Type:<span class="m-color-red">*</span></label><br />
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>--Select Event Type--</asp:ListItem>
                            <asp:ListItem Value="Zonal">Zonal</asp:ListItem>
                            <asp:ListItem Value="Inter-Zonal">Inter-Zonal</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row">
                <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />
            </div>
        </div>

        <div class="container">
            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="cr_no" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="cr_no" HeaderText="cr_no" SortExpression="cr_no" />
                    <asp:BoundField DataField="Student_id" HeaderText="Student id" SortExpression="Student_id" />
                    <asp:BoundField DataField="Student_name" HeaderText="student name" SortExpression="student_name" />
                    <asp:BoundField DataField="Student_mobile" HeaderText="student mobile" SortExpression="student_mobile" />
                    <asp:BoundField DataField="Student_email" HeaderText="student email" SortExpression="student_email" />
                    <asp:TemplateField HeaderText="Operations">
                        <ItemTemplate>
                            <asp:LinkButton ID="ImageButton1" runat="server" Text="Certificate" CommandName="Download Certy" Width="50" Height="25" CommandArgument='<%#Eval("cr_no") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
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
        </div>
    </div>

</asp:Content>
