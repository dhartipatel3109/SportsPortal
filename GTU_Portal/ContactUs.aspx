<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="GTU_Portal.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Contact Us</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li><a href="?????.aspx">CMS</a></li>
                    <li class="active">Contact Us</li>
                </ol>
            </section>
            <section class="content">

                <div class="row ">
                    <section class="col-lg-12">
                        <div class="box box-primary">
                            
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Description for Contact Us</h3>
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
                                            <label>University Name<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="UniNameTextBox" runat="server" class="form-control" placeholder="Enter College Name"></asp:TextBox> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>University Address<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="UniAddressTextBox" runat="server" Rows="10" textMode="MultiLine" class="form-control" placeholder="Enter College Address"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>University Mobiile No.<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="UniMobileTextBox" runat="server" class="form-control" placeholder="Enter University Mobile no."></asp:TextBox> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>University Email ID<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="UniEmailTextBox" runat="server" class="form-control" placeholder="Enter University Email-id"></asp:TextBox> 
                                        </div>
                                    </div>
                                </div>

                                <%--<div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click"/>
                                            &nbsp;
                                            <input type="reset" id="Reset1" class="btn btn-primary" runat="server" name="Reset"/>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>


                        <div class="box box-primary">
                            
                            <div class="box-header with-border">
                                <h3 class="box-title">Contact Person Detail</h3>
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
                                            <label>Person Photo<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:FileUpload ID="PhotoFileUpload" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Person Photo<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="OfficerNameTextBox" class="form-control" placeholder="Enter Officer Name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Designation<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="OfficerDesignationTextBox" runat="server" class="form-control" placeholder="Enter Designation of this person"></asp:TextBox> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Mobiile No.<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="OfficerMobileTextBox" runat="server" class="form-control" placeholder="Enter Person Mobile no."></asp:TextBox> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Phone No.<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="OfficerPhoneTextBox" runat="server" class="form-control" placeholder="Enter Office Phone no."></asp:TextBox> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Email ID<span class="m-color-red">*</span><span class="m-color-red"></span></label>
                                            <asp:TextBox ID="OfficerEmailTextBox" runat="server" class="form-control" placeholder="Enter Person Email-id"></asp:TextBox> 
                                        </div>
                                    </div>
                                    
                                </div>
                                <hr /><hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Button2_Click"/>
                                            &nbsp;
                                            <input type="reset" id="Reset2" class="btn btn-primary" runat="server" name="Reset"/>
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
