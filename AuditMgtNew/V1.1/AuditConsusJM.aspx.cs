using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data.SqlClient;
using System.Data;

namespace AuditMgtNew
{
    public partial class AuditConsusJM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (this.Page.PreviousPage != null)
            {
                String sid, sname, location, stddate;

                int rowIndex = int.Parse(Request.QueryString["RowIndex"]);
                GridView GridView1 = (GridView)this.Page.PreviousPage.FindControl("GridView1");
                GridViewRow row = GridView1.Rows[rowIndex];
                sid = row.Cells[0].Text;
                sname = row.Cells[1].Text.ToString();
                //  sname = (row.FindControl("lblName") as Label).Text;
                stddate = DateTime.Today.ToString("dd/MM/yyyy");
                lblLocation.Text = (string)Session["location"];
                //  lblLoc.Text = (string)Session["Month"]; 
                //lblLoc.Text = "Jumeirah Group";
                location = lblLocation.Text;
                // sname = row.Cells[1].Text;



                //DropDownList dd2 = (DropDownList)PreviousPage.FindControl("DropDownList2");
                //lblLocation.Text = ddl.SelectedValue;




                //sid = ddlSubjects.SelectedItem.Value;
                //sname = ddlSubjects.SelectedItem.Text;
                Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), Int32.Parse(sid), sname, location);
                exam.GetQuestions();
                Session.Add("questions", exam);
                // Response.Redirect("Audit.aspx");

                //LinkButton2.Attributes.Add("onClick", "return false;");

                if (!Page.IsPostBack)
                    DisplayQuestion();

                // Label1.Text = lblQuestionId.Text;
            }


        }

        public void DisplayQuestion()
        {
            // get data from session object
            Examination e = (Examination)Session["questions"];
            // display data
            lblIndicatorName.Text = e.sname;
            lblQnum.Text = e.curpos + 1 + "/" + e.SIZE;
            //  lblCtime.Text = DateTime.Now.ToString();
            //   lblStime.Text = e.StartTime.ToString();
            lblLocation.Text = e.location;

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


            //SqlConnection con3 = new SqlConnection(DBUtil.ConnectionString);
            //con3.Open();
            //SqlDataAdapter myDataAdapter;
            //DataSet ds;

            //myDataAdapter = new SqlDataAdapter("SELECT guid FROM tblQuestionsJMSub  WHERE qid = '" + q.qid + "' ", con3);

            ////DetailsID = '" + lstBoxCategory.SelectedValue.ToString() + "' ", connection);
            ////string queryString = ("SELECT guid FROM oe_questions where qid = '" + q.qid.ToString() +"' ");
            ////SqlDataAdapter adapter = new SqlDataAdapter(queryString, con3);

            //ds = new DataSet();
            //myDataAdapter.Fill(ds, "oe_questions");

            //con3.Close();

            ////GridView1.DataSource = ds.Tables[0];
            ////GridView1.DataBind();


            //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            //con.Open();
            //SqlDataAdapter myDataAdapter1;
            //DataSet ds1;

            ////myDataAdapter1 = new SqlDataAdapter("SELECT guid FROM oe_questions  WHERE qid = '" + q.qid.ToString() + "' ", con3);
            //myDataAdapter1 = new SqlDataAdapter("SELECT ref FROM tblQuestionsJMSub WHERE qid = '" + q.qid + "' ", con);

            ////DetailsID = '" + lstBoxCategory.SelectedValue.ToString() + "' ", connection);
            ////string queryString = ("SELECT guid FROM oe_questions where qid = '" + q.qid.ToString() +"' ");
            ////SqlDataAdapter adapter = new SqlDataAdapter(queryString, con3);

            //ds1 = new DataSet();
            //myDataAdapter1.Fill(ds1, "oe_questions1");

            //con.Close();

            ////GridView2.DataSource = ds1.Tables[0];
            ////GridView2.DataBind();



        }

        public void ProcessQuestion()
        {
            Examination exam = (Examination)Session["questions"];
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
        protected void TextBox4_DataBind(object sender, EventArgs e)
        {

            TextBox4.Text.Replace("\n", "<br /> <br />");

        }
        protected void TextBox5_DataBind(object sender, EventArgs e)
        {

            TextBox5.Text.Replace("\n", "<br /> <br />");

        }
        protected void btnNext_ServerClick(object sender, EventArgs e)
        {
            ProcessQuestion();
            Examination exam = (Examination)Session["questions"];

            if (exam.curpos == exam.SIZE - 1)
            // Response.Redirect("showresult.aspx");
            {
                foreach (Question q in exam.questions)
                {

                    SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
                    int examid = (Int32)cmd.ExecuteScalar();
                    cmd.CommandText = ("select locationid from tbllocation where location ='" + exam.location + "'");
                    int locationid = (Int32)cmd.ExecuteScalar();
                    cmd.CommandText = "insert into tblSavedAnswers values(@examid,@locationid,@location,@mid,@sid,@qid,@question,@answer,@evidence,@comments)";
                    cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                    cmd.Parameters.Add("@locationid", SqlDbType.NVarChar).Value = locationid;
                    cmd.Parameters.Add("@location", SqlDbType.NVarChar).Value = exam.location;
                    cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                    cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                    cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
                    cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                    cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
                    cmd.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = TextBox2.Text;
                    cmd.Parameters.Add("@comments", SqlDbType.NVarChar).Value = TextBox3.Text;
                    //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                    //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                    //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                    cmd.ExecuteNonQuery();

                    SqlConnection con8 = new SqlConnection(DBUtil.ConnectionString);
                    con8.Open();
                    SqlCommand cmd8 = new SqlCommand("insert into tblSavedAnswersHistory values(@examid,@locationid,@location,@mid,@sid,@qid,@question,@answer,@evidence,@comments,@date)", con8);
                    // cmd.CommandText = "insert into tblSavedAnswersHistory values(@examid,@locationid,@location,@mid,@sid,@qid,@question,@answer,@evidence,@comments,@date)";
                    cmd8.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
                    cmd8.Parameters.Add("@locationid", SqlDbType.NVarChar).Value = locationid;
                    cmd8.Parameters.Add("@location", SqlDbType.NVarChar).Value = exam.location;
                    cmd8.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                    cmd8.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                    cmd8.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
                    cmd8.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
                    cmd8.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
                    cmd8.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = TextBox2.Text;
                    cmd8.Parameters.Add("@comments", SqlDbType.NVarChar).Value = TextBox3.Text;
                    //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                    //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                    cmd8.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Today.ToString("dd/MM/yyyy");
                    cmd8.ExecuteNonQuery();


                }
                Question q3 = exam.questions[exam.curpos];

                SqlConnection con5 = new SqlConnection(DBUtil.ConnectionString);
                SqlDataAdapter da5 = new SqlDataAdapter("select * from tblQuestionsJMSub where sid = " + q3.sid, con5);
                DataSet ds5 = new DataSet();
                da5.Fill(ds5, "questions");


                SqlConnection con4 = new SqlConnection(DBUtil.ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("select * from oe_subjects where sid = " + q3.sid, con4);
                DataSet ds = new DataSet();
                da.Fill(ds, "questions");

                int cnt = 0;
                Decimal per;
                int SIZE;
                Decimal score;

                Decimal weighting = decimal.Parse(ds.Tables[0].Rows[0][2].ToString());
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


                SqlConnection con6 = new SqlConnection(DBUtil.ConnectionString);
                con6.Open();
                //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con2);
                //int examid = (Int32)cmd2.ExecuteScalar();
                //   SqlCommand cmd3 = new SqlCommand("Update View_subject_location Set score=@score,status=@status  WHERE sid =@sid and location=@loc", con6);
                SqlConnection cons = new SqlConnection(DBUtil.ConnectionString);
                cons.Open();
                SqlCommand cmds = new SqlCommand("select locationid from tbllocation where location ='" + exam.location + "'", cons);
                int locid = (Int32)cmds.ExecuteScalar();


                // SqlCommand cmd3 = new SqlCommand("UPDATE oe_subjects SET oe_subjects.score = @score,oe_subjects.status =@status FROM oe_subjects INNER JOIN tbllocation ON oe_subjects.locationid = tbllocation.id where tbllocation.location=@loc and oe_subject.sid=@sid ", con6);
                SqlCommand cmd3 = new SqlCommand("Insert into oe_subjects_status values(@sid,@mid,@locid,@loc,@sname,@status,@score)", con6);
                //  SqlCommand cmd3 = new SqlCommand("UPDATE View_subject_location SET View_subject_location.status=@status,View_subject_location.score=@score where View_subject_location.sid=@sid and View_subject_location.location=@loc", con6);
                // cmd2.CommandText = ("Update oe_subjects Set status=@status WHERE sid =@sid",con2);


                cmd3.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                cmd3.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd3.Parameters.Add("@locid", SqlDbType.Int).Value = locid;
                cmd3.Parameters.Add("@loc", SqlDbType.NVarChar).Value = lblLocation.Text;
                cmd3.Parameters.Add("@sname", SqlDbType.NVarChar).Value = exam.sname;
                cmd3.Parameters.Add("@status", SqlDbType.NVarChar).Value = "complete";
                cmd3.Parameters.Add("@score", SqlDbType.Float).Value = exam.score;



                cmd3.ExecuteNonQuery();

                Question q6 = exam.questions[exam.curpos];

                SqlConnection con2 = new SqlConnection(DBUtil.ConnectionString);
                con2.Open();
                SqlCommand cmd2 = new SqlCommand("select isnull( max(auditid),0) + 1 from oe_Audits", con2);
                int auditid = (Int32)cmd2.ExecuteScalar();
                cmd2.CommandText = "insert into oe_Audits values(@examid,@mid,@sid,@location,@score,@status,@enddate)";
                cmd2.Parameters.Add("@examid", SqlDbType.Int).Value = auditid;
                cmd2.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd2.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
                cmd2.Parameters.Add("@location", SqlDbType.NVarChar).Value = lblLocation.Text;
                cmd2.Parameters.Add("@score", SqlDbType.Float).Value = exam.score;
                cmd2.Parameters.Add("@status", SqlDbType.NVarChar).Value = "complete";
                //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
                //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
                //  cmd2.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
                cmd2.Parameters.Add("@enddate", SqlDbType.DateTime).Value = DateTime.Today.ToString("dd/MM/yyyy");

                cmd2.ExecuteNonQuery();






                string context = Session["location"].ToString();

                switch (context)
                {
                    case "Jumeirah Group Corporate":
                        {
                            Response.Redirect("JMIndicatorsCorporate.aspx");
                            break;
                        }
                    default:
                        {
                            Response.Redirect("JMIndicators.aspx");
                            break;

                        }






                }
            }

            else
            {
                exam.curpos++;
                Session.Add("questions", exam);
                DisplayQuestion();
            }
        }




        //ProcessQuestion();
        //Examination exam = (Examination)Session["questions"];
        //Question q = exam.questions[exam.curpos];
        //if (exam.curpos == exam.SIZE - 1)
        //{

        //    SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
        //    int examid = (Int32)cmd.ExecuteScalar();
        //    cmd.CommandText = "insert into tblSavedAnswers values(@examid,@location,@mid,@sid,@qid,@question,@answer,@evidence,@comments)";
        //    cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        //    cmd.Parameters.Add("@location", SqlDbType.NVarChar).Value = exam.location;
        //    cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        //    cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        //    cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
        //    cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
        //    cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
        //    cmd.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = q.evidence;
        //    cmd.Parameters.Add("@comments", SqlDbType.NVarChar).Value = q.comments;
        //    //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        //    //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        //    //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        //    cmd.ExecuteNonQuery();

        //    SqlConnection con5 = new SqlConnection(DBUtil.ConnectionString);
        //    SqlDataAdapter da5 = new SqlDataAdapter("select * from tblQuestionsJMSub where sid = " + q.sid, con5);
        //    DataSet ds5 = new DataSet();
        //    da5.Fill(ds5, "questions");


        //    SqlConnection con4 = new SqlConnection(DBUtil.ConnectionString);
        //    SqlDataAdapter da = new SqlDataAdapter("select * from oe_subjects_corporate where sid = " + q.sid, con4);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds, "questions");

        //    int cnt = 0;
        //    Decimal per;
        //    int SIZE;
        //    Decimal score;

        //    Decimal weighting = decimal.Parse(ds.Tables[0].Rows[0][3].ToString());
        //    int nquestions = ds5.Tables[0].Rows.Count;
        //    SIZE = nquestions;

        //    foreach (Question q1 in exam.questions)
        //    {
        //        //if (q.IsCorrect())
        //        //    cnt++;
        //        cnt = cnt + q1.answer;
        //        //SqlConnection con4 = new SqlConnection(DBUtil.ConnectionString);
        //        //con4.Open();
        //        //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        //    }
        //    //con.Open();                       

        //    per = (cnt / SIZE) * weighting;
        //    //  Label1.Text = per.ToString()+"%";
        //    //  lblNcans.Text = cnt.ToString();
        //    score = (Decimal)per;
        //    exam.score = (Decimal)score;
        //    Session.Add("questions", exam);

        //    //if (cnt > 3)
        //    //    lblGrade.Text = "Excellent";
        //    //else
        //    //    if (cnt > 1)
        //    //        lblGrade.Text = "Average";
        //    //    else
        //    //        lblGrade.Text = "Poor";
        //    // add row to OE_EXAMS table
        //    //SqlConnection con1 = new SqlConnection(DBUtil.ConnectionString);
        //    //con1.Open();
        //    //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con1);
        //    //int examid2 = (Int32)cmd1.ExecuteScalar();
        //    //cmd1.CommandText = "insert into oe_exams values(@examid,@mid,@sid,@noq,@ncans,@stdate,getdate())";
        //    //cmd1.Parameters.Add("@examid", SqlDbType.Int).Value = examid1;
        //    //cmd1.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        //    //cmd1.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        //    //cmd1.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        //    //cmd1.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        //    //cmd1.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        //    //cmd1.ExecuteNonQuery();
        //    //con1.Close();   




        //    SqlConnection con6 = new SqlConnection(DBUtil.ConnectionString);
        //    con6.Open();
        //    //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con2);
        //    //int examid = (Int32)cmd2.ExecuteScalar();
        // //   SqlCommand cmd3 = new SqlCommand("Update View_subject_location Set score=@score,status=@status  WHERE sid =@sid and location=@loc", con6);

        //   // SqlCommand cmd3 = new SqlCommand("UPDATE oe_subjects SET oe_subjects.score = @score,oe_subjects.status =@status FROM oe_subjects INNER JOIN tbllocation ON oe_subjects.locationid = tbllocation.id where tbllocation.location=@loc and oe_subject.sid=@sid ", con6);
        //    SqlCommand cmd3 = new SqlCommand("UPDATE View_subject_location SET View_subject_location.status=@status,View_subject_location.score=@score where View_subject_location.sid=@sid and View_subject_location.location=@loc", con6);
        //    // cmd2.CommandText = ("Update oe_subjects Set status=@status WHERE sid =@sid",con2);
        //    cmd3.Parameters.Add("@score", SqlDbType.Float).Value = exam.score;
        //    cmd3.Parameters.Add("@status", SqlDbType.NVarChar).Value = "complete";
        //    cmd3.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        //    cmd3.Parameters.Add("@loc", SqlDbType.NVarChar).Value = lblLocation.Text;

        //    cmd3.ExecuteNonQuery();

        //    Response.Redirect("JMIndicators.aspx");

        //}
        //else
        //{

        //    SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
        //    int examid = (Int32)cmd.ExecuteScalar();
        //    cmd.CommandText = "insert into tblSavedAnswers values(@examid,@location,@mid,@sid,@qid,@question,@answer,@evidence,@comments)";
        //    cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        //    cmd.Parameters.Add("@location", SqlDbType.NVarChar).Value = exam.location;
        //    cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        //    cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        //    cmd.Parameters.Add("@qid", SqlDbType.NVarChar).Value = q.qid;
        //    cmd.Parameters.Add("@question", SqlDbType.NVarChar).Value = q.question;
        //    cmd.Parameters.Add("@answer", SqlDbType.NVarChar).Value = q.answer;
        //    cmd.Parameters.Add("@evidence", SqlDbType.NVarChar).Value = q.evidence;
        //    cmd.Parameters.Add("@comments", SqlDbType.NVarChar).Value = q.comments;
        //    //cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        //    //cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        //    //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        //    cmd.ExecuteNonQuery();

        //    exam.curpos++;
        //    Session.Add("questions", exam);
        //    DisplayQuestion();







        protected void ImageButton1_ServerClick(object sender, EventArgs e)
        {
            Response.Write(string.Format("<script>window.open('{0}','_blank');</script>", "Default3.aspx"));
        }
        protected void ImageButton8_ServerClick(object sender, EventArgs e)
        {
            lblLocation.Text = (string)Session["location"];


            ProcessQuestion();
            Examination exam = (Examination)Session["questions"];
            Question q = exam.questions[exam.curpos];
            //Question q = exam.questions[exam.curpos];
            //if (exam.curpos == exam.SIZE - 1)
            //    Response.Redirect("showresult.aspx");
            //else
            //{

            for (int i = 0; i < Session.Contents.Count; i++)
            {
                //Examination exam = (Examination)Session["questions"];
                //Question q = exam.questions[exam.curpos];
                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
                int examid = (Int32)cmd.ExecuteScalar();
                cmd.CommandText = "insert into tblSavedAnswersAuditor values(@mid,@location,@examid,@sid,@qid,@question,@answer,@evidence,@comments)";

                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
                cmd.Parameters.Add("@location", SqlDbType.NVarChar).Value = lblLocation.Text.ToString();
                cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
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
            SqlCommand cmd2 = new SqlCommand("UPDATE oe_subjects_status SET status=@status where sid=@sid and mid=@mid and location=@loc", con2);

            //  SqlCommand cmd2 = new SqlCommand("UPDATE oe_subjects SET oe_subjects.status =@status FROM oe_subjects INNER JOIN tbllocation ON oe_subjects.locationid = tbllocation.id where tbllocation.location=@loc and oe_subject.sid=@sid ", con2);
            // cmd2.CommandText = ("Update oe_subjects Set status=@status WHERE sid =@sid",con2);
            cmd2.Parameters.Add("@status", SqlDbType.NVarChar).Value = "Incomplete";
            cmd2.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
            cmd2.Parameters.Add("@sid", SqlDbType.NVarChar).Value = exam.sid;
            cmd2.Parameters.Add("@loc", SqlDbType.NVarChar).Value = lblLocation.Text;
            // cmd2.Parameters.Add("@score", SqlDbType.Float).Value = exam.score;
            cmd2.ExecuteNonQuery();


            SqlConnection con3 = new SqlConnection(DBUtil.ConnectionString);
            con3.Open();
            //SqlCommand cmd2 = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con2);
            //int examid = (Int32)cmd2.ExecuteScalar();
            SqlCommand cmd3 = new SqlCommand("Delete from tblSavedAnswers where mid=@mid and location=@loc and sid=@sid", con3);
            // cmd2.CommandText = ("Update oe_subjects Set status=@status WHERE sid =@sid",con2);
            cmd3.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
            cmd3.Parameters.Add("@sid", SqlDbType.NVarChar).Value = exam.sid;
            cmd3.Parameters.Add("@loc", SqlDbType.NVarChar).Value = lblLocation.Text;
            // cmd2.Parameters.Add("@score", SqlDbType.Float).Value = exam.score;
            cmd3.ExecuteNonQuery();

            string context = Session["location"].ToString();

            switch (context)
            {
                case "Jumeirah Group Corporate":
                    {
                        Response.Redirect("JMIndicatorsCorporate.aspx");
                        break;
                    }
                default:
                    {
                        Response.Redirect("JMIndicators.aspx");
                        break;

                    }






            }
        }

        //protected void ImageButton9_ServerClick(object sender, EventArgs e)
        //{

        //    Examination exam = (Examination)Session["questions"];
        //    exam.curpos--;
        //    Session.Add("question", exam);
        //    DisplayQuestion();

        //}

        protected void ImageButton3_ServerClick(object sender, EventArgs e)
        {
            // Response.Redirect("pdfViwerGuide.aspx", target="_blank");
            Session.Remove("question");
            string context = Session["location"].ToString();

            switch (context)
            {
                case "Jumeirah Group Corporate":
                    {
                        Response.Redirect("JMIndicatorsCorporate.aspx");
                        break;
                    }
                default:
                    {
                        Response.Redirect("JMIndicators.aspx");
                        break;

                    }






            }
        }


        protected void btnCancel_ServerClick(object sender, EventArgs e)
        {


        }
        protected void ImageButton2_ServerClick(object sender, EventArgs e)
        {


        }
        protected void ImageButton6_ServerClick(object sender, EventArgs e)
        {

            TextBox4.Text.Replace("\n", "<br /> <br />");
        }
        protected void ImageButton7_ServerClick(object sender, EventArgs e)
        {

            TextBox5.Text.Replace("\n", "<br /> <br />");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbAns1.Checked || rbAns2.Checked || rbAns3.Checked;
        }
    }
}