<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="med-edit.aspx.cs" Inherits="SE_Project.med_edit" %>
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
                    <h2>Edit Doctor</h2>
                <formview class="form">
                    <label for="TextBox0" class="">MedicineID:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="MedicineID"></asp:TextBox>
                    <label for="TextBox1">PatientID:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="PatientID"></asp:TextBox>
                    <label for="TextBox2">Medicine_Name:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Medicine_Name"></asp:TextBox>
                    <label for="TextBox3">Description:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Description"></asp:TextBox>
                    <label for="TextBox4">Price:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox4" runat="server" placeholder="Price"></asp:TextBox>
                    <label for="TextBox5">Stock:</label>
                    <asp:TextBox CssClass="input-line" ID="TextBox5" runat="server" placeholder="Stock"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Edit" onclick="btnEdit_Click" CssClass="curved-button" />
                </formview>
                        </div>
                </div>
        </body>
    </html>
</asp:Content>
