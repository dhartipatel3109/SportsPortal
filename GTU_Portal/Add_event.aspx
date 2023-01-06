<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="Add_event.aspx.cs" Inherits="GTU_Portal.Add_event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="addBranchForm" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>Add Event</h1>
                <ol class="breadcrumb">
                    <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>GTU EVENT</a></li>
                    <li><a href="Branch.aspx">Events</a></li>
                    <li class="active">Add Events</li>
                </ol>
            </section>
            <section class="content">

                <div class="row">

                    <section class="col-lg-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Events</h3>
                                <div class="box-tools pull-right">
                                    <a href="Events.aspx" class="btn-primary btn-sm btn"><i class="fa-angle-double-left fa mr-5"></i>Back</a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Event Name<span class="m-color-red">*</span></label>
                                            <asp:TextBox ID="AddEventTextBox" runat="server" class="form-control" placeholder="Enter event Nmae"></asp:TextBox>
                                         </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group text-center">
                                            <button id="AddEventsButton" type="submit" class="btn btn-primary" runat="server">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </section>
        </div>
    </form>
</asp:Content>
