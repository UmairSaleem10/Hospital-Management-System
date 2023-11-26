<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Medicines.aspx.cs" Inherits="SE_Project.Medicines" %>
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
                    width: 150%;
                    height: 300px;
                }

                .above-image {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 20px; /* Adjust the margin to add space between the image and container */
                }

                .image-adjust {
                    display: block;
                    max-width: 100%;
                    margin-bottom: 20px;
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

                .h {
                    color: #215d8c;
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
            </style>
            <div class="background-theme">
                <img src="images/medicine.jpg"/ width="100%" height="560" class="image-adjust above-image"> 
                <div class="container" id="userContent" runat="server" visible="false">
                    <h2> Medicines </h2>
                    <asp:Button ID="Button2" runat="server" Text="View Medicine" OnClick="Button2_Click" CssClass="curved-button" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" connectionString = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true" 
                    SelectCommand ="SELECT MedicineID, PatientID, Medicine_Name, Description, Price, Stock, Created_AT, Updated_AT FROM Medicine"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID="gridView" runat="server" Visible="false" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand" OnRowDeleting="gridView_RowDeleting" DataKeyNames="MedicineID">
                        <Columns>
                            <asp:BoundField DataField="MedicineID" HeaderText="MedicineID" SortExpression="MedicineID" />
                            <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                            <asp:BoundField DataField="Medicine_Name" HeaderText="Medicine_Name" SortExpression="Medicine_Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                            <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                            <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                            <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" HeaderText="Edit" Visible="false" />
                            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" HeaderText="Delete" Visible="false" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="contact-us-container" id="adminContent" runat="server" visible="false">
                <formview>
                    <h2>Medicine Data</h2>
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="MedicineID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="PatientID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Medicine_Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Description"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox4" runat="server" placeholder="Price"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox5" runat="server" placeholder="Stock" TextMode="Number"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" CssClass="curved-button" />
                </formview>
                </div>
            </div>
        </body>
    </html>
</asp:Content>
