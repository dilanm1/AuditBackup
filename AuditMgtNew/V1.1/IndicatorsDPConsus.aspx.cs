using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace AuditMgtNew
{
    public partial class IndicatorsDPConsus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindEmployeeDetails();

                //  lblLocation.Text = (string)Session["Month1"];

                //GridView2.DataSource = dt;
                //GridView2.DataBind();

                // DropDownList LabelAdd = (DropDownList)PreviousPage.FindControl("DropDownList1");

                //   lblLocation.Text = (string)Session["Month1"];
                //    lblLoc.Text = (string)Session["Month"];
                //lblLocation.Text = "Jumeirah Group";

                //  Session["loc"] = lblLocation.Text;
                // lblLocation.Text = "Jumeirah Group Corporate";


            }
        }
        protected void BindEmployeeDetails()
        {
            //if ((string)Session["location"] != null)
            //{

            lblLocation.Text = (string)Session["location"];

            //}
            //else
            //    lblLocation.Text = (string)Session["location2"];
            //  lblLoc.Text = (string)Session["sublocation"];


            string name = lblLocation.Text.ToString();
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            //string color_na = textBox3.Text;
            string commandQuery = "select oe_subjectsConsus.sid, oe_subjectsConsus.sname, oe_subjectsConsus.status, oe_subjectsConsus.score FROM oe_subjectsConsus INNER JOIN tbllocation ON oe_subjectsConsus.locationid = tbllocation.locationid where tbllocation.location=@loc";
            using (SqlCommand cmd = new SqlCommand(commandQuery, con))
            {
                cmd.Parameters.AddWithValue("@loc", lblLocation.Text);
                //cmd.Parameters.AddWithValue("@model", Area);


                //  SqlConnection con2 = new SqlConnection(conn);
                using (con)
                {
                    con.Open();
                    // SqlDataReader reader = cmd.ExecuteReader();
                    // bool initialized above is set here
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    con.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds;
                        GridView1.DataBind();



                    }
                    else
                    {
                        //ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                        //GridView1.DataSource = ds;
                        //GridView1.DataBind();
                        //int columncount = GridView1.Rows[0].Cells.Count;
                        //GridView1.Rows[0].Cells.Clear();
                        //GridView1.Rows[0].Cells.Add(new TableCell());
                        //GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                        //GridView1.Rows[0].Cells[0].Text = "No Records Found";
                    }
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridView2.PageIndex = e.NewPageIndex;
            //GridView2.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {


            Session["sid"] = e.Row.Cells[0].Text;
            Session["sname"] = e.Row.Cells[1].Text;


            e.Row.Cells[4].Visible = false;
            e.Row.Cells[0].Attributes["width"] = "20px";


            if (e.Row.DataItemIndex == 0 && e.Row.Cells[4].Text.ToString() == "nodata")
            {
                e.Row.Cells[3].Enabled = true;
                // return;  
            }
            if (e.Row.DataItemIndex == 0 && e.Row.Cells[4].Text.ToString() == "Incomplete")
            {
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[3].Text = "Incomplete";
                // return;  
            }
            if (e.Row.DataItemIndex == 0 && e.Row.Cells[4].Text.ToString() == "complete")
            {
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[3].Text = "complete";
                // return;  
            }
            if (e.Row.DataItemIndex > 0)
            {
                var thisRow = e.Row;
                var prevRow = GridView1.Rows[e.Row.DataItemIndex - 1];
                if (prevRow.Cells[4].Text.ToString() == "nodata")
                {
                    thisRow.Cells[3].Enabled = false;

                }
                if (prevRow.Cells[4].Text.ToString() == "Incomplete")
                {
                    thisRow.Cells[3].Enabled = false;

                }
                else
                    if (prevRow.Cells[4].Text.ToString() == "complete")
                    {
                        thisRow.Cells[3].Enabled = true;

                    }

                if (thisRow.Cells[4].Text.ToString() == "complete")
                {
                    thisRow.Cells[3].Enabled = true;
                    thisRow.Cells[3].Text = "complete";
                    //   thisRow.Cells[5].Visible = true;
                }
                if (thisRow.Cells[4].Text.ToString() == "Incomplete")
                {
                    thisRow.Cells[3].Enabled = true;
                    thisRow.Cells[3].Text = "Incomplete";
                    thisRow.Cells[5].Visible = true;
                    thisRow.Cells[5].Enabled = true;
                }
                else
                    if (thisRow.Cells[4].Text.ToString() == "Start Audit")
                    {
                        thisRow.Cells[5].Visible = false;

                    }



            }


            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.Cells[3].Text.ToString() == "complete")
                {
                    LinkButton btn = (LinkButton)row.FindControl("Button1");
                    //row.Cells[5].Enabled = true;
                    //row.Cells[5].Visible = true;
                    //row.Cells[5].ForeColor = System.Drawing.Color.Red;
                    btn.ForeColor = System.Drawing.Color.YellowGreen;
                    //   row.Cells[3].Text = "Edit";
                    btn.Enabled = true;
                    LinkButton btn2 = (LinkButton)row.FindControl("btnreport");
                    //row.Cells[5].Enabled = true;
                    //row.Cells[5].Visible = true;
                    //row.Cells[5].ForeColor = System.Drawing.Color.Red;
                    btn2.ForeColor = System.Drawing.Color.Green;
                    //   row.Cells[3].Text = "Edit";
                    btn2.Visible = true;
                    btn2.Enabled = true;

                }
                else

                    if (row.Cells[3].Text.ToString() == "Incomplete")
                    {
                        LinkButton btn = (LinkButton)row.FindControl("Button2");
                        //row.Cells[5].Visible = true;
                        //row.Cells[5].Text = "Resume";
                        btn.Visible = true;
                        btn.Text = "Resume";
                        btn.ForeColor = System.Drawing.Color.Red;
                        btn.Enabled = true;
                        //row.Cells[5].Enabled = true;
                        //row.Cells[5].ForeColor = System.Drawing.Color.Red;
                        //   row.Cells[3].Text = "Edit";

                    }

                    else
                    {
                        // row.Cells[5].Enabled = false;
                        //   row.Cells[5].Enabled = false;
                        //  row.Cells[5].ForeColor = System.Drawing.Color.Black;
                        //   row.Cells[3].Text = "Edit";
                        LinkButton btn = (LinkButton)row.FindControl("Button1");
                        //row.Cells[5].Visible = true;
                        //row.Cells[5].Text = "Resume";
                        btn.Text = "Edit";
                        btn.Enabled = false;

                    }

            }
            //var thisRow = e.Row;   
            //var prevRow = GridView1.Rows[e.Row.DataItemIndex-1];
            //prevRow.Cells[3].Enabled = false;

            //e.Row.Cells[4]. = (thisRow.Cells[1].Text == prevRow.Cells[1].Text) ? Color.Green : Color.Red;  
        }


        //e.Row.Cells[0].Text = "<a href=''>" + e.Row.Cells[0].Text + "</a>";

        //String sname, sid;



        /////  sid = e.Row.Cells[0].ToString();
        //sname = e.Row.Cells[1].Text;
        //Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), 1, sname);
        //exam.GetQuestions();
        //Session.Add("questions", exam);
        //Response.Redirect("Audit.aspx");

    }




}


