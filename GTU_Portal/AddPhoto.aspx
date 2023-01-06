<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddPhoto.aspx.cs" Inherits="GTU_Portal.WebForm21" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $('#<%=Button2.ClientID %>').click(function () {
                debugger;
                var fileExtension = ['jpeg', 'jpg', 'png', 'gif'];
                if ($.inArray($('#<%=fileupload.ClientID %>').val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only '.jpeg','.jpg', '.png', '.gif' formats are allowed.");
                    return false;
                }

                var size = ($('#<%=fileupload.ClientID %>').files[0].size / 1024 / 1024).toFixed(2);

                if (size > 4) {
                    alert("File Size is too long - insert only < 4 MB");
                    alert(size);
                    return false;
                }

            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Add Photo</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Add Photo</li>
            </ol>
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
                                        <label>Add File<span class="m-color-red">*</span></label>
                                        <asp:FileUpload ID="fileupload" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group text-center">
                                        <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Upload" OnClick="Button2_Click" OnClientClick="return Validate();" />
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
