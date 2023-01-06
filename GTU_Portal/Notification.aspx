<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="GTU_Portal.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        <%--function Validate() {

            var name = document.getElementById("<%= TextBox1.ClientID%>").value;

            if (name == "") {
                //alert("Enter Message");
                //return false;
            }
        }--%>

        function blockSpecialChar(e) {
            debugger;
            var k = e.keyCode;
            if (k === 39) {
                alert("Don't Use Apostophe");
                return false;
            }
        }

        $(function () {
            $('#<%=Button1.ClientID %>').click(function () {
                debugger;
                var k = $('#<%=TextBox1.ClientID %>').val();
                var text = k.includes("'s");
                if (text == true) {
                    alert("Don't Use Apostrophe");
                    return false;
                }
            });
        });

        $(function () {
            $('#<%=Button2.ClientID %>').click(function () {
                debugger;
                var fileExtension = ['pdf'];
                if ($.inArray($('#<%=fileupload.ClientID %>').val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only 'pdf' formats are allowed");
                    return false;
                }
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
     <div class="content-wrapper">
            <section class="content-header">
                <h1>Add Notification</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>                    
                    <li class="active">Add Notification</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">

                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Updates</h3>                                
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Add Message<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="TextBox1" placeholder="Enter new Message" runat="server" class="form-control" onkeypress="return blockSpecialChar(event);"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Add" OnClick="Button1_Click" />
                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </section>

         <section class="content">

                <div class="row">

                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Circular</h3>                                
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Add File Name<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="TextBox2" placeholder="Enter new Message" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Add File<span class="m-color-red">*</span></label>
                                            <asp:FileUpload ID="fileupload" runat="server"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Upload" OnClick="Button2_Click" OnClientClick="return Validate();"/>
                                            <asp:Label ID="Label2" runat="server"></asp:Label>
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
