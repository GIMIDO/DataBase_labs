<%@ Page Title="Планируемые организации" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventPlan.aspx.cs" Inherits="Lab7.EventPlan" %>
<asp:Content ID="ContentEventPlan" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelEventPlan" runat="server" Font-Size="Large">Планируемые организации</asp:Label>
    <br />
    Найти событие:&nbsp;
    ФИО работника:&nbsp;<asp:DropDownList ID="DropDownListFIO" runat="server" DataSourceID="SqlDataSourceEmployee" DataTextField="FIO" DataValueField="Id" AutoPostBack="true">
            </asp:DropDownList>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceEventPlan">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            Название организации:
            <asp:DropDownList ID="DropDownListOrgName" runat="server" DataSourceID="SqlDataSourceOrganization" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("OrganizationId") %>'>
            </asp:DropDownList>
            <br />
            Название события:
            <asp:DropDownList ID="DropDownListEventName" runat="server" DataSourceID="SqlDataSourceEvent" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("EventId") %>'>
            </asp:DropDownList>
            <br />
            Дата начала события:
            <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
            <asp:RangeValidator ID="RegularStartDate" runat="server" ControlToValidate="StartDateTextBox" ErrorMessage="Неправильное значение даты" MinimumValue="2000-01-01" MaximumValue="2022-01-01" Type="Date"></asp:RangeValidator>
            <br />
            Дата конца события:
            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
            <asp:RangeValidator ID="RegularEndDate" runat="server" ControlToValidate="EndDateTextBox" ErrorMessage="Неправильное значение даты" MinimumValue="2000-01-01" MaximumValue="2022-01-01" Type="Date"></asp:RangeValidator>
            <br />
            Планируемые объемы:
            <asp:TextBox ID="PlanVolumeTextBox" runat="server" Text='<%# Bind("PlanVolume") %>' />
            <asp:RangeValidator ID="RegularPlanVolume" runat="server" ControlToValidate="PlanVolumeTextBox" ErrorMessage="Неправильное значение объема" MinimumValue="1" MaximumValue="1000" Type="Integer"></asp:RangeValidator>
            <br />
            Планируемая стоимость:
            <asp:TextBox ID="PlanCostTextBox" runat="server" Text='<%# Bind("PlanCost") %>' />
            <asp:RangeValidator ID="RegularPlanCost" runat="server" ControlToValidate="PlanCostTextBox" ErrorMessage="Неправильное значение стоимости" MinimumValue="1" MaximumValue="1000" Type="Double"></asp:RangeValidator>
            <br />
            Экономический эффект:
            <asp:TextBox ID="EcEffTextBox" runat="server" Text='<%# Bind("EconomicEffect") %>' />
            <asp:RangeValidator ID="RegularEcEff" runat="server" ControlToValidate="EcEffTextBox" ErrorMessage="Неправильное значение эффекта" MinimumValue="1" MaximumValue="1000" Type="Double"></asp:RangeValidator>
            <br />
            ФИО работника:
            <asp:DropDownList ID="EmplDropDownList" runat="server" DataSourceID="SqlDataSourceEmployee" DataTextField="FIO" DataValueField="Id" SelectedValue='<%# Bind("EmployeeId") %>'>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Добавление" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить планируемое событие" />
        </ItemTemplate>
    </asp:FormView>
    <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="Планируемые события" Font-Bold="true"/>

    <asp:GridView ID="GridViewEventPlan" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceEventPlan">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="Название организации" SortExpression="Name">
                <EditItemTemplate>
                    <asp:DropDownList ID="OrgIdList" runat="server" DataSourceID="SqlDataSourceOrganization" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("OrganizationId") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OrgID" runat="server"  Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Название события" SortExpression="Name">
                <EditItemTemplate>
                    <asp:DropDownList ID="EventIdList" runat="server" DataSourceID="SqlDataSourceEvent" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("EventId") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="EventID" runat="server"  Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="StartDate" HeaderText="Дата начала" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="Дата конца" SortExpression="EndDate" />
            <asp:BoundField DataField="PlanVolume" HeaderText="Планируемый объем" SortExpression="PlanVolume" />
            <asp:BoundField DataField="PlanCost" HeaderText="Вес" SortExpression="PlanCost" />
            <asp:BoundField DataField="EconomicEffect" HeaderText="Экономический эффект" SortExpression="EconomicEffect" />

            <asp:TemplateField HeaderText="ФИО работника" SortExpression="FIO">
                <EditItemTemplate>
                    <asp:DropDownList ID="EmployeeId" runat="server" DataSourceID="SqlDataSourceEmployee" DataTextField="FIO" DataValueField="Id" SelectedValue='<%# Bind("EmployeeId") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="EmployeeID" runat="server"  Text='<%# Eval("FIO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceOrganization" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EventPlansConnection %>" 
        SelectCommand="SELECT [Id], [Name] FROM [Organizations]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EventPlansConnection %>" 
        SelectCommand="SELECT [Id], [FIO] FROM [Employees]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEvent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EventPlansConnection %>" 
        SelectCommand="SELECT [Id], [Name] FROM [Events]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEventPlan" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EventPlansConnection %>" 
        SelectCommand="SELECT EventPlans.Id, EventPlans.OrganizationId, Organizations.Name, EventPlans.EventId, Events.Name, EventPlans.StartDate, EventPlans.EndDate, EventPlans.PlanVolume, EventPlans.PlanCost, EventPlans.EconomicEffect, EventPlans.EmployeeId, Employees.FIO
        FROM [EventPlans] INNER JOIN Organizations ON EventPlans.OrganizationId = Organizations.Id INNER JOIN Employees ON EventPlans.EmployeeId = Employees.Id INNER JOIN Events ON Events.Id = EventPlans.EventId
        WHERE (EmployeeId = @EmployeeId)" 
        DeleteCommand="DELETE FROM [EventPlans] WHERE [Id] = @Id" 
        UpdateCommand="UPDATE [EventPlans] SET [OrganizationId] = @OrganizationId, [EventId] = @EventId, [StartDate] = @StartDate, [EndDate] = @EndDate, [PlanVolume] = @PlanVolume, [PlanCost] = @PlanCost, [EconomicEffect] = @EconomicEffect, [EmployeeId] = @EmployeeId WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [EventPlans] ([Id], [OrganizationId], [EventId], [StartDate], [EndDate], [PlanVolume], [PlanCost], [EconomicEffect], [EmployeeId]) VALUES ((SELECT MAX(EventPlans.Id) FROM EventPlans) + 1, @OrganizationId, @EventId, @StartDate, @EndDate, @PlanVolume, @PlanCost, @EconomicEffect, @EmployeeId)">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrganizationId" Type="Int32" />
            <asp:Parameter Name="EventId" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="EndDate" Type="DateTime" />
            <asp:Parameter Name="PlanVolume" Type="Int32" />
            <asp:Parameter Name="PlanCost" Type="Decimal" />
            <asp:Parameter Name="EconomicEffect" Type="Single" />
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListFIO" Name="EmployeeId" PropertyName="SelectedValue" Type="Int32"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="OrganizationId" Type="Int32" />
            <asp:Parameter Name="EventId" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="EndDate" Type="DateTime" />
            <asp:Parameter Name="PlanVolume" Type="Int32" />
            <asp:Parameter Name="PlanCost" Type="Decimal" />
            <asp:Parameter Name="EconomicEffect" Type="Single" />
            <asp:Parameter Name="EmployeeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>