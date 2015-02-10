using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebCorrespondence
{
    public partial class Users : System.Web.UI.Page
    {

        string connectionSTR = "Data Source=TEST-COLLECTSRV;Initial Catalog=Correspondence;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // ADD NEW USER
        #region ADD NEW USER
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            // TO DO !!!
            //if(txtLogin.Text.Length>2)
            //{ }
            //else
            //{

            //}

            SqlConnection con = new SqlConnection(connectionSTR);

            string queryString = "INSERT into Users (login, name, email, phone) VALUES ('" + txtLogin.Text + "', '" + txtName.Text + "', '" + txtEmail.Text + "', '" + txtPhone.Text + "')";

            SqlCommand command = new SqlCommand(queryString, con);

            string queryString2 = "SELECT id from USERS where login = '" + txtLogin.Text + "'";
            SqlCommand command2 = new SqlCommand(queryString2, con);
            SqlDataReader reader;

            string queryString3 = "";

            con.Open();

            try
            {
                command.ExecuteNonQuery();
            }
            catch
            {

                txtLogin.Style["border-color"] = "red";
            }



            reader = command2.ExecuteReader();


            while (reader.Read())
            {
                queryString3 = "INSERT into UserRights (userid) VALUES ('" + int.Parse(reader[0].ToString()) + "')";
            }

            reader.Close();

            SqlCommand command3 = new SqlCommand(queryString3, con);
            try
            {
                command3.ExecuteNonQuery();
            }
            catch
            {

            }

            con.Close();
        }

        #endregion


        #region UPDATE USERsGridView after EDIT

        // Method to Update UserGrid
        public void UserGrUpd()
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);

        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            UserGrUpd();
        }

        protected void DetailsView2_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            UserGrUpd();
        }

        #endregion








    }
}