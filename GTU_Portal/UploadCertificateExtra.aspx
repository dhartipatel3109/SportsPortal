<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="UploadCertificateExtra.aspx.cs" Inherits="GTU_Portal.UploadCertificateExtra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Upload Results</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>
                <li class="active">Upload Certificate</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">

                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of Games</h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowHeaderWhenEmpty="True" DataKeyNames="Ega_id" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Ega_id" HeaderText="Ega_id"  SortExpression="Ega_id" />
                                    <asp:BoundField DataField="Egd_id" HeaderText="Egd_id"  SortExpression="Egd_id" />
                                    <asp:BoundField DataField="Event_name" HeaderText="Event_name" SortExpression="Event_name" />
                                    <asp:BoundField DataField="Game_name" HeaderText="Game_name" SortExpression="Game_name" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                    <asp:BoundField DataField="Event_type" HeaderText="Event_type" SortExpression="Event_type" />
                                    <asp:BoundField DataField="Zone_name" HeaderText="Zone_name" SortExpression="Zone_name" />
                                    <asp:BoundField DataField="C_name" HeaderText="C_name" SortExpression="C_name" />
                                    <asp:BoundField DataField="Result_Status" HeaderText="Result_Status" SortExpression="Result_Status" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton CssClass="btn btn-primary" BackColor="green" ID="LinkButton1" CommandName="result" runat="server" CausesValidation="false" CommandArgument='<%#Eval("Ega_id")%>' OnClick="LinkButton1_Click">Results</asp:LinkButton>
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
                </section>
            </div>
        </section>
    </div>

</asp:Content>
