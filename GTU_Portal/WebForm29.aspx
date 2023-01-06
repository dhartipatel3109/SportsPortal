<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="WebForm29.aspx.cs" Inherits="GTU_Portal.WebForm29" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {

            var Enroll = document.getElementById('<%=EnrolmentTextBox.ClientID %>').value;

            if (Enroll == "") {
                alert("Enter Enrollment Number");
                return false;
            }

            if (isNaN(Enroll) || Enroll.length !== 12) {
                alert("Enter Valid Enrollment Number");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Registration</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Registration</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Event Detail</h3>
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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Game Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="GameDropDownList" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Game_name" DataValueField="Game_id" OnSelectedIndexChanged="GameDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <%--<div class="col-md-4">
                                    <div class="form-group">
                                        <label id="Label1" runat="server">Gender<span class="m-color-red">*</span></label><br />
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" onclick="return false;">
                                            <asp:ListItem Value="B">B</asp:ListItem>
                                            <asp:ListItem Value="G">G</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                </div>--%>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Gender<span class="m-color-red">*</span></label>
                                        <%--<%--<asp:Label ID="Gender" runat="server" Font-Bold="true">Gender</asp:Label><span class="m-color-red">*</span><br />--%>
                                        <asp:DropDownList ID="GenderDropDownList" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Gender" DataValueField="Gender" OnSelectedIndexChanged="GenderDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <%--<div class="col-md-4">
                                    <div class="form-group">
                                        <label>Event Type<span class="m-color-red">*</span></label>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" onclick="return false;">
                                            <asp:ListItem>Z</asp:ListItem>
                                            <asp:ListItem Value="0">IZ</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>--%>
                                <%--<div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="EventType" runat="server" Font-Bold="true">Event Type</asp:Label><br />
                                        <asp:Label ID="EventTypelabel" runat="server"></asp:Label>
                                    </div>
                                </div>--%>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="ZoneName" runat="server" Font-Bold="true">Zone Name</asp:Label><br />
                                        <asp:Label ID="ZoneNamelabel" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <%--<div class="col-md-4">
                                    <div class="form-group">
                                        <label>Zone Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="ZoneDropDownList" Visible="false" AutoPostBack="true" CssClass="form-control" DataSourceID="SqlDataSource4" runat="server" DataTextField="Zone_name" DataValueField="Zone_id" OnSelectedIndexChanged="ZoneDropDownList_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [ZONE_MAST] ORDER BY [Zone_id]"></asp:SqlDataSource>
                                    </div>
                                </div>--%>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="College" runat="server" Font-Bold="true">Hosting College Name</asp:Label><br />
                                        <asp:Label ID="Collegelabel" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="GameDate" runat="server" DataFormatString="{0:dd/MM/yyyy}" Font-Bold="true">Game Date</asp:Label><br />
                                        <asp:Label ID="GameDatelabel" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="MaxPlayer" runat="server" Font-Bold="true">Maximum Player</asp:Label><br />
                                        <asp:Label ID="MaxPlayerlabel" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="MinPlayer" runat="server" Font-Bold="true">Minimum Player</asp:Label><br />
                                        <asp:Label ID="MinPlayerlabel" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="NewRegistrationButton" CssClass="btn btn-primary" runat="server" Text="New Team Registration" OnClick="NewRegistrationButton_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-primary" visible="false" id="team" runat="server">
                        <div class="box-header with-border">
                            <h3 class="box-title">Team Registration</h3>
                            <div class="box-tools pull-right">                                
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body" id="registration" runat="server">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Add Student</h3>
                                </div>

                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Label ID="TeamIdLabel" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Enrolment No<span class="m-color-red">*</span></label>
                                                &nbsp;
                                            <asp:TextBox ID="EnrolmentTextBox" runat="server"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="AddStudentButton" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="Add_Click" OnClientClick="return Validate();"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowHeaderWhenEmpty="True" OnRowDeleting="GridView1_RowDeleting" OnDataBound="GridView1_DataBound">
                                    <Columns>
                                        <asp:BoundField DataField="Student_id" HeaderText="Student id" SortExpression="Student_id" />
                                        <asp:BoundField DataField="Student_name" HeaderText="Student name" SortExpression="Student_name" />
                                        <asp:BoundField DataField="student_mobile" HeaderText="student mobile" SortExpression="student_mobile" />
                                        <asp:BoundField DataField="student_email" HeaderText="student email" SortExpression="student_email" />
                                        <asp:BoundField DataField="C_name" HeaderText="Student college" SortExpression="Student_college" />
                                        <asp:TemplateField HeaderText="Operations">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" ImageUrl="~/Image/delete1.png" Width="20" Height="20" CommandArgument='<%#Eval("Student_id") %>' />
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
                                <asp:SqlDataSource ID="sqldatasource1" runat="server" ConnectionString="<%$ connectionstrings:db %>" SelectCommand="select distinct * from [Temp2] where ([student_id] = @student_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="enrolmenttextbox" Name="student_id" PropertyName="text" Type="string" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Submit_Click" />
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label ID="closedRegistration" runat="server" Visible="false">Registration is closed</asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>

</asp:Content>
