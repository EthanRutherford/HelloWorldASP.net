<%@ Page Title="I'm a title" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

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
                <td><%# Eval("name") %></td>
                <td><%# Eval("description") %></td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>

        </asp:Repeater>
        </p>
    </center>
</asp:Content>