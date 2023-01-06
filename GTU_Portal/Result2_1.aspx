<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeFile="Result2_1.aspx.cs" Inherits="GTU_Portal.WebForm28" %>
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
            <br /><br /><br />
            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="cr_no" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="cr_no" HeaderText="cr_no" SortExpression="cr_no" />
                    <asp:BoundField DataField="Student_id" HeaderText="Student id" SortExpression="Student_id" />
                    <asp:BoundField DataField="Student_name" HeaderText="student name" SortExpression="student_name" />
                    <asp:BoundField DataField="Student_mobile" HeaderText="student mobile" SortExpression="student_mobile" />
                    <asp:BoundField DataField="Student_email" HeaderText="student email" SortExpression="student_email" />
                    <asp:BoundField DataField="Student College" HeaderText="Student College" SortExpression="Student College" />
                    <asp:TemplateField HeaderText="Operations">
                        <ItemTemplate>
                            <asp:LinkButton ID="Button1" runat="server" CssClass="btn btn-primary" BackColor="Green" Text="Certificate" CommandName="Certificate" CommandArgument='<%#Eval("cr_no") %>' />
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

</asp:Content>
