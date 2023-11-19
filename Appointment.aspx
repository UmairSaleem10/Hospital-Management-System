<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="SE_Project.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
        <body>
            <style>
                .image-adjust {
                  margin-bottom: 50px; 
                }
                .container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    text-decoration-color: #215d8c;
                }
                .image-container {
                    margin-bottom: 20px; /* Adjust the margin as needed to create space between image and text */
                }
                .right-align {
                    text-align: left;
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
                .curved-button:hover {
                        background-color: #043965; /* Color change on hover */
                }
                body {
                    margin: 0;
                    padding: 0;
                    background: url('images/theme1.jpg') no-repeat center center fixed;
                    background-size: cover;
                }

                .background-theme {
                    padding: 20px; /* Adjust the padding as needed */
                }
                .app-container {
                    max-width: 500px; /* Adjust the width as needed */
                    margin: 50%;
                    width: 50%;
                    margin-top: -380px;
                    padding: 50px;
                    background-color: #ffffff;
                    border: 1px solid #ddd;
                    margin-bottom: 50px; /* Border style */
                    border: none;
                    color: #000000;
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
                .input-dec{
                    margin:0px;
                    margin-bottom:10px;
                }

            </style>

            <div class="background-theme">
            <div class="container"> 
            <div class="image-container" style="width: 106%; height: 577px; bottom: 200px">
            <h1 style="width: 1121px;"> </h1> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <p></p> Book an Appointment</b>
                <p><h4>Comprehensive Healthcare for the whole family</h4></p>
          </div>
                </div>
                <img src="images/doct.jpg" style="float:left; 
            margin-right:10px; width: 500px; height: 400px; bottom:230px; margin-left: 36px; text-align:center; margin-top: -360px"></h1>

                <div class="app-container">
                    <formview>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                    <label for="ddlDoctors">Dr_Name:</label>
                        <asp:DropDownList ID="ddlDoctors" runat="server" CssClass="input-line">
                        </asp:DropDownList>
                        <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Disease"></asp:TextBox>
                        <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Gender"></asp:TextBox>
                        <asp:TextBox CssClass="input-line" ID="TextBox4" runat="server" placeholder="Time" TextMode="DateTime"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="curved-button1" />
                </formview>
                </div>
                </div>
        </body>
    </html>
</asp:Content>
