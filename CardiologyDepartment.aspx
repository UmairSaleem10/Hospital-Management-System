<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CardiologyDepartment.aspx.cs" Inherits="SE_Project.CardiologyDepartment" %>
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

                .image-adjust {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 50px;
                    height: 550px;
                }

                .h1 {
                    text-align: center;
                    margin-top: -30px;
                    color: #063963;
                }

                .container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    text-decoration-color: #215d8c;
                    background-color: #fff;
                    margin-top: 80px;
                    margin-bottom: 70px;
                    width: 180%;
                    height: 450px;
                }

                .right-align {
                    text-align: left;
                }

                .image-container {
                    margin-bottom: 20px; /* space between image and text */
                }

                .disease-container {
                    display: flex;
                    justify-content: space-around;
                    flex-wrap: wrap;
                }

                .disease-box {
                    width: 250px;
                    margin: 20px;
                    text-align: start;
                    background-color: #15466b;
                    padding: 15px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    margin-bottom: 20px;
                    margin-top: -20px;
                    color: #fff;
                }

                .disease-box2 {
                    width: 250px;
                    margin: 20px;
                    text-align: start;
                    background-color: #6b6868;
                    padding: 15px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    margin-bottom: 20px;
                    margin-top: -20px;
                    color: #fff;
                }

                .disease-box h3 {
                    color: #fff;
                    text-align: center;
                }

                .disease-box p {
                    color: #fff;
                }

                .fa-angle-double-right:before {
                    content: "\f101";
                    color: #215d8c;
                }

                .mt-2, .my-2 {
                    margin-top: 0.5rem !important;
                    color: #215d8c;
                }

                .container {
                    width: 100%;
                    padding-right: 15px;
                    padding-left: 15px;
                    text-align: left;
                }

                .h2 {
                    margin-top: 20px;
                }

                .p {
                    text-align: center;
                    color: #293b48;
                }

                .emergency-container {
                    width: 100%;
                    height: 30%;
                    margin-top: -40px;
                    border: 1px solid #ccc;
                    padding: 40px;
                    text-align: center;
                    background-color: #6b6868;
                }

                .headingh3 {
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

                .p1 {
                    color: #fff;
                }
            </style>
            <div class="background-theme">
                <img src="images/cardiology.jpg"/ width="100%" class="image-adjust above-image">
                <div class="container">
                    <div class="image-container" style="width: 106%; height: 577px; bottom: 200px">
                        <h1 style="width: 1121px"></h1>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <p></p>
                HealthCare</b>
                <img src="images/heartbeat.png" style="float: left; margin-right: 10px; width: 480px; height: 320px; bottom: 200px; margin-left: 36px; text-align: center"></h1>
                        <p>
                            <h4>Your Heart Deserves Best Services</h4>
                        </p>
                        <p class="right-align">
                            Cardiovascular Treatment comprises treating the structure, functional problem, disorders, 
                    diseases of the heart, blood and vascular system. Healthcare Hospital is one of Best leading Heart 
                    Hospitals.
                    <p class="right-align">
                        Our heart care center is equipped with state of the art infrastructure with a fleet of highly
                        experienced doctors and surgeons who are ready at all times for emergent cases that need 
                        utmost critical care. Our Cardiac Care is awarded and celebrated across the medical community 
                        in the country.
                    </p>
                        </p>
                    </div>
                </div>
                <div class="disease-container">
                    <div class="disease-box">
                        <h4>Clinical & Preventive Cardiology</h4>
                        <p>
                            Doctors are capable of handling all heart related emergencies 
            and identifying people with high risk of cardiac diseases especially diabetics, people with high 
            cholesterol and hypertension.
                        </p>
                    </div>
                    <div class="disease-box2">
                        <h4>Interventional Cardiac Surgery</h4>
                        <p>
                            It is a branch of cardiovascular surgical subspecialties wherein a cardiac surgeon performs surgery 
            on the heart and its surrounding vessels.
                        </p>
                    </div>
                    <div class="disease-box2">
                        <h4>Cardiothoracic Vascular Surgery</h4>
                        <p>
                            This subspecialty specializes in surgery of the heart, lungs, thorax, chest, esophagus and major 
            blood vessels of the body.
                        </p>
                    </div>
                    <div class="disease-box">
                        <h4>Pediatric Cardiac Surgery</h4>
                        <p>
                            Pediatric Cardiac Surgery Program offers a specialized approach providing excellent care through surgery 
            for children with congenital and acquired heart conditions, defects, diseases and disorders.
                        </p>
                    </div>
                </div>
                <div>
                    <div class="container">
                        <h2 class="h2">Facilities and Technologies</h2>
                        <p class="p">
                            The cardiology department in our hospital is equipped with state-of-the-art facilities 
                            and cutting-edge technology to provide comprehensive and specialized care for heart-related
                            conditions. Our commitment to ensuring the well-being of our patients is reflected in the 
                            range of services and amenities available within the cardiology department.
                        </p>
                        <ul class="mt-2">
                            <li><i class="fas fa-angle-double-right mr-1"></i>Heart Lung Machine</li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>Heater-Cooler Machine</li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>IABP Machine</li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>Anesthesia </li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>Surgical Table </li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>Ventilator Machine </li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>Patient Monitor System </li>
                            <li><i class="fas fa-angle-double-right mr-1"></i>Defibrillator</li>
                        </ul>

                    </div>
                </div>
                <div class="emergency-container">
                    <h2 class="headingh3">Emergencies In Department
                    </h2>
                    <p class="p1">
                        Our hospital has an Ultra modern 24x7 Cath Lab, Specialized Cardiac Operation Theaters, and 
                        several other Heart Care technologies to the patient’s disposal at all times. Additionally, 
                        Crash Cart Trolleys are placed strategically all around HealthCare Hospital with 
                        Monitor/defibrillators, suction devices, and bag valve masks (BVMs) of different sizes and 
                        Advanced cardiac life support (ACLS) drugs at all times for Emergency Cases of Cardiac Arrest.
                    </p>
                    <link rel="stylesheet" type="text/css" href="styles.css">
                    <a class="curved-button" href="Appointment.aspx">Book an Appointment</a>
                </div>
            </div>
        </body>
    </html>
</asp:Content>
