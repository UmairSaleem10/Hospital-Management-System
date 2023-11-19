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
                    background-color:#fff;
                    margin-top: 80px;
                    margin-bottom: 70px;
                    width:150%;
                    height: 480px;
                }
                .image-container {
                    margin-bottom: 20px; /* space between image and text */
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
                    padding: 20px; 
                }

                .department-container {
                    display: flex;
                    justify-content: space-around;
                    flex-wrap: wrap;
                }

                .department-box {
                    width: 300px;
                    margin: 20px;
                    text-align: center;
                    background-color: #fff; 
                    padding: 20px;
                    border-radius: 20px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                .department-box img {
                    width: 100%;
                    height: auto;
                    border-radius: 5px;
                    margin-bottom: 10px;
                }

                .department-box h3 {
                    color: #215d8c;
                }

                .department-box p {
                    color: #333; 
                }

                .department-box .curved-button {
                    display: inline-block;
                    padding: 5px 15px;
                    background-color: #215d8c;
                    color: #fff;
                    border: none;
                    border-radius: 20px;
                    text-decoration: none;
                    font-size: 14px;
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

                <div class="department-container">
    <div class="department-box">
        <h3>Cardiology Department</h3>
        <p>Explore our cardiology services and meet our expert cardiologists.</p>
        <a class="curved-button" href="CardiologyDepartment.aspx">Learn More</a>
    </div>

    <div class="department-box">
        <h3>Eye care Department</h3>
        <p>Discover our eye care services and meet our skilled ophthalmologists.</p>
        <a class="curved-button" href="EyeDepartment.aspx">Learn More</a>
    </div>

    <div class="department-box">
        <h3>Neurology Department</h3>
        <p>Learn about our neurology services and meet our experienced neurologists.</p>
        <a class="curved-button" href="NeurologyDepartment.aspx">Learn More</a>
    </div>

                    <div class="department-box">
        <h3>Surgery Department</h3>
        <p>Explore our advanced brain care services and meet our dedicated neurosurgeons.</p>
        <a class="curved-button" href="BrainDepartment.aspx">Learn More</a>
    </div>

                    <div class="department-box">
        <h3>Physiotherapy Department</h3>
        <p>Explore our advanced brain care services and meet our dedicated neurosurgeons.</p>
        <a class="curved-button" href="BrainDepartment.aspx">Learn More</a>
    </div>
                    <div class="department-box">
        <h3>Radiology Department</h3>
        <p>Explore our advanced brain care services and meet our dedicated neurosurgeons.</p>
        <a class="curved-button" href="BrainDepartment.aspx">Learn More</a>
    </div>
</div>
                
                <style>
                    .about-us-container1 {
                    /*margin-bottom:50px;*/
                    max-width: 1200px; /* Adjust the width as needed */
                    margin: 0 auto;
                    padding: 50px; /* Adjust the padding as needed */
                    background-color: #ddd; /* Background color */
                    border: 1px solid #ddd; /* Border style */
                }

                    .about-us-container1 h2 {
                        text-align: center;
                        color: #215d8c; /* Heading text color */
                    }

                    .about-us-container1 p {
                        /*margin-top:20px;*/
                        line-height: 1.5; /* Adjust line height as needed */
                        text-align: left;
                        color: #385977; /* Paragraph text color */
                        /*margin-top: 60px;*/
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
                        max-width: 500px; /* Adjust the width as needed */
                        margin: 50%;
                        margin-top:60px;
                        width:50%;
                        padding: 50px; /* Adjust the padding as needed */
                        background-color: #ffffff; /* Background color */
                        border: 1px solid #ddd;
                        margin-bottom:20px;/* Border style */
                        border:none;
                        color:#000000;
                        margin: auto;
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

                <div class="about-us-container1">
                    <h2>Quick Entry</h2>
                    <div class="contact-us-container">
                <formview>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Email" TextMode= "Email" ></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Phone Number" TextMode="Number"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox4" runat="server" placeholder="Message"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" CssClass="curved-button1" />
                </formview>
                        </div>
                </div>
                </div>
        </body>
    </html>
</asp:Content>
