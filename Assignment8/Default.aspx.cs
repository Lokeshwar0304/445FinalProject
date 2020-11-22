using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment8
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bnMemRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberRegister.aspx");
        }

        protected void bnMemLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberLogin.aspx");
        }

        protected void bnStaffPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Staff/Staff.aspx");
        }

        protected void bnStaffLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffLogin.aspx");
        }

        protected void bnMemPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Member/Member.aspx");
        }
    }
}