<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="SE_Project.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
        <body>
            <style>
                .about-us-container {
                    /*margin-bottom:50px;*/
                    max-width: 1200px; /* Adjust the width as needed */
                    margin: 0 auto;
                    padding: 50px; /* Adjust the padding as needed */
                    background-color: #ffffff; /* Background color */
                    border: 1px solid #ddd; /* Border style */
                }

                    .about-us-container h2 {
                        text-align: center;
                        color: #215d8c; /* Heading text color */
                    }

                    .about-us-container p {
                        /*margin-top:20px;*/
                        line-height: 1.5; /* Adjust line height as needed */
                        text-align: left;
                        color: #030b17; /* Paragraph text color */
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
            <img src="images/About.png" width="100%" class="above-image"/>
        <link rel="stylesheet" type="text/css" href="styles.css">
            <div class="background-theme">
        <div class="about-us-container">
        <h2>About Us</h2>  
        <p>
            At Health Care Hospital, our commitment to your well-being is unwavering. 
            We have proudly served our community for over a decade, providing exceptional 
            healthcare services with compassion and dedication. Our journey began with a 
            vision to create a place where patients are not merely treated, but cared for 
            like family. Our team of experienced healthcare professionals, from skilled 
            physicians to empathetic nurses, works tirelessly to ensure that every patient 
            receives the highest quality of care. We believe in the power of modern medical 
            advancements coupled with a human touch. Our mission is to be your trusted partner 
            in health, guiding you towards a happier, healthier life.
            <p>
                Health Care Hospital is more than just a medical institution; it's a place 
                where healing and hope intersect. We take pride in our state-of-the-art facilities 
                and cutting-edge technology, allowing us to provide comprehensive healthcare services 
                that meet the diverse needs of our community. With a patient-centric approach and a commitment 
                to excellence, we are dedicated to improving and safeguarding the health of all those we serve. 
                Your health is our priority, and we look forward to being your beacon of care and compassion in 
                every step of your healthcare journey. Thank you for choosing Health Care Hospital.
            </p>
        </p>
    </div>
                <style>
                    .scroll-button {
                        display: inline-block;
                        margin: 60px auto; /* Center align the buttons */
                        padding: 10px 10px;
                        background-color: #215d8c;
                        color: #fff;
                        border: none;
                        border-radius: 20px;
                        text-decoration: none;
                        font-size: 16px;
                        transition: background-color 0.3s;
                    }
                    .text-color {
                        color:#215d8c;
                        text-align:center;
                    }

                    .scroll-button:hover {
                            background-color: #217dbb;
                    
                    }
                    .button-container {
                        max-width: 1400px;
                        text-align: center;
                        justify-content: center; 
                        align-items: center;
                    }


                    .container {
                        max-width: 1000px;
                        margin: 0 auto;
                        padding: 20px;
                        background-color: #fff;
                        border: 1px solid #ddd;
                        margin-bottom: 20px;
                        border-radius: 10px;
                        text-align: center; /* Center align content */
                    }
                        .container h2 {
                            color: #215d8c;
                        }

                        .container p {
                            line-height: 1.6;
                            text-align: left;
                            color:#030b17;
                        }
                    .image-adjust {
                        margin-bottom: 50px;
                    }
                .container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    text-decoration-color: #030b17;
                }
                .image-container {
                    margin-bottom: 20px; /* Adjust the margin as needed to create space between image and text */
                }
                .right-align {
                    text-align: right;
                }
                .left-align {
                    text-align: left;
                }
                </style>
                <link rel="stylesheet" type="text/css" href="styles.css">
                <div class="button-container">
                <a class="scroll-button" href="#mission">Our Mission</a>
                <a class="scroll-button" href="#vision">Our Vision</a>
                    <a class="scroll-button" href="#Quality">Quality Policy</a>
                    </div>

                <div id="mission" class="container">
            <h2>Our Mission</h2>
            <p>
                At Health Care Hospital, our core purpose is to provide the highest standard of 
                healthcare to our community. We are deeply committed to offering a level of care 
                that combines expertise and compassion. Our team of dedicated healthcare professionals, 
                from skilled physicians to empathetic nurses, is driven by the shared goal of ensuring 
                that every patient receives top-tier medical services. Our patient-centered approach is 
                the cornerstone of our philosophy. We believe in tailoring healthcare to the unique needs
                of each individual. Understanding that no two patients are alike, we take the time to listen, 
                empathize, and adapt our services to meet the specific needs and preferences of each person. 
                Our goal is to make every patient's healthcare journey as comfortable, informed, and effective 
                as possible.
                <p>
                    We remain at the forefront of medical innovation and technology, investing in state-of-the-art 
                    equipment and staying updated with the latest medical practices. Our commitment to advancement 
                    extends to research and education, ensuring that our staff is well-equipped to provide the best
                    care possible. Health Care Hospital is not just a healthcare institution; it's an active participant
                    in our community's well-being. Our mission extends beyond hospital walls, encompassing health 
                    education and preventive care initiatives. We believe in raising awareness about health issues, 
                    promoting healthy lifestyles, and offering support where it's needed most.
                </p>
                <p>
                    Compassion and empathy are fundamental to the care we provide. We understand the emotional 
                    challenges that can accompany health issues, and we strive to deliver not only medical expertise 
                    but also emotional support. Our team's kindness, reassurance, and understanding make a significant 
                    difference in each patient's healthcare experience.
                    Health Care Hospital's dedication to exceptional care, patient-centered services, innovation, 
                    community engagement, and a deep belief in the power of compassion and empathy drive us in our 
                    quest to enhance and safeguard the health and well-being of those we serve.
                </p>
            </p>
        </div>
                <div id="vision" class="container">
            <h2>Our Vision</h2>
                    <p>
                        At Health Care Hospital, our vision is to be a beacon of healthcare excellence 
                        that shines brightly within our community. We aspire to set new standards in 
                        patient-centric care, offering innovative and compassionate healthcare services 
                        to all who seek our help. Our dedication to this vision is unwavering, and it 
                        guides us in every aspect of our work.
                        Our aim is to create a healthcare institution where individuals are not just 
                        patients but are also active participants in their own well-being. We envision a 
                        place where every patient receives personalized care, tailored to their unique needs 
                        and preferences. We believe in a future where healthcare is a collaborative journey, 
                        and individuals are empowered to make informed decisions about their health.
                        <p>
                            In our vision, technology and innovation play a crucial role. We see a future 
                            where the latest advancements in medical science are readily available to our 
                            patients. Health Care Hospital will continue to invest in cutting-edge equipment 
                            and stay at the forefront of medical research and education, ensuring that our 
                            community receives the benefits of progress.
                            Our vision extends beyond the hospital walls. We imagine a community that is not 
                            just healthier but also more informed about health-related issues. We actively engage 
                            with the community to promote health education and preventive care, providing resources 
                            and support to enhance overall well-being.
                        </p>
                        <p>
                            Central to our vision is the idea that compassion and empathy are integral to healthcare.
                            We envision a healthcare environment where patients and their families are met with 
                            understanding, kindness, and support. Every interaction, from diagnosis to recovery, 
                            will be marked by a caring approach that acknowledges the emotional aspect of health 
                            challenges. At Health Care Hospital, this vision is our driving force, and we remain 
                            dedicated to making it a reality.
                        </p>
                    </p>
                </div>
                
                
            <div  style="width: 100%; height: 250px;">
            <h1 style="width: 1121px"> </h1> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h1>
            <img src="images/doct.jpg" style="float:right; 
            margin-right:10px; width: 480px;  margin-left: 36px; text-align:center"></h1>
                <p>
                    <div id="Quality" class="text-color">
                    <h2>Quality Policy</h2>
                        </div>

                </p>
                <p class="left-align">
                    The management and staff of Health Care Hospitals - Health Care are committed to create a 
                    culture of quality, patient safety, efficiency and accountability towards patient 
                    care and prevention of adverse events. Patients are treated with respect, dignity 
                    and courtesy at all time. Further, we are committed to continually improve our Quality 
                    of services, Safety of patients/staff and to comply with all applicable statutory & 
                    regulatory requirements.
                </p>
                </div>

                <style>
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
                    .container1 {
                        text-align: center;
                        max-width: 1000px;
                        margin: 0 auto;
                        padding: 20px;
                    }

                </style>

                <div class="container1">
                <a class="curved-button" href="ContactUs.aspx">Contact Us</a>
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
                    <input type="text" id="fullName1" name="fullName" class="input-line" placeholder="Full Name" required>
                    <input type="text" id="Email1" name="Email" class="input-line" placeholder="Email" required>
                    <input type="text" id="PhoneNumber1" name="PhoneNumber" class="input-line" placeholder="Phone Number" required>
                    <input type="text" id="Message1" name="Message" class="input-line" placeholder="Message" required>
                    <button class="curved-button1" type="submit">Contact Us</button>
                </formview>
                        </div>
                </div>
            
        </body>
    </html>
</asp:Content>
