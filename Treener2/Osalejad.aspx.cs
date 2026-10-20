
using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treener2
{
    public partial class Osalejad : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceOsalejad_Deleted(
            object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                SqlException sqlException = e.Exception as SqlException;

                if (sqlException != null && sqlException.Number == 547)
                {
                    e.ExceptionHandled = true;

                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "Hoiatus",
                        "alert('Osalejat ei saa kustutada, sest temaga on seotud teised andmed.');",
                        true
                    );
                }
            }
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
