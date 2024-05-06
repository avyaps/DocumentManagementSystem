using System;
using System.IO;
using System.Web;
using MySql.Data.MySqlClient;

namespace DocumentManagementSystem
{
    public partial class UploadFile : System.Web.UI.Page
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

            return $"Server={server};Database={database};Uid={username};Pwd={password};";
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    // Get the physical path of the web application
                    string appPath = HttpContext.Current.Request.PhysicalApplicationPath;

                    // Combine the application path with the "Downloads" folder
                    string downloadsFolderPath = Path.Combine(appPath, "Downloaded Files");

                    // Check if the "Downloads" folder exists, if not, create it
                    if (!Directory.Exists(downloadsFolderPath))
                    {
                        Directory.CreateDirectory(downloadsFolderPath);
                    }

                    // Combine the downloads folder path with the file name
                    string fileName = Path.Combine(downloadsFolderPath, FileUpload1.FileName);

                    // Save the file to the specified path
                    FileUpload1.SaveAs(fileName);

                    // Display success message
                    Label1.Text = "File Downloaded Successfully !! " + FileUpload1.PostedFile.ContentLength + "mb";
                }
                catch (Exception ex)
                {
                    // Display error message
                    Label1.Text = "File Not Downloaded!!" + ex.Message.ToString();
                }
            }
            else
            {
                Label1.Text = "Please Select File and Download Again";
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                try
                {
                    // Record file upload to database
                    RecordFileUpload(FileUpload1.FileName);

                    // Display success message
                    Label1.Text = "File Uploaded Successfully !!";
                }
                catch (Exception ex)
                {
                    // Display error message
                    Label1.Text = "File Not Uploaded!! " + ex.Message.ToString();
                }
            }
            else
            {
                Label1.Text = "Please Select File and Upload Again";
            }
        }

        private void RecordFileUpload(string fileName)
        {
            // SQL query to insert file upload information into the database
            string query = "INSERT INTO uploadedfiles (FileName, UploadDateTime) VALUES (@FileName, @UploadDateTime)";

            // Create and open a connection to the database
            using (MySqlConnection connection = new MySqlConnection(GetConnectionString()))
            {
                connection.Open();

                // Create a command object
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@FileName", fileName);
                    command.Parameters.AddWithValue("@UploadDateTime", DateTime.Now);

                    // Execute the command
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}