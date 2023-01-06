<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Observer_Report.aspx.cs" Inherits="GTU_Portal.WebForm26" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="content-wrapper">
        <section class="content-header">
            <h1>Observer Report</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Observer Report</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">

                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Observer Report</h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowHeaderWhenEmpty="True" DataKeyNames="Observer_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">

                                <Columns>
                                    <asp:BoundField DataField="Observer_id" HeaderText="No." InsertVisible="False" ReadOnly="True" SortExpression="Observer_id" />
                                    <asp:BoundField DataField="File_Name" HeaderText="File Name" SortExpression="File_Name" />
                                    <asp:BoundField DataField="Uploaded_File" HeaderText="Uploaded File" SortExpression="Uploaded_File" />                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton CssClass="btn btn-primary" BackColor="#006600" ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%#Eval("Uploaded_File")%>' OnClick="OpenPDF">OpenPDF</asp:LinkButton>
                                            <asp:Button ID="StatusButton" CommandName="status" CssClass="btn btn-primary" BackColor="Red"  Text="Delete" runat="server"  CommandArgument='<%#Eval("Observer_id") %>'/> 
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

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM Observer_Report ORDER BY Observer_id DESC"></asp:SqlDataSource>

                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>

</asp:Content>
