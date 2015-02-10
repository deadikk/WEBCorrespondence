<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Users.aspx.cs" Inherits="WebCorrespondence.Users" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    
    

     <div id="ADDuserblock" class="card">
         
         <img src="Images/img/CARD/blue-cross-icon.png" id="closeADDuserblock" class="closeCARD" onclick="CloseCard()" onmouseover="ShowUserAdd(3)" onmouseout="ShowUserAdd(4)"/>

         <h1>ADD USER</h1>
        <label>Login</label><asp:TextBox runat="server" ID="txtLogin"></asp:TextBox>
        <label>Name</label><asp:TextBox runat="server" ID="txtName"></asp:TextBox>
        <label>Email</label><asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
        <label>Phone</label><asp:TextBox runat="server" ID="txtPhone"></asp:TextBox>
         <br />
        <asp:Button runat="server" Text="   ADD   " OnClick="Unnamed1_Click"/>

            
        </div>

    <div id="UserPage" class="pageGr">

       
         <img src="Images/img/Menu/yellow-plus-icon.png"  id="plusUserBtn" class="plusBtn" onclick="ShowCard()" onmouseover="ShowUserAdd(1)" onmouseout="ShowUserAdd(2)"/>
                
                    <asp:GridView ID="GridView1" width="100%" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                            <asp:CheckBoxField DataField="createCard" HeaderText="createCard" SortExpression="createCard" />
                            <asp:CheckBoxField DataField="seeArch" HeaderText="seeArch" SortExpression="seeArch" />
                            <asp:CheckBoxField DataField="seeAllExptArch" HeaderText="seeAllExptArch" SortExpression="seeAllExptArch" />
                            <asp:CheckBoxField DataField="updateAll" HeaderText="updateAll" SortExpression="updateAll" />
                            <asp:CheckBoxField DataField="updateStatus" HeaderText="updateStatus" SortExpression="updateStatus" />
                            <asp:CheckBoxField DataField="toTrash" HeaderText="toTrash" SortExpression="toTrash" />
                            <asp:CheckBoxField DataField="toArch" HeaderText="toArch" SortExpression="toArch" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CorrespondenceConnectionString %>" SelectCommand="SELECT Users.login, Users.name, Users.email, Users.phone, UserRights.createCard, UserRights.seeArch, UserRights.seeAllExptArch, UserRights.updateAll, UserRights.updateStatus, UserRights.toTrash, UserRights.toArch, Users.id FROM Users INNER JOIN UserRights ON Users.id = UserRights.userid"></asp:SqlDataSource>
                
            
       

      

      
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="userid" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                <asp:CheckBoxField DataField="createCard" HeaderText="createCard" SortExpression="createCard" />
                <asp:CheckBoxField DataField="seeArch" HeaderText="seeArch" SortExpression="seeArch" />
                <asp:CheckBoxField DataField="seeAllExptArch" HeaderText="seeAllExptArch" SortExpression="seeAllExptArch" />
                <asp:CheckBoxField DataField="updateAll" HeaderText="updateAll" SortExpression="updateAll" />
                <asp:CheckBoxField DataField="updateStatus" HeaderText="updateStatus" SortExpression="updateStatus" />
                <asp:CheckBoxField DataField="toTrash" HeaderText="toTrash" SortExpression="toTrash" />
                <asp:CheckBoxField DataField="toArch" HeaderText="toArch" SortExpression="toArch" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CorrespondenceConnectionString %>" DeleteCommand="DELETE FROM [UserRights] WHERE [userid] = @userid" InsertCommand="INSERT INTO [UserRights] ([userid], [createCard], [seeArch], [seeAllExptArch], [updateAll], [updateStatus], [toTrash], [toArch]) VALUES (@userid, @createCard, @seeArch, @seeAllExptArch, @updateAll, @updateStatus, @toTrash, @toArch)" SelectCommand="SELECT * FROM [UserRights] WHERE ([userid] = @userid)" UpdateCommand="UPDATE [UserRights] SET [id] = @id, [createCard] = @createCard, [seeArch] = @seeArch, [seeAllExptArch] = @seeAllExptArch, [updateAll] = @updateAll, [updateStatus] = @updateStatus, [toTrash] = @toTrash, [toArch] = @toArch WHERE [userid] = @userid">
            <DeleteParameters>
                <asp:Parameter Name="userid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userid" Type="Int32" />
                <asp:Parameter Name="createCard" Type="Boolean" />
                <asp:Parameter Name="seeArch" Type="Boolean" />
                <asp:Parameter Name="seeAllExptArch" Type="Boolean" />
                <asp:Parameter Name="updateAll" Type="Boolean" />
                <asp:Parameter Name="updateStatus" Type="Boolean" />
                <asp:Parameter Name="toTrash" Type="Boolean" />
                <asp:Parameter Name="toArch" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="userid" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="createCard" Type="Boolean" />
                <asp:Parameter Name="seeArch" Type="Boolean" />
                <asp:Parameter Name="seeAllExptArch" Type="Boolean" />
                <asp:Parameter Name="updateAll" Type="Boolean" />
                <asp:Parameter Name="updateStatus" Type="Boolean" />
                <asp:Parameter Name="toTrash" Type="Boolean" />
                <asp:Parameter Name="toArch" Type="Boolean" />
                <asp:Parameter Name="userid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CorrespondenceConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" InsertCommand="INSERT INTO [Users] ([login], [name], [email], [phone]) VALUES (@login, @name, @email, @phone)" SelectCommand="SELECT * FROM [Users] WHERE ([id] = @id)" UpdateCommand="UPDATE [Users] SET [login] = @login, [name] = @name, [email] = @email, [phone] = @phone WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

       

      

      
        <br />

    </div>

    <script>
        function ShowCard() {
            document.getElementById('ADDuserblock').style.display = 'block';
        }

        function CloseCard() {
            document.getElementById('ADDuserblock').style.display = 'none';
        }

        function ShowUserAdd(a) {
            if (a == 1) {
                document.getElementById('plusUserBtn').src = "Images/img/Menu/green-plus-icon.png";
            }
            else if (a == 2) {
                document.getElementById('plusUserBtn').src = "Images/img/Menu/yellow-plus-icon.png";
            }
            if (a == 3) {
                document.getElementById('closeADDuserblock').src = "Images/img/CARD/red-cross-icon.png";
            }
            else if (a == 4) {
                document.getElementById('closeADDuserblock').src = "Images/img/CARD/blue-cross-icon.png";
            }
            else { }
        }

    </script>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 30px;
        }
    </style>
</asp:Content>


