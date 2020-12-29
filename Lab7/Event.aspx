<%@ Page Title="События" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="Lab7.Event" %>
<asp:Content ID="ContentEvent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelEvent" runat="server" Font-Size="Large">Список событий</asp:Label>
    <br />
    Найти событие:&nbsp;<asp:TextBox ID="Name" runat="server" Width="15%" Text=""></asp:TextBox>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceEvent">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            Название:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <asp:RegularExpressionValidator ControlToValidate="NameTextBox" runat="server" ID="RegularNameTextBox" ErrorMessage="Неправильная длина названия" ValidationExpression="^.{10,50}$"></asp:RegularExpressionValidator>
            <br />
            Единица измерения:
            <asp:TextBox ID="UnitTextBox" runat="server" Text='<%# Bind("Unit") %>' />
            <asp:RegularExpressionValidator ControlToValidate="UnitTextBox" runat="server" ID="RegularUnitTextBox" ErrorMessage="Неправильная длина единицы измерения" ValidationExpression="^.{1,10}$"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Добавление" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить событие" />
        </ItemTemplate>
    </asp:FormView>
    <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="События" Font-Bold="true"></asp:Label>

<asp:GridView ID="GridViewEvent" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceEvent">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Название" SortExpression="Name" />
        <asp:BoundField DataField="Unit" HeaderText="Единица измерения" SortExpression="Unit" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceEvent" runat="server" 
    ConnectionString="<%$ ConnectionStrings:EventPlansConnection %>" 
    SelectCommand="SELECT * FROM [Events] WHERE ((Name LIKE '%'+ ISNULL(@Name,'')+'%'))" 
    DeleteCommand="DELETE FROM [Events] WHERE [Id] = @Id" 
    UpdateCommand="UPDATE [Events] SET [Name] = @Name, [Unit] = @Unit WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Events] ([Id], [Name], [Unit]) VALUES ((SELECT MAX(Events.Id) FROM Events) + 1, @Name, @Unit)">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Unit" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" ConvertEmptyStringToNull="False" DbType="String"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Unit" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>