
using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treener2
{
    public partial class Treeningud : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceTreeningud_Deleted(
            object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                SqlException sqlException =
                    e.Exception as SqlException;

                if (sqlException != null &&
                    sqlException.Number == 547)
                {
                    e.ExceptionHandled = true;

                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "Hoiatus",
                        "alert('Treeningut ei saa kustutada, sest sellega on seotud teised andmed.');",
                        true
                    );
                }
            }
        }

        protected void SqlDataSourceLisaTreening_Inserted(
            object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception == null)
            {
                GridView1.DataBind();
            }
        }
    }
}
