<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Loi2.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Letter of Interest List</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Loi</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">

                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of LOIs</h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowHeaderWhenEmpty="True" DataKeyNames="L_id" DataSourceID="SqlDataSource1">

                                <Columns>
                                    <asp:BoundField DataField="L_id" HeaderText="L_id" InsertVisible="False" ReadOnly="True" SortExpression="L_id" />
                                    <asp:BoundField DataField="File_Name" HeaderText="File_Name" SortExpression="File_Name" />
                                    <asp:BoundField DataField="Uploaded_File" HeaderText="Uploaded_File" SortExpression="Uploaded_File" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                    <asp:BoundField DataField="C_name" HeaderText="C_name" SortExpression="C_name" />

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton CssClass="btn btn-primary" BackColor="#006600" ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%#Eval("Uploaded_File")%>' OnClick="OpenPDF">OpenPDF</asp:LinkButton>
                                            <%--<asp:Button ID="StatusButton" CommandName="status" CssClass="btn btn-primary" BackColor="Red"  Text="Delete" runat="server"  CommandArgument='<%#Eval("L_id") %>'/>--%> 
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

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT l.L_id, l.File_Name, l.Uploaded_File, l.Date, cm.C_name FROM LOI AS l INNER JOIN COLLEGE_MAST AS cm ON cm.C_id = l.C_id ORDER BY l.L_id DESC"></asp:SqlDataSource>

                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>
</asp:Content>

