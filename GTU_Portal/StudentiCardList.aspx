<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="StudentiCardList.aspx.cs" Inherits="GTU_Portal.StudentiCardList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .txt0 {
            border: none;
            border-bottom: 1px solid black;
        }

        .txt {
            border:none;
            border-bottom:1px solid black;
            width:75%;
        }

        table.tab td, th {
            padding-left:5px
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=iCard.ClientID %>").style.display = "none";
            }, seconds * 1000);
        });
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
            <section class="content-header">
                <h1>i-Card List</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>                    
                    <li class="active">Student iCard List</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Student List</h3>
                                <%--<div class="box-tools pull-right">
                                    <a href="??????.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>--%>
                            </div>
                            <div id="PDF" runat="server">                                
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Event Name<span class="m-color-red">*</span></label><br />
                                                <label id="EventName" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Game Name<span class="m-color-red">*</span></label><br />
                                                <label id="GameName" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Game Date<span class="m-color-red">*</span></label><br />
                                                <label id="GameDate" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Event Type<span class="m-color-red">*</span></label><br />
                                                <label id="EventType" runat="server" style="font-weight: 500"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Ega_id" ShowHeaderWhenEmpty="True" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="Ega_id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Ega_id" />
                                        <asp:BoundField DataField="Student_id" HeaderText="Enrolment Number" SortExpression="Student_id" />
                                        <asp:BoundField DataField="Student_name" HeaderText="Student Name" SortExpression="Student_name" />
                                        <asp:BoundField DataField="Student_mobile" HeaderText="Mobile Number" SortExpression="Student_mobile" />
                                        <asp:BoundField DataField="Student_email" HeaderText="Email Id" SortExpression="Student_email" />
                                        <asp:BoundField DataField="C_name" HeaderText="Student College" SortExpression="C_name" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="dwnld" CommandName="download" CssClass="btn btn-primary" BackColor="#cc0000" Text="Download iCard" runat="server" CommandArgument='<%#Eval("Student_id") %>'/> 
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


                            <%--iCard HTML Design--%>                           
                            <div id="iCard" style="border:1px solid black; margin:10px; padding : 10px; height : 450px; width:700px;" runat="server" visible="false">
		                        <label style="font-weight:bold; float:right; font-size:35px; color:#414844">Gujarat Technological University</label><br/>
	                            
	                            <div style="padding-bottom:30px; padding-top:30px;">
		                            <label for="game">Game : </label>                                    
                                    <asp:TextBox ID="gametxt" CssClass="txt0" runat="server"></asp:TextBox>
		                            <p style="float:right; position:relative; display:inline; background-color:#414844; color:white; padding:3px 10px 3px 10px"><b>Zonal/Interzonal PARTICIPATION I-CARD</b></p>  
		                            <br/>
	                            </div>
	                            <div style="display:inline-block;vertical-align:top; margin: 0px 0px 0px 20px">		                            
                                    <asp:Image ID="student_img" ImageUrl="~/StudentPic/pic.jpg" BorderStyle="Dashed" Height="200px" Width="150px" style="float:left" runat="server" />
	                            </div>
	                            <div class="tab" style="display:inline-block; position:absolute; margin:0 0 0 20px;">
		                            <label for="name">Name &nbsp;&nbsp;&nbsp; : </label>
                                    <asp:TextBox ID="studentnametxt" MaxLength="240" CssClass="txt" runat="server"></asp:TextBox>
                                    <br/>
		                            <label for="college">College &nbsp; : </label>
                                    <asp:TextBox ID="studentclgtxt" CssClass="txt" runat="server"></asp:TextBox>
                                    <br/><br />


		                            <table border="1" cellspacing="0" width="450px" height="125px" cellpadding="5" runat="server">
			                            <tr>
				                            <th>Year</th>
				                            <th>Class</th>
				                            <th>Sign of Sports Officer</th>
			                            </tr>
			                            <tr>
				                            <td>20</td>
				                            <td></td>
				                            <td></td>
			                            </tr>
			                            <tr>
				                            <td>Birth Date:</td>
				                            <td></td>
				                            <td></td>
			                            </tr>
		                            </table>
	                            </div>
	                            <div style="padding-top:80px; position:absolute;">
		                            <label>Student's Signature</label>
		                            <div style="display:inline-block; margin-left:100px; position:fixed;">
			                            <label>Date : </label>
                                        <asp:TextBox ID="gamedatetxt"  CssClass="txt" runat="server"></asp:TextBox>
		                            </div>
		                            <div style="display:inline-block; float:right; margin-left: 450px; position:fixed;">
			                            <label>Principal's Signature</label>
		                            </div>
	                            </div>
                            </div>
                            
                        </div>
                    </section>
                </div>
            </section>
        </div>

</asp:Content>
