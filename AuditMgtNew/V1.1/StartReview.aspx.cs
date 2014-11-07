using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AuditMgtNew.Old_App_Code;


namespace AuditMgtNew
{
    public partial class StartReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            DisplayQuestion();   

        }
        public void DisplayQuestion()
        {
            // get data from session object
            AuditAnswers e = (AuditAnswers)Session["questions1"];
            // display data
            lblSubject.Text = e.sname;
            lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
            lblCtime.Text = DateTime.Now.ToString();
            lblStime.Text = e.StartTime.ToString();

            QuestionAnswers q = e.questionsAnswers[e.curpos];
            // display details of question
            //question.InnerHtml = q.question;
            TextBox1.Text = q.question;
            //TextBox4.Text = q.answer.ToString();
            Label1.Text = q.answer.ToString();

            //ans1.InnerHtml = q.ans1;
            //ans2.InnerHtml = q.ans2;
            //ans3.InnerHtml = q.ans3;
            //ans4.InnerHtml = q.ans4;

            // reset all radio buttons
            rbAns1.Checked = false;
            rbAns2.Checked = false;
            rbAns3.Checked = false;
            rbAns4.Checked = false;
            rbAns5.Checked = false;
            rbAns6.Checked = false;
            rbAns7.Checked = false;
            rbAns8.Checked = false;
            rbAns9.Checked = false;
            rbAns10.Checked = false;
            rbAns11.Checked = false;


            // disable and enable buttons
            if (e.curpos == 0)
                btnPrev.Enabled = false;
            else
                btnPrev.Enabled = true;

            if (e.curpos == e.SIZE - 1)
                btnNext.Text = "Finish";
            else
                btnNext.Text = "Next";



            SqlConnection con3 = new SqlConnection(DBUtil.ConnectionString);
            con3.Open();
            SqlDataAdapter myDataAdapter;
            DataSet ds;

            myDataAdapter = new SqlDataAdapter("SELECT guid FROM oe_questions  WHERE qid = '" + q.qid.ToString() + "' ", con3);

            //DetailsID = '" + lstBoxCategory.SelectedValue.ToString() + "' ", connection);
            //string queryString = ("SELECT guid FROM oe_questions where qid = '" + q.qid.ToString() +"' ");
            //SqlDataAdapter adapter = new SqlDataAdapter(queryString, con3);

            ds = new DataSet();
            myDataAdapter.Fill(ds, "oe_questions");

            con3.Close();

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();


            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            con.Open();
            SqlDataAdapter myDataAdapter1;
            DataSet ds1;

            myDataAdapter1 = new SqlDataAdapter("SELECT ref FROM oe_questions  WHERE qid = '" + q.qid.ToString() + "' ", con);

            //DetailsID = '" + lstBoxCategory.SelectedValue.ToString() + "' ", connection);
            //string queryString = ("SELECT guid FROM oe_questions where qid = '" + q.qid.ToString() +"' ");
            //SqlDataAdapter adapter = new SqlDataAdapter(queryString, con3);

            ds1 = new DataSet();
            myDataAdapter1.Fill(ds1, "oe_questions");

            con.Close();

            GridView2.DataSource = ds1.Tables[0];
            GridView2.DataBind();



        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            ProcessQuestion();

            AuditAnswers exam = (AuditAnswers)Session["questions1"];
            QuestionAnswers q = exam.questionsAnswers[exam.curpos];
            if (exam.curpos == exam.SIZE - 1)
                Response.Redirect("showresult.aspx");
            else
            {
                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
                int examid = (Int32)cmd.ExecuteScalar();
                cmd.CommandText = "insert into tblSavedAnswersAuditor values(@mid,@examid,@sid,@qid,@question,@answer)";
                cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd.Parameters.Add("@sid", SqlDbType.NVarChar).Value = exam.sname;
                cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
                cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
                //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                cmd.ExecuteNonQuery();

                exam.curpos++;
                Session.Add("questions1", exam);
                DisplayQuestion();
            }

        }
        public void ProcessQuestion()
        {
            AuditAnswers exam = (AuditAnswers)Session["questions1"];
            QuestionAnswers q = exam.questionsAnswers[exam.curpos];

            int answer;

            // find out the answer and assign it to 
            //if (rbAns1.Checked)
            //    answer = "1";
            //else
            //    if (rbAns2.Checked)
            //        answer = "2";
            //    else
            //        if (rbAns3.Checked)
            //            answer = "3";
            //        else
            //            if (rbAns4.Checked)
            //                answer = "4";
            //            else
            //                answer = "0";  // error
            if (rbAns1.Checked)
                answer = 0;
            else
                if (rbAns2.Checked)
                    answer = 1;
                else
                    if (rbAns3.Checked)
                        answer = 2;
                    else
                        if (rbAns4.Checked)
                            answer = 3;
                        else
                            answer = 4;  // error
            q.question = TextBox1.Text;
            q.answer = answer;
            exam.questionsAnswers[exam.curpos] = q;
            Session.Add("questions1", exam);
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void ClientButton_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}