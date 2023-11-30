<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Patient-Record.aspx.cs" Inherits="SE_Project.Patient_Record" %>
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

                .patient-container {
                    margin: 150%;
                    margin-top: -80px;
                    width: 100%;
                    padding: 50px; /* Adjust the padding*/
                    background-color: #ffffff; /* Background color */
                    border: 1px solid #ddd;
                    padding-top: 60px;
                    border: none;
                    color: #000000;
                    margin: auto;
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

                .gridView {
                    border-collapse: collapse;
                    width: 100%;
                    margin-top: 20px;
                }

                    .gridView:start {
                        border: 1px solid #ddd;
                        padding: 10px;
                        text-align: left;
                    }

                    .gridView:active {
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

                .h {
                    text-align: center;
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
                    color: #000000;
                    Background-color: #00000000
                }

                    .input-line:focus {
                        outline: auto;
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
                <div class="patient-container">
                    <h2 class="h">Patient Record</h2>
                    <asp:Button ID="Button2" runat="server" Text="View Patient Record" OnClick="Button1_Click" CssClass="curved-button1" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true"
                        SelectCommand="SELECT PatientID, Name, Disease, D_Name, Address, Gender, Created_AT, Updated_AT FROM Patient"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID="gridView" runat="server" Visible="false" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand" OnRowDeleting="gridView_RowDeleting" DataKeyNames="PatientID">
                        <Columns>
                            <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Disease" HeaderText="Disease" SortExpression="Disease" />
                            <asp:BoundField DataField="D_Name" HeaderText="D_Name" SortExpression="D_Name" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                            <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                            <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" HeaderText="Edit" Visible="false" />
                            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" HeaderText="Delete" Visible="false" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="contact-us-container" id="adminContent" runat="server" visible="false">
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
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button2_Click" CssClass="curved-button1" />
                    </formview>
                </div>
                </div>
        </body>
    </html>
</asp:Content>
