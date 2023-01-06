<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LiveEvent.aspx.cs" Inherits="GTU_Portal.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Live Events</h1>
            <ol class="breadcrumb">
                <li><a href="?????.aspx"><i class="fa fa-dashboard"></i>GTU Event</a></li>
                <li class="active">Eligibility</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Student Data</h3>
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
                                        <label>Event Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="EventDropDownList" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Event_name" DataValueField="Event_id" OnSelectedIndexChanged="EventDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of Games with Student Record</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Egd_id" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing1" OnRowDeleting="GridView1_RowDeleting1">
                                <Columns>
                                    <asp:BoundField DataField="Egd_id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Event_id" />
                                    <asp:BoundField DataField="Event_name" HeaderText="Event Name" SortExpression="Event_name" />
                                    <asp:BoundField DataField="Game_name" HeaderText="Game Name" SortExpression="Game_name" />
                                    <asp:BoundField DataField="Game_date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Game Date" SortExpression="Game_date" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                    <asp:BoundField DataField="Event_type" HeaderText="Event Type" SortExpression="Event Type" />
                                    <asp:BoundField DataField="Zone_Name" HeaderText="Zone Name" SortExpression="Zone_Name" />
                                    <asp:BoundField DataField="C_name" HeaderText="College Name" SortExpression="C_id" />
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Egd_id") %>' />
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
