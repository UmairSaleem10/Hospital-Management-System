<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EyeDepartment.aspx.cs" Inherits="SE_Project.EyeDepartment" %>

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

            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                text-decoration-color: #215d8c;
                background-color: #fff;
                margin-top: 80px;
                margin-bottom: 70px;
                width: 100%;
                height: 430px;
            }

            .container2 {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                text-decoration-color: #215d8c;
                background-color: #e1dddd;
                margin-top: 80px;
                margin-bottom: 70px;
                width: 100%;
                height: 800px;
            }

            .image-container {
                margin-bottom: 20px; /* space between image and text */
            }

            .right-align {
                text-align: left;
                padding-right: 14px;
            }

            .h1 {
                margin-top: 20px;
            }

            .h4 {
                text-align: initial;
                color: #215d8c;
            }

            .p {
                text-align: center;
                color: #000000;
                padding-left: 20px;
                padding-right: 20px;
            }

            .fa-angle-double-right:before {
                content: "\f101";
                color: #215d8c;
            }

            .mt-2, .my-2 {
                margin-top: 0.5rem !important;
                color: #215d8c;
            }
            .emergency-container {
                width: 100%;
                height: 30%;
                margin-top: -40px;
                border: 1px solid #ccc;
                padding: 40px;
                text-align: center;
                background-color: #215d8c;
            }
            .headingh3 {
                color: #fff
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
            <div class="container">
                <div class="image-container" style="width: 106%; height: 577px; bottom: 200px">
                    <h1 style="width: 1121px"></h1>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h1><b>HealthCare</b>
                <img src="images/eye.jpg" style="float: left; margin-right: 10px; width: 480px; height: 320px; bottom: 200px; margin-left: 36px; text-align: center"></h1>
                    <p>
                        <h3>Your Eye Care Center</h3>
                    </p>
                    <p class="right-align">
                        We’ve taken an oath to protect the sight of lives around us and empower them by setting 
                            the standards and quality of the treatment we offer. We innovate to advance our profession 
                            and to ensure the delivery of the highest-quality eye care. Pursuing the highest standards 
                            of contemporary eye care needs, we educate our patients about how important it is to 
                            maintain eye health and empower them to preserve healthy vision. We guide our patients 
                            about the most reliable and medically accurate information about eye diseases, conditions, 
                            and injuries. We Continuously Strive To Present To Our Patients The Newest Pain Free 
                            Eye Care. Our Expertise Provides The Best Diagnostic & Treatment Services For Eye Patients 
                            Regarding Diagnosis,Treatment And Surgery. 
                    </p>
                </div>
            </div>
            <div class="container2">
                <h1 class="h1">Eye Care Center</h1>
                <h4 class="h4">About Us
                </h4>
                <p class="p">
                    Welcome to our Eye Care Department, where we are dedicated to preserving and improving the 
                        vision of our community. Our state-of-the-art facilities are designed to provide comprehensive 
                        eye care services, ranging from routine eye examinations to advanced surgical procedures. Our 
                        team of experienced ophthalmologists, optometrists, and support staff is committed to 
                        delivering personalized and compassionate care to meet the unique needs of each patient.
                </p>
                <h4 class="h4">Why Choose Us?
                </h4>
                <p class="p">
                    Choosing our Eye Care Department means choosing excellence in vision care. 
                        Our commitment to quality is evident in the cutting-edge technology we employ, our team of 
                        skilled and compassionate professionals, and our patient-centered approach. We prioritize your 
                        eye health and aim to create a comfortable and supportive environment for all our patients. 
                        Whether you need a routine eye check-up or specialized treatment, we are here to deliver 
                        top-notch care with a focus on your well-being.
                </p>
                <h3 class="h4">Types of Eye Infection
                </h3>
                <p class="p">Here are the some most common Eye Infection types</p>
                <ul class="mt-2 right-align">
                    <li><i class="fas fa-angle-double-right mr-1"></i>Conjunctivitis.</li>
                    <li><i class="fas fa-angle-double-right mr-1"></i>Keratitis</li>
                    <li><i class="fas fa-angle-double-right mr-1"></i>Endophthalmitis</li>
                    <li><i class="fas fa-angle-double-right mr-1"></i>Cellulitis </li>
                    <li><i class="fas fa-angle-double-right mr-1"></i>Stye </li>
                    <li><i class="fas fa-angle-double-right mr-1"></i>Blepharitis </li>
                    <li><i class="fas fa-angle-double-right mr-1"></i>Uveitis </li>
                </ul>
                <h3 class="h4">Our Treatments
                </h3>
                <p class="p">
                    Our Eye Care Department offers a wide range of treatments tailored to address various
                        eye conditions. From prescription eyeglasses and contact lenses to advanced surgical procedures
                        like cataract surgery and LASIK, we provide comprehensive solutions to enhance your vision. 
                        Additionally, our team is well-versed in managing and treating eye infections, offering 
                        targeted therapies such as antibiotic or antiviral medications, depending on the specific 
                        diagnosis.We prioritize your eye health, and our goal is to ensure that you receive the best 
                        possible care to maintain clear and healthy vision. Trust our Eye Care Department for expert, 
                        compassionate, and patient-focused services.
                </p>
            </div>
            <div class="emergency-container">
                    <h2 class="headingh3">Emergencies In Department
                    </h2>
                    <p class="p1">
                        Our hospital has an Ultra modern 24x7 Lab, Specialized Eye Operation Theaters, and 
                        several other Eye Care technologies to the patient’s disposal at all times. Additionally, 
                        Crash Cart Trolleys are placed strategically all around HealthCare Hospital with 
                        Monitor/defibrillators, suction devices, and bag valve masks (BVMs) of different sizes and 
                        Advanced cardiac life support (ACLS) drugs at all times for Emergency Cases of Eye Arrest.
                    </p>
                    <link rel="stylesheet" type="text/css" href="styles.css">
                    <a class="curved-button" href="Appointment.aspx">Book an Appointment</a>
                </div>
        </div>
    </body>
    </html>
</asp:Content>
