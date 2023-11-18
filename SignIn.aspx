<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SE_Project.SignIn" %>
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
                    padding: 20px; /* Adjust the padding as needed */
                }
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

                .signIn-container {
                    position: absolute;
                    top: 150px; /* Adjust the top position as needed */
                    right: 9%;
                    transform: translateX(-50%);
                    max-width: 500px; /* Adjust the width as needed */
                    width: 50%;
                    padding: 50px; /* Adjust the padding as needed */
                    background-color: #fff; /* Background color */
                    border: 1px solid #ddd;
                    border: none;
                    color: #ddd;
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
                .h3{
                    color: #000;
                    text-align: center;
                }
                .h4{
                    color: #fff
                }
                .forgot-password-link {
                    color: #215d8c; /* Blue color */
                    text-decoration: underline;
                    cursor: pointer;
                    text-align: right;
                }

            </style>
            <div class="background-theme">
                <div class="signIn-container">
                    <img src="images/HealthCare.png" style="float:left; 
            margin-right:200px; width: 300px; height: 200px; bottom:400px; margin-left: 40px; text-align:center; margin-top: -20px">
                    <h3 class="h3">Health Care Hospital</h3>
                    <h4 class="h4">management</h4>
                <formview>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password" ></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Role"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" CssClass="curved-button1" />
                    <div class="forgot-password-link" onclick="location.href='ForgotPassword.aspx'">Forgot Password?</div>
                </formview>
                        </div>
                </div>
        </body>
    </html>
</asp:Content>
