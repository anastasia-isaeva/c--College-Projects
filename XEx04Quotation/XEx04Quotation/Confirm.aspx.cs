using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx04Quotation
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["salesPrice"] != null)
            {
                lblSalesPrice.Text = Session["salesPrice"].ToString();
            }
            if (Session["discountAmount"] != null)
            {
                lblDiscountAmount.Text = Session["discountAmount"].ToString();
            }
            if (Session["totalPrice"] != null)
            {
                lblTotalPrice.Text = Session["totalPrice"].ToString();
            }
            
        }

        protected void btnSendQuotation_Click(object sender, EventArgs e)
        {
            
            string name = txtName.Text.ToString();
            string email = txtEmail.Text.ToString();
            if (name != null && email != null)
            {
                lblQuotationSend.Visible = true; 
                lblQuotationSend.Text = ("Quotation sent to " + name + " at " + email);
            }
        }
    }
}