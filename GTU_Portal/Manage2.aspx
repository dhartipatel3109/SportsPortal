<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Manage2.aspx.cs" Inherits="GTU_Portal.Manage2" %>

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

        $(function () {
            var date = new Date();
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();
            $('input[id*=txtdate2]').datepicker({

                minDate: new Date(currentYear, currentMonth, currentDate)
            });
        });

        $(document).ready(function () {
            $("#gtu-tab").on("click", function (e) {
                //debugger;
                //var ref_this = $("ul.gtu-tab li a.active");

                var target = $(e.target).attr("data-id");
                if (target == null)                    
                    alert('There is no active element');

               <%-- document.getElementById("<%=hdnfldVariable.ClientID %>").value = target;

                alert(document.getElementById("<%=hdnfldVariable.ClientID %>").value);--%>
            });                 
        });        
        
        function boy() {
            debugger;
            var chkListModules = document.getElementById('<%= GridView1.ClientID %>');            
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    return;
                }
            }
            alert("Please select Game_type (Zonal or Inter-zonal) for all the games that you have selected.");
            return false;
        }

        function girl() {
            debugger;
            var chkListModules = document.getElementById('<%= GridView2.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    return;
                }
            }
            alert("Please select Zone.");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <%--<section class="content-header">
            <h1></h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Users</li>
            </ol>
        </section>--%>
        <section class="content">
            <div class="row">
                <section class="col-lg-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Manage Event</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="box-body">

                            <div class="row">

                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <label>Event Name:</label>
                                        <asp:Label CssClass="form-control" ID="EventNameLabelBox" runat="server"></asp:Label>
                                    </div>
                                </div>

                            </div>
                            <hr />
                            <div class="row">
                                <%--<div class="col-md-4">
                                    <div class="form-group" style="margin-left: 10%; table-layout: auto; right: 10%;">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_id" DataSourceID="SqlDataSource1" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" Width="1000px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Game ID">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Label1" Style="border: 0px" runat="server" Text='<%#Eval("Game_id") %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Game Name">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Label2" Style="border: 0px" runat="server" Text='<%#Eval("Game_name") %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Event for">
                                                    <ItemTemplate>
                                                        <asp:CheckBoxList ID="EventForCheckBoxList" RepeatDirection="Horizontal" CssClass="" runat="server" AutoPostBack="false" CellSpacing="10" CellPadding="10">
                                                            <asp:ListItem Value="1">Boys</asp:ListItem>
                                                            <asp:ListItem Value="2">Girls</asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="GameDate">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtdate" Style="border: 0px" type="date" runat="server"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [GAME_MAST] ORDER BY [Game_id]"></asp:SqlDataSource>

                                    </div>
                                </div>--%>

                                <div class="col-md-12">
                                    <div class="nav-tabs-custom">

                                        <asp:HiddenField ID="hdnfldVariable" runat="server" />
                                        <ul class="nav nav-tabs" id="gtu-tab">
                                            <li class="active"><a href="#Boys" data-id="1" id="boys-tab" data-toggle="tab">Boys</a></li>
                                            <li><a href="#Girls" id="girls-tab" data-id="2" data-toggle="tab">Girls</a></li>
                                        </ul>
                                        <div id="tabs" class="tab-content">
                                            <div class="tab-pane active" id="Boys">
                                                <asp:Label ID="Label3" runat="server" type="hidden"></asp:Label>
                                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_id" DataSourceID="SqlDataSource1" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" Width="1000px">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Game ID">
                                                            <ItemTemplate>
                                                                <%-- <asp:Label ID="Label1" runat="server" Text='<%#Eval("Game_id") %>'></asp:Label>--%>
                                                                <asp:TextBox ID="Label1" Style="border: 0px" runat="server" Text='<%#Eval("Game_id") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Game Name">
                                                            <ItemTemplate>
                                                                <%--<asp:Label ID="Label2" runat="server" Text='<%#Eval("Game_name") %>'></asp:Label>--%>
                                                                <asp:TextBox ID="Label2" Style="border: 0px" runat="server" Text='<%#Eval("Game_name") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox CssClass="chk" ID="CheckBox1" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GameDate">
                                                            <ItemTemplate>
                                                                <%--<input id="txtdate1" type="text" runat="server" />--%>
                                                                <asp:TextBox ID="txtdate1" DataFormatString="{0:dd/MM/yyyy}" Cssclass="form-control" type="text" runat="server"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Event Type">
                                                            <ItemTemplate>
                                                                <asp:RadioButtonList CssClass="chk" ID="EventTypeCheckBoxList1" Style="border: 0px" runat="server">
                                                                    <asp:ListItem Value="Zonal">Zonal Level</asp:ListItem>
                                                                    <asp:ListItem Value="Inter-Zonal">Inter-Zonal Level</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [GAME_MAST] ORDER BY [Game_id]"></asp:SqlDataSource>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group text-center">
                                                            <asp:Button ID="BoyButton" CssClass="btn btn-primary" runat="server" Text="BoyPublish" OnClick="BoyButton_Click" OnClientClick="return boy();"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="tab-pane" id="Girls">
                                                <asp:Label ID="Label4" runat="server"></asp:Label>
                                                <asp:GridView ID="GridView2" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_id" DataSourceID="SqlDataSource1" CellPadding="1" CellSpacing="1" HorizontalAlign="Center" Width="1000px">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Game ID">
                                                            <ItemTemplate>
                                                                <%-- <asp:Label ID="Label1" runat="server" Text='<%#Eval("Game_id") %>'></asp:Label>--%>
                                                                <asp:TextBox ID="Label1" Style="border: 0px" runat="server" Text='<%#Eval("Game_id") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Game Name">
                                                            <ItemTemplate>
                                                                <%--<asp:Label ID="Label2" runat="server" Text='<%#Eval("Game_name") %>'></asp:Label>--%>
                                                                <asp:TextBox ID="Label2" Style="border: 0px" runat="server" Text='<%#Eval("Game_name") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox CssClass="chk" ID="CheckBox2" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GameDate">
                                                            <ItemTemplate>
                                                                <%--<input id="txtdate2" type="text" runat="server" />--%>
                                                                <asp:TextBox ID="txtdate2" DataFormatString="{0:dd/MM/yyyy}" Cssclass="form-control" type="text" runat="server"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Event Type">
                                                            <ItemTemplate>
                                                                <asp:RadioButtonList CssClass="chk" ID="EventTypeCheckBoxList2" Style="border: 0px" runat="server">
                                                                    <asp:ListItem Value="Zonal">Zonal Level</asp:ListItem>
                                                                    <asp:ListItem Value="Inter-Zonal">Inter-Zonal Level</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [GAME_MAST] ORDER BY [Game_id]"></asp:SqlDataSource>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group text-center">
                                                            <asp:Button ID="GirlButton" CssClass="btn btn-primary" runat="server" Text="GirlPublish" OnClick="GirlButton_Click" OnClientClick="return girl();" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="box-body table-responsive no-padding">
                                                <asp:GridView ID="GridView3" CssClass="table table-striped table-bordered" DataKeyNames="Egd_id" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" BorderWidth="1px" CellPadding="3">
                                                    <Columns>                                                        
                                                        <asp:BoundField DataField="Egd_id" HeaderText="No" SortExpression="Egd_id" InsertVisible="False" ReadOnly="True" />
                                                        <%--<asp:BoundField DataField="Event_name" HeaderText="Event_name" SortExpression="Event_name" />--%>
                                                        <asp:BoundField DataField="Game_name" HeaderText="Game_name" SortExpression="Game_name" />
                                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                                        <asp:BoundField DataField="Game_date" HeaderText="Game_date" SortExpression="Game_date" />
                                                        <asp:BoundField DataField="Event_type" HeaderText="Event_type" SortExpression="Event_type" />
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
                                                <%--<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [Event_Game_Detail_Extra]"></asp:SqlDataSource>--%>
                                            </div>

                                            <br />
                                            <hr />
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group text-center">
                                                        <asp:Button ID="Submit" CssClass="btn btn-primary" Visible="false" type="Submit" Text="Submit" runat="server" OnClick="Submit_Click" />
                                                        <input id="Reset" runat="server" type="reset" class="btn btn-primary" title="Reset" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%--<div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group text-center">
                                                        <asp:Button ID="Submit" CssClass="btn btn-primary" Visible="false" type="Submit" Text="Submit" runat="server" OnClick="Submit_Click" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group text-center">
                                                        <input id="Reset" runat="server" type="reset" class="btn btn-primary" title="Reset" />
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <%--<div class="rows">
                                <asp:Label ID ="Label1" CssClass="form-control" runat="server"></asp:Label>
                            </div>--%>

                            <%--<div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="CollegeButton" CssClass="btn btn-primary" runat="server" Text="Publish" OnClientClick="return " OnClick="CollegeButton_Click" />
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
