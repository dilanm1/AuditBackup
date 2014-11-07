using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditMgtNew
{
    public partial class AuditLevelConsusDP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            foreach (ListItem item in contentcheck.Items)
            {
                if (item.Selected)
                {
                    //if (contentcheck.SelectedValue == "Introductory Audit")
                    //    // Response.Redirect("JMIndicatorsCorporate.aspx");
                    //    Response.Redirect("AuditReviewConsus.aspx?location=" + "Jumeirah Group");
                    //else
                    if (contentcheck.SelectedValue == "First Tier Audit Review")
                    {
                        Session["location"] = "Dubai Property Group Corporate";
                        Response.Redirect("DPIndicatorsCorporate.aspx");
                    }
                    else
                        if (contentcheck.SelectedValue == "Second Tier Audit Review")
                            Response.Redirect("DPIndicators.aspx");

                }
            }

        }
    }
}