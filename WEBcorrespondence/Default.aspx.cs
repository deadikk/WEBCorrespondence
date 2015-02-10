using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
namespace WebCorrespondence
{
    public partial class _Default : Page
    {


       
        

        const string connectionString = @"Data Source=10.1.56.57;Initial Catalog=Correspondence;Integrated Security=True";
        const string filepath = @"\\10.1.56.57\Collect\Corrensopndence\";
        protected void Page_Load(object sender, EventArgs e)
        {


            plusBtn.Attributes.Add("onmouseover", "src='Images/img/Menu/green-plus-icon.png'");
            plusBtn.Attributes.Add("onmouseout", "src='Images/img/Menu/yellow-plus-icon.png'");
            plusBtn.Style["background-color"] = "none";

        }

       
        protected void Main_Table_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            cardId.Style["display"] = "block";
           
            int id= int.Parse(Main_Table.SelectedRow.Cells[1].Text);

            insertDataIntoCard(id);            
            loadCardFiles(id);

        }

        private void initOfDropdownLists() {
            loadStatusCard();
            loadSenderCategory();
            loadCategory();
            loadSubCategory();
            loadCardType();
            Sender.Text="";
            Receiver.Text="";
            Executor.Text="";
            txtDate.Text = "";
            modifyDateTxt.Text="";

        }


        private void insertDataIntoCard(int id) {
            try { 
            SqlConnection conn6 = new SqlConnection(connectionString);
            conn6.Open();

            SqlCommand command6 = conn6.CreateCommand();

            DateTime addDate=new DateTime(), modifyDate=new DateTime();
            int status=0, category=0, subCategory=0, type=0, senderType=0;
            string selected_sender="", selected_receiver="", selected_executor="";
            command6.CommandText = @"select status, addDate, category, subCategory, type, senderType, sender, receiver, executor, modifyDate from Document where id=" + id;
            SqlDataReader reader;
            reader = command6.ExecuteReader();

            while (reader.Read())
            {
                status = reader.GetInt32(0);
                addDate = reader.GetDateTime(1);
                category = reader.GetInt32(2);
                subCategory = reader.GetInt32(3);
                type = reader.GetInt32(4);
                senderType = reader.GetInt32(5);
                selected_sender = reader.GetString(6);
                selected_receiver = reader.GetString(7);
                selected_executor = reader.GetString(8);
                modifyDate = reader.GetDateTime(9);
            }


            StatusCard.Items.FindByValue(status.ToString());
            TypeSenderCard.Items.FindByValue(senderType.ToString());
            CardCategory.Items.FindByValue(category.ToString());
            CardSubCategory.Items.FindByValue(subCategory.ToString());
            CardType.Items.FindByValue(type.ToString());

            Sender.Text = selected_sender;
            Receiver.Text = selected_receiver;
            Executor.Text = selected_executor;

            txtDate.Text = addDate.ToString();
            modifyDateTxt.Text=modifyDate.ToString();
                conn6.Close();

                
        }
        catch{}
        }

        private void loadCardFiles(int id) {
            try
            {
                SqlConnection conn6 = new SqlConnection(connectionString);
                conn6.Open();
                SqlCommand command6 = conn6.CreateCommand();
                command6.CommandText = @"select link from Doc_Links where id_document=" + id;
                SqlDataReader reader;
                reader = command6.ExecuteReader();
                

                while (reader.Read())
                {                   
                    insertCardFileIntoTable(reader.GetString(0));
                }

                conn6.Close();
            }
            catch { }

        }

        private void insertCardFileIntoTable(string fileName) {

            string fileforUrl=fileName.Replace('\\','/');
            string nam = Path.GetFileName(fileName);

            files.Text += " <a target='_blank' href='file:"+fileforUrl+"' >" + nam + " <a/>  <br />";
            
                        

            //<a  href="javascript:__doPostBack('ctl00$FeaturedContent$imgFirst','')">asp_link</a>

            
            //<a id="FeaturedContent_imgFirst" href="javascript:__doPostBack('ctl00$FeaturedContent$imgFirst','')" title="file://10.1.56.57/Collect/Corrensopndence/52_Jellyfish.jpg">asp_link</a>

            //<asp:LinkButton runat="server" ID="imgFirst" ToolTip="file://10.1.56.57/Collect/Corrensopndence/52_Jellyfish.jpg" OnClick="imgFirst_Click" >asp_link</asp:LinkButton> 
        
        }

        private void loadStatusCard()
        {

            StatusCard.Items.Clear();

            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();

            SqlCommand command = connect.CreateCommand();

            command.CommandText = "select id,[Name] from Dictionary where specId=1 order by id";
            SqlDataReader reader;
            reader = command.ExecuteReader();

            while (reader.Read())
            {

                ListItem i = new ListItem(reader.GetString(1), reader.GetInt32(0).ToString());

                StatusCard.Items.Add(i);


            }


            connect.Close();

        }

        private void loadSenderCategory()
        {
            TypeSenderCard.Items.Clear();
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();

            SqlCommand command = connect.CreateCommand();

            command.CommandText = "select id,[Name],Code from Dictionary where specId=5 order by Code";
            SqlDataReader reader;
            reader = command.ExecuteReader();

            while (reader.Read())
            {

                ListItem i = new ListItem(reader.GetString(2) + " " + reader.GetString(1), reader.GetInt32(0).ToString());

                TypeSenderCard.Items.Add(i);


            }


            connect.Close();

        }

