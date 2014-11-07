using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace AuditMgtNew
{
    public partial class showresult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // show exam result
            Examination exam = (Examination)Session["questions"];
            lblSubject.Text = exam.sname;
            lblStime.Text = exam.StartTime.ToString();
            TimeSpan ts = DateTime.Now.Subtract(exam.StartTime);
            lblMin.Text = ts.Minutes.ToString();
            lblNquestions.Text = exam.SIZE.ToString();

            // find how many correct answers
            int cnt = 0;
            double per;
            SqlConnection con3 = new SqlConnection(DBUtil.ConnectionString);
            con3.Open();
            SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from tblFinalData", con3);
            int examid = (Int32)cmd.ExecuteScalar();
            con3.Close();   

            foreach (Question q in exam.questions)
            {
                //if (q.IsCorrect())
                //    cnt++;
                cnt = cnt + q.answer;
                SqlConnection con4 = new SqlConnection(DBUtil.ConnectionString);
                con4.Open();
                //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                //con.Open();
                SqlCommand cmd4 = new SqlCommand("select isnull( max(examid),0) from tblFinalData", con4);
                //int examid = (Int32)cmd.ExecuteScalar();
                cmd4.CommandText = "insert into tblFinalData values(@examid,@mid,@sid,@qid,@question,@answer)";
                cmd4.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                cmd4.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd4.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                cmd4.Parameters.Add("@qid", SqlDbType.Int).Value = q.qid;
                cmd4.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                cmd4.Parameters.Add("@answer", SqlDbType.Int).Value = q.answer;
                cmd4.ExecuteNonQuery();
                con4.Close();   



               
                
            }
           // per = (((double)cnt /500) * 100);
           // Label1.Text = per.ToString()+"%";
           // lblNcans.Text = cnt.ToString();
           //// exam.ncans = cnt;
           // Session.Add("questions", exam);

           // if (cnt > 3)
           //     lblGrade.Text = "Excellent";
           // else
           //     if (cnt > 1)
           //         lblGrade.Text = "Average";
           //     else
           //         lblGrade.Text = "Poor";
           // // add row to OE_EXAMS table
           // SqlConnection con1 = new SqlConnection(DBUtil.ConnectionString);
           // con1.Open();
           // SqlCommand cmd1 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con1);
           // int examid1 = (Int32)cmd1.ExecuteScalar();
           // cmd1.CommandText = "insert into oe_exams values(@examid,@mid,@sid,@noq,@ncans,@stdate,getdate())";
           // cmd1.Parameters.Add("@examid", SqlDbType.Int).Value = examid1;
           // cmd1.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
           // cmd1.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
           // cmd1.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
           // cmd1.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
           // cmd1.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
           // cmd1.ExecuteNonQuery();
           // con1.Close();   

        }

        protected void lbRank_Click(object sender, EventArgs e)
        {
            //Examination exam = (Examination)Session["questions"];
            //double per = (double)exam.ncans / exam.SIZE;
            //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("select count(*) from oe_exams where nocans * 1.0 / noq >= @per and  sid = @sid", con);
            //cmd.Parameters.Add("@per", SqlDbType.Decimal).Value = per;
            //cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
            //int rank = (Int32)cmd.ExecuteScalar();

            //cmd.CommandText = "select count(*) from oe_exams where sid = @sid";
            //int total = (Int32)cmd.ExecuteScalar();

            //con.Close();

            //lblRank.Text = "<h4>Your Rank : " + rank.ToString() + " out of " + total.ToString() + " </h4>"; 
        }
    }
}