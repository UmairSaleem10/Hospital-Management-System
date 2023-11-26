<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-worker.aspx.cs" Inherits="SE_Project.edit_worker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
        <body>
            <style>
                .input-line {
                    border: solid;
                    border-bottom: 1px solid #000;
                    width: 100%;
                    margin-bottom: 20px;
                    padding: 5px;
                    color: #000000;
                    Background-color: #00000000
                }
                        .input-line:focus {
                            outline: auto;
                        }

                .container {
                    width: 50%;
                    margin: 100px;
                    margin-top: 350px;
                    padding: 100px; /* Adjust the padding as needed */
                    background-color: #ffffff; /* Background color */
                    border: 1px solid #ddd;
                    border: none;
                    color: #000000;
                    margin: auto;
                }

                body {
                    margin: 0;
                    padding: 0;
                    background: url('images/theme1.jpg') no-repeat center center fixed;
                    background-size: cover;
                }

                .background-theme {
                    padding: 20px; /* Adjust the padding */
                }
                .above-image {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 40px; /* Space b/w image and container */
                }
                .curved-button {
                    padding: 5px 25px;
                    background-color: #215d8c; /* Button background color */
                    color: #fff; 
                    border: none;
                    border-radius: 20px; 
                    text-decoration: none;
                    text-align: center;
                    font-size: 20px;
                }
            </style>
            <div class="background-theme">
                <div class="container" id="adminContent" runat="server">
                    <h2>Edit Details</h2>
                <formview class="form">
                    <label for="TextBox0" class="">ID:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="ID"></asp:TextBox>
                    <label for="TextBox1">Name:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                    <label for="ddlworker">Role:</label>
                        <asp:DropDownList ID="ddlworker" runat="server" CssClass="input-line">
                            <asp:ListItem Text="Technicians" Value="Technicians" />
                            <asp:ListItem Text="Security Guard" Value="Security Guard" />
                            <asp:ListItem Text="Maintenance Staff" Value="Maintenance Staff" />
                            <asp:ListItem Text="Care taker" Value="Care taker" />
                        </asp:DropDownList>
                    <label for="TextBox3">Address:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Address"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Edit" onclick="btnEdit_Click" CssClass="curved-button" />
                </formview>
                        </div>
                </div>
        </body>
    </html>
</asp:Content>