        private void loadCategory()
        {
            CardCategory.Items.Clear();
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();

            SqlCommand command = connect.CreateCommand();

            command.CommandText = "select id,[Name],Code from Dictionary where specId=2 order by Code";
            SqlDataReader reader;
            reader = command.ExecuteReader();

            while (reader.Read())
            {

                ListItem i = new ListItem(reader.GetString(2) + " " + reader.GetString(1), reader.GetInt32(0).ToString());

                CardCategory.Items.Add(i);


            }


            connect.Close();

        }

        private void loadSubCategory()
        {
            CardSubCategory.Items.Clear();
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();

            SqlCommand command = connect.CreateCommand();

            command.CommandText = "select id,[Name],Code from Dictionary where specId=3 order by Code";
            SqlDataReader reader;
            reader = command.ExecuteReader();

            while (reader.Read())
            {

                ListItem i = new ListItem(reader.GetString(2) + " " + reader.GetString(1), reader.GetInt32(0).ToString());

                CardSubCategory.Items.Add(i);


            }


            connect.Close();

        }

        private void loadCardType()
        {
            CardType.Items.Clear();
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();

            SqlCommand command = connect.CreateCommand();

            command.CommandText = "select id,[Name],Code from Dictionary where specId=4 order by Code";
            SqlDataReader reader;
            reader = command.ExecuteReader();

            while (reader.Read())
            {

                ListItem i = new ListItem(reader.GetString(2) + " " + reader.GetString(1), reader.GetInt32(0).ToString());

                CardType.Items.Add(i);


            }


            connect.Close();

        }

        protected void saveDoc_Click(object sender, EventArgs e)
        {
              
            int status, category, subCategory, type, senderType;
            string senderName, receiverName, executerName;
            string addDate;
            try
            {
            

            status = int.Parse(StatusCard.SelectedValue);
            category = int.Parse(CardCategory.SelectedValue);
            subCategory = int.Parse(CardSubCategory.SelectedValue);
            type = int.Parse(CardType.SelectedValue);
            senderType = int.Parse(TypeSenderCard.SelectedValue);

            senderName = Sender.Text;
            receiverName = Receiver.Text;
            executerName = Executor.Text;
            //addDate = txtDate.Text;
            int newId = 0;
            addDate = DateTime.ParseExact(txtDate.Text, "dd.mm.yyyy", null).ToShortDateString();



            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand myCommand = conn.CreateCommand();

            myCommand.CommandText = @"INSERT INTO Document(status,addDate,modifyDate,category,subCategory,type,senderType,sender,receiver,executor)
            Values('" + status + "', '" + addDate + "', GETDATE(), '" + category + "', '" + subCategory + "', '" + type + "', '" + senderType + "', '" + senderName + "', '" + receiverName + "', '" + executerName + "')" +
                       " SELECT CONVERT(Int,SCOPE_IDENTITY()) AS [value] ";

//            myCommand.CommandText = @"INSERT INTO Document(status, addDate, modifyDate,category,subCategory,type,senderType,sender,receiver,executor)
//            Values('" + status + "',  GETDATE(), GETDATE(), '" + category + "', '" + subCategory + "', '" + type + "', '" + senderType + "', '" + senderName + "', '" + receiverName + "', '" + executerName + "')" +
//                   " SELECT CONVERT(Int,SCOPE_IDENTITY()) AS [value] ";


         
                           
            newId = (int)myCommand.ExecuteScalar();
            conn.Close();

            saveFilesToServer(newId);

            cardId.Style["display"] = "none";

            Main_Table.DataBind();
        }
        catch{
           
        }

        }

        private void saveFilesToServer(int DocumentId)
        {



            HttpFileCollection uploadedFiles = Request.Files;


            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];

                if (userPostedFile.ContentLength > 0)
                {
                    string path = filepath + modifyName(Path.GetFileName(userPostedFile.FileName), DocumentId);
                    userPostedFile.SaveAs(path);
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    SqlCommand myCommand = conn.CreateCommand();

                    myCommand.CommandText = @"Insert into Doc_Links(id_document,link) values (" +
                        DocumentId + ", '" + path + "')";
                    myCommand.ExecuteNonQuery();
                    conn.Close();
                }

            }
        }

        private string modifyName(string name, int DocumentId)
        {

            return DocumentId + "_" + name;

        }


        protected void addRelation_Click(object sender, EventArgs e)
        { 
        
        }

        protected void plusBtn_Click1(object sender, ImageClickEventArgs e)
        {
            cardId.Style["display"] = "block";
            initOfDropdownLists();
        }

        protected void imgFirst_Click(object sender, EventArgs e)
        {
            LinkButton lb=sender as LinkButton;

            divForImage.Style["display"] = "block";
            divForImage.Style["background-image"] = "url('" + lb.ToolTip+"')";
        }




    }
}

//ДОБАВИТЬ
/*
 * 
вывод значений и выбор дропдоуалистов при выборе карточки
вывод списка фалйлов, прикрепленных к карточке

реализовать редактирование карточки, проверкой, была ли она открыта  через + или через Выбор
при редактировании, заменить инсерт на апдейт по выбранному ИД
 */
