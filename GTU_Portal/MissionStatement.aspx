<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MissionStatement.aspx.cs" Inherits="GTU_Portal.MissionStatement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function Validate() {
            debugger;
            var name = document.getElementById("<%= Desc2TextBox.ClientID%>").value;
            var name1 = document.getElementById("<%= Desc1TextBox.ClientID%>").value;

            if (name == "" && name1 == "") {
                alert("Enter Message");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Mission Statement</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>GTU EVENT</a></li>
                    <li><a href="??????.aspx">CMS</a></li>
                    <li class="active">Mission Statement</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Description for Mission Statement<span class="m-color-red">*</span>:</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <%--<textarea rows="10" class="form-control"></textarea>--%>
                                            <asp:Label ID="Label1" runat="server" Text="">Mission<span class="m-color-red">*</span></asp:Label>
                                            <asp:TextBox ID="Desc1TextBox" TextMode="multiline" rows="10" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <%--<textarea rows="10" class="form-control"></textarea>--%>
                                            <asp:Label ID="Label2" runat="server" Text="">Vision<span class="m-color-red">*</span></asp:Label>
                                            <asp:TextBox ID="Desc2TextBox" rows="10" TextMode="multiline" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <%--<button id="Button1"  type="submit" class="btn btn-primary" runat="server">Submit</button>--%>
                                            <asp:Button ID="MissionStatementButton" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="MissionStatementButton_Click" OnClientClick="return Validate();" />
                                            <asp:Label ID="label" runat="server" Visible="false"></asp:Label>
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
