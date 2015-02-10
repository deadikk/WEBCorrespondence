<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebCorrespondence._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">

         <style>

             .imageFullScreen {
             
                 z-index:100;
                 
                 width:600px;
                 height:1000px;
                 position:fixed;
                 margin:0px 0px 0px -300px ;
                 background-image:url('file://10.1.56.57/Collect/Corrensopndence/52_Koala.jpg');
                 background-repeat:no-repeat;
                 left:50%;
                 display:none;

             }

             .fileUploadStyle {
             padding:1px;
             margin:1px;
             
             }
        

        .CARD_Table{
            border:0px;
            margin:auto;
            padding:5px;
        }
               
        .CARD_Table tr{
           
            border:1px solid;
             width:100%;
             margin:1px;
             padding:10px;
        }

             td {
             padding:0px;
             }
      
        
       
             .boxToEdit {
             
             width:100%;
             padding:0px;
             margin:0px;
            
             border:0px;
             
             }

             
                 

    </style>

         <div id="cardId" class="card" runat="server"  >

         <div id="closeCard">

            <img id="closeCardImg" class="closeCARD"  onclick="closeCardBTN()" onmouseover="ShowADD(1)" onmouseout="ShowADD(2)" src="Images/img/CARD/blue-cross-icon.png" />

         </div>

             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            
                  <ContentTemplate>
       <asp:Table ID="CARD_Table" runat="server"  CssClass="CARD_Table" CellPadding="1" CellSpacing="1"  CaptionAlign="Right">

        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Статус</asp:TableCell>
            <asp:TableCell runat="server"><asp:DropDownList  runat="server" Width="100%" ID="StatusCard"  AutoPostBack="true" AppendDataBoundItems="True"></asp:DropDownList></asp:TableCell>
            <asp:TableCell runat="server" ID="FileList"></asp:TableCell>
        </asp:TableRow>

        <asp:TableRow ID="TableRow2" runat="server" >
            <asp:TableCell ID="TableCell3" runat="server">Дата добавления</asp:TableCell>
            <asp:TableCell ID="TableCell4" runat="server"> <asp:TextBox ID="txtDate" runat="server" CssClass="boxToEdit" ></asp:TextBox> </asp:TableCell>
        </asp:TableRow>

           <asp:TableRow ID="TableRow1" runat="server"  >
            <asp:TableCell ID="TableCell1" runat="server">Категория</asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server">
                    <asp:DropDownList  runat="server" Width="100%" ID="CardCategory" AutoPostBack="true" ></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

               <asp:TableRow ID="TableRow3" runat="server"  >
            <asp:TableCell ID="TableCell5" runat="server">Подкатегория</asp:TableCell>
            <asp:TableCell ID="TableCell6" runat="server">
                <asp:DropDownList  runat="server" Width="100%" ID="CardSubCategory"  AutoPostBack="true"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

           <asp:TableRow ID="TableRow4" runat="server"  >
            <asp:TableCell ID="TableCell7" runat="server">Тип документа</asp:TableCell>
            <asp:TableCell ID="TableCell8" runat="server">
                <asp:DropDownList  runat="server" Width="100%" ID="CardType"  AutoPostBack="true"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

            <asp:TableRow ID="TableRow5" runat="server"  >
            <asp:TableCell ID="TableCell9" runat="server">Тип отправителя</asp:TableCell>
            <asp:TableCell ID="TableCell10" runat="server">
                <asp:DropDownList  runat="server" Width="100%" ID="TypeSenderCard"  AutoPostBack="true"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

           <asp:TableRow ID="TableRow6" runat="server"  >
            <asp:TableCell ID="TableCell11" runat="server">Отправитель</asp:TableCell>
            <asp:TableCell ID="TableCell12" runat="server">
                <asp:TextBox ID="Sender" runat="server"  CssClass="boxToEdit"  ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

            <asp:TableRow ID="TableRow7" runat="server"  >
            <asp:TableCell ID="TableCell13" runat="server">Получатель</asp:TableCell>
            <asp:TableCell ID="TableCell14" runat="server">
                <asp:TextBox ID="Receiver" runat="server" CssClass="boxToEdit" ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

            <asp:TableRow ID="TableRow8" runat="server"  >
            <asp:TableCell ID="TableCell15" runat="server">Исполнитель</asp:TableCell>
            <asp:TableCell ID="TableCell16" runat="server">
                <asp:TextBox ID="Executor" runat="server" CssClass="boxToEdit" ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

          

            <asp:TableRow ID="TableRow12" runat="server"  >
            <asp:TableCell ID="TableCell23" runat="server">Последнее изменение</asp:TableCell>
            <asp:TableCell ID="TableCell24" runat="server">
                <asp:TextBox ID="modifyDateTxt" runat="server" CssClass="boxToEdit" ReadOnly="True"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

           
            </asp:Table>
             </ContentTemplate>
              </asp:UpdatePanel>
             
             <asp:Table runat="server" CssClass="CARD_Table"  >
        <asp:TableRow ID="TableRow9" runat="server"  >
            <asp:TableCell ID="TableCell17" runat="server">
                <asp:Button runat="server" Text="Добавить связи"  Width="200px" ID="addRelations" OnClick="addRelation_Click" OnClientClick="return false;" />                
            </asp:TableCell>
              <asp:TableCell ID="TableCell22" runat="server">
                       <asp:Label runat="server" ID="RelationText" Text=""></asp:Label>
            </asp:TableCell>
                
            
        </asp:TableRow>

           <asp:TableRow ID="TableRow11" runat="server"  >
            <asp:TableCell ID="TableCell18" runat="server">
                    <asp:Label runat="server" ID="Label1" Text="Загрузить сканы документа"></asp:Label>    
            </asp:TableCell>
                <asp:TableCell ID="TableCell20" runat="server">
                        <%-- <asp:FileUpload  runat="server" AllowMultiple="true" id="filesToUpload" CssClass="fileUploadStyle" />
                        <asp:Button runat="server" Text="Загрузить" ID="saveFilesBtn" OnClick="saveFilesBtn_Click"   />--%>
                     <input type="file" id="myfile" multiple="multiple" name="myfile" runat="server"/>
            </asp:TableCell>           
                               
            
        </asp:TableRow>



           <asp:TableRow ID="TableRow10" runat="server">            
                 <asp:TableCell ID="TableCell21" runat="server">
                          <asp:Button runat="server" Text="Сохранить" Width="200px"  ID="saveDoc" OnClick="saveDoc_Click" />
            </asp:TableCell>

        </asp:TableRow>


            <asp:TableRow ID="TableRow13" runat="server">     
                                      
                 <asp:TableCell ID="files" runat="server">                   

            </asp:TableCell>

        </asp:TableRow>


       </asp:Table> 
         
    <script src="Scripts/jquery-1.8.2.js"></script>

    <script src="Scripts/jquery-ui-1.8.24.js"></script>
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />
    
    <script type="text/javascript">
        $(function () {
            $("[id$=txtDate]").datepicker({ dateFormat: 'dd.mm.yy' });
        });
    </script>

           
    </div>
        
    
     <div runat="server" class="imageFullScreen" id="divForImage"> 

    </div> 


   <asp:LinkButton runat="server" ID="imgFirst" ToolTip="file://10.1.56.57/Collect/Corrensopndence/52_Jellyfish.jpg" OnClick="imgFirst_Click" >asp_link</asp:LinkButton> 
    


         <div id="page" class="pageGr">
             <asp:ImageButton ImageUrl="Images/img/Menu/yellow-plus-icon.png" id="plusBtn" runat="server" CssClass="plusBtn" OnClick="plusBtn_Click1"  />
          <%--    <img title="Add document" src="Images/img/Menu/yellow-plus-icon.png" id="plusBtn" runat="server" class="plusBtn" onclick="openNewCard()"  onmouseover="ShowADD(3)" onmouseout="ShowADD(4)"/>--%>

        <div id="doc_Table" class="TableGr">

            <asp:GridView ID="Main_Table" runat="server" CellPadding="2" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="Main_Table_SelectedIndexChanged" AllowSorting="True" DataKeyNames="id">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="true" InsertVisible="False" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
                    <asp:BoundField DataField="Создание" HeaderText="Создание" SortExpression="Создание" />
                    <asp:BoundField DataField="Последнее изменение" HeaderText="Последнее изменение" SortExpression="Последнее изменение" />
                    <asp:BoundField DataField="Отправитель" HeaderText="Отправитель" SortExpression="Отправитель" ReadOnly="True" />
                    <asp:BoundField DataField="Имя отправителя" HeaderText="Имя отправителя" SortExpression="Имя отправителя" />
                    <asp:BoundField DataField="Категория" HeaderText="Категория" SortExpression="Категория" ReadOnly="True" />
                    <asp:BoundField DataField="Подкатегория" HeaderText="Подкатегория" SortExpression="Подкатегория" ReadOnly="True" />
                    <asp:BoundField DataField="Тип" HeaderText="Тип" SortExpression="Тип" ReadOnly="True" />
                    <asp:BoundField DataField="Получатель" HeaderText="Получатель" SortExpression="Получатель" />
                    <asp:BoundField DataField="Исполнитель" HeaderText="Исполнитель" SortExpression="Исполнитель" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CorrespondenceConnectionString %>" SelectCommand="select d.id, dic.Name as 'Статус', d.addDate as 'Создание', d.modifyDate as 'Последнее изменение', dic5.Code+dic5.Name as 'Отправитель', d.sender as 'Имя отправителя',dic2.Code + dic2.Name as 'Категория',dic3.Code+dic3.Name as 'Подкатегория',dic4.Code+dic4.Name as 'Тип', d.receiver as 'Получатель', d.executor as 'Исполнитель' 
from Document d
inner join Dictionary dic on dic.id=d.status
inner join Dictionary dic2 on dic2.id=d.category
inner join Dictionary dic3 on dic3.id=d.subCategory
inner join Dictionary dic4 on dic4.id=d.type
inner join Dictionary dic5 on dic5.id=d.senderType"></asp:SqlDataSource>

        </div>

       

    </div>

   

         <script>




             function ShowCard() {
                 //alert(document.getElementById('FeaturedContent_cardId').style.display);

                 document.getElementById('<%= cardId.ClientID %>').style.display = 'block';
                 
                <%-- alert(document.getElementById('<%=cardId.ClientID %>').style.display);--%>
             }

             function closeCardBTN() {
                 document.getElementById('<%= cardId.ClientID %>').style.display = 'none';
             }

             function ShowADD(a) {
                 if (a == 1) {
                     document.getElementById('closeCardImg').src = "Images/img/CARD/red-cross-icon.png";
                 }
                 else if (a == 2) {
                     document.getElementById('closeCardImg').src = "Images/img/CARD/blue-cross-icon.png";
                 }

             }

   </script>

</asp:Content>
