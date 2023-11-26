<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="SE_Project.Employee" %>
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
                    padding: 20px; /* Adjust the padding as needed */
                }
                .image-adjust {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 20px;
                }
                .above-image {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 20px; /* margin to add space between the image and container */
                }
                .employee-container {
                    width: 100%;
                    margin: 0;
                    margin-top: 40px;
                    padding: 50px; /* Adjust the padding as needed */
                    background-color: #ffffff; /* Background color */
                    border: 1px solid #ddd;
                    margin-bottom: 20px; /* Border style */
                    border: none;
                    color: #000000;
                    margin: auto;
                }
                .h1{
                    text-align:center;
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
                .employee-container1 {
                    width: 50%;
                    margin: 0;
                    margin-top: 40px;
                    padding: 50px; /* Adjust the padding as needed */
                    background-color: #ffffff; /* Background color */
                    border: 1px solid #ddd;
                    margin-bottom: 20px; /* Border style */
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
                    color: #000000;
                    Background-color: #00000000
                }

                    .input-line:focus {
                        outline: auto;
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

                        .gridView:after {
                            border-color: #ddd;
                            border-style: solid;
                            border-width: 1px 1px 1px 0; /* Borders on all sides except right */
                            padding: 10px;
                        }

                        .gridView:end {
                            border-width: 1px; /* Add right border for the last column */
                        }
            </style>

            <div class="background-theme">
                <img src="images/worker.png"/ width="100%"; height="600" class="image-adjust above-image"> 
                <div class="employee-container" id="userContent" runat="server" visible="false">
                    <h1 class="h1"> Our Employees </h1>
                    <p>
                        The cohesive and dedicated team of professionals at our esteemed organization comprises 
                        individuals who collectively contribute to the success and effectiveness of our operations. 
                        Each member plays a crucial role in the overall functioning and strives to uphold the 
                        organization's values and commitment to excellence. Our team is a dynamic blend of diverse 
                        skills, experiences, and expertise, fostering an environment where collaboration and innovation
                        thrive. Our team encompasses a wealth of professional diversity, bringing together individuals 
                        with varied backgrounds, qualifications, and areas of specialization. From seasoned veterans 
                        with years of industry experience to fresh talents bringing new perspectives, this diversity 
                        creates a dynamic synergy that enhances our ability to meet the complex demands of our industry.
                        <p>
                            Every team member shares a common commitment to delivering excellence in their respective 
                            roles. Whether on the frontlines of patient care, in administrative functions, or behind 
                            the scenes in support roles, our employees understand the critical role they play in 
                            upholding the organization's standards. This commitment translates into a unified effort 
                            to provide the highest quality of service and care to our stakeholders. Our workplace 
                            culture is defined by collaboration and mutual respect. Team members actively engage with 
                            each other, fostering open communication and a spirit of camaraderie. This collaborative 
                            ethos extends beyond individual departments, creating a holistic approach to problem-solving 
                            and ensuring that the collective strength of our team is harnessed to address challenges and 
                            drive continuous improvement.
                        </p>
                        <p>
                            The impact of our dedicated team is evident in the positive outcomes we achieve and the 
                            satisfaction of our patients, clients, and stakeholders. As we look towards the future, 
                            our team remains committed to adapting to evolving industry trends, embracing innovation, 
                            and continuing to provide unparalleled service. Together, we are not only a reflection of 
                            the organization's values but also architects of its ongoing success and growth.
                        </p>
                    </p>
                    <asp:Button ID="Button1" runat="server" Text="View Employee" OnClick="Button1_Click" CssClass="curved-button" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true"
                        SelectCommand="SELECT Employee_ID, Name, Role, Address, Created_AT, Updated_AT FROM Employee"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID="gridView" runat="server" Visible="false" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand" OnRowDeleting="gridView_RowDeleting" DataKeyNames="Employee_ID">
                        <Columns>
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" SortExpression="Employee_ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                            <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                            <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" HeaderText="Edit" visible="false"/>
                            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" HeaderText="Delete" visible="false"/>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="employee-container1" id="adminContent" runat="server" visible="false">
                    <h2>Add Employee</h2>
                    <formview class="form">
                        <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="Employee_ID"></asp:TextBox>
                        <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                        <label for="ddlemployee">Role:</label>
                        <asp:DropDownList ID="ddlemployee" runat="server" CssClass="input-line">
                            <asp:ListItem Text="Doctors " Value="Doctors " />
                            <asp:ListItem Text="Nurses" Value="Nurses" />
                            <asp:ListItem Text="Administrative Staff" Value="Administrative Staff" />
                            <asp:ListItem Text="Technologists" Value="Technologists" />
                            <asp:ListItem Text="Health Professionals" Value="Health Professionals" />
                        </asp:DropDownList>
                        <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Address"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" CssClass="curved-button" />
                    </formview>
                </div>
                </div>
        </body>
    </html>
</asp:Content>
