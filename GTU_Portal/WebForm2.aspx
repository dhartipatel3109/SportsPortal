<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="GTU_Portal.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView6_RowCommand" OnRowDeleting="GridView6_RowDeleting" OnRowEditing="GridView6_RowEditing" CellSpacing="1" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Edit">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button1" CommandArgument='<%#Eval("id") %>' CommandName="edit" runat="server" Text="Edit" />
                                                                  <asp:Button ID="Button2" CommandArgument='<%#Eval("id") %>' CommandName="delete" runat="server" Text="Edit" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                      
                                                        <asp:BoundField DataField="id" HeaderText="id" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="mid" />
                                                        <asp:TemplateField HeaderText="Header Image">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Image/edit.png" CommandArgument='<%#Eval("id") %>'/>
                                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Image/edit.png" CommandArgument='<%#Eval("id") %>'/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                      
                                                    </Columns>

                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />

                                                </asp:GridView>
    </div>
    </form>
</body>
</html>
