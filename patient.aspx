<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="patient.aspx.cs" Inherits="SE_Project.patient" %>
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
                    padding: 20px; 
                }
                .about-us-container1 p {
                    line-height: 1.5; /* Adjust line height */
                    text-align: left;
                    color: #385977; /* Paragraph text color */
                }
                .contact-us-container {
                    max-width: 500px; /* Adjust the width */
                    margin: 150%;
                    margin-top: -80px;
                    width: 50%;
                    padding: 50px; /* Adjust the padding*/
                    background-color: #ffffff; /* Background color */
                    border: 1px solid #ddd;
                    padding-top: 60px;
                    border: none;
                    color: #000000;
                    margin: auto;
                }

                    .input-line {
                        border: solid;
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
            </style>
            <div class="background-theme">
                <img src="images/patient.jpg"/ width="100%"; height="500" class="image-adjust above-image"> 
                    <div class="contact-us-container">
                <formview>
                    <h2>Add Patient Data</h2>
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="PatientID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Disease"></asp:TextBox>
                    <label for="ddlDoctors">D_Name:</label>
                        <asp:DropDownList ID="ddlDoctors" runat="server" CssClass="input-line">
                        </asp:DropDownList>
                    <label for="ddlGender">Gender:</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="input-line">
                            <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        </asp:DropDownList>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Address"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" CssClass="curved-button1" />
                </formview>
                </div>
            </div>
        </body>
    </html>
</asp:Content>
