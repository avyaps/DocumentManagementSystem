using System;
using MySql.Data.MySqlClient;


namespace DocumentManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string GetConnectionString()
        {
            string server = "localhost";
            string database = "documentsystem";
            string username = "root";
            string password = "";

            return $"server={server};database={database};uid={username};pwd={password};";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Check if username or password fields are empty
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "EmptyFields", "alert('Please fill in.');", true);
                return;
            }

            string connectionString = GetConnectionString();
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                // Check if the username exists
                string usernameQuery = "SELECT COUNT(*) FROM login WHERE Username = @Username";
                MySqlCommand usernameCommand = new MySqlCommand(usernameQuery, connection);
                usernameCommand.Parameters.AddWithValue("@Username", username);

                connection.Open();
                int usernameCount = Convert.ToInt32(usernameCommand.ExecuteScalar());

                if (usernameCount > 0)
                {
                    // Username exists, now validate the password
                    string passwordQuery = "SELECT COUNT(*) FROM login WHERE Username = @Username AND Password = @Password";
                    MySqlCommand passwordCommand = new MySqlCommand(passwordQuery, connection);
                    passwordCommand.Parameters.AddWithValue("@Username", username);
                    passwordCommand.Parameters.AddWithValue("@Password", password);

                    int passwordCount = Convert.ToInt32(passwordCommand.ExecuteScalar());

                    if (passwordCount > 0)
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "InvalidPassword", "alert('Invalid password.');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "InvalidUsername", "alert('Username does not exist.');", true);
                }
            }
        }
    }
}
