<%@ Page Title="Работников" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Lab7.Employee" %>
<asp:Content ID="ContentEmployee" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelEmpl" runat="server" Font-Size="Large">Список работников</asp:Label>
    <br />
    Найти работника:&nbsp;<asp:TextBox ID="FIO" runat="server" Width="15%" Text=""></asp:TextBox>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceEmployees">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            ФИО:
            <asp:TextBox ID="FIOTextBox" runat="server" Text='<%# Bind("FIO") %>' />
            <asp:RegularExpressionValidator ControlToValidate="FIOTextBox" runat="server" ID="RegularFIOTextBox" ErrorMessage="Неправильная длина ФИО" ValidationExpression="^.{18,100}$"></asp:RegularExpressionValidator>
            <br />
            Должность:
            <asp:TextBox ID="PositionTextBox" runat="server" Text='<%# Bind("Position") %>' />
            <asp:RegularExpressionValidator ControlToValidate="PositionTextBox" runat="server" ID="RegularPositionTextBox" ErrorMessage="Неправильная длина должности" ValidationExpression="^.{10,50}$"></asp:RegularExpressionValidator>
            <br />
            Номер:
            <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' />
            <asp:RegularExpressionValidator ControlToValidate="NumberTextBox" runat="server" ID="RegularNumberTextBox" ErrorMessage="Неправильный номер" ValidationExpression="^([\+][0-9]{1,3}([ \.\-])?)?([\(]{1}[0-9]{3}[\)])?([0-9A-Z \.\-]{1,32})((x|ext|extension)?[0-9]{1,4}?)$"></asp:RegularExpressionValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Добавление" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить работника" />
        </ItemTemplate>
    </asp:FormView>
                <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="Работники" Font-Bold="true"></asp:Label>

<asp:GridView ID="GridViewEmployee" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceEmployees">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="FIO" HeaderText="ФИО" SortExpression="FIO" />
        <asp:BoundField DataField="Position" HeaderText="Должность" SortExpression="Position" />
        <asp:BoundField DataField="Number" HeaderText="Номер" SortExpression="Number" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceEmployees" runat="server" 
    ConnectionString="<%$ ConnectionStrings:EventPlansConnection %>" 
    SelectCommand="SELECT * FROM [Employees] WHERE ((FIO LIKE '%'+ ISNULL(@FIO,'')+'%'))" 
    DeleteCommand="DELETE FROM [Employees] WHERE [Id] = @Id" 
    UpdateCommand="UPDATE [Employees] SET [FIO] = @FIO, [Position] = @Position, [Number] = @Number WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Employees] ([Id], [FIO], [Position], [Number]) VALUES ((SELECT MAX(Employees.Id) FROM Employees) + 1, @FIO, @Position, @Number)">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FIO" Type="String" />
        <asp:Parameter Name="Position" Type="String" />
        <asp:Parameter Name="Number" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="FIO"  Name="FIO" PropertyName="Text" ConvertEmptyStringToNull="False" DbType="String"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="FIO" Type="String" />
        <asp:Parameter Name="Position" Type="String" />
        <asp:Parameter Name="Number" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
