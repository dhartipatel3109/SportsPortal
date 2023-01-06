<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Event.aspx.cs" Inherits="GTU_Portal.Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="content-wrapper">
            <section class="content-header">
                <h1>Events</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>GTU Event</a></li>
                    <li class="active">Events</li>
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
                                            <label>Event Name<span class="m-color-red">*</span></label>
                                            <asp:DropDownList ID="EventDropDownList" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Event_name" DataValueField="Event_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB %>" DeleteCommand="DELETE FROM [Event] WHERE [Event_id] = @original_Event_id AND [Event_name] = @original_Event_name" InsertCommand="INSERT INTO [Event] ([Event_name]) VALUES (@Event_name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Event_id], [Event_name] FROM [Event] ORDER BY [Event_id]" UpdateCommand="UPDATE [Event] SET [Event_name] = @Event_name WHERE [Event_id] = @original_Event_id AND [Event_name] = @original_Event_name">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="original_Event_id" Type="Int32" />
                                                    <asp:Parameter Name="original_Event_name" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Event_name" Type="String" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Event_name" Type="String" />
                                                    <asp:Parameter Name="original_Event_id" Type="Int32" />
                                                    <asp:Parameter Name="original_Event_name" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="EventsButton" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="EventButton_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">List of Events</h3>
                                <div class="box-tools pull-right">
                                    <a class="btn btn-primary btn-sm" href="addEvent.aspx"><i class="fa-plus fa"></i>Add Event</a>
                                </div>
                            </div>
                            <div class="box-body table-responsive no-padding">
                              
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" ShowHeaderWhenEmpty="true" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Event_id" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="Event_id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Event_id" />
                                        <asp:BoundField DataField="Event_name" HeaderText="Event Name" SortExpression="Event_name" />
                                        <asp:BoundField DataField="Event_date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Event Dates" SortExpression="Event_date" />
                                        <%--<asp:CommandField HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True" />
                                        <asp:ButtonField ButtonType="Button" HeaderText="Manage Event" Text="Manage">
                                            <ControlStyle BackColor="#009933" ForeColor="White" />
                                        </asp:ButtonField>--%>
                                        <asp:BoundField DataField="Event_status" HeaderText="Event_status" SortExpression="Event_status" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="ManageButton" CommandName="manage" CssClass="btn btn-primary" Text="Manage" runat="server" CommandArgument='<%#Eval("Event_id") %>'/> 
                                                 <asp:Button ID="StatusButton" CommandName="status" CssClass="btn btn-primary" BackColor="Red"  Text="Disable Event" runat="server"  CommandArgument='<%#Eval("Event_id") %>'/> 
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
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB %>" DeleteCommand="DELETE FROM [Event] WHERE [Event_id] = @original_Event_id AND [Event_name] = @original_Event_name AND [Enter_date] = @original_Enter_date" InsertCommand="INSERT INTO [Event] ([Event_name], [Enter_date]) VALUES (@Event_name, @Enter_date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Event] ORDER BY [Event_id] desc" UpdateCommand="UPDATE [Event] SET [Event_name] = @Event_name, [Enter_date] = @Enter_date WHERE [Event_id] = @original_Event_id AND [Event_name] = @original_Event_name AND [Enter_date] = @original_Enter_date">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_Event_id" Type="Int32" />
                                        <asp:Parameter Name="original_Event_name" Type="String" />
                                        <asp:Parameter DbType="Date" Name="original_Enter_date" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Event_name" Type="String" />
                                        <asp:Parameter DbType="Date" Name="Enter_date" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Event_name" Type="String" />
                                        <asp:Parameter DbType="Date" Name="Enter_date" />
                                        <asp:Parameter Name="original_Event_id" Type="Int32" />
                                        <asp:Parameter Name="original_Event_name" Type="String" />
                                        <asp:Parameter DbType="Date" Name="original_Enter_date" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
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
