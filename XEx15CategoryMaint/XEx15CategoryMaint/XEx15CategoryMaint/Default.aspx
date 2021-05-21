<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx15CategoryMaint.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch15: Category Maintenance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main class="row">

        <form id="form1" runat="server" class="form-horizontal">

            <div class="col-xs-12 table-responsive">
                <h1>Category Maintenance</h1>
                <asp:GridView ID="grdCategories" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="CategoryID"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdCategories_PreRender" 
                    OnRowDeleted="grdCategories_RowDeleted" 
                    OnRowUpdated="grdCategories_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                            ReadOnly="True" SortExpression="CategoryID">
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortName" HeaderText="ShortName" SortExpression="ShortName" />
                        <asp:BoundField DataField="LongName" HeaderText="LongName" SortExpression="LongName" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [CategoryID], [ShortName], [LongName] 
                        FROM [Categories]"
                    DeleteCommand="DELETE FROM [Categories] 
                        WHERE [CategoryID] = @original_CategoryID 
                          AND [ShortName] = @original_ShortName 
                          AND [LongName] = @original_LongName" 
                    InsertCommand="INSERT INTO [Categories] 
                        ([CategoryID], [ShortName], [LongName]) 
                        VALUES (@CategoryID, @ShortName, @LongName)" 
                    UpdateCommand="UPDATE [Categories] 
                          SET [ShortName] = @ShortName, 
                              [LongName] = @LongName 
                        WHERE [CategoryID] = @original_CategoryID 
                          AND [ShortName] = @original_ShortName 
                          AND [LongName] = @original_LongName">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>  
                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />  
            </div>

            <div class="col-xs-9">
               
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                 <asp:DetailsView ID="DetailsView1" runat="server"
                        AutoGenerateRows="False" DataKeyNames="CategoryID"
                        DataSourceID="SqlDataSource1" CssClass="table table-bordered table-condensed" OnItemInserted="DetailsView1_ItemInserted1" >
                     <HeaderTemplate>
                          <p>To create a new category, enter the information and click Add New Category</p>
                     </HeaderTemplate>
                     <HeaderStyle CssClass="bg-halloween" />
                        <Fields>
                            <asp:TemplateField HeaderText="ID" SortExpression="CategoryID">
                                <InsertItemTemplate>
                                    <div class="col-xs-6">
                                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Text='<%# Bind("CategoryID") %>'></asp:TextBox>
                                     </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtID" ValidationGroup="Insert">*</asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short Name" SortExpression="ShortName">
                                <InsertItemTemplate>
                                    <div class="col-xs-6">
                                        <asp:TextBox ID="txtShortName" runat="server" CssClass="form-control" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Insert" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtShortName">*</asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Long Name" SortExpression="LongName">
                                <InsertItemTemplate>
                                   <div class="col-xs-11">
                                       <asp:TextBox ID="txtLongName" runat="server" CssClass="form-control" Text='<%# Bind("LongName") %>'></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Insert" ErrorMessage="RequiredFieldValidator"
                                           ControlToValidate="txtLongName">*</asp:RequiredFieldValidator>
                                   </div>
                                 </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" CausesValidation="True" 
                            ValidationGroup="Insert"/>
                        </Fields>
                    </asp:DetailsView>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Insert" CssClass="text-danger" />
            </div>  
        </form>
    </main>
</div>
</body>
</html>