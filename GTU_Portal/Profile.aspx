<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GTU_Portal.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Float four columns side by side */
        .column {
            float: left;
            width: 30%;
            padding: 0 10px;
        }

        .column1 {
            float: left;
            width: 70%;
            padding: 0 10px;
        }

        /* Remove extra left and right margins, due to padding */
        .row {
            margin: 0 -5px;
        }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

        /* Responsive columns */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }

        /* Style the counter cards */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: center;
            background-color: #f1f1f1;
        }

        .card1 {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: left;
            background-color: #f1f1f1;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#gtu-tab").on("click", function (e) {
                debugger;
                //var ref_this = $("ul.gtu-tab li a.active");

                var target = $(e.target).attr("data-id");
                if (target != null)
                    console.write(target);
                else
                    alert('There is no active element');

               <%-- document.getElementById("<%=hdnfldVariable.ClientID %>").value = target;

                alert(document.getElementById("<%=hdnfldVariable.ClientID %>").value);--%>
            });

        });

        $(function () {
            $('#<%=FileUpload1.ClientID %>').change(function () {
                debugger;
                var fileExtension = ['jpeg', 'jpg', 'png', 'gif'];
                if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only '.jpeg','.jpg', '.png', '.gif' formats are allowed.");
                    return false;
                }

                var size = (this.files[0].size / 1024 / 1024).toFixed(2);

                if (size > 4 ) {
                    alert("File Size is too long - insert only < 4 MB");
                    alert(size);
                    return false; 
                }

                var objTextBox = document.getElementById("<%= UploadButton.ClientID %>");
                //objTextBox.value = objfile.value;               
                document.getElementById("<%= UploadButton.ClientID %>").click();
                return false;

            });
        });

        function fireFileClick() {
            //debugger;
            var objfile = document.getElementById("<%= FileUpload1.ClientID %>");
            objfile.click();

            return false;
        }
        <%--function myFunction(objfile) {
            debugger;
            var objTextBox = document.getElementById("<%= UploadButton.ClientID %>");
            //objTextBox.value = objfile.value;
            document.getElementById("<%= UploadButton.ClientID %>").click();
            return false;
        }--%>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Profile</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Dashboard</a></li>
                <li class="active">Profile</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="column">
                    <div class="card">
                        <asp:Image ID="UploadImage" Style="width: 100%" Height="" runat="server" />

                        <div class="file-field">
                            <a class="btn-floating blue-gradient mt-0 float-left">
                                <%--<i class="far fa-heart" aria-hidden="true"></i>--%>
                                <br />
                                <asp:FileUpload ID="FileUpload1" CssClass="btn btn-primary" runat="server"  onchange="myFunction(this);" Style="display : none;"/>
                                <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Style="display : none;"/>
                                <asp:Button ID="AddPhoto" runat="server" CssClass="btn btn-primary" Text="Add Photo" OnClientClick="return fireFileClick();" />
                            </a>
                        </div>
                        <h1>
                            <asp:Label ID="imgnamelabel1" runat="server"></asp:Label></h1>
                        <p>
                            <asp:Label ID="Rolelabel" CssClass="title" runat="server"></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="univerditylabel" runat="server"></asp:Label>
                        </p>
                        <div style="margin: 24px 0;">
                            <a href="#"><i class="fa fa-dribbble"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </div>
                    </div>
                </div>

                <div class="column1">
                    <div class="card1">
                        <div class="nav-tabs-custom">
                            <asp:HiddenField ID="hdnfldVariable" runat="server" />
                            <ul class="nav nav-tabs" id="gtu-tab">
                                <li class="active"><a href="#Boys" data-id="1" id="boys-tab" data-toggle="tab">Info</a></li>
                                <li><a href="#Girls" id="girls-tab" data-id="2" data-toggle="tab">Add Info</a></li>
                            </ul>
                            <div id="tabs" class="tab-content">
                                <div class="tab-pane active" id="Boys">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4>
                                                <asp:Label runat="server" Font-Bold="true">Name : </asp:Label>
                                            </h4>
                                            <asp:Label ID="nlabel" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4>
                                                <asp:Label runat="server" Font-Bold="true">User ID : </asp:Label>
                                            </h4>
                                            <asp:Label ID="uidlabel" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4>
                                                <asp:Label runat="server" Font-Bold="true">Password : </asp:Label>
                                            </h4>
                                            <asp:Label ID="plabel" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4>
                                                <asp:Label runat="server" Font-Bold="true">Mobile No. : </asp:Label>
                                            </h4>
                                            <asp:Label ID="mlabel" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4>
                                                <asp:Label runat="server" Font-Bold="true">Email : </asp:Label>
                                            </h4>
                                            <asp:Label ID="elabel" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane" id="Girls">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <h4>
                                                    <asp:Label runat="server" Font-Bold="true">Name : </asp:Label>
                                                </h4>
                                                <asp:TextBox ID="Name" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <h4>
                                                    <asp:Label runat="server" Font-Bold="true">User ID : </asp:Label>
                                                </h4>
                                                <asp:TextBox ID="Userid" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <h4>
                                                    <asp:Label runat="server" Font-Bold="true">Password : </asp:Label>
                                                </h4>
                                                <asp:TextBox ID="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <h4>
                                                    <asp:Label runat="server" Font-Bold="true">Mobile No. : </asp:Label>
                                                </h4>
                                                <asp:TextBox ID="MobileNo" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <h4>
                                                    <asp:Label runat="server" Font-Bold="true">Email : </asp:Label>
                                                </h4>
                                                <asp:TextBox CssClass="form-control" ID="Email" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <%--<div class="col-lg-6">
                                            <div class="form-group">
                                                <h4>
                                                    <asp:Label runat="server" Font-Bold="true">Add Photo : </asp:Label>
                                                </h4>
                                                <asp:FileUpload ID="FileUpload1" CssClass="btn btn-primaryt" runat="server" />
                                                <asp:Button ID="UploadButton" CssClass="btn btn-primary" runat="server" Text="Upload" OnClick="UploadButton_Click" />
                                            </div>
                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group text-center">
                                                <asp:Button ID="Add" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="SubmitButton_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

</asp:Content>
