<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="SE_Project.Manager" %>
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
                <img src="images/doctor.jpg"/ width="100%" height="560" class="image-adjust above-image"> 
                <div  id="userContent" runat="server" visible="false">
                    <h2> Our Managers </h2>
                    <asp:Button ID="Button1" runat="server" Text="View Managers" OnClick="Button2_Click" CssClass="curved-button" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" connectionString = "Data Source = DESKTOP-PQQJSLN\\MSSQLSERVER08; Database = SE_Project; Integrated Security = true" 
                    SelectCommand ="SELECT ID, Name, Email, Role, Address, Created_AT, Updated_AT FROM Manager"></asp:SqlDataSource>
                    <asp:GridView class="gridView" ID ="gridView" runat="server" Visible="false" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand" OnRowDeleting="gridView_RowDeleting" DataKeyNames="ID">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Created_AT" HeaderText="Created_AT" SortExpression="Created_AT" />
                        <asp:BoundField DataField="Updated_AT" HeaderText="Updated_AT" SortExpression="Updated_AT" />
                        <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" HeaderText="Edit" visible="false"/>
                        <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete" HeaderText="Delete" Visible="false"/>
                    </Columns>
                    </asp:GridView>
                </div>
                <div class="contact-us-container" id="adminContent" runat="server" visible="false">
                <formview>
                    <h2>Add Manager Data</h2>
                    <asp:TextBox CssClass="input-line" ID="TextBox0" runat="server" placeholder="ID"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                    <asp:TextBox CssClass="input-line" ID="TextBox2" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                    <label for="ddlmanager">Role:</label>
                        <asp:DropDownList ID="ddlmanager" runat="server" CssClass="input-line">
                            <asp:ListItem Text="Supervisor" Value="Supervisor" />
                            <asp:ListItem Text="Department Head" Value="Department Head" />
                            <asp:ListItem Text="Administrative Manager" Value="Administrative Manager" />
                            <asp:ListItem Text="Clinical Director" Value="Clinical Director" />
                            <asp:ListItem Text="Facility Manager" Value="Facility Manager" />
                        </asp:DropDownList>
                    <asp:TextBox CssClass="input-line" ID="TextBox3" runat="server" placeholder="Address"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Save" onclick="Button1_Click" CssClass="curved-button" />
                </formview>
                </div>
            </div>
        </body>
    </html>
</asp:Content>
