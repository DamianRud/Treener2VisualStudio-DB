
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treener2
{
    public partial class Treeniregistreerimine : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceLisa_Inserted(
            object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception == null)
            {
                GridView1.DataBind();
            }
        }
    }
}
