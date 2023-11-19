<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="SE_Project.Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
        <body>
            <style>
                image-adjust {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 10px;
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

                    .doctor-container h2 {
                        text-align: center;
                        color: #215d8c; 
                    }

                    .doctor-container p {
                        line-height: 1.5; 
                        text-align: left;
                        color: #030b17; 
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
                .curved-button:hover {
                        background-color: #043965; /* Color change on hover */
                }

                .gridView {
                    border-collapse: collapse;
                    width: 100%;
                    margin-top:20px;
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
                            outline: auto;
                        }
                    .doctor-container {
                        width:100%;
                        margin: 0;
                        margin-top:60px;
                        padding: 50px; /* Adjust the padding as needed */
                        background-color: #ffffff; /* Background color */
                        border: 1px solid #ddd;
                        margin-bottom:20px;/* Border style */
                        border:none;
                        color:#000000;
                        margin: auto;
                    }
                    .container{
                        width:50%;
                        margin: 100px;
                        margin-bottom: 50px;
                        margin-top: 150px;
                        padding: 50px; /* Adjust the padding as needed */
                        background-color: #ffffff; /* Background color */
                        border: 1px solid #ddd;
                        border:none;
                        color:#000000;
                        margin: auto;
                    }
                    .form{
                        margin-top: 50px;
                    }

            </style>
            <div class="background-theme">
        <img src="images/Doctors-pro.png" width="100%" height="540" class="image-adjust above-image"> 
                <div class="doctor-container" id="userContent" runat="server" visible="false">
        <h2>Our Doctors</h2>  
        <p>
            Welcome to our Health Care Hospital, where a team of dedicated and highly skilled doctors is committed 
            to providing exceptional healthcare services. Our doctors bring a wealth of experience and expertise to 
            the medical field, ensuring that patients receive the highest standard of care. From primary care 
            physicians to specialists in various fields such as cardiology, orthopedics, and pediatrics, our diverse 
            team collaborates to offer comprehensive and personalized medical solutions. We take pride in our 
            commitment to the well-being of our patients, and our doctors are at the forefront of delivering 
            compassionate and cutting-edge medical care.
            <p>
                Our team of doctors comprises individuals who are not only leaders in their respective fields but are 
                also passionate about staying at the forefront of medical advancements. Equipped with state-of-the-art
                facilities and a patient-centric approach, our doctors focus on preventive care, accurate diagnostics,
                and tailored treatment plans. We understand the importance of fostering strong doctor-patient 
                relationships, and our compassionate healthcare professionals are dedicated to ensuring that each 
                patient feels heard, supported, and well-informed throughout their medical journey.
            </p>
            <p>
                At our hospital, we believe in the power of collaboration and continuous learning. Our doctors actively
                engage in ongoing medical education and research to stay informed about the latest medical 
                breakthroughs. Whether you are seeking routine check-ups or specialized treatments, our team of doctors
                is here to provide the highest quality of care. We take pride in building a healthcare environment that
                promotes trust, transparency, and excellence. Explore the profiles of our esteemed doctors, and entrust
                your health to a team that is passionate about making a positive impact on the lives of our patients.
            </p>
        </p>
                    <asp:Button ID="Button1" runat="server" Text="View Doctors" OnClick="Button1_Click" CssClass="curved-button" />
                    <asp:GridView class="gridView" ID ="gridView" runat="server" Visible="false">
                    </asp:GridView>
    </div>

                <div class="container" id="adminContent" runat="server" visible="false">
                    <h2>Add Doctor</h2>
                <formview class="form">
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="ID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Speciality"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Email" TextMode= "Email" ></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox4" runat="server" placeholder="Address"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" CssClass="curved-button" />
                </formview>
                        </div>
                </div>
        </body>
    </html>
</asp:Content>
