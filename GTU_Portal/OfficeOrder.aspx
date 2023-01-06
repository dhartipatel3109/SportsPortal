<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OfficeOrder.aspx.cs" Inherits="GTU_Portal.WebForm23" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<div class="content-wrapper">
        <section class="content-header">
            <h1>Office Order</h1>
            <ol class="breadcrumb">
                <li><a href="?????.aspx"><i class="fa fa-dashboard"></i>GTU Event</a></li>
                <li class="active">Office Order</li>
            </ol>
        </section>
        <section class="content">

            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Office Order</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Image ID="GTUHeaderImage" ImageUrl="~/img/bgs.png" runat="server" />
                                </div>
                                <div class="col-md-12">
                                    <div>
                                        <p>રેફ નં: જી.ટી.યુ / સ્પોર્ટ્સ / </p><asp:TextBox ID="year" runat="server">year</asp:TextBox> / <asp:TextBox ID="serialNo" runat="server">serial</asp:TextBox>
                                    </div>
                                    <div>
                                        <p>તારીખ: </p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div>
                                        પ્રતિ
                                        <asp:TextBox ID="ToSir" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Event Type<span class="m-color-red">*</span></label>
                                        <div style="align-content: space-between;">
                                            <asp:CheckBoxList ID="CheckBoxList2" runat="server" OnClick="return false;">
                                                <asp:ListItem Value="Zonal">Zonal</asp:ListItem>
                                                <asp:ListItem Value="Inter-Zonal">Inter-Zonal</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Zone Name<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="ZoneDropDownList" Visible="true" AutoPostBack="true" CssClass="form-control" runat="server" DataTextField="Zone_name" DataValueField="Zone_id" OnSelectedIndexChanged="ZoneDropDownList_SelectedIndexChanged">                                            
                                        </asp:DropDownList>
                                        <%--<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT * FROM [ZONE_MAST] ORDER BY [Zone_id]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>College<span class="m-color-red">*</span></label>
                                        <asp:DropDownList ID="CollegeDropDownList" CssClass="form-control" runat="server" DataTextField="C_name" DataValueField="C_id"></asp:DropDownList>
                                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DB %>" SelectCommand="SELECT C_id, C_name FROM [COLLEGE_MAST] ORDER BY [C_id]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <asp:Button ID="AssignButton" CssClass="btn btn-primary" runat="server" Text="Assign" OnClick="AssignButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>
    </div>--%>

</asp:Content>
