using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

namespace AuditMgtNew
{
    public partial class SelectSBUConsusDP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = ("select distinct locationid,location from tbllocation2 where verticalid =" + 2);
                DataSet1 dt = GetData(query);
                ddlCountries.DataSource = dt;
                ddlCountries.DataTextField = "location";
                ddlCountries.DataValueField = "location";
                ddlCountries.DataBind();
                ddlCountries.Items.Insert(0, new ListItem("Select", ""));
            }

        }
        private DataSet1 GetData(string query)
        {

            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(DBUtil.ConnectionString))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;


                    using (DataSet1 dsCustomers = new DataSet1())
                    {
                        sda.Fill(dsCustomers, "DataTable1");
                        con.Close();
                        return dsCustomers;
                    }
                }
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session["location"] = ddlCountries.SelectedItem.Text;
            Response.Redirect("IndicatorsDPConsus.aspx");  

        }
    
        
    }
}