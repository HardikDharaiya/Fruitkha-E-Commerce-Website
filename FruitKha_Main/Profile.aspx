<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FruitKha_Main.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
          <div class="container mt-5">
        <h2 class="text-center">User Profile</h2>

        <!-- User Information -->
        <div class="card">
            <div class="card-body">
                <h4>Personal Details</h4>
                <p><b>Username:</b> <asp:Label ID="lblUsername" runat="server" /></p>
                <p><b>Email:</b> <asp:Label ID="lblEmail" runat="server" /></p>
                <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="btnLogout_Click" />
            </div>
        </div>

        <hr />

        <!-- Order History -->
        <div class="card mt-3">
            <div class="card-body">
                <h4>Order History</h4>
                <asp:GridView ID="gvOrders" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Date" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
