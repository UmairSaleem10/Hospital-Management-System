<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SE_Project.Home" %>
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
                .curved-button {
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

            </style>

            <div class="background-theme">
            <div class="container"> 
            <div class="image-container" style="width: 106%; height: 577px; bottom: 200px">
            <h1 style="width: 1121px"> </h1> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <p></p> HealthCare</b>
            <img src="images/HealthCare.png" style="float:left; 
            margin-right:10px; width: 480px; height: 320px; bottom:200px; margin-left: 36px; text-align:center"></h1>
                <p><h4>Comprehensive Healthcare for the whole family</h4></p>
                <p class="right-align">Health care Hospital is dedicated to delivering the highest standards of 
                    healthcare, be it having the finest doctors, cutting edge technology, modern 
                    infrastructure, dedicated about healing the lives that have been entrusted to us, we ensure utmost care and 
                     we ensure utmost care and comfort. With a view to provide comprehensive medical services our Hospital has tie-ups with all
                    major Third party administrators (TPA) to provide cashless hospitalisation for the convenience of the insured patients.
                </p>
                <link rel="stylesheet" type="text/css" href="styles.css">
                <a class="curved-button" href="AboutUs.aspx">Know more</a>
          <h1 style="width: 1121px">&nbsp;</h1>
         <h1 style="width: 1121px">&nbsp;</h1>
          </div>
                </div>
                </div>
        </body>
    </html>
</asp:Content>
