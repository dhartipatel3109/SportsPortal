<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="OfficeOrderForm.aspx.cs" Inherits="GTU_Portal.OfficeOrderForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">      
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td {
            height: 50px;
            vertical-align: bottom;
            padding: 15px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <%--Observer report--%>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Office Order</h1>
            <%--<ol class="breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>College Event</a></li>
                <li class="active">Request Event</li>
            </ol>--%>
        </section>
        <section class="content">
            <div class="row">
                <section class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Report form</h3>
                            <div class="box-tools pull-right">
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">

                                    <div style="float: right">
                                        <asp:Panel ID="Panel6" ScrollBars="Auto" runat="server" CssClass="modalPopup" Style="display: none; border: 5px solid gray; background-color: white" Width="75%" Height="600px">                                            
                                            <asp:Button ID="Button26" runat="server" Text="Cancel" OnClick="Button26_Click" />
                                            <asp:Button ID="Button3" runat="server" Text="Print" OnClick="Button3_Click" />
                                            <div class="uk-width-medium-1-1" id="Print" runat="server">
                                                <div id="header" runat="server" visible="true" style="text-align: center">
                                                    <asp:Image ID="Image1" ImageUrl="~/img/bgs.png" runat="server" Width="100%" Height="200" />
                                                    <hr />
                                                </div>

                                                <div id="observerdetail" runat="server" style="margin-left: 10px;">
                                                    <label>રેફ. નઉં: જી. ટી. યુ./ સ્પોર્ટ્સ / </label><label id="date" style="float:right; padding-right:7%;">Date</label>
                                                    &nbsp;&nbsp;
                                                    <b>
                                                        <asp:TextBox ID="observername" CssClass="txt" runat="server"></asp:TextBox><br />
                                                    </b>
                                                    <br />

                                                    <label>પ્રતિ,</label><br />
                                                    <textarea id="txtarea" style="width:20%;"></textarea><br /><br />

                                                    <center><label>વિષય : યુનિવર્સિટી સ્પર્ધા માં રેફરી / પંચ / સેલેક્ટર / અમ્પાયર ની નિમણુંક અંગે</label></center>
                                                    <br />

                                                    <label>શ્રીમાન ,</label><br />

                                                    <label style="margin-left: 5%;">સવિનય સાથે જાણવા નું કે કુલપતિશ્રી ના આદેશ અનુસાર યુનિવર્સિટી સ્પર્ધા માં રેફરી / પંચ / સેલેક્ટર / અમ્પાયર કાર્ય તરીકે આપશ્રી ની નિમણુંક કરવામાં આવે છે.</label><br />
                                                    <br />

                                                    <table style="padding-left: 7%">
                                                        <tr>
                                                            <td>1.</td>
                                                            <td>રમતનું નામ : </td>
                                                            <td>
                                                                <asp:TextBox ID="eventname" runat="server"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>2.</td>
                                                            <td>તારીખ: </td>
                                                            <td>
                                                                <asp:TextBox ID="dte" CssClass="txt" runat="server"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>3.</td>
                                                            <td>સ્થળ: </td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox1" CssClass="txt" runat="server"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>4.</td>
                                                            <td>સમય: </td>
                                                            <td>
                                                                <asp:TextBox ID="time" CssClass="txt" runat="server"></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <br />

                                                    <label>ઉપર જણાવેલ તારીખ, સમય અને સ્થળ પર હાજર રહી સહકાર આપી આભારી કારશો આપનો સંમતિપત્ર ઉલટ ટપાલે મોકલી આપવા વિનંતી છે</label><br /><br />

                                                    <label style="float:right; padding-right:7%;">આભાર સહ</label><br />

                                                    <label>યુનિવર્સિટીના નિયમાનુસાર ટી.એ.ડી.એ. તથા અન્ય ભથ્થું ચૂકવવામાં આવશે</label><br /><br /><br />

                                                    <label style="float:right; padding-right:7%;">સ્પોર્ટ્સ ઓફિસર</label><br />

                                                    <label>નકલ સવિનય રાવના (જાણ માટે):</label><br />
                                                    <label>પ્રતિ,          </label>
                                                    <br />
                                                    <textarea id="Textarea1" style="width:20%;" runat="server"></textarea><br /><br />

                                                    <label>અધ્યક્ષ યુનિવર્સિટી બોર્ડ ઓફ સ્પોર્ટ્સ</label><br />
                                                    <label>નકલ રાવના જાણ માટે :-</label><br />
                                                    <label>1. કુલપતિશ્રી ના અંગત સચિવશ્રી,</label><br />
                                                    <label>2. કુલસચિવશ્રી ના અંગત સચિવશ્રી,</label><br />
                                                    <label>3. મુખ્ય હિસાબી અધિકારી,</label><br />
                                                    <label>4. આંતરિક અન્વેષણ અધિકારી (ઓડિટ)</label><br />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:LinkButton ID="LinkButton15" runat="server"></asp:LinkButton>
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender10" runat="server"
                                            PopupControlID="Panel6" TargetControlID="LinkButton15"
                                            BackgroundCssClass="modalBackground">
                                        </cc1:ModalPopupExtender>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Observer Report form<span class="m-color-red">*</span></label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ForeColor="white" BackColor="green" CssClass="btn1" ID="reportform" runat="server" Text="Observer Report Link" OnClick="formload" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label>Name the Pdf<span class="m-color-red">*</span></label><br />
                                                <asp:TextBox ID="TextBox2" placeholder="Enter Name of Pdf" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label>Choose Letter of Interest File<span class="m-color-red">*</span></label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Button CssClass="btn btn-primary" ID="btn_upload_pdf" runat="server" Text="Upload" OnClick="btn_upload_pdf_Click" />
                                        </div>
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
