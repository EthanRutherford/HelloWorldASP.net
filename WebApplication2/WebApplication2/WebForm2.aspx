<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>JavaScript Page</h1>
        Gimme a string!!!
        <input type="text" id="txt1"/>
        <button type="button" id="btn1">Submit</button>
        <p id="thing"></p>
        <script>
            $(document).ready(function () {
                $("#btn1").click(function () {
                    var val = $("#txt1").val();
                    var amt = 0;
                    for (var i = 0; i < val.length; i++) {
                        if (val[i] == 'a' || val[i] == 'e' || val[i] == 'i' ||
					        val[i] == 'o' || val[i] == 'u' || val[i] == 'y')
                            amt++;
                    }
                    $("#thing").text("Your string contains " + amt + " vowel(s).");
                });
            });
        </script>
    </center>
</asp:Content>
