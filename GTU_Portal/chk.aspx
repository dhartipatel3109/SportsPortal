<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="chk.aspx.cs" Inherits="chk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            var date = new Date();
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();
            $('input[id*=txtdate1]').datepicker({
                minDate: new Date(currentYear, currentMonth, currentDate)
            });
        });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Assign Event</h1>
            <ol class="breadcrumb">
                <li><a href="?????.aspx"><i class="fa fa-dashboard"></i>GTU Event</a></li>
                <li class="active">Assign Event</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Assign Event</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <%-- <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" class="table table-bordered table-hover table-striped" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Zone">
                                            <ItemTemplate>
                                                <asp:RadioButtonList ID="EventTypeRadioButtonList" AutoPostBack="true" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="EventTypeRadioButtonList_SelectedIndexChanged">
                                                    <asp:ListItem Text="Z">Z</asp:ListItem>
                                                    <asp:ListItem Text="IZ">IZ</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                                                     <asp:ListItem Text="Z">Z</asp:ListItem>
                                                    <asp:ListItem Text="IZ" Value="6">IZ</asp:ListItem>
                                                </asp:DropDownList>


                                                <asp:DropDownList ID="ZoneDropDownList" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ZoneDropDownList_SelectedIndexChanged" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Zone_name" DataValueField="Zone_id"></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [ZONE_MAST] ORDER BY [Zone_id]"></asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="College Name">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="CollegeDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_name" DataValueField="C_id"></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [C_id], [C_name] FROM [COLLEGE_MAST] ORDER BY [C_id]"></asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                                
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="AssignButton" CssClass="btn btn-primary" runat="server" Text="Assign" />
                                        </div>
                                    </div>
                                </div>
                            </div>  --%>

                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Event Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="EventDropDownList" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Event_name" DataValueField="Event_id" OnSelectedIndexChanged="EventDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Game Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="GameDropDownList" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Game_name" DataValueField="Game_id" OnSelectedIndexChanged="GameDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="Label1" runat="server">Gender<span class="m-color-red">*</span></label><br />
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnClick="return false;">
                                            <asp:ListItem Value="Boys">Boys</asp:ListItem>
                                            <asp:ListItem Value="Girls">Girls</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Event Type<span class="m-color-red">*</span></label>
                                        <div>
                                            <%--<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem Selected value="Z">Z</asp:ListItem>
                                                <asp:ListItem value="IZ">IZ</asp:ListItem>
                                            </asp:RadioButtonList>--%>
                                            <asp:CheckBoxList ID="CheckBoxList2" runat="server" OnClick="return false;">
                                                <asp:ListItem Value="Zonal">Zonal</asp:ListItem>
                                                <asp:ListItem Value="Inter-Zonal">Inter-Zonal</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Zone Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="ZoneDropDownList" Visible="true" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Zone_name" DataValueField="Zone_id" OnSelectedIndexChanged="ZoneDropDownList_SelectedIndexChanged">                                            
                                        </asp:DropDownList>
                                        <%--<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [ZONE_MAST] ORDER BY [Zone_id]"></asp:SqlDataSource>--%>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>College<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="CollegeDropDownList" CssClass="form-control" runat="server" DataTextField="C_name" DataValueField="C_id"></asp:DropDownList>
                                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT C_id, C_name FROM [COLLEGE_MAST] ORDER BY [C_id]"></asp:SqlDataSource>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Final Date<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="finalDate" placeholder="Select Date" CssClass="form-control" runat="server" Type="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <asp:Button ID="AssignButton" CssClass="btn btn-primary" runat="server" Text="Assign" OnClick="AssignButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Assigned Event</h3>
                            <div class="box-tools pull-right">
                                <%--<button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>--%>
                                <asp:Button ID="SendMail" CssClass="btn btn-primary" runat="server" Text="Send Email" OnClick="SendMail_Click" />
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <br />
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" RowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="Ega_id" HeaderText="ID" SortExpression="Ega_id" />
                                    <asp:BoundField DataField="Event_name" HeaderText="Event Name" SortExpression="Event_name" />
                                    <asp:BoundField DataField="Game_name" HeaderText="Game Name" SortExpression="Game_name" />
                                    <asp:BoundField DataField="Assign_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Final Date" SortExpression="Final Date" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                    <asp:BoundField DataField="Event_type" HeaderText="Event Type" SortExpression="Event_type" />
                                    <asp:BoundField DataField="Zone_name" HeaderText="Zone Name" SortExpression="Zone_name" />
                                    <asp:BoundField DataField="C_name" HeaderText="College Name" SortExpression="C_name" />
                                    <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Ega_id") %>' />
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
