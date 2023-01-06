<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Certificate.aspx.cs" Inherits="GTU_Portal.Ceritificate1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cerificate</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Latest compiled and minified CSS -->
   <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Bitter" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>--%>

    <style type="text/css">
        p, h3, h2, h4, h5, h1 {
            font-family: 'Bitter', serif;
        }

        /*input {
            border: 2px solid #2C3E50;
            padding: 10px;
            border-radius: 20px;
            text-decoration: none;
            width: 150px;
            color: inherit;
            background-color: white;
            outline: none;
        }*/

        .w3 {
            font-family: Comic Sans, Comic Sans MS, cursive;
        }

        .b {
            font-family: 'Times New Roman';
        }
    </style>
</head>
<body style="background-color: white">

    <form id="form1" runat="server">
        <div id="Certificate" runat="server" visible="true">
            <div class="container" style="padding-left: 2%; padding-right:2%; text-align: center; background-color: white; border-radius: 16px; background-image: url('ri_1.png'); background-repeat: no-repeat; background-size: cover">
                <div class="row">
                    <div style="height: 100px">
                        <br />
                        <br />
                        <img src="img/logo.png" style="padding-left: 20px" alt="GTU Logo" height="70px" width="90px">
                        <!--<div style="float: right; width: 50%">
                            <img src="GTU-Logo.PNG" style="padding-right: 20px" alt="apdo logo" height="70px" width="100px">
                        </div>-->
                    </div>
                    <h1 style="font-size: 35px; color: #227093">Gujarat Technical University</h1>
                    <h3 style="font-size: 20px; color: #227093">Certificate Of <b class="b" style="color: red; font-size: 25px">
                        <asp:Label ID="level" runat="server"></asp:Label></b>
                    </h3>
                    <i class="fa fa-certificate" style="font-size: 50px; color: green"></i>
                    <h3 class="w3" style="font-size: 20px;">This Certificate is given to</h3>
                    <h2 style="font-size: 35px; text-transform: uppercase; color: #FF3399"><span id="dname"></span>
                        <asp:Label id="Name" runat="server"></asp:Label>
                    </h2>
                    <h3 class="w3" style="font-size: 20px;">Active student of,</h3>
                    <h2 style="font-size: 30px; color: #054d9a"><span id="dage"></span>
                        <asp:Label id="studentCollegeName" runat="server"></asp:Label>
                    </h2>
                    <h3 class="w3" style="font-size: 20px;">has participated in 
                        <b class="b">
                            <asp:Label id="Game" runat="server"></asp:Label>
                        </b>competition of <b class="b">
                        <asp:Label id="Evtname" runat="server"></asp:Label>
                    </b>.</h3>
                    <h3 class="w3" style="font-size: 20px;">held at 
                        <b class="b">
                            <asp:Label id="hostclgname" runat="server"></asp:Label>
                        </b>
                    </h3>
                    <br />



                    <div style="display: inline-blok; height: 120px;">
                        <div style="float: left; width: 20%; border-width: 7%; margin-left: 10%">
                            <h4>14 Feb, 2020</h4>
                            <p style="border-bottom: 5px solid black; border: 0 0 5px 0;"></p>
                            <h4 style="text-align: center">
                                <asp:Label id="GameDate" runat="server"></asp:Label>
                            </h4>
                        </div>
                        <div style="float: right; width: 20%; border-width: 7%; margin-right: 10%">
                            <h4>Navin Sheth</h4>
                            <p style="border-bottom: 5px solid black; border: 0 0 5px 0;"></p>
                            <h4 style="text-align: center">SECRETERY</h4>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <center>
                <%--<input type="button" id="create_pdf" value="Generate PDF">--%>
                <asp:Button ID="create_pdf" runat="server" Text="Generate PDF" OnClick="create_pdf_Click"></asp:Button>
            </center>

           <%-- <script type="text/javascript">
                var rname = localStorage.getItem("name");
                var rage = localStorage.getItem("age");
                console.log("zfzfggcvhbjnkmllkjhgfdxfcvgbhnjmklghf");
                console.log(rname);
                document.getElementById('dname').innerHTML = rname;
                document.getElementById('dage').innerHTML = rage;
            </script>--%>
            <script>
               
               
            </script>
            
    <script src="js/html2canvas.js"></script>
    <%--<script type="text/javascript">
        //$('#create_pdf').on('click', function () {
        //    debugger;
        //    $('body').scrollTop(0);
        //    PrintDiv();
        //});

        function PrintDiv() {
            html2canvas(document.body, {
                onrendered: function (canvas) {
                    var img = canvas.toDataURL().replace(/^data[:]image\/(png|jpg|jpeqg)[;]base64,/i, "");
                    //alert(img);
                    //Canvas2Image.saveAsPNG(canvas); 
                    $.ajax({
                        type: "POST",
                        url: "Certificate.aspx/UploadImage",
                        data: { "imageData": name },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            alert(msg.d);
                        }
                    });

                }
            });
            function OnSuccess(response) {
                alert(response.d);
            }
        }

        $('#create_pdf').click(function () {
            html2canvas($('#img'),
                {
                    onrendered: function (canvas) {
                        var a = document.createElement('a');
                        // toDataURL defaults to png, so we need to request a jpeg, then convert for file download.
                        a.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream");
                        a.download = 'somefilename.jpg';
                        a.click();
                    }
                });
        });

    </script>--%>

        </div>
    </form>
</body>
</html>
