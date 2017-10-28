<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chaomung.aspx.cs" Inherits="Chaomung" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Bạn đã đăng nhập thành công</p>
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Login.aspx">Đăng xuất</asp:LinkButton>
        </p>
    </form>
</body>
</html>
