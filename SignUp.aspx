<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="SE_Project.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
        <body>
        <style>
            .input-line {
                border: none;
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

            .contact-us-container {
                position: absolute;
                top: 150px; 
                right: -15%;
                transform: translateX(-50%);
                max-width: 500px;
                width: 50%;
                padding: 50px; 
                background-color: #ddd; /* Background color */
                border: 1px solid #ddd;
                border: none;
                color: #ddd;
            }
            .image-container {
                margin-bottom: 20px;
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
            body {
                margin: 0;
                padding: 0;
                background: url('images/theme1.jpg') no-repeat center center fixed;
                background-size: cover;
            }

            .background-theme {
                padding: 20px; 
            }
            .image-container {
                margin-top: 200px;
            }

            .form-control {
                margin-bottom: 8px; 
            }
            </style>

        <div class="background-theme">
            <div class="image-container" style="width: 100%; height: 350px; bottom: 400px">
                <img src="images/HealthCare.png" style="float:left; 
            margin-right:10px; width: 480px; height: 340px; bottom:350px; margin-left: 40px; text-align:center; margin-top: -40px">
                    <div class="contact-us-container">
                <formview>
                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="FirstName"></asp:TextBox>
                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="UserName"></asp:TextBox>
                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Gender" ></asp:TextBox>
                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Role"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" CssClass="curved-button1" />
                </formview>
                        </div>
            </div>
            </div>
            </body>
    </html>
</asp:Content>
