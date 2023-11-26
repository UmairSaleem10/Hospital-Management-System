
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="SE_Project.Feedback" %>
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
                        border: solid;
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
                <div class="doctor-container" id="userContent" runat="server">
        <h2>Our Hospital</h2>  
        <p>
            Healthcare hospitals play a crucial role in the well-being of communities, providing essential medical 
            services and fostering a sense of trust and security among the population. Patient feedback serves as a 
            valuable compass for healthcare institutions, offering insights into the quality of care, patient 
            experiences, and areas for improvement. Positive feedback often highlights the dedication and expertise 
            of healthcare professionals, compassionate patient care, and the effectiveness of medical treatments. 
            Such affirmations not only boost the morale of hospital staff but also reinforce the hospital's 
            commitment to delivering outstanding healthcare services.
            <p>
                On the flip side, constructive criticism from patients serves as a catalyst for continuous 
                improvement. It allows healthcare hospitals to identify and address any shortcomings, streamline 
                processes, and enhance overall patient satisfaction. Feedback may shed light on areas such as 
                communication, waiting times, and facility cleanliness, providing hospitals with actionable data to 
                refine their practices. A responsive and patient-centric approach to feedback underscores the 
                hospital's commitment to patient welfare and fosters a culture of accountability and continuous 
                learning within the healthcare team. Ultimately, patient feedback serves as a dynamic tool that 
                empowers healthcare hospitals to evolve, ensuring they meet the ever-changing needs and expectations
                of the communities they serve.
            </p>
        </p>
                    <asp:Button ID="Button1" runat="server" Text="View FeedBacks" OnClick="Button1_Click" CssClass="curved-button" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" connectionString = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true" 
                    SelectCommand ="SELECT ID, PatientID, Name, Message, Created_AT, Updated_AT FROM Feedback"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID ="gridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                            <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                            <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                            <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                    </Columns>
                    </asp:GridView>
    </div>
                
                <div class="container" runat="server">
                    <h2>Add Feedback</h2>
                <formview class="form">
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="ID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="PatientID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Message"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" CssClass="curved-button" />
                </formview>
                        </div>
                </div>
        </body>
    </html>
</asp:Content>
