using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuditMgtNew.Old_App_Code;

namespace AuditMgtNew
{
    public partial class SelectReviewIndicator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            // 
            String examid, qid, sname;

            examid = ddlSubjects.SelectedItem.Value;
            qid = ddlSubjects.SelectedItem.Value;
            sname = ddlSubjects.SelectedItem.Text;
            //Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), Int32.Parse(examid), sname);
            AuditAnswers exam = new AuditAnswers(Int32.Parse(Session["mid"].ToString()), Int32.Parse(examid),Int32.Parse(qid),sname);
            exam.GetQuestionsAnswers();
            Session.Add("questions1", exam);
            Response.Redirect("StartReview.aspx");
        }
    }
}