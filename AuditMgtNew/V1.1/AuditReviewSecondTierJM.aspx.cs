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
    public partial class AuditReviewSecondTierJM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String sid = "1";

            String sname = "General Requirements,  Leadership and Accountability";
            String location = "Jumeirah Group";

            //int rowIndex = int.Parse(Request.QueryString["RowIndex"]);
            //GridView GridView1 = (GridView)this.Page.PreviousPage.FindControl("GridView1");
            //GridViewRow row = GridView1.Rows[rowIndex];
            //sid = row.Cells[0].Text;
            //  sname = (row.FindControl("lblName") as Label).Text;
            lblLocation.Text = "Jumeirah Group".ToString();
            // sname = row.Cells[1].Text;




            //sid = ddlSubjects.SelectedItem.Value;
            //sname = ddlSubjects.SelectedItem.Text;
            ExaminationConsusIntroJM exam = new ExaminationConsusIntroJM(Int32.Parse(Session["mid"].ToString()), Int32.Parse(sid), sname, location);
            exam.GetQuestions();
            Session.Add("questions", exam);
            // Response.Redirect("Audit.aspx");

            //LinkButton2.Attributes.Add("onClick", "return false;");
            if (!Page.IsPostBack)
                DisplayQuestion();

            // Label1.Text = lblQuestionId.Text;



        }
        public void DisplayQuestion()
        {
            // get data from session object
            ExaminationConsusIntroJM e = (ExaminationConsusIntroJM)Session["questions"];
            // display data
            lblIndicatorName.Text = e.sname;
            lblQnum.Text = e.curpos + 1 + "/" + e.SIZE;
            //  lblCtime.Text = DateTime.Now.ToString();
            //   lblStime.Text = e.StartTime.ToString();


            Question q = e.questions[e.curpos];
            // display details of question
            //question.InnerHtml = q.question;
            TextBox1.Text = q.question;
            lblQid.Text = q.qid;
            TextBox4.Text = q.guid;
            TextBox4.Text.Replace("\n", "<br /> <br />");

            TextBox5.Text = q.refe;
            TextBox5.Text.Replace("\n", "<br /> <br />");
            //TextBox4.Text = q.qid.ToString();
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
            //if (e.curpos == 0)
            //    ImageButton9.Enabled = false;
            //else
            //    ImageButton9.Enabled = true;

            if (e.curpos == e.SIZE)
            {
                ImageButton2.Visible = true;
                btnNext.Visible = false;
            }
            else
                btnNext.Visible = true;


            SqlConnection con3 = new SqlConnection(DBUtil.ConnectionString);
            con3.Open();
            SqlDataAdapter myDataAdapter;
            DataSet ds;

            myDataAdapter = new SqlDataAdapter("SELECT guid FROM tblQuestionsJMSub  WHERE qid = '" + q.qid + "' ", con3);

            //DetailsID = '" + lstBoxCategory.SelectedValue.ToString() + "' ", connection);
            //string queryString = ("SELECT guid FROM oe_questions where qid = '" + q.qid.ToString() +"' ");
            //SqlDataAdapter adapter = new SqlDataAdapter(queryString, con3);

            ds = new DataSet();
            myDataAdapter.Fill(ds, "oe_questions");

            con3.Close();

            //GridView1.DataSource = ds.Tables[0];
            //GridView1.DataBind();


            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            con.Open();
            SqlDataAdapter myDataAdapter1;
            DataSet ds1;

            //myDataAdapter1 = new SqlDataAdapter("SELECT guid FROM oe_questions  WHERE qid = '" + q.qid.ToString() + "' ", con3);
            myDataAdapter1 = new SqlDataAdapter("SELECT ref FROM tblQuestionsJMSub WHERE qid = '" + q.qid + "' ", con);

            //DetailsID = '" + lstBoxCategory.SelectedValue.ToString() + "' ", connection);
            //string queryString = ("SELECT guid FROM oe_questions where qid = '" + q.qid.ToString() +"' ");
            //SqlDataAdapter adapter = new SqlDataAdapter(queryString, con3);

            ds1 = new DataSet();
            myDataAdapter1.Fill(ds1, "oe_questions1");

            con.Close();

            //GridView2.DataSource = ds1.Tables[0];
            //GridView2.DataBind();



        }

        public void ProcessQuestion()
        {
            ExaminationConsusIntroJM exam = (ExaminationConsusIntroJM)Session["questions"];
            Question q = exam.questions[exam.curpos];


            int answer;
            string evidence, comments;


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
                            if (rbAns5.Checked)
                                answer = 4;
                            else

                                if (rbAns6.Checked)
                                    answer = 5;
                                else

                                    if (rbAns7.Checked)
                                        answer = 6;
                                    else
                                        if (rbAns8.Checked)
                                            answer = 7;
                                        else
                                            if (rbAns9.Checked)
                                                answer = 8;
                                            else
                                                if (rbAns10.Checked)
                                                    answer = 9;
                                                else
                                                    if (rbAns11.Checked)
                                                        answer = 10;
                                                    else
                                                        answer = 0;          // error               
            evidence = TextBox2.Text;
            comments = TextBox3.Text;

            q.question = TextBox1.Text;
            q.answer = answer;
            q.evidence = evidence;
            q.comments = comments;

            exam.questions[exam.curpos] = q;
            Session.Add("questions", exam);
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            TextBox4.Text.Replace("\n", "<br /> <br />");
        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
            TextBox5.Text.Replace("\n", "<br /> <br />");
        }
        protected void btnNext_ServerClick(object sender, EventArgs e)
        {
            ProcessQuestion();
            ExaminationConsusIntroJM exam = (ExaminationConsusIntroJM)Session["questions"];
            Question q = exam.questions[exam.curpos];


            if (exam.curpos == exam.SIZE - 1)
            {

                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
                int examid = (Int32)cmd.ExecuteScalar();
                cmd.CommandText = "insert into tblSavedAnswers values(@mid,@examid,@sid,@qid,@question,@answer,@evidence,@comments)";
                cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
                cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
                cmd.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = q.evidence;
                cmd.Parameters.Add("@comments", SqlDbType.NVarChar).Value = q.comments;
                //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                cmd.ExecuteNonQuery();

                SqlConnection con5 = new SqlConnection(DBUtil.ConnectionString);
                SqlDataAdapter da5 = new SqlDataAdapter("select * from tblQuestionsJMSub where sid = " + q.sid, con5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, "questions");


                SqlConnection con4 = new SqlConnection(DBUtil.ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("select * from oe_subjects where sid = " + q.sid, con4);
                DataSet ds = new DataSet();
                da.Fill(ds, "questions");

                int cnt = 0;
                Decimal per;
                int SIZE;
                Decimal score;

                Decimal weighting = decimal.Parse(ds.Tables[0].Rows[0][3].ToString());
                int nquestions = ds5.Tables[0].Rows.Count;
                SIZE = nquestions;

                foreach (Question q1 in exam.questions)
                {
                    //if (q.IsCorrect())
                    //    cnt++;
                    cnt = cnt + q1.answer;
                    //SqlConnection con4 = new SqlConnection(DBUtil.ConnectionString);
                    //con4.Open();
                    //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                }
                //con.Open();                       

                per = (cnt / SIZE) * weighting;
                //  Label1.Text = per.ToString()+"%";
                //  lblNcans.Text = cnt.ToString();
                score = (Decimal)per;
                exam.score = (Decimal)score;
                Session.Add("questions", exam);

                //if (cnt > 3)
                //    lblGrade.Text = "Excellent";
                //else
                //    if (cnt > 1)
                //        lblGrade.Text = "Average";
                //    else
                //        lblGrade.Text = "Poor";
                // add row to OE_EXAMS table
                //SqlConnection con1 = new SqlConnection(DBUtil.ConnectionString);
                //con1.Open();
                //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con1);
                //int examid2 = (Int32)cmd1.ExecuteScalar();
                //cmd1.CommandText = "insert into oe_exams values(@examid,@mid,@sid,@noq,@ncans,@stdate,getdate())";
                //cmd1.Parameters.Add("@examid", SqlDbType.Int).Value = examid1;
                //cmd1.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                //cmd1.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                //cmd1.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                //cmd1.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                //cmd1.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                //cmd1.ExecuteNonQuery();
                //con1.Close();   




                SqlConnection con6 = new SqlConnection(DBUtil.ConnectionString);
                con6.Open();
                //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con2);
                //int examid = (Int32)cmd2.ExecuteScalar();
                SqlCommand cmd3 = new SqlCommand("Update oe_subjects Set score=@score,status=@status  WHERE sid =@sid", con6);
                // cmd2.CommandText = ("Update oe_subjects Set status=@status WHERE sid =@sid",con2);
                cmd3.Parameters.Add("@score", SqlDbType.Float).Value = exam.score;
                cmd3.Parameters.Add("@status", SqlDbType.NVarChar).Value = "complete";
                cmd3.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;

                cmd3.ExecuteNonQuery();

                Response.Redirect("JMIndicators.aspx");

            }
            else
            {

                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
                int examid = (Int32)cmd.ExecuteScalar();
                cmd.CommandText = "insert into tblSavedAnswers values(@mid,@examid,@sid,@qid,@question,@answer,@evidence,@comments)";
                cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
                cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
                cmd.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = q.evidence;
                cmd.Parameters.Add("@comments", SqlDbType.NVarChar).Value = q.comments;
                //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                cmd.ExecuteNonQuery();

                exam.curpos++;
                Session.Add("questions", exam);
                DisplayQuestion();
            }




        }
        protected void ImageButton8_ServerClick(object sender, EventArgs e)
        {
            ProcessQuestion();

            ExaminationConsusIntroJM exam = (ExaminationConsusIntroJM)Session["questions"];
            //Question q = exam.questions[exam.curpos];
            //if (exam.curpos == exam.SIZE - 1)
            //    Response.Redirect("showresult.aspx");
            //else
            //{

            for (int i = 0; i < Session.Contents.Count; i++)
            {
                //Examination exam = (Examination)Session["questions"];
                Question q = exam.questions[exam.curpos];
                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
                int examid = (Int32)cmd.ExecuteScalar();
                cmd.CommandText = "insert into tblSavedAnswersAuditor values(@mid,@examid,@sid,@qid,@question,@answer,@evidence,@comments)";
                cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
                cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
                cmd.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = q.evidence;
                cmd.Parameters.Add("@comments", SqlDbType.NVarChar).Value = q.comments;
                //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                cmd.ExecuteNonQuery();

                exam.curpos--;
                //Session.Add("questions", exam);
                //DisplayQuestion();

            }
            SqlConnection con2 = new SqlConnection(DBUtil.ConnectionString);
            con2.Open();
            //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con2);
            //int examid = (Int32)cmd2.ExecuteScalar();
            SqlCommand cmd2 = new SqlCommand("Update oe_subjects_corporate Set status=@status WHERE sid =@sid", con2);
            // cmd2.CommandText = ("Update oe_subjects Set status=@status WHERE sid =@sid",con2);
            cmd2.Parameters.Add("@status", SqlDbType.NVarChar).Value = "Incomplete";
            cmd2.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
            cmd2.ExecuteNonQuery();

            Response.Redirect("JMIndicators.aspx");
        }
        //protected void ImageButton9_ServerClick(object sender, EventArgs e)
        //{

        //}
        protected void ImageButton2_ServerClick(object sender, EventArgs e)
        {


        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbAns1.Checked || rbAns2.Checked || rbAns3.Checked;
        }
        protected void ImageButton1_ServerClick(object sender, EventArgs e)
        {

        }
        protected void ImageButton3_ServerClick(object sender, EventArgs e)
        {

        }
    }
}