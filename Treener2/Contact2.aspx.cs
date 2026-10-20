
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Treener2
{
    public partial class Contact2 : Page
    {
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int treenerID = Convert.ToInt32(
                GridView1.DataKeys[e.RowIndex].Value);

            string connectionString = ConfigurationManager
                .ConnectionStrings["Treener2ConnectionString4"]
                .ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM TreeningSet WHERE Treener_TreenerID = @TreenerID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TreenerID", treenerID);

                    connection.Open();

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        e.Cancel = true;

                        ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "Hoiatus",
                            "alert('Treenerit ei saa kustutada, sest temaga on seotud treeningud.');",
                            true
                        );
                    }
                }
            }
        }
    }
}
