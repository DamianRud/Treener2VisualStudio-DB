
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treener2
{
    public partial class Contact3 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int spordialaID = Convert.ToInt32(
                GridView1.DataKeys[e.RowIndex].Value);

            string connectionString = ConfigurationManager
                .ConnectionStrings["Treener2ConnectionString1"]
                .ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM [VoistlusSet] WHERE [Spordiala_SpordialaID] = @SpordialaID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SpordialaID", spordialaID);
                    connection.Open();

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        e.Cancel = true;

                        ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "Hoiatus",
                            "alert('Spordiala ei saa kustutada, sest sellega on seotud võistlused.');",
                            true
                        );
                    }
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
