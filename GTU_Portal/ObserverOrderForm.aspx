<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ObserverOrderForm.aspx.cs" Inherits="GTU_Portal.pratrak1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">      
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .txt {
            outline: none;
            border: none;
            border-bottom: 1px solid black;
        }

        .btn1 {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.5);
            border-color:white;
            padding: 12px 28px;
        }

        .btn1:hover {
          background-color: black;
          color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <%--Observer report--%>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>Observer Report</h1>
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
                                            <div class="uk-width-medium-1-1" id="Print" runat="server" style="margin-left:5%">
                                                <div id="header" runat="server" visible="true" style="text-align:center; ">
                                                    <asp:Image ID="Image1" ImageUrl="~/img/bgs.png" runat="server" Width="100%" Height="200" />
                                                    <h3>ગુજરાત ટેકનોલોજીકલ યુનિવર્સિટી</h3>
                                                    <h3><b>ઓબ્સર્વેર રિપોર્ટ</b></h3>
                                                    <hr />
                                                </div>

                                                <div id="observerdetail" runat="server">
                                                    <label>1. ઓબ્સર્વેરનું નામ: </label>&nbsp;&nbsp;&nbsp;&nbsp;                                                    
                                                    <b><asp:TextBox ID="observername" CssClass="txt" runat="server"></asp:TextBox><br /></b><br />

                                                    <label>2. ઓબ્સર્વેરની સંસ્થા: </label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="oservercompany" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>3. ઓબ્સર્વેરનો હોદ્દો: </label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="observerpost" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>4. ઓબ્સર્વેર મોબાઈલ નંબર: </label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="observermobile" CssClass="txt" runat="server"></asp:TextBox><br /><br />
                                                </div>

                                                <div id="event" style="text-align:center" runat="server">
                                                    <label>Sports:</label><b>
                                                    <asp:Label ID="eventname" runat="server" BackColor="#ffff00" Text="EventName here"></asp:Label></b>
                                                </div>

                                                <div id="details" runat="server">
                                                    <label>1. સંસ્થાનું નામ:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <b><asp:TextBox ID="collegename" CssClass="txt" runat="server"></asp:TextBox></b><br /><br />

                                                    <label>2. સંચાલકનું નામ (ઓર્ગનાઈઝીંગ સેક્રેટરી):</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="collegemanagername" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>3. સ્પર્ધાનું નામ:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="gamename" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>4. કુલ કેટલી કોલેજ અને સ્ટુડેંટ્સે ભાગ લીધો તેની સંખ્યા:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="totalstudents" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>5. ગ્રાઉન્ડ બાબતે મંતવ્ય:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>A. ગ્રાઉન્ડ સ્પર્ધા મુજબ / લાયક છે કે નહિ (હા કે ના):</label><asp:TextBox ID="firsthakena" CssClass="txt" runat="server"></asp:TextBox>                                         
                                                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label>B. સ્પધા ને અનુરૂપ છે કે નહિ (હા કે ના):</label><asp:TextBox ID="secondhakena" CssClass="txt" runat="server"></asp:TextBox>
                                                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label>C. પ્રેકટીસ અનુરૂપ છે કે નહિ (હા કે ના):</label><asp:TextBox ID="thirdhakena" CssClass="txt" runat="server"></asp:TextBox>
                                                    <br /><br />

                                                    <label>6. સેલેક્ટર / એક્સપર્ટ ની વિગત:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="expertdetails" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>7. બેનર લગાવેલા છે કે નહિ:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="bannerdetail" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>8. સંસ્થા દ્વારા નાસ્તા/પાણી ની વ્યવસ્થા:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="fooddetail" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>9. આયોજક તરફથી કરવા માં આવેલા વધારા ની વ્યવસ્થા વિગતો:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="extrafacility" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>10. મંડપ/ માઈક / સાઉન્ડ સિસ્ટમ/ હોલની વ્યવસ્થા વિગતો (પ્રોગ્રામ ને અનુરૂપ):</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="TextBox9" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>11. ઇવેન્ટ ને લગતા સાધન વ્યવસ્થા (વિગત):</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="mikedetails" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>12. આયોજક તરફથી મેહમાનને આમંત્રિત કરેલ હોય તો તેની માહિતી:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="guestdetails" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label>13. ઓબ્સર્વેરના અન્ય સૂચનો:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <textarea id="extrasuggestions" cols="60" rows="10" runat="server"></textarea><br /><br />

                                                </div>

                                                <div id="footer" runat="server">
                                                    <label>તારીખ:</label><asp:TextBox ID="dte" CssClass="txt" runat="server"></asp:TextBox><br /><br />

                                                    <label style="text-align:left">સ્થળ:</label><asp:TextBox ID="place" CssClass="txt" runat="server"></asp:TextBox>
                                                    <label style="text-align:right">ઓબ્સર્વેરની સહી:</label><asp:TextBox ID="sign" CssClass="txt" runat="server"></asp:TextBox>
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
                                                <label>Name the Game<span class="m-color-red">*</span></label><br />
                                                <asp:TextBox ID="TextBox2" placeholder="Name of game for which sending this report" runat="server" />
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