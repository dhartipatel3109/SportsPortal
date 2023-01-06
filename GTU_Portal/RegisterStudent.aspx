<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RegisterStudent.aspx.cs" Inherits="GTU_Portal.RegisterStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#datepicker").datepicker({
                changeMonth: true,
                changeYear: true
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Student Registration</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>
                <li><a href="Registration.aspx">Registration</a></li>
                <li class="active">Student Registration</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Registration of Students</h3>
                            <div class="box-tools pull-right">
                                <a href="Registration.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="EnrolLabel" runat="server">Enrolment No.<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="EnrolmentTextBox" class="form-control" placeholder="Enter Enrolment No." runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="StudentNameLabel" runat="server">Student Name<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="StudentNameTextBox" CssClass="form-control" placeholder="Enter Student Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <%--<div class="col-md-4">
                                        <div class="form-group">
                                            <label id="FatherNameLabel" runat="server">Father Name<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="FatherNameTextBox" CssClass="form-control" placeholder="Enter Father Name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="MotherNameLabel" runat="server">Mother Name.<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="MotherNameTextBox" CssClass="form-control" placeholder="Enter Mother Name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="DOBLabel" runat="server">Date of Birth<span class="m-color-red">*</span></label>
                                            <asp:Calendar ID="DOBCalendar" placeholder="Enter Date of Birth" runat="server"></asp:Calendar>
                                            <input type="date" id="datepicker" class="form-control" runat="server" />
                                        </div>
                                    </div>--%>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="MobileLabel" runat="server">Mobile No.<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="MobileTextBox" placeholder="Enter Phone Number of Student" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="Label4" runat="server">Email ID<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="EmailTextBox" placeholder="Enter Email Id of Student" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="StudentCollegelabel" runat="server">College<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="StudentCollegeTextBox" placeholder="Enter Student's College" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <%--<div class="col-md-4">
                                        <div class="form-group">
                                            <label id="PresentCourseLabel" runat="server">Name of Present Course<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="PresentCourseTextBox" placeholder="Name of Present Course (Branch)" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="DurOfPreCourseLabel" runat="server">Duration of Present Course<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="DurOfPreCourseTextBox" placeholder="Duration of Present Course" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="PresentSemLabel" runat="server">Present Semester<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="PresentSemTextBox" placeholder="Present Semester" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label id="LastSemYearLabel" runat="server">Last Semester Year<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="LastSemYearTextBox" placeholder="Year of Last Semester" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>--%>

                                <%--<div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />
                                            &nbsp; &nbsp; &nbsp;
                                            <input id="Reset1" type="reset" class="btn btn-primary" value="Reset" runat="server" />
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Team Registration</h3>
                            <div class="box-tools pull-right">
                                <a class="btn btn-primary btn-sm" href="RegisterStudent.aspx">Student Registration</a>
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <%--<div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <fieldset runat="server">
                                            <legend class="box-tools">Add Student</legend>
                                            <label>Enrolment No:</label>
                                            <asp:TextBox ID="enrolment" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Add" OnClick="Add_Click" />
                                            <input type="reset" class="btn btn-primary" runat="server" />
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="box-body table-responsive no-padding">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Student_id" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="Student_id" HeaderText="Student_id" SortExpression="Student_id" />
                                    <asp:BoundField DataField="Student_name" HeaderText="Student_name" SortExpression="Student_name" />
                                    <asp:BoundField DataField="Student_mobile" HeaderText="Student_mobile" SortExpression="Student_mobile" />
                                    <asp:BoundField DataField="Student_email" HeaderText="Student_email" SortExpression="Student_email" />
                                    <asp:BoundField DataField="Student_college" HeaderText="Student_college" SortExpression="Student_college" />                                    
                                    <asp:BoundField DataField="Game_name" HeaderText="Game_name" SortExpression="Game_name" />
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
                            <br />
                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Submit_Click" />
                        </div>--%>
                        
                    </div>
                </section>
            </div>
        </section>
    </div>

</asp:Content>
