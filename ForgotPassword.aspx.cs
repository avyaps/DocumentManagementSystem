using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocumentManagementSystem
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetCode_Click(object sender, EventArgs e)
        {
            // Store the email input in a session variable
            Session["Email"] = txtEmail.Text;
            Response.Redirect("ForgotPasswordCode.aspx");
        }
    }
}