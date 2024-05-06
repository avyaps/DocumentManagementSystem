using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace DocumentManagementSystem
{
    public partial class ForgotPasswordCode : System.Web.UI.Page
    {
        // Your Gmail credentials
        private const string GmailUsername = "docmanagementsystem098@gmail.com";
        private const string GmailPassword = "vjtfpjexjchrdtqc";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitCode_Click(object sender, EventArgs e)
        {
            // Redirect to the password reset page
            Response.Redirect("ForgotPasswordNewPw.aspx");
        }

        protected void LinkBtnResendCode_Click(object sender, EventArgs e)
        {
            // Get the email address from the session
            if (Session["Email"] != null)
            {
                string emailAddress = Session["Email"].ToString();

                // Send email via Gmail SMTP
                SendEmail(GmailUsername, GmailPassword);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "showFailed", "alert('Email is not stored in the session!');", true);
            }
        }

        private void SendEmail(string fromMail, string fromPassword)
        {
            // Configure Gmail SMTP client
            using (var client = new SmtpClient("smtp.gmail.com", 587))
            {
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(fromMail, fromPassword);

                // Create the email message
                using (var message = new MailMessage())
                {
                    message.From = new MailAddress(fromMail);
                    message.Subject = "Test Email";
                    message.To.Add(new MailAddress("docmanagementsystem098@gmail.com"));
                    message.Body = "<html><body>Hello!</body></html>";
                    message.IsBodyHtml = true;

                    try
                    {
                        client.Send(message);
                        txtCode.Text = Session["Email"].ToString();
                        // Notify the user that the email has been sent
                        ClientScript.RegisterStartupScript(this.GetType(), "showSuccessAlert", "alert('Email has been sent!');", true);
                    }
                    catch (Exception ex)
                    {
                        // Handle email sending failure
                        Console.WriteLine($"Failed to send email: {ex.Message}");
                    }
                }
            }
        }
    }
}