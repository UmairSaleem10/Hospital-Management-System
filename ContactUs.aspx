<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SE_Project.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!DOCTYPE html>
    <html>
        <body>
            <style>
                .image-adjust {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 20px;
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

                .heading {
                    text-align:center;
                    color:#0d3566;
                    margin-bottom: 20px;
                }
                .row {
                    display: flex;
                    justify-content: space-between;
                    margin-top:40px;
                }

                .container {
                    width: 25%;
                    height: 50%;
                    border: 1px solid #ccc;
                    padding: 20px;
                    text-align: center;
                    background-color: #ffffff;
                }
                    .container h4 {
                        text-align: center;
                        color: #000000; /* Heading text color */
                    }
                .above-image {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 20px; /* Adjust the margin to add space between the image and container */
                }
                .above-container {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 10px; /* Adjust the margin to add space between the image and container */
                }
            </style>
            <div class="background-theme">
        <img src="images/contact.jpg"/ width="100%" class="image-adjust above-image"> 
                <div class="heading above-container">
                <h2>
                    Get In Touch
                </h2>
                    <div class="row">
                        <div class="container">
                            <h4>Email Us</h4>
                            <p>
                                HealthCareHospital@gmail.com
                            </p>
                        </div>
                        <div class="container">
                            <h4>
                                Emergency & Ambulance
                            </h4>
                            <p>
                                +92 31278905631
                            </p>
                        </div>
                        <div class="container">
                            <h4>
                                Call Us
                            </h4>
                            <p>
                                +92 31278905631
                            </p>
                        </div>
                    </div>
                    </div>

                <style>
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
                        max-width: 500px; /* Adjust the width as needed */
                        margin: 50%;
                        margin-top:90px;
                        width:50%;
                        padding: 50px; /* Adjust the padding as needed */
                        background-color: #ffffff; /* Background color */
                        border: 1px solid #ddd;
                        margin-bottom:20px;/* Border style */
                        border:none;
                        color:#000000;
                    }
                    .image-container {
                        margin-bottom: 20px; /* Adjust the margin as needed to create space between image and text */
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

                    <div class="image-container" style="width: 100%; height: 577px; bottom: 200px">
                    <img src="images/map.jpg" style="float:left; 
            margin-right:10px; width: 480px; height: 320px; bottom:200px; margin-left: 40px; text-align:center">
                        <div class="contact-us-container">
                <formview>
                    <input type="text" id="fullName" name="fullName" class="input-line" placeholder="Full Name" required>
                    <input type="text" id="Email" name="Email" class="input-line" placeholder="Email" required>
                    <input type="text" id="PhoneNumber" name="PhoneNumber" class="input-line" placeholder="Phone Number" required>
                    <input type="text" id="Message" name="Message" class="input-line" placeholder="Message" required>
                    <button class="curved-button1" type="submit">Contact Us</button>
                </formview>
                        </div>
                    </div>

                <style>
                    .App-container {
                        width: 100%;
                        height: 60%;
                        margin-top: -140px;
                        border: 1px solid #ccc;
                        padding: 40px;
                        text-align: center;
                        background-color: #215d8c;
                    }
                    .headingh3{
                        color: #ffffff
                    }
                    .curved-button {
                        display: inline-block;
                        padding: 5px 25px;
                        background-color: #ffffff; /* Button background color */
                        color: #121e27;
                        border: none;
                        border-radius: 20px;
                        text-decoration: none;
                        text-align: center;
                        font-size: 20px;
                    }
                    .text-heading{
                        color: #001e3a
                    }
                    .paragraph{
                        color:#215d8c
                    }
                    .address-container {
                        max-width: 500px; /* Adjust the width as needed */
                        margin: 50%;
                        margin-top:70px;
                        width:50%;
                        padding: 50px; /* Adjust the padding as needed */
                        background-color: #f9f9f9; /* Background color */
                        border: 1px solid #ddd;
                        margin-bottom:20px;/* Border style */
                        border:none;
                    }
                </style>

                <div class="App-container">
                    <h3 class="headingh3">
                        Book An Appointment Online
                    </h3>
                    <link rel="stylesheet" type="text/css" href="styles.css">
                <a class="curved-button" href="Appointment.aspx">Book an Appointment</a>
                </div>

                <div class="image-container" style="width: 100%; height: 450px; bottom: 400px; margin-top:70px">
                    <img src="images/HealthCare.png" style="float:left; margin-bottom:50px; 
            margin-right:10px; width: 480px; height: 350px; bottom:200px; margin-left: 40px; text-align:center">
                    <div class="address-container">
                        <a href="Home.aspx">
                            <h4 class="text-heading"> Health Care Hospital</h4>
                        </a>
                        <p>
                            Shalimar Link Road, Shalimar Larechs Colony, Lahore, Punjab 54000, Pakistan
                        </p>
                        <div class="row">
                            <div>
                                <h5>Helpline</h5>
                                <p class="paragraph">+92 31278905631</p>
                            </div>
                            <div>
                                <h5>Email Us</h5>
                                <p class="paragraph"> HealthCareHospital@gmail.com </p>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </body>
    </html>
</asp:Content>
