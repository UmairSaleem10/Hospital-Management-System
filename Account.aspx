<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="SE_Project.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
        <body>
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    background: url('images/theme1.jpg') no-repeat center center fixed;
                    background-size: cover;
                }

                .background-theme {
                    padding: 20px; /* Adjust the padding */
                }

                    .about-us-container1 p {
                        line-height: 1.5; /* Adjust line height */
                        text-align: left;
                        color: #385977; /* Paragraph text color */
                    }

                    .input-line {
                        border: none;
                        border-bottom: 1px solid #000;
                        width: 100%;
                        margin-bottom: 20px;
                        padding: 5px;
                        color:#000000;
                        Background-color:#00000000
                    }

                    .input-line:focus {
                        outline:auto;
                    }

                    .contact-us-container {
                        max-width: 500px; /* Adjust the width */
                        margin: 150%;
                        margin-top:-80px;
                        width:50%;
                        padding: 50px; /* Adjust the padding*/
                        background-color: #ffffff; /* Background color */
                        border: 1px solid #ddd;
                        padding-top:60px;
                        border:none;
                        color:#000000;
                        margin: auto;
                    }
                    .doctor-container {
                        width:100%;
                        margin: 0;
                        padding: 50px; /* Adjust the padding as needed */
                        background-color: #ffffff; /* Background color */
                        border: 1px solid #ddd;
                        margin-bottom:20px;/* Border style */
                        border:none;
                        color:#000000;
                    }
                    .image-container {
                        margin-bottom: 20px; /* space between image and text */
                    }
                    .curved-button1 {
                        display: inline-block;
                        padding: 5px 25px;
                        background-color: #215d8c; /* Button background color */
                        color: #fff;
                        border: none;
                        border-radius: 20px;
                        text-decoration: none;
                        text-align: center;
                        font-size: 20px;
                    }
                .gridView {
                    border-collapse: collapse;
                    width: 100%;
                    margin-top: 20px;
                }

                    .gridView:start{
                        border: 1px solid #ddd;
                        padding: 10px;
                        text-align: left;
                    }

                    .gridView:active{
                        background-color: #f2f2f2;
                    }

                    .gridView:after{
                        border-color: #ddd;
                        border-style: solid;
                        border-width: 1px 1px 1px 0; /* Borders on all sides except right */
                        padding: 10px;
                    }

                        .gridView:end{
                            border-width: 1px; /* Add right border for the last column */
                        }
            </style>
            <div class="background-theme">
                <img src="images/account.png"/ width="100%"; height="500" class="image-adjust above-image">

                <div class="contact-us-container">
                    <formview>
                        <h2>Add Account Details</h2>
                        <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="ID"></asp:TextBox>
                        <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Account_Name"></asp:TextBox>
                        <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Account_No"></asp:TextBox>
                        <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Bank_Name"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button2_Click" CssClass="curved-button1" />
                    </formview>
                </div>

                <div class="doctor-container">
                    <asp:Button ID="Button2" runat="server" Text="View Details" OnClick="Button1_Click" CssClass="curved-button1" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true"
                        SelectCommand="SELECT ID, Account_Name, Account_No, Bank_Name, Created_AT, Updated_AT FROM account"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID="gridView" runat="server" Visible="false" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand" OnRowDeleting="gridView_RowDeleting" DataKeyNames="ID">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                            <asp:BoundField DataField="Account_Name" HeaderText="Account_Name" SortExpression="Account_Name" />
                            <asp:BoundField DataField="Account_No" HeaderText="Account_No" SortExpression="Account_No" />
                            <asp:BoundField DataField="Bank_Name" HeaderText="Bank_Name" SortExpression="Bank_Name" />
                            <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                            <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                            <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" HeaderText="Edit" Visible="false" />
                            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" HeaderText="Delete" Visible="false" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </body>
    </html>
</asp:Content>
