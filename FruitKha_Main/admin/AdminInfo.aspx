<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInfo.aspx.cs" Inherits="FruitKha_Main.admin.AdminInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            max-width: 500px;
            margin: auto;
            padding: 20px;
        }
        .btn-save {
            background-color: #28a745;
            color: white;
        }
        .btn-save:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <!-- ✅ FORM MUST WRAP THE CONTENT PROPERLY -->
    <form id="AdminEditForm" runat="server">  

        <div class="container">
            <div class="card shadow">
                <h3 class="text-center">Admin Profile</h3>
                <hr>

                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtAdminName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Email Address (Read-Only):</label>
                    <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>New Password:</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Confirm Password:</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-save btn-block" OnClick="btnUpdate_Click" />

                <a href="admin.aspx" class="btn btn-secondary btn-block mt-2">Back to Dashboard</a>
            </div>
        </div>

    </form>  <!-- ✅ Closing form tag here -->

</body>
</html>