using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditMgtNew
{
    public partial class TakeAudit:Pagebase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            // 
            String sid, sname, location;

            sid = ddlSubjects.SelectedItem.Value;
            sname = ddlSubjects.SelectedItem.Text;
            location = ddlSubjects.SelectedIndex.ToString();
            Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), Int32.Parse(sid), sname, location);
            exam.GetQuestions();
            Session.Add("questions", exam);
            Response.Redirect("Audit1.aspx");
        }
    }
}