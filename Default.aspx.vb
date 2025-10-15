Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Try
            Me.btnSubmit.Attributes.Add("onclick", disableButton(Me.Page, Me.btnSubmit))
            Me.btnSubmitPoker.Attributes.Add("onclick", disableButton(Me.Page, Me.btnSubmitPoker))
            Page.SetFocus(txtAmount)
        Catch ex As Exception
            lblMessage1.Text = "Error loading page. " & ex.Message
            Exit Sub
        End Try

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        Try
            lblMessage1.Text = ""

            'confirm valid # was submitted
            If IsNumeric(txtAmount.Text) = False Then
                lblMessage1.Text = "Please enter a valid numeric amount."
                Exit Sub
            ElseIf CDec(txtAmount.Text) < 0 Or CDec(txtAmount.Text) > 999999999.99 Then
                lblMessage1.Text = "Please enter a value between 0 and 999,999,999.99."
                Exit Sub
            End If

            lblResult.Text = ConvertAmountToString(CDec(txtAmount.Text))
        Catch ex As Exception
            lblMessage1.Text = "Error converting entered value to string. " & ex.Message
            Exit Sub
        End Try

    End Sub

    Function ConvertAmountToString(ByVal amount As Decimal) As String
        Dim dollars As Integer = Math.Floor(amount)
        Dim cents As Integer = CInt((amount - dollars) * 100)

        Dim wordsText As String = NumberToString(dollars)
        Dim centsText As String = cents.ToString("00")

        wordsText = Char.ToUpper(wordsText(0)) & wordsText.Substring(1)

        Return $"{wordsText} and {centsText}/100 dollars"
    End Function

    Private Function NumberToString(ByVal number As Long) As String
        If number = 0 Then
            Return "zero"
        End If

        Dim unitsMap() As String = {"zero", "one", "two", "three", "four", "five",
                                "six", "seven", "eight", "nine", "ten", "eleven",
                                "twelve", "thirteen", "fourteen", "fifteen",
                                "sixteen", "seventeen", "eighteen", "nineteen"}
        Dim tensMap() As String = {"zero", "ten", "twenty", "thirty", "forty",
                               "fifty", "sixty", "seventy", "eighty", "ninety"}

        Dim parts As New List(Of String)()

        If number \ 1000000 > 0 Then
            parts.Add(NumberToString(number \ 1000000) & " million")
            number = number Mod 1000000
        End If

        If number >= 1000 Then
            parts.Add(NumberToString(number \ 1000) & " thousand")
            number = number Mod 1000
        End If

        If number >= 100 Then
            parts.Add(unitsMap(number \ 100) & " hundred")
            number = number Mod 100
        End If

        If number > 0 Then
            If number < 20 Then
                parts.Add(unitsMap(number))
            Else
                Dim tens As Integer = number \ 10
                Dim units As Integer = number Mod 10
                If units = 0 Then
                    parts.Add(tensMap(tens))
                Else
                    parts.Add(tensMap(tens) & "-" & unitsMap(units))
                End If
            End If
        End If

        Return String.Join(" ", parts)
    End Function


    Public Function disableButton(ByVal pge As Control, ByVal btn As Control) As String

        Dim sb As New System.Text.StringBuilder()
        sb.Append("if (typeof(Page_ClientValidate) == 'function') {")
        sb.Append("if (Page_ClientValidate('vgConfirm') == false) { return false; }} ")
        sb.Append("this.value = 'Processing...';")
        sb.Append("this.disabled = true;")
        sb.Append(pge.Page.ClientScript.GetPostBackEventReference(btn, ""))
        sb.Append(";")
        Return sb.ToString()

    End Function

    Protected Sub btnSubmitPoker_Click(sender As Object, e As EventArgs) Handles btnSubmitPoker.Click

        Try
            lblMessage2.Text = ""

            If ddlFaceValue1.SelectedValue = "-1" Or ddlFaceValue2.SelectedValue = "-1" Or ddlFaceValue3.SelectedValue = "-1" Or ddlFaceValue4.SelectedValue = "-1" Or ddlFaceValue5.SelectedValue = "-1" Or ddlSuit1.SelectedValue = "-1" Or ddlSuit2.SelectedValue = "-1" Or ddlSuit3.SelectedValue = "-1" Or ddlSuit4.SelectedValue = "-1" Or ddlSuit5.SelectedValue = "-1" Then
                lblMessage2.Text = "Please select 5 cards."
                Exit Sub
            End If

            ' Build the hand
            Dim cards As New List(Of String)

            cards.Add($"{ddlFaceValue1.SelectedValue}{ddlSuit1.SelectedValue}")
            cards.Add($"{ddlFaceValue2.SelectedValue}{ddlSuit2.SelectedValue}")
            cards.Add($"{ddlFaceValue3.SelectedValue}{ddlSuit3.SelectedValue}")
            cards.Add($"{ddlFaceValue4.SelectedValue}{ddlSuit4.SelectedValue}")
            cards.Add($"{ddlFaceValue5.SelectedValue}{ddlSuit5.SelectedValue}")

            ' Check for duplicates
            If cards.Distinct().Count() <> cards.Count Then
                lblMessage2.Text = "You cannot select duplicate cards."
                Exit Sub
            End If

            ' Combine into a single string
            Dim hand As String = String.Join(" ", cards)

            ' Evaluate the hand
            Dim result As String = EvaluateHand(hand)
            lblResultPoker.Text = $"Hand: {hand} → {result}"

        Catch ex As Exception
            lblMessage2.Text = "Error evaluating poker hand. " & ex.Message
            Exit Sub
        End Try

    End Sub

    Function EvaluateHand(hand As String) As String
        Dim cards = hand.Split(" "c).Select(Function(c) c.Trim().ToLower()).ToList()
        Dim ranks = cards.Select(Function(c) c.Substring(0, c.Length - 1)).ToList()
        Dim suits = cards.Select(Function(c) c.Last()).ToList()

        ' Convert ranks to numbers for easy sorting and straight checking
        Dim rankValues = ranks.Select(Function(r) RankValue(r)).OrderBy(Function(v) v).ToList()

        Dim isFlush = suits.Distinct().Count() = 1
        Dim isStraight = rankValues.Distinct().Count() = 5 AndAlso (rankValues.Max() - rankValues.Min() = 4)

        Dim groups = rankValues.GroupBy(Function(v) v).OrderByDescending(Function(g) g.Count()).ToList()
        Dim counts = groups.Select(Function(g) g.Count()).ToList()

        ' Determine hand rank
        If isStraight AndAlso isFlush AndAlso rankValues.Max() = 14 Then
            Return "Royal Flush - great job, this hand beats all!"
        ElseIf isStraight AndAlso isFlush Then
            Return "Straight Flush - good hand but a Royal Flush beats it"
        ElseIf counts.SequenceEqual({4, 1}) Then
            Return "Four of a Kind - good hand but can be beat by a Straight Flush or a Royal Flush"
        ElseIf counts.SequenceEqual({3, 2}) Then
            Return "Full House - pretty good hand, 3 other hands beat it"
        ElseIf isFlush Then
            Return "Flush - good, 4 other hands beat it"
        ElseIf isStraight Then
            Return "Straight - mediocre, 5 other hands beat it"
        ElseIf counts.SequenceEqual({3, 1, 1}) Then
            Return "Three of a Kind - mediocre, 6 other hands beat it"
        ElseIf counts.SequenceEqual({2, 2, 1}) Then
            Return "Two Pair - not great, 7 other hands beat it"
        ElseIf counts.SequenceEqual({2, 1, 1, 1}) Then
            Dim pairValue = groups.First(Function(g) g.Count() = 2).Key
            Return $"Pair of {RankName(pairValue)}s, just okay, all other hands beat it except a single high card"
        Else
            Return "High Card, all other combos beat this, so you're lucky if you win the hand with this"
        End If
    End Function

    ' Helper: convert rank string to numeric value
    Private Function RankValue(rank As String) As Integer
        Select Case rank
            Case "a" : Return 14
            Case "k" : Return 13
            Case "q" : Return 12
            Case "j" : Return 11
            Case Else : Return Integer.Parse(rank)
        End Select
    End Function

    ' Helper: convert numeric rank back to name
    Private Function RankName(value As Integer) As String
        Select Case value
            Case 14 : Return "Ace"
            Case 13 : Return "King"
            Case 12 : Return "Queen"
            Case 11 : Return "Jack"
            Case Else : Return value.ToString()
        End Select
    End Function


    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        lblResultPoker.Text = ""
        lblMessage2.Text = ""
        ddlFaceValue1.SelectedValue = "-1"
        ddlSuit1.SelectedValue = "-1"
        ddlFaceValue2.SelectedValue = "-1"
        ddlSuit2.SelectedValue = "-1"
        ddlFaceValue3.SelectedValue = "-1"
        ddlSuit3.SelectedValue = "-1"
        ddlFaceValue4.SelectedValue = "-1"
        ddlSuit4.SelectedValue = "-1"
        ddlFaceValue5.SelectedValue = "-1"
        ddlSuit5.SelectedValue = "-1"
    End Sub

End Class