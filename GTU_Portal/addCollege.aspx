<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="addCollege.aspx.cs" Inherits="GTU_Portal.addCollege" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validate() {
            debugger;

            var id = document.getElementById("<%= CollegeIdTextBox.ClientID%>").value;
            var name = document.getElementById("<%= CollegeTextBox.ClientID%>").value;
            var add = document.getElementById("<%= CollegeAddressTextArea.ClientID%>").value;
            var mobile = document.getElementById("<%= MobileTextBox.ClientID%>").value;
            var email = document.getElementById("<%= EmailTextBox.ClientID%>").value;
            var website = document.getElementById("<%= WebsiteTextBox.ClientID%>").value;
            var pincode = document.getElementById("<%= PincodeTextBox.ClientID%>").value;
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            //var web = /^(wW)+(.)+([a-zA-Z0-9])+(.)+([a-zA-z0-9]{2,4})+$/;
            
            if (id == "" || name == "" || add == "" || mobile == "" || email == "" || website == "" || pincode == "") {
                alert("Enter Required Field");
                return false;
            }

            if (isNaN(id)) {
                alert("Enter Valid College ID");
                return false;
            }

            //if (!isNaN(cname) || !isNaN(add)) {
            //    alert("Enter Valid Word");
            //    return false;
            //}

            if (pincode.length != 6) {
                alert("Enter Valid Pin code");
                return false;
            }

            if (mobile.length != 10) {
                alert("Enter Valid Phone Number");
                return false;
            }
            
            if (!filter.test(email)) {
                alert('Enter Valid Email Address');
                email.focus;
                return false;
            }

            //if (!web.test(website)) {
            //    alert("Enter Valid Website");
            //    return false;
            //}
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-wrapper">
        <section class="content-header">
            <h1>Add College</h1>
            <ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                <li><a href="College.aspx">College</a></li>
                <li class="active">Add College</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add College</h3>
                            <div class="box-tools pull-right">
                                <a href="College.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                            </div>
                        </div>


                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="Label4" runat="server">College ID<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="CollegeIdTextBox" class="form-control" placeholder="Enter College ID" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">College Name<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="CollegeTextBox" class="form-control" placeholder="Enter College Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">College Address<span class="m-color-red">*</span></label>
                                        <textarea id="CollegeAddressTextArea" name="CollegeAddressTextArea" column="8" rows="4" class="form-control" placeholder="Enter College Address" runat="server"></textarea>
                                    </div>
                                </div>

                            </div>



                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="Label2" runat="server">College Mobile No.<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="MobileTextBox" class="form-control" placeholder="Enter College Mobile Number" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">College Email<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="EmailTextBox" class="form-control" placeholder="Enter College Email-id" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">City<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="CityDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="City_name" DataValueField="City_id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT [City_id], [City_name] FROM [CITY_MAST] ORDER BY [City_id]"></asp:SqlDataSource>
                                    </div>
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label id="Label3" runat="server">State<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="StateDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="State_name" DataValueField="State_id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [STATE_MAST] ORDER BY [State_id]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">Zone<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="ZoneDropDownList" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Zone_name" DataValueField="Zone_id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [ZONE_MAST] ORDER BY [Zone_id]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">Pincode<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="PincodeTextBox" CssClass="form-control" placeholder="Enter College Pincode" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label runat="server">Website<span class="m-color-red">*</span></label>
                                        <asp:TextBox ID="WebsiteTextBox" CssClass="form-control" placeholder="Enter College Website" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="Button1_Click" OnClientClick="return Validate();"/>
                                    <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
            </div>
        </section>
    </div>

</asp:Content>
