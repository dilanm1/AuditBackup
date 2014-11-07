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
    public partial class ReportJMVerticalQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/ReportAuditor.rdlc");
                AuditorDataSet dsCustomers = GetData("select * from tblSavedAnswersAuditor");
                ReportDataSource datasource = new ReportDataSource("DataSet1", dsCustomers.Tables[0]);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }
        private AuditorDataSet GetData(string query)
        {

            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(DBUtil.ConnectionString))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;


                    using (AuditorDataSet dsCustomers = new AuditorDataSet())
                    {
                        sda.Fill(dsCustomers, "DataTable2");
                        con.Close();
                        return dsCustomers;
                    }
                }
            }
        }
    }
}