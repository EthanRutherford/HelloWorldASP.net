<%@ Page Title="I'm a Title" MasterPageFile="Site1.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    Sub submit(sender As Object, e As EventArgs)
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True"
        conn.Open()
        Dim ins As New SqlCommand
        ins.CommandText = "Insert stuff (name, description) values ('" + txt1.Text + "', '" + txt2.Text + "');"
        ins.Connection = conn
        ins.ExecuteNonQuery()
        Dim sel As New SqlCommand
        sel.CommandText = "select * from stuff"
        sel.Connection = conn
        Dim read = sel.ExecuteReader()
        things.DataSource = read
        things.DataBind()
        read.Close()
        conn.Close()
    End Sub
</script>

<script runat="server">
    Sub Page_Load()
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\data.mdf;Integrated Security=True;User Instance=True"
        conn.Open()
        Dim create As New SqlCommand
        create.CommandText = "IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[stuff]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)CREATE TABLE [dbo].[stuff] (name varchar(255), description varchar(255));"
        create.Connection = conn
        create.ExecuteNonQuery()
        Dim sel As New SqlCommand
        sel.CommandText = "select * from stuff"
        sel.Connection = conn
        Dim read = sel.ExecuteReader()
        things.DataSource = read
        things.DataBind()
        read.Close()
        conn.Close()
    End Sub
</script>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>Hello, World!</h1>
        Name a thing:
        <asp:TextBox id="txt1" runat="server" />
        And give a description of that thing:
        <asp:TextBox id="txt2" runat="server" />
        <asp:Button ID="Button1" OnClick="submit" Text="Submit" runat="server" />
        <p>
        <asp:Repeater id="things" runat="server">
        <HeaderTemplate>
            <table border="1" width="100%">
            <tr bgcolor="#b0c4de">
                <th>Name</th>
                <th>Description</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr bgcolor="#f0f0f0">
                <td><%#Container.DataItem("name")%> </td>
                <td><%#Container.DataItem("description")%> </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>

        </asp:Repeater>
        </p>
    </center>
</asp:Content>