using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx06Reservation
{
    public partial class Request : System.Web.UI.Page
    {
        private string currentDate = DateTime.Today.ToShortDateString();
        private string currentYear = DateTime.Today.Year.ToString();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            txtArrivalDate.Text = currentDate;
            lblYear.Text = currentYear;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Thank you for your request.<br>We will get back to you within 24 hours.";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtArrivalDate.Text = currentDate;
            txtDepartureDate.Text = String.Empty;
            txtEmailAddress.Text = String.Empty;
            txtFirstName.Text = String.Empty;
            txtLastName.Text = String.Empty;
            txtSpecialRequests.Text = String.Empty;
            txtTelephoneNumber.Text = String.Empty;
            ddlNumberOfPeople.SelectedIndex = 0;
            ddlPreferedMethod.SelectedIndex = 0;
            rblBedType.SelectedIndex = 0;
            lblMessage.Text = String.Empty;
        }
    }
}