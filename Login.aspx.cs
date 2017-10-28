using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
public partial class Login : System.Web.UI.Page
{
    public static SqlConnection cn = null;
    public static string mssv = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Directory.GetCurrentDirectory();
        path = path.Substring(0, path.LastIndexOf('\\') - 3);
        cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|UserLogin.mdf;Integrated Security=True;Connect Timeout=30");
    }

    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Session["UserName"] = this.Login1.UserName;
    }

    protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
    {

    }

    protected void Login1_LoginError(object sender, EventArgs e)
    {

    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
       
        Connect();
        TextBox user = (TextBox)Login1.FindControl("UserName");
        TextBox pass = (TextBox)Login1.FindControl("Password");
        DangNhapTK dangnhap = new DangNhapTK(user.Text,pass.Text);
        mssv = dangnhap.Dangnhap();
        if (mssv != null)
        {
            Response.Redirect("Chaomung.aspx");
        }
        
        //if (output == "1")
        //{

        //   Session["UserName"] = Login1.UserName.ToString();
        //    Response.Redirect("Chaomung.aspx");
        //    //Response.Write("Dang nhap thanh cong");
        //   // e.Authenticated = true;
        //}
        //else
        //{
        //    //Response.Write("<script> alert('Dang nhap that bai') </script>");

        //   // e.Authenticated = false;
        //}

    }
    public void Connect()
    {
        try
        {
            if (Login.cn != null && cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
            else
                Response.Write("<script> alert('Bạn đã đăng nhập trước đó rồi!') </script>");
        }
        catch (SqlException)
        {
            Response.Write("<script> alert('Lỗi kết nối') </script>");
        }
    }
    public void disConnect()
    {
        if (cn != null && cn.State == ConnectionState.Open)
            cn.Close();
    }
    class DangNhapTK
    {
        string pass;
        string tk;
        public DangNhapTK(string user, string password)
        {
            this.tk = user;
            this.pass = password;
        }
        public string Dangnhap()
        {
            string sql = "SELECT UserName FROM User1 WHERE UserName = @User and Password = @Pass";
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("User", tk));
            cmd.Parameters.Add(new SqlParameter("Pass", pass));
            return Login.mssv = (string)cmd.ExecuteScalar();

        
        }

    }
}