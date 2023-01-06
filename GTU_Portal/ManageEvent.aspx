<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ManageEvent.aspx.cs" Inherits="GTU_Portal.ManageEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Manage Events</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>                    
                    <li class="active">Manage Event</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Manage Events</h3>
                                <%--<div class="box-tools pull-right">
                                    <a href="??????.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>--%>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Ega_id" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="Ega_id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Event_id" />
                                        <asp:BoundField DataField="Event_name" HeaderText="Event Name" SortExpression="Event_name" />
                                        <asp:BoundField DataField="Game_name" HeaderText="Game Name" SortExpression="Game_name" />
                                        <asp:BoundField DataField="Game_date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Game Date" SortExpression="Game_date" />                                       
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                        <asp:BoundField DataField="Event_type" HeaderText="Event Type" SortExpression="Event Type" />
                                        <asp:BoundField DataField="Zone_Name" HeaderText="Zone Name" SortExpression="Zone_Name" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="StudentDataButton" CommandName="StudentData" CssClass="btn btn-primary" Text="Student Data" runat="server" CommandArgument='<%#Eval("Ega_id") %>'/> 
                                                <asp:Button ID="UploadResultButton" CommandName="UploadResult" CssClass="btn btn-primary" BackColor="#009933" Text="Upload Result" runat="server"  CommandArgument='<%#Eval("Ega_id") %>'/> 
                                                <asp:Button ID="UploadCertificateButton" CommandName="UploadCertificates" CssClass="btn btn-primary" BackColor="#cc0000" Text="Upload Certificates" runat="server" CommandArgument='<%#Eval("Ega_id") %>'/> 
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
                            </div>
                        </div>
                    </section>
                </div>
            </section>
        </div>
    
</asp:Content>

