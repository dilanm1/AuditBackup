using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Security;

namespace AuditMgtNew
{
    public partial class StartAuditJMTier2 : System.Web.UI.Page
    {
        public string GetName
        {
            get { return DropDownList1.SelectedItem.Text.ToString(); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // Button1.Text = "OK";

            Label52.Visible = false;
            //  TextBox123.Text = "Jumeirah Group Corporate";
            foreach (ListItem item in contentcheck.Items)
            {
                if (item.Selected)
                {
                    if (contentcheck.SelectedValue == "SBU Audit")
                    {
                        // Response.Redirect("JMIndicatorsCorporate.aspx");
                        DropDownList2.Visible = false;
                        DropDownList2.Enabled = false;
                        //  Session["location"] = DropDownList1.SelectedItem.Text;
                        Labeld2.Visible = false;
                    }
                    else
                    {
                        if (contentcheck.SelectedValue == "Sub SBU Audit")
                            DropDownList2.Visible = true;
                        DropDownList2.Enabled = true;
                        Labeld2.Visible = true;
                        //   Session["location"] = DropDownList2.SelectedItem.Text;
                    }
                }
            }
            if (!IsPostBack)
            {
                //  BindBusinessdropdown();
                BindBusinessNames();
                //LabelAdd.Text = DropDownList1.SelectedItem.Text;




            }


        }
        protected void BindBusinessNames()
        {
            try
            {

                SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select Unit from tblBuilding WHERE VerticalName = " + "Jumeirah Group Corporate", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "Unit";
                //   DropDownList1.DataValueField = "SubVerticalID";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();
                //  DropDownList1.Items.Insert(0, "");
                //   DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));
                //   DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                // Handle the error
            }
            DropDownList1.Items.Insert(0, new ListItem("<Select>", "0"));

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lbllocation.Text = DropDownList1.SelectedItem.Text.ToString();

                int CountryID = Convert.ToInt32(DropDownList1.SelectedValue);
                SqlConnection con2 = new SqlConnection(DBUtil.ConnectionString);
                con2.Open();
                SqlCommand cmd2 = new SqlCommand("select SubUnit from tblBuilding whereVerticalName = " + "Jumeirah Group Corporate", con2);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd2);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                con2.Close();
                DropDownList2.DataSource = ds1;
                DropDownList2.DataTextField = "SubUnit";
                DropDownList2.DataValueField = "id";
                DropDownList2.DataBind();



            }
            catch (Exception ex)
            {
                // Handle the error
            }

            DropDownList2.Items.Insert(0, new ListItem("<Select>", "0"));
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {


            //  DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));
            //if (DropDownList1312.SelectedValue == "0")
            //{
            //    ddlRegion.Items.Clear();
            //    ddlRegion.Items.Insert(0, new ListItem("--Select--", "0"));
            //}
            lbllocation.Text = DropDownList2.SelectedItem.Text.ToString();
        }
        protected void btnStart_Click(object sender, EventArgs e)
        {

            bool readerHasRows = false;

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            //string color_na = textBox3.Text;
            string commandQuery = "SELECT location,mid FROM oe_Audits WHERE location = @loc and mid=@mid";
            using (SqlCommand cmd = new SqlCommand(commandQuery, con))
            {
                cmd.Parameters.AddWithValue("@loc", lbllocation.Text);
                cmd.Parameters.AddWithValue("@mid", Int32.Parse(Session["mid"].ToString()));


                //  SqlConnection con2 = new SqlConnection(conn);
                using (con)
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    // bool initialized above is set here
                    readerHasRows = (reader != null && reader.HasRows);
                }
            }

            if (readerHasRows)
            {

                Label52.Text = "There is an existing Audit already!!";
                Label52.Visible = true;




            }

            else
            {
                // 
                String sid, sname, location;

                sid = "1";
                sname = "General Requirements,Leadership and Accountability";
                location = lbllocation.Text;
                Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), Int32.Parse(sid), sname, location);
                exam.GetQuestions();
                Session.Add("questions", exam);
                Response.Redirect("Audit1.aspx");
            }
        }
    }
}