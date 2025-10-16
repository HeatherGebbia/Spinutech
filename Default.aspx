<%@ Page Title="Home Page" Language="VB" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Spinutech._Default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Code Test</title>


</head>
<body>
    <form runat="server">
        <link rel="stylesheet" href="/js/jquery-ui-1.14.1.custom/jquery-ui.min.css">
        <script src="/js/jquery-ui-1.14.1.custom/external/jquery/jquery.js"></script>
        <script src="/js/jquery-ui-1.14.1.custom/jquery-ui.min.js"></script>

        <script>
            $(function () {
                $("#tabs").tabs();
            });

            $(function () {
                var selected = parseInt($("#hdnSelectedTabIndex").val() || 0);
                var tabs = $("#tabs").tabs({
                    active: selected,
                    activate: function (event, ui) {
                        $("#hdnSelectedTabIndex").val(ui.newTab.index());
                    }
                });
            });
        </script>

        <div>
            <link href="styles.css" rel="stylesheet" type="text/css" />
        </div>



        <style type="text/css">
            body {
                font: 72% "Trebuchet MS", sans-serif;
            }

            #dialog_link {
                padding: .4em 1em .4em 20px;
                text-decoration: none;
                position: relative;
            }

                #dialog_link span.ui-icon {
                    margin: 0 5px 0 0;
                    position: absolute;
                    left: .2em;
                    top: 50%;
                    margin-top: -8px;
                }

            ul#icons {
                margin: 0;
                padding: 0;
            }

                ul#icons li {
                    margin: 2px;
                    position: relative;
                    padding: 4px 0;
                    cursor: pointer;
                    float: left;
                    list-style: none;
                }

                ul#icons span.ui-icon {
                    float: left;
                    margin: 0 4px;
                }

            legend {
                font-size: 15px;
                font-weight: bold;
            }
        </style>


        <asp:HiddenField runat="server" ID="hdnSelectedTabIndex" Value="0" />
        <main>
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Exercise 1</a></li>
                    <li><a href="#tabs-2">Exercise 2</a></li>
                    <li><a href="#tabs-6">Exercise 6</a></li>
                </ul>


                <div id="tabs-1">
                    <asp:Label ID="lblMessage1" runat="server" CssClass="lblError"></asp:Label>
                    <table id="Table1" border="0" cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" CssClass="tableCell" Text="Enter a numeric value to convert to string representation:"></asp:Label>
                                &nbsp;
                                <asp:TextBox ID="txtAmount" runat="server" Width="300"></asp:TextBox>
                                &nbsp;
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" CssClass="tableCell" Text="Result:"></asp:Label>&nbsp;
                        <asp:Label ID="lblResult" runat="server" CssClass="tableCelltext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tabs-2">
                    <asp:Label ID="lblMessage2" runat="server" CssClass="lblError"></asp:Label>
                    <table id="Table1b" border="0" cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" CssClass="tableCell" Text="Select the cards in your poker hand to evaluate:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlFaceValue1" runat="server">
                                    <asp:ListItem Selected="True" Text="Select Face Value" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="J" Value="J"></asp:ListItem>
                                    <asp:ListItem Text="Q" Value="Q"></asp:ListItem>
                                    <asp:ListItem Text="K" Value="K"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                                        <asp:DropDownList ID="ddlSuit1" runat="server">
                                                            <asp:ListItem Selected="True" Text="Select Suit" Value="-1"></asp:ListItem>
                                                            <asp:ListItem Text="Hearts" Value="h"></asp:ListItem>
                                                            <asp:ListItem Text="Diamonds" Value="d"></asp:ListItem>
                                                            <asp:ListItem Text="Spades" Value="s"></asp:ListItem>
                                                            <asp:ListItem Text="Clubs" Value="c"></asp:ListItem>
                                                        </asp:DropDownList>
                                <br />
                                <asp:DropDownList ID="ddlFaceValue2" runat="server">
                                    <asp:ListItem Selected="True" Text="Select Face Value" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="J" Value="J"></asp:ListItem>
                                    <asp:ListItem Text="Q" Value="Q"></asp:ListItem>
                                    <asp:ListItem Text="K" Value="K"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                                        <asp:DropDownList ID="ddlSuit2" runat="server">
                                                            <asp:ListItem Selected="True" Text="Select Suit" Value="-1"></asp:ListItem>
                                                            <asp:ListItem Text="Hearts" Value="h"></asp:ListItem>
                                                            <asp:ListItem Text="Diamonds" Value="d"></asp:ListItem>
                                                            <asp:ListItem Text="Spades" Value="s"></asp:ListItem>
                                                            <asp:ListItem Text="Clubs" Value="c"></asp:ListItem>
                                                        </asp:DropDownList>
                                <br />
                                <asp:DropDownList ID="ddlFaceValue3" runat="server">
                                    <asp:ListItem Selected="True" Text="Select Face Value" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="J" Value="J"></asp:ListItem>
                                    <asp:ListItem Text="Q" Value="Q"></asp:ListItem>
                                    <asp:ListItem Text="K" Value="K"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                                        <asp:DropDownList ID="ddlSuit3" runat="server">
                                                            <asp:ListItem Selected="True" Text="Select Suit" Value="-1"></asp:ListItem>
                                                            <asp:ListItem Text="Hearts" Value="h"></asp:ListItem>
                                                            <asp:ListItem Text="Diamonds" Value="d"></asp:ListItem>
                                                            <asp:ListItem Text="Spades" Value="s"></asp:ListItem>
                                                            <asp:ListItem Text="Clubs" Value="c"></asp:ListItem>
                                                        </asp:DropDownList>
                                <br />
                                <asp:DropDownList ID="ddlFaceValue4" runat="server">
                                    <asp:ListItem Selected="True" Text="Select Face Value" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="J" Value="J"></asp:ListItem>
                                    <asp:ListItem Text="Q" Value="Q"></asp:ListItem>
                                    <asp:ListItem Text="K" Value="K"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                                        <asp:DropDownList ID="ddlSuit4" runat="server">
                                                            <asp:ListItem Selected="True" Text="Select Suit" Value="-1"></asp:ListItem>
                                                            <asp:ListItem Text="Hearts" Value="h"></asp:ListItem>
                                                            <asp:ListItem Text="Diamonds" Value="d"></asp:ListItem>
                                                            <asp:ListItem Text="Spades" Value="s"></asp:ListItem>
                                                            <asp:ListItem Text="Clubs" Value="c"></asp:ListItem>
                                                        </asp:DropDownList>
                                <br />
                                <asp:DropDownList ID="ddlFaceValue5" runat="server">
                                    <asp:ListItem Selected="True" Text="Select Face Value" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="J" Value="J"></asp:ListItem>
                                    <asp:ListItem Text="Q" Value="Q"></asp:ListItem>
                                    <asp:ListItem Text="K" Value="K"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                                        <asp:DropDownList ID="ddlSuit5" runat="server">
                                                            <asp:ListItem Selected="True" Text="Select Suit" Value="-1"></asp:ListItem>
                                                            <asp:ListItem Text="Hearts" Value="h"></asp:ListItem>
                                                            <asp:ListItem Text="Diamonds" Value="d"></asp:ListItem>
                                                            <asp:ListItem Text="Spades" Value="s"></asp:ListItem>
                                                            <asp:ListItem Text="Clubs" Value="c"></asp:ListItem>
                                                        </asp:DropDownList>
                                <br />
                                <br />

                                <asp:Button ID="btnSubmitPoker" runat="server" Text="Submit" />&nbsp;
                             <asp:Button ID="btnReset" runat="server" Text="Reset" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" CssClass="tableCell" Text="Result:"></asp:Label>&nbsp;
                    <asp:Label ID="lblResultPoker" runat="server" CssClass="tableCelltext"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tabs-6">
    <asp:Label ID="lblMessage6" runat="server" CssClass="lblError"></asp:Label>
    <table id="Table1a" border="0" cellpadding="1" cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" CssClass="tableCell" Text="Enter a numeric value to determine whether or not it is a palindrome:"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtPalindromeCheck" runat="server" Width="300"></asp:TextBox>
                &nbsp;
                <asp:Button ID="btnPalindromeCheck" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" CssClass="tableCell" Text="Result:"></asp:Label>&nbsp;
        <asp:Label ID="lblPalindromeResult" runat="server" CssClass="tableCelltext"></asp:Label>
            </td>
        </tr>
    </table>
</div>
            </div>
        </main>
    </form>
</body>

</html>
