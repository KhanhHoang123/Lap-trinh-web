<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>        
        <asp:Login  ID="Login1" runat="server" CreateUserUrl="~/Taotaikhoan.aspx"
                    LoginButtonText="Đăng nhập" OnAuthenticate="Login1_Authenticate"
                    OnLoggedIn="Login1_LoggedIn" OnLoggingIn="Login1_LoggingIn"
                    OnLoginError="Login1_LoginError" PasswordLabelText="Mật khẩu:"
                    PasswordRecoveryUrl="~/RecoveryPass.aspx" RememberMeText="Nhớ đăng nhập cho lần sau"
                    TitleText="Đăng nhập" UserNameLabelText="Đăng Nhập:" FailureText="Tài khoản hoặc mật khẩu không đúng" CreateUserText="Tạo tài khoản" DestinationPageUrl="~/Login.aspx" PasswordRecoveryText="Quên mật khẩu?" PasswordRequiredErrorMessage="Nhập mật khẩu" RememberMeSet="True" UserNameRequiredErrorMessage="Nhập tên đăng nhập">
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2">Đăng nhập</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Đăng Nhập:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server">khanhhoang</asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Nhập tên đăng nhập" ToolTip="Nhập tên đăng nhập" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mật khẩu:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password">khanhhoang</asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Nhập mật khẩu" ToolTip="Nhập mật khẩu" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Checked="True" Text="Nhớ đăng nhập cho lần sau" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Đăng nhập" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Taotaikhoan.aspx">Tạo tài khoản</asp:HyperLink>
<br />
                                        <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="~/RecoveryPass.aspx">Quên mật khẩu?</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    
    </div>
    
        <p>
            &nbsp;</p>
        
    <session
        mode="StateServer"
        cookieless="false"
        timeout="2000"/>
        
    </form>
    </body>
</html>