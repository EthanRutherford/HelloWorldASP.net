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
            Or type a thing to delete:
            <asp:TextBox ID="txt3" runat="server"/>
            <asp:Button ID="Button2" OnClick="delete" Text="Delete" runat="server" />
            <asp:Button ID="Button3" OnClick="clear" Text="Delete All" runat="server" />
        </p>
        <asp:Repeater id="things" runat="server">
        <HeaderTemplate>
            <div id = "column1">
                Name
            </div>
            <div id = "column2">
                Description
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div id = "column1">
                <%# Eval("name") %></td>
            </div>
            <div id = "column2">
                <td><%# Eval("description") %>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            <inv>-</inv>        <!-- invisible text so html knows where to put the bottom of the page -->
        </FooterTemplate>
        </asp:Repeater>
    </center>
</asp:Content>