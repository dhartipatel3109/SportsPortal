<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RequestEvent.aspx.cs" Inherits="GTU_Portal.RequestEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">      
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function val() {
            debugger;
            var chkListModules = document.getElementById('<%= GridView1.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    return;
                }
            }
            alert("CheckBox is not be null");
            return false;
        }

        $(function () {
            <%--$('#<%=FileUpload1.ClientID %>').change(function () {
                debugger;
                var fileExtension = ['pdf'];
                if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only 'pdf' formats are allowed.");
                    return false;
                }                                
            });--%>

            $('#<%=btn_upload_pdf.ClientID %>').click(function () {
                debugger;
                var fileExtension = ['pdf'];
                if ($.inArray($('#<%=FileUpload1.ClientID %>').val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only 'pdf' formats are allowed otherwise LOI will not be send to GTU officer");
                    return false;
                }
            });
        });
                    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Events</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>
                <li class="active">Request Event</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">

                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">List of Games in Event</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">

                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="Event_name" HeaderText="EventName" />
                                        <asp:BoundField DataField="Game_name" HeaderText="Game Name" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                        <asp:BoundField DataField="Game_date" HeaderText="Game Date" />
                                        <asp:BoundField DataField="Event_type" HeaderText="Event Type" />--%>
                                </Columns>
                            </asp:GridView>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="CreateLOIButton" CssClass="btn btn-primary" runat="server" Text="Create LOI" OnClick="CreateLOIButton_Click" OnClientClick="return val();" />
                                    </div>
                                </div>
                            </div>
                            <%--<div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-4 col-lg-offset-4">
                                            <label>Event Name:</label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                
                                     <div class="form-group">
                                        <div class="col-lg-4 col-lg-offset-4">
                                            <label>Game Name:</label>
                                            <asp:DropDownList ID="GameDropDownList" CssClass="form-control"   runat="server" OnSelectedIndexChanged="GameDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-4 col-lg-offset-4">
                                            <label>Gender:</label>
                                            <asp:DropDownList ID="GenderDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>                                            
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-4 col-lg-offset-4">
                                            <label>Event Status:</label>
                                            <asp:DropDownList ID="StatusDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>--%>
                        </div>
                    </div>

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Requested Event List</h3>
                            <div class="box-tools pull-right">
                                <button id="Button1" type="button" class="btn btn-box-tool" data-widget="collapse" runat="server">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">

                                    <div style="float: right">
                                        <asp:Panel ID="Panel6" ScrollBars="Auto" runat="server" CssClass="modalPopup" Style="display: none; border: 5px solid gray; background-color: white" Width="50%" Height="550px">
                                            <asp:Button ID="Button26" runat="server" Text="Cancel" OnClick="Button26_Click" />
                                            <asp:Button ID="Button3" runat="server" Text="Print" OnClick="Button3_Click" />
                                            <div class="uk-width-medium-1-1" id="Print" runat="server">
                                                <div id="header" runat="server" visible="true">
                                                    <asp:Image ID="Image1" ImageUrl="~/img/bgs.png" runat="server" Width="100%" Height="200" />
                                                </div>
                                                <asp:Label ID="lblCollegeId" runat="server" Visible="false" Text="Label"></asp:Label>
                                                <table id="Table1" style="width: 100%; margin: auto;" border="1">
                                                    <thead class="thead" style="background-color: #3c8dbc; color: #fff">
                                                        <tr>
                                                            <th>Sr. No.</th>
                                                            <th>Details</th>
                                                            <th>Particulars</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>Name of the Institue</td>
                                                            <td>
                                                                <asp:Label ID="ClgNameLabel" runat="server" Text=""></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>Institute Code</td>
                                                            <td>
                                                                <asp:Label ID="ClgCodeLabel" runat="server" Text=""></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>Contact Detail of Head of Institute</td>
                                                            <td>
                                                                <asp:Label ID="HeadLabel" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>Name of the Sports Games</td>
                                                            <td>
                                                                <asp:GridView ID="GridView3" ShowHeader="false" CssClass="" runat="server" AutoGenerateColumns="False" CellPadding="3" CellSpacing="3" HorizontalAlign="Center" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="event" HeaderText="Event Name" SortExpression="Game_name" />

                                                                        <asp:BoundField DataField="game" HeaderText="Game Name" SortExpression="Game_name" />

                                                                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="Gender" />
                                                                        <asp:BoundField DataField="eventtype" HeaderText="Event type" SortExpression="Gender" />

                                                                    </Columns>
                                                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                                                    <HeaderStyle BackColor="#1976D2" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                                    <RowStyle ForeColor="#000066" />
                                                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Detail of Facilities</td>
                                                            <td>
                                                                <asp:Label ID="FacilitiesLabel" runat="server" Text=""></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>Name of Faculty Coordinator</td>
                                                            <td>
                                                                <asp:Label ID="FacultyNameLabel" runat="server" Text=""></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>Designation of Faculty Coordinator</td>
                                                            <td>
                                                                <asp:Label ID="FacultyDesignationLabel" runat="server" Text="Sports in Charge"></asp:Label>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>8</td>
                                                            <td>Contact Details of Facult Coordinator</td>
                                                            <td>
                                                                <asp:Label ID="FacultyContactLabel" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="select ev.Event_name, game.Game_name, egd.Game_date,egd.Gender from Event_Game_Detail egd join Event ev on ev.Event_id = egd.Event_id join GAME_MAST game on game.Game_id = egd.Game_id WHERE ([Gender] = @Gender)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="1" Name="Gender" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </asp:Panel>
                                        <asp:LinkButton ID="LinkButton15" runat="server"></asp:LinkButton>
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender10" runat="server"
                                            PopupControlID="Panel6" TargetControlID="LinkButton15"
                                            BackgroundCssClass="modalBackground">
                                        </cc1:ModalPopupExtender>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                             <div class="form-group">
                                                <label>Name the Pdf<span class="m-color-red">*</span></label><br />
                                                <asp:TextBox ID="TextBox2" placeholder="Enter Name of Pdf" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                             <div class="form-group">
                                                 <label>Choose Letter of Interest File<span class="m-color-red">*</span></label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                             </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Button CssClass="btn btn-primary" ID="btn_upload_pdf" runat="server" Text="Upload" OnClick="btn_upload_pdf_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="3" HorizontalAlign="Center" Width="1000px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                    <Columns>
                                        <asp:BoundField DataField="Event_name" HeaderText="Event Name" SortExpression="Event_name" />
                                        <asp:BoundField DataField="Game_name" HeaderText="Game Name" SortExpression="Game_name" />
                                        <asp:BoundField DataField="Game_date" HeaderText="Game Date" SortExpression="Game_date" DataFormatString="{0:dd/MM/yyyy}" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                        
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#1976D2" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                               </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="select ev.Event_name, game.Game_name, egd.Game_date,egd.Gender from Event_Game_Detail egd join Event ev on ev.Event_id = egd.Event_id join GAME_MAST game on game.Game_id = egd.Game_id ">
                                    
                               </asp:SqlDataSource>
                         </div>--%>

                            <%-- <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Export as PDF" OnClick="Button2_Click" />
                                </div>
                            </div>
                        </div>--%>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>
</asp:Content>

<%-- <div id="header" runat="server" visible="true">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/bg.png" Width="100%" Height="200" />
                                    </div>--%>

<%--<asp:GridView ID="GridView2" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" Width="1000px">
                                            <Columns>
                                                <asp:BoundField DataField="Event_name" HeaderText="Event_name" SortExpression="Event_name" />
                                                <asp:BoundField DataField="Game_name" HeaderText="Game_name" SortExpression="Game_name" />
                                                <asp:BoundField DataField="Game_date" HeaderText="Game_date" SortExpression="Game_date" />
                                                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                                <asp:ButtonField ButtonType="Button" HeaderText="Request Event" Text="Request">
                                                    <ControlStyle BackColor="#009933" ForeColor="White" />
                                                </asp:ButtonField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="select ev.Event_name, game.Game_name, egd.Game_date,egd.Gender from Event_Game_Detail egd join Event ev on ev.Event_id = egd.Event_id join GAME_MAST game on game.Game_id = egd.Game_id WHERE ([Gender] = @Gender)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="2" Name="Gender" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>--%>

<%--<ul class="nav nav-tabs" id="gtu-tab">
                                            <li class="active"><a href="#Boys" data-id="1" id="boys-tab" data-toggle="tab">Boys</a></li>
                                            <li><a href="#Girls" id="girls-tab" data-id="2" data-toggle="tab">Girls</a></li>
                                        </ul>--%>

<%--<div class="box box-primary">--%>
<%--<div class="box-header with-border">
                                <h3 class="box-title">List of Events</h3>
                                <div class="box-tools pull-right">
                                    <a class="btn btn-primary btn-sm" href="addEvent.aspx"><i class="fa-plus fa"></i>Add Event</a>
                                </div>
                            </div>--%>
<%--<div class="box-body table-responsive no-padding">--%>

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
<%--</div>

                        </div>--%>

<%-- <asp:ButtonField ButtonType="Button" HeaderText="Request Event" Text="Request">
                                            <ControlStyle BackColor="#009933" ForeColor="White" />
                                        </asp:ButtonField>--%>