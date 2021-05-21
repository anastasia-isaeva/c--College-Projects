<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx14ProductReceipt.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch14: Product Receipt</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">

            <div class="row">
                <div class="col-xs-12">

                    <asp:GridView ID="grdProducts" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" 
                        CssClass="table table-bordered table-condensed">
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID"
                                ReadOnly="True">
                                <HeaderStyle CssClass="col-sm-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="true" SortExpression="Name">
                                <HeaderStyle CssClass="col-sm-6" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="On Hand" SortExpression="OnHand">
                                <EditItemTemplate>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" CssClass="text-danger"></asp:CompareValidator>
                                    <asp:TextBox ID="EditItemTextBox" runat="server" CssClass="form-control" Text='<%# Bind("OnHand") %>' Height="114px" Width="272px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("OnHand") %>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="col-sm-2 text-right" />
                                <ItemStyle CssClass="text-right" />
                            </asp:TemplateField>

                            <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Edit" />

                        </Columns>
                        <HeaderStyle CssClass="bg-halloween" />
                        <AlternatingRowStyle CssClass="altRow" />
                        <EditRowStyle CssClass="warning" />
                        <PagerStyle CssClass="bg-halloween" HorizontalAlign="Center" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                        SelectCommand="SELECT ProductID, Name, OnHand FROM Products" 
                        UpdateCommand="UPDATE Products SET OnHand = @OnHand WHERE (ProductID = @ProductID)">

                        <UpdateParameters>
                            <asp:Parameter Name="OnHand" />
                            <asp:Parameter Name="ProductID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>    
                </div>  
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <p><asp:Label ID="lblError" runat="server"  
                        CssClass="text-danger" EnableViewState="false"></asp:Label></p>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" CssClass="text-danger" />
                </div>
            </div>
        </form>
    </main>
</div>
</body>
</html>