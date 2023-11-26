<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Pharmacy.aspx.cs" Inherits="SE_Project.Pharmacy" %>
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
        <img src="images/medicine.jpg" width="100%" height="540" class="image-adjust above-image"> 
                <div class="doctor-container" id="userContent" runat="server" visible="false">
        <h2>Pharmacy</h2>  
        <p>
            The hospital pharmacy is a vital component of healthcare institutions, playing a pivotal role in 
            patient care and treatment. Pharmacy services encompass a broad spectrum of responsibilities, 
            including dispensing medications, ensuring proper dosage and administration, and collaborating with 
            healthcare professionals to optimize therapeutic outcomes. Pharmacists, as integral members of the 
            healthcare team, contribute their expertise to assess medication regimens, address potential drug 
            interactions, and educate patients on the proper use of medications. The hospital pharmacy serves as 
            a central hub for medication management, maintaining a comprehensive inventory of pharmaceuticals and
            adhering to stringent quality and safety standards. By providing timely and accurate medication 
            services, the hospital pharmacy contributes significantly to patient safety and the overall success of 
            medical treatments.
        </p>
                    <asp:Button ID="Button1" runat="server" Text="Pharmacy Details" OnClick="Button1_Click" CssClass="curved-button" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" connectionString = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true" 
                    SelectCommand = "SELECT ID, Name, Contact, Address, No_Medicine, Created_AT, Updated_AT FROM Pharmacy"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID ="gridView" runat="server" Visible="false" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand" OnRowDeleting="gridView_RowDeleting" DataKeyNames="ID">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="No_Medicine" HeaderText="No_Medicine" SortExpression="No_Medicine" />
                            <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                            <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                            <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" HeaderText="Edit" Visible="false" />
                            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" HeaderText="Delete" Visible="false" />
                        </Columns>
                    </asp:GridView>
    </div>
                
                <div class="container" id="adminContent" runat="server" visible="false">
                    <h2>Add Doctor</h2>
                <formview class="form">
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="ID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Pharmacy-Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Contact"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Address"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox4" runat="server" placeholder="No_Medicine"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" CssClass="curved-button" />
                </formview>
                        </div>
                </div>
        </body>
    </html>
</asp:Content>
