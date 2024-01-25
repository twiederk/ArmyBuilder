VERSION 5.00
Begin VB.Form frmDrucken 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Druckervorschau"
   ClientHeight    =   7980
   ClientLeft      =   210
   ClientTop       =   870
   ClientWidth     =   11595
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   7980
   ScaleWidth      =   11595
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton comTrennlinie 
      Caption         =   "-----"
      Height          =   435
      Left            =   5775
      TabIndex        =   10
      Top             =   1155
      Width           =   540
   End
   Begin VB.VScrollBar vscDruckvorschau 
      Height          =   7680
      Left            =   11295
      TabIndex        =   9
      Top             =   105
      Visible         =   0   'False
      Width           =   270
   End
   Begin VB.PictureBox picDruckvorschau 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   7980
      Left            =   0
      ScaleHeight     =   7980
      ScaleWidth      =   540
      TabIndex        =   8
      Top             =   0
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.CommandButton labtxtAlle_nicht_drucken 
      Caption         =   "<<"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   5775
      TabIndex        =   7
      Top             =   3675
      Width           =   540
   End
   Begin VB.CommandButton labtxtAusgewählte_nicht_Drucken 
      Caption         =   "<"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   5775
      TabIndex        =   6
      Top             =   3045
      Width           =   540
   End
   Begin VB.CommandButton labtxtAusgewählte_Drucken 
      Caption         =   ">"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   5775
      TabIndex        =   5
      Top             =   2415
      Width           =   540
   End
   Begin VB.CommandButton labtxtAlle_Drucken 
      Caption         =   ">>"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   5775
      TabIndex        =   4
      Top             =   1785
      Width           =   540
   End
   Begin VB.ListBox lstDrucken 
      DragIcon        =   "FRMDRUCK.frx":0000
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7020
      Left            =   6405
      MultiSelect     =   2  'Extended
      TabIndex        =   1
      Top             =   420
      Width           =   5160
   End
   Begin VB.ListBox lstAuswahl 
      DragIcon        =   "FRMDRUCK.frx":030A
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7020
      Left            =   210
      MultiSelect     =   2  'Extended
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   420
      Width           =   5475
   End
   Begin VB.Label labtxtDruckreihenfolge 
      BackStyle       =   0  'Transparent
      Caption         =   "Druckreihenfolge:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   6405
      TabIndex        =   3
      Top             =   105
      Width           =   1590
   End
   Begin VB.Label labtxtArmee 
      Caption         =   "Armee:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   210
      TabIndex        =   2
      Top             =   105
      Width           =   750
   End
   Begin VB.Menu mnuZeichnen 
      Caption         =   "&Zeichnen(Entwichkung)"
      Visible         =   0   'False
      Begin VB.Menu mnuZReihenfolge 
         Caption         =   "R&eihenfolge"
      End
      Begin VB.Menu mnuZGesamte_Armee 
         Caption         =   "Gesamte &Armee"
      End
      Begin VB.Menu mnuZTrennlinie1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuZTitel 
         Caption         =   "&Titel"
      End
      Begin VB.Menu mnuZCharakter 
         Caption         =   "&Charakter"
      End
      Begin VB.Menu mnuZRegimenter 
         Caption         =   "&Regimenter"
      End
      Begin VB.Menu mnuZKriegsgerät 
         Caption         =   "&Kriegsgerät"
      End
      Begin VB.Menu mnuZMonster 
         Caption         =   "&Monster"
      End
      Begin VB.Menu mnuZGesamtkosten 
         Caption         =   "&Gesamtkosten"
      End
      Begin VB.Menu mnuZTrennlinie2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuZClear_Screen 
         Caption         =   "C&lear Screen"
      End
      Begin VB.Menu mnuZTrennlinie3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuZBeenden 
         Caption         =   "&Schließen"
      End
   End
   Begin VB.Menu mnuDrucken 
      Caption         =   "&Drucken(Entwicklung)"
      Visible         =   0   'False
      Begin VB.Menu mnuDReihenfolge 
         Caption         =   "Reihenfolge"
      End
      Begin VB.Menu mnuDGesamte_Armee 
         Caption         =   "Gesamte &Armee"
      End
      Begin VB.Menu mnuDTrennlinie1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDTitel 
         Caption         =   "&Titel"
      End
      Begin VB.Menu mnuDCharakter 
         Caption         =   "&Charakter"
      End
      Begin VB.Menu mnuDRegimenter 
         Caption         =   "&Regimenter"
      End
      Begin VB.Menu mnuDKriegsgerät 
         Caption         =   "&Kriegsgerät"
      End
      Begin VB.Menu mnuDMonster 
         Caption         =   "&Monster"
      End
      Begin VB.Menu mnuDGesamtkosten 
         Caption         =   "&Gesamtkosten"
      End
      Begin VB.Menu mnuDTrennlinie2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDAusdrucken 
         Caption         =   "&Ausdrucken"
      End
   End
   Begin VB.Menu mnuDDDrucken 
      Caption         =   "&Drucken"
      Begin VB.Menu mnuDDDruckreihenfolge 
         Caption         =   "Druck&reihenfolge"
      End
      Begin VB.Menu mnuDDDruckvorschau 
         Caption         =   "Druck&vorschau"
      End
      Begin VB.Menu mnuDDTrennlinie1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDDAusdrucken 
         Caption         =   "&Ausdrucken"
      End
      Begin VB.Menu mnuDDTrennlinie2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDDSchließen 
         Caption         =   "&Schließen"
      End
   End
   Begin VB.Menu mnuNächste_Seite 
      Caption         =   "&Nächste Seite"
      Enabled         =   0   'False
   End
   Begin VB.Menu mnuHilfe 
      Caption         =   "&Hilfe"
      Begin VB.Menu mnuHInfo 
         Caption         =   "&Info"
      End
   End
End
Attribute VB_Name = "frmDrucken"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Drucker As Printer

Dim Skalierung As Integer

Dim Oben As Integer
Dim Unten As Integer
Dim Links As Integer
Dim Rechts As Integer

Dim Zeilenhöhe As Integer

Dim Buchstabenhöhe As Integer
Dim Versatz As Integer
Dim Schrifthöhe As Integer
Dim Spaltenbreite As Integer
Dim Namensfeldgröße As Integer
Dim Linkerrand As Integer
Dim Rechterrand As Integer


Dim i As Integer

Private Sub comTrennlinie_Click()
lstDrucken.AddItem "----------(Trennlinie)----------"
End Sub

Private Sub Form_Load()
'Hilfemenü rechtsbündig anordnen
mnuHilfe.Caption = Chr$(8) & "&Hilfe"

'Standartdrucker als Drucker auswählen
Set Drucker = Printer

'Druckblatt justieren
picDruckvorschau.Top = 200
picDruckvorschau.Left = 200
picDruckvorschau.Width = Drucker.ScaleWidth
picDruckvorschau.Height = Drucker.ScaleHeight

'Skalierung des Druckblattes
Skalierung = 1

'Seitenränder einrichten
Oben = 100
Unten = 100
Links = 100
Rechts = 100

'Druckanfang einstellen
Schrifthöhe = Oben
End Sub



Private Sub Form_Resize()
'Bildlaufleiste platzieren
vscDruckvorschau.Top = 0
vscDruckvorschau.Left = frmDrucken.ScaleWidth - 270
vscDruckvorschau.Height = frmDrucken.ScaleHeight
'vscDruckvorschau.Height = frmDrucken.ScaleHeight - 285

'Bildlaufleiste einstellen
vscDruckvorschau.Min = -200
vscDruckvorschau.Value = vscDruckvorschau.Min
vscDruckvorschau.Max = Drucker.ScaleHeight - frmDrucken.Height + 400
vscDruckvorschau.LargeChange = Drucker.ScaleHeight
vscDruckvorschau.SmallChange = vscDruckvorschau.LargeChange / 10
End Sub

Private Sub labtxtAlle_Drucken_Click()
Dim i As Integer
For i = 0 To lstAuswahl.ListCount - 1
    lstDrucken.AddItem lstAuswahl.List(i)
Next
lstAuswahl.Clear
End Sub

Private Sub labtxtAlle_nicht_drucken_Click()
Dim i As Integer
For i = 0 To lstDrucken.ListCount - 1
    If lstDrucken.List(i) <> "----------(Trennlinie)----------" Then
        lstAuswahl.AddItem lstDrucken.List(i)
    End If
Next
lstDrucken.Clear
End Sub

Private Sub labtxtAusgewählte_Drucken_Click()
Dim i As Integer
If lstAuswahl.ListIndex <> -1 Then
    For i = 0 To lstAuswahl.ListCount - 1
        If lstAuswahl.Selected(i) Then
            lstDrucken.AddItem lstAuswahl.List(i)
        End If
    Next
    i = 0
    Do Until i = lstAuswahl.ListCount
        If lstAuswahl.Selected(i) Then
            lstAuswahl.RemoveItem i
        Else
            i = i + 1
        End If
    Loop
End If
End Sub

Private Sub labtxtAusgewählte_nicht_Drucken_Click()
Dim i As Integer
If lstDrucken.ListIndex <> -1 Then
    For i = 0 To lstDrucken.ListCount - 1
        If lstDrucken.Selected(i) And lstDrucken.List(i) <> "----------(Trennlinie)----------" Then
            lstAuswahl.AddItem lstDrucken.List(i)
        End If
    Next
    i = 0
    Do Until i = lstDrucken.ListCount
        If lstDrucken.Selected(i) Then
            lstDrucken.RemoveItem i
        Else
            i = i + 1
        End If
    Loop
End If
End Sub


Private Sub lstAuswahl_DragDrop(Source As Control, X As Single, Y As Single)
Dim i As Integer
If (TypeOf Source Is ListBox) And (Source.Name = "lstDrucken") Then
    If lstDrucken.ListIndex <> -1 Then
        For i = 0 To lstDrucken.ListCount - 1
            If lstDrucken.Selected(i) And lstDrucken.List(i) <> "----------(Trennlinie)----------" Then
                lstAuswahl.AddItem lstDrucken.List(i)
            End If
        Next
        i = 0
        Do Until i = lstDrucken.ListCount
            If lstDrucken.Selected(i) Then
                lstDrucken.RemoveItem i
            Else
                i = i + 1
            End If
        Loop
    End If
End If
End Sub

Private Sub lstAuswahl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lstAuswahl.Drag
End Sub


Private Sub lstDrucken_DragDrop(Source As Control, X As Single, Y As Single)
Dim i As Integer
If (TypeOf Source Is ListBox) And (Source.Name = "lstAuswahl") Then
    If lstAuswahl.ListIndex <> -1 Then
        For i = 0 To lstAuswahl.ListCount - 1
            If lstAuswahl.Selected(i) Then
                lstDrucken.AddItem lstAuswahl.List(i)
            End If
        Next
        i = 0
        Do Until i = lstAuswahl.ListCount
            If lstAuswahl.Selected(i) Then
                lstAuswahl.RemoveItem i
            Else
                i = i + 1
            End If
        Loop
    End If
End If
End Sub


Private Sub lstDrucken_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lstDrucken.Drag
End Sub


Private Sub mnuDAusdrucken_Click()
Drucker.EndDoc
End Sub

Private Sub mnuDCharakter_Click()
Dim SQL_Abfrage As String
Dim i As Integer
i = 0
With frmHauptmenü
    If .lstCharakteroben.ListCount > 0 Then
        Do Until i = .lstCharakteroben.ListCount
            Charakter_anzeigen dsCharakter, .lstCharakteroben.List(i), i
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            If .lab2Truppenname_klein.Caption = "" Then
                Tabelle "Charakter", 1, -1
            Else
                If .lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Charakter", 2, -1
                Else
                    Tabelle "Charakter", 3, -1
                End If
            End If
            i = i + 1
        Loop
    End If
End With
End Sub

Private Sub mnuDDAusdrucken_Click()
If lstAuswahl.ListCount Then
    MsgBox "Es wurden noch nicht alle Truppen" & Chr$(10) & "in die Druckreichnfolge eingegliedert", 16, "Armee noch nicht komplett"
Else
    'Mousepointer Sanduhr
    Screen.MousePointer = 11
    Reihenfolge_drucken
    'Mousepointer normal
    Screen.MousePointer = 0
    'Armee ausdrucken
    Drucker.EndDoc
End If
End Sub

Private Sub mnuDDDrucken_Click()
If lstAuswahl.Visible Then
    mnuDDDruckreihenfolge.Enabled = False
Else
    mnuDDDruckreihenfolge.Enabled = True
End If
End Sub


Private Sub mnuDDDruckreihenfolge_Click()
picDruckvorschau.Cls
Steuerelemente_un_sichtbar -1
Schrifthöhe = 100
End Sub

Private Sub mnuDDDruckvorschau_Click()
If lstAuswahl.ListCount Then
    MsgBox "Es wurden noch nicht alle Truppen" & Chr$(10) & "in die Druckreichnfolge eingegliedert", 16, "Armee noch nicht komplett"
Else
    i = 0
    mnuNächste_Seite.Enabled = True
    Reihenfolge_zeichnen
End If
End Sub


Private Sub mnuDDSchließen_Click()
frmHauptmenü.Enabled = True
frmDrucken.Hide
lstAuswahl.Clear
lstDrucken.Clear
mnuZClear_Screen_Click
End Sub

Private Sub mnuDGesamte_Armee_Click()
mnuDTitel_Click
mnuDCharakter_Click
mnuDRegimenter_Click
mnuDKriegsgerät_Click
mnuDMonster_Click
mnuDGesamtkosten_Click
End Sub

Private Sub mnuDGesamtkosten_Click()
Drucker.FontSize = "10"
Drucker.FontName = "Times New Roman"
Drucker.FontSize = 12
Drucker.FontUnderline = True
Drucker.FontBold = True

'Titel ausgeben
Drucker.CurrentY = Schrifthöhe
Drucker.CurrentX = (Drucker.ScaleWidth - Links - Rechts - Drucker.TextWidth("GESAMTKOSTEN")) / 2
Drucker.Print "GESAMTKOSTEN"
Drucker.FontUnderline = False
Drucker.FontBold = False

'Leerzeile einfügen
Drucker.Print ""
Schrifthöhe = Drucker.CurrentY

'Kostenposten anzeigen
'CHARAKTER UND REGIMENTER
Drucker.CurrentX = Drucker.TextWidth("i")
Drucker.Print "Charaktermodelle" & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.5) & "):" & Chr$(9) & frmHauptmenü.labCharakterpunkte & Chr$(9) & Chr$(9) & Chr$(9) & "Regimenter" & Chr$(9) & "(" & Int(Maximalpunkte * 0.25) & " - " & Maximalpunkte & "):" & Chr$(9) & frmHauptmenü.labRegimenterpunkte

'KRIEGSGERÄT UND MONSTER
Drucker.CurrentX = Drucker.TextWidth("i")
If frmHauptmenü.labtxtKriegsgerät.Caption = "Dämonen:" Then
    Drucker.Print "Dämonen:" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.5) & "):" & Chr$(9) & frmHauptmenü.labKriegsgerätpunkte & Chr$(9) & Chr$(9) & Chr$(9) & "Monster" & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labMonsterpunkte
Else
    Drucker.Print "Kriegsgerät:" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labKriegsgerätpunkte & Chr$(9) & Chr$(9) & Chr$(9) & "Monster" & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labMonsterpunkte
End If

'VERBÜNDETE
Drucker.CurrentX = Drucker.TextWidth("i")
Wandler = 0 + frmHauptmenü.labVerbündetepunkte
If Wandler < 0 Then
    Drucker.Print "Verbündete" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labVerbündetepunkte & Chr$(9) & "Negatives Vorzeichen bedeutet Punkte von Verbündeten erhalten."
Else
    Drucker.Print "Verbündete" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labVerbündetepunkte
End If

'GESAMTKOSTEN
Drucker.Print ""
Drucker.FontSize = 18
Drucker.FontBold = True
Drucker.CurrentX = Drucker.TextWidth("i")
Drucker.Print "GESAMTKOSTEN DER ARMEE: " & (Maximalpunkte - frmHauptmenü.labRestpunkte)
Drucker.FontSize = 12
Drucker.FontBold = False
End Sub

Private Sub mnuDKriegsgerät_Click()
Dim SQL_Abfrage As String
Dim i As Integer
i = 0
With frmHauptmenü
    If .lstKriegsgerätoben.ListCount > 0 Then
        Do Until i = .lstKriegsgerätoben.ListCount
            Kriegsgerätinfo_anzeigen dsKriegsgerät, .lstKriegsgerätoben.List(i), i
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            If .lab2Truppenname_klein.Caption = "" Then
                Tabelle "Kriegsgerät", 1, -1
            Else
                If .lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Kriegsgerät", 2, -1
                Else
                    Tabelle "Kriegsgerät", 3, -1
                End If
            End If
            i = i + 1
        Loop
    End If
End With
End Sub

Private Sub mnuDMonster_Click()
Dim SQL_Abfrage As String
Dim i As Integer
i = 0
With frmHauptmenü
    If .lstMonsteroben.ListCount > 0 Then
        Do Until i = .lstMonsteroben.ListCount
            Monsterinfo_anzeigen dsMonster, .lstMonsteroben.List(i), i
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            Tabelle "Monster", 1, -1
            i = i + 1
        Loop
    End If
End With
End Sub

Private Sub mnuDRegimenter_Click()
Dim SQL_Abfrage As String
Dim i As Integer
i = 0
With frmHauptmenü
    If .lstRegimenteroben.ListCount > 0 Then
        Do Until i = .lstRegimenteroben.ListCount
            Regimenter_anzeigen dsRegimenter, .lstRegimenteroben.List(i), i
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            If .lab2Truppenname_klein.Caption = "" Then
                Tabelle "Regimenter", 1, -1
            Else
                If .lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Regimenter", 2, -1
                Else
                    Tabelle "Regimenter", 3, -1
                End If
            End If
            i = i + 1
        Loop
    End If
End With
End Sub


Private Sub mnuDReihenfolge_Click()
If lstAuswahl.ListCount Then
    MsgBox "Es wurden noch nicht alle Truppen" & Chr$(10) & "in die Druckreichnfolge eingegliedert", 16, "Armee noch nicht komplett"
Else
    Reihenfolge_drucken
End If
End Sub


Private Sub mnuDTitel_Click()
Dim Titelhöhe As Integer
'Schriftart ändern
Drucker.FontSize = "10"
Drucker.FontName = "Algerian"
Drucker.FontSize = 28
Drucker.FontUnderline = True
'Stift platziern
Drucker.CurrentY = 0
Drucker.CurrentX = ((Drucker.ScaleWidth - Links - Rechts - Drucker.TextWidth(frmHauptmenü.Caption)) / 2)
Titelhöhe = Drucker.TextHeight(frmHauptmenü.Caption)
'Titel ausgeben
Drucker.Print frmHauptmenü.Caption
'Schriftart ändern
Drucker.FontName = "Times New Roman"
Drucker.FontSize = 12
Drucker.FontUnderline = False
'Leerzeile einfügen
Schrifthöhe = Titelhöhe + Drucker.TextHeight("I") + 50
End Sub


Private Sub mnuHInfo_Click()
frmInfo.Visible = True
End Sub


Private Sub mnuNächste_Seite_Click()
Reihenfolge_zeichnen
End Sub

Private Sub mnuZBeenden_Click()
frmHauptmenü.Enabled = True
frmDrucken.Hide
lstAuswahl.Clear
lstDrucken.Clear
mnuZClear_Screen_Click
End Sub

Private Sub mnuZCharakter_Click()
Dim SQL_Abfrage As String
Dim i As Integer
If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
i = 0
With frmHauptmenü
    If .lstCharakteroben.ListCount > 0 Then
        Do Until i = .lstCharakteroben.ListCount
            Charakter_anzeigen dsCharakter, .lstCharakteroben.List(i), i
            If Größe_überprüfen(Schrifthöhe, 0) Then
                picDruckvorschau.Cls
                Schrifthöhe = 100
            End If
            If .lab2Truppenname_klein.Caption = "" Then
                Tabelle "Charakter", 1, 0
            Else
                If .lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Charakter", 2, 0
                Else
                    Tabelle "Charakter", 3, 0
                End If
            End If
            i = i + 1
        Loop
    End If
End With
End Sub

Private Sub mnuZClear_Screen_Click()
picDruckvorschau.Cls
Steuerelemente_un_sichtbar -1
'Line (0, 0)-(Int(Drucker.ScaleWidth / Skalierung), Int(Drucker.ScaleHeight / Skalierung)), QBColor(15), BF
Schrifthöhe = 100
End Sub



Private Sub mnuZGesamte_Armee_Click()
Steuerelemente_un_sichtbar 0
mnuZTitel_Click
mnuZCharakter_Click
mnuZRegimenter_Click
mnuZKriegsgerät_Click
mnuZMonster_Click
mnuZGesamtkosten_Click
End Sub

Private Sub mnuZGesamtkosten_Click()
If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
Drucker.FontSize = "10"
picDruckvorschau.FontName = "Times New Roman"
picDruckvorschau.FontSize = Int(12 / Skalierung)
picDruckvorschau.FontUnderline = True
picDruckvorschau.FontBold = True

'Titel ausgeben
picDruckvorschau.CurrentY = Schrifthöhe
picDruckvorschau.CurrentX = Int(((Drucker.ScaleWidth - Links - Rechts - picDruckvorschau.TextWidth("GESAMTKOSTEN")) / 2) / Skalierung)
picDruckvorschau.Print "GESAMTKOSTEN"
picDruckvorschau.FontUnderline = False
picDruckvorschau.FontBold = False

'Leerzeile einfügen
picDruckvorschau.Print ""
Schrifthöhe = picDruckvorschau.CurrentY

'Kostenposten anzeigen
'CHARAKTER UND REGIMENTER
picDruckvorschau.CurrentX = picDruckvorschau.TextWidth("i")
picDruckvorschau.Print "Charaktermodelle" & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.5) & "):" & Chr$(9) & frmHauptmenü.labCharakterpunkte & Chr$(9) & Chr$(9) & Chr$(9) & "Regimenter" & Chr$(9) & "(" & Int(Maximalpunkte * 0.25) & " - " & Maximalpunkte & "):" & Chr$(9) & frmHauptmenü.labRegimenterpunkte

'KRIEGSGERÄT UND MONSTER
picDruckvorschau.CurrentX = picDruckvorschau.TextWidth("i")
If frmHauptmenü.labtxtKriegsgerät.Caption = "Dämonen:" Then
    picDruckvorschau.Print "Dämonen:" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.5) & "):" & Chr$(9) & frmHauptmenü.labKriegsgerätpunkte & Chr$(9) & Chr$(9) & Chr$(9) & "Monster" & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labMonsterpunkte
Else
    picDruckvorschau.Print "Kriegsgerät:" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labKriegsgerätpunkte & Chr$(9) & Chr$(9) & Chr$(9) & "Monster" & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labMonsterpunkte
End If

'VERBÜNDETE
picDruckvorschau.CurrentX = picDruckvorschau.TextWidth("i")
Wandler = 0 + frmHauptmenü.labVerbündetepunkte
If Wandler < 0 Then
    picDruckvorschau.Print "Verbündete" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labVerbündetepunkte & Chr$(9) & "Negatives Vorzeichen bedeutet Punkte von Verbündeten erhalten."
Else
    picDruckvorschau.Print "Verbündete" & Chr$(9) & Chr$(9) & "(0 - " & Int(Maximalpunkte * 0.25) & "):" & Chr$(9) & frmHauptmenü.labVerbündetepunkte
End If

'GESAMTKOSTEN
picDruckvorschau.Print ""
picDruckvorschau.FontSize = 18
picDruckvorschau.FontBold = True
picDruckvorschau.CurrentX = picDruckvorschau.TextWidth("i")
picDruckvorschau.Print "GESAMTKOSTEN DER ARMEE: " & (Maximalpunkte - frmHauptmenü.labRestpunkte)
picDruckvorschau.FontSize = 12
picDruckvorschau.FontBold = False

End Sub


Private Sub mnuZKriegsgerät_Click()
Dim SQL_Abfrage As String
Dim i As Integer
If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
i = 0
With frmHauptmenü
    If .lstKriegsgerätoben.ListCount > 0 Then
        Do Until i = .lstKriegsgerätoben.ListCount
            Kriegsgerätinfo_anzeigen dsKriegsgerät, .lstKriegsgerätoben.List(i), i
            If Größe_überprüfen(Schrifthöhe, 0) Then
                picDruckvorschau.Cls
                Schrifthöhe = 100
            End If
            If .lab2Truppenname_klein.Caption = "" Then
                Tabelle "Kriegsgerät", 1, 0
            Else
                If .lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Kriegsgerät", 2, 0
                Else
                    Tabelle "Kriegsgerät", 3, 0
                End If
            End If
            i = i + 1
        Loop
    End If
End With
End Sub

Private Sub mnuZMonster_Click()
Dim SQL_Abfrage As String
Dim i As Integer
If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
i = 0
With frmHauptmenü
    If .lstMonsteroben.ListCount > 0 Then
        Do Until i = .lstMonsteroben.ListCount
            Monsterinfo_anzeigen dsMonster, .lstMonsteroben.List(i), i
            If Größe_überprüfen(Schrifthöhe, 0) Then
                picDruckvorschau.Cls
                Schrifthöhe = 100
            End If
            Tabelle "Monster", 1, 0
            i = i + 1
        Loop
    End If
End With
End Sub

Private Sub mnuZRegimenter_Click()
Dim SQL_Abfrage As String
Dim i As Integer
If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
i = 0
With frmHauptmenü
    If .lstRegimenteroben.ListCount > 0 Then
        Do Until i = .lstRegimenteroben.ListCount
            Regimenter_anzeigen dsRegimenter, .lstRegimenteroben.List(i), i
            If Größe_überprüfen(Schrifthöhe, 0) Then
                picDruckvorschau.Cls
                Schrifthöhe = 100
            End If
            If .lab2Truppenname_klein.Caption = "" Then
                Tabelle "Regimenter", 1, 0
            Else
                If .lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Regimenter", 2, 0
                Else
                    Tabelle "Regimenter", 3, 0
                End If
            End If
            i = i + 1
        Loop
    End If
End With
End Sub


Public Sub Waagrechte(Linkerrand As Integer, Höhe As Integer, Dicke As Integer, Drucken As Integer)
If Drucken Then
    Drucker.DrawWidth = Dicke
    Drucker.Line (Linkerrand, Höhe)-(Int(Drucker.ScaleWidth - Rechts), Höhe)
Else
    picDruckvorschau.DrawWidth = Dicke
    picDruckvorschau.Line (Linkerrand, Höhe)-(Int((Drucker.ScaleWidth - Rechts) / Skalierung), Höhe)
End If
End Sub

Public Sub Senkrechte(Spalte As Integer, Höhe As Integer, Zeilenanzahl, Dicke As Integer, Drucken As Integer)
If Drucken Then
    Drucker.DrawWidth = Dicke
    Drucker.Line (Spalte, Höhe)-(Spalte, Höhe + Zeilenhöhe * Zeilenanzahl)
Else
    picDruckvorschau.DrawWidth = Dicke
    picDruckvorschau.Line (Spalte, Höhe)-(Spalte, Höhe + Zeilenhöhe * Zeilenanzahl)
End If
End Sub

Public Sub Tabelle(Truppentyp As String, Zeilenanzahl As Integer, Drucken As Integer)
'VARIABLEN DEKLARATION
Dim i As Integer
Dim k As Integer
Dim Zeile_einfügen As Integer

'FUNKTIONSSTART
Drucker.FontSize = "10"
If Drucken Then
    Drucker.FontName = "Times New Roman"
    Drucker.FontSize = 12
    Buchstabenhöhe = TextHeight("I")
    Versatz = 0
    Zeilenhöhe = Buchstabenhöhe + 50
    Linkerrand = Links
    Rechterrand = Drucker.ScaleWidth - Rechts
    Namensfeldgröße = 2892
    Spaltenbreite = Int((Drucker.ScaleWidth - Rechts - Links - Namensfeldgröße) / 10)
    'Stift linksoben platziern
    Drucker.CurrentX = Schrifthöhe
    Drucker.CurrentY = Links
Else
    picDruckvorschau.FontName = "Times New Roman"
    picDruckvorschau.FontSize = Int(12 / Skalierung)
    Buchstabenhöhe = Int(TextHeight("I") / Skalierung)
    Versatz = Int(0 / Skalierung)
    Zeilenhöhe = Int((Buchstabenhöhe + 50) / Skalierung)
    Linkerrand = Int(Links / Skalierung)
    Rechterrand = Int((Drucker.ScaleWidth - Rechts) / Skalierung)
    Namensfeldgröße = Int(2892 / Skalierung)
    Spaltenbreite = Int((Drucker.ScaleWidth - Rechts - Links - Namensfeldgröße * Skalierung) / 10 / Skalierung)
    'Stift linksoben platziern
    picDruckvorschau.CurrentX = Int(Schrifthöhe / Skalierung)
    picDruckvorschau.CurrentY = Int(Links / Skalierung)
End If


'Tabellenüberschrift anlegen
Tabellenüberschrift Namensfeldgröße, Spaltenbreite, Drucken

'Eine Zeile nach unten
Schrifthöhe = Schrifthöhe + TextHeight("N") + 40

'Waagrechte Linien ziehen
Waagrechte 0, Schrifthöhe - Versatz, 4, Drucken
i = 1
Do Until i = Zeilenanzahl
    Waagrechte 0, Schrifthöhe - Versatz + Zeilenhöhe * i, 2, Drucken
    i = i + 1
Loop
Waagrechte 0, Schrifthöhe - Versatz + i * Zeilenhöhe, 4, Drucken

'Namenskästchen anlegen
Senkrechte 0, Schrifthöhe - Versatz, Zeilenanzahl, 4, Drucken
Senkrechte Namensfeldgröße, Schrifthöhe - Versatz, Zeilenanzahl, 2, Drucken

'Kästchen für Charakteristik anlegen
For i = 1 To 9
    Senkrechte Namensfeldgröße + (Spaltenbreite * i), Schrifthöhe - Versatz, Zeilenanzahl, 2, Drucken
Next
Senkrechte Rechterrand, Schrifthöhe - Versatz, Zeilenanzahl, 4, Drucken

'TABELLE FÜLLEN
i = 1
Do Until i > Zeilenanzahl
    Tabelle_füllen Schrifthöhe + (i - 1) * Zeilenhöhe, i, Drucken
    i = i + 1
Loop

'Ausrüstung anzeigen
If (frmHauptmenü.labWaffe <> "" And frmHauptmenü.labWaffe <> "Handwaffe" And frmHauptmenü.labWaffe <> "keine") Or (frmHauptmenü.labRüstung <> "" And frmHauptmenü.labRüstung <> "keine" And frmHauptmenü.labRüstung <> "keine erlaubt") Or (frmHauptmenü.labFernwaffe <> "" And frmHauptmenü.labFernwaffe <> "keine") Then
    Ausrüstung_anhängen Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken
    'Eine Zeile nach unten
    Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
End If

'ausgewählte Optionen anzeigen
If Truppentyp = "Regimenter" Or Truppentyp = "Kriegsgerät" Then
    Zeile_einfügen = Option_anhängen(Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken)
    'Eine Zeile nach unten
    If Zeile_einfügen Then
        Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
    End If
End If

'Musiker und Standartenträger anzeigen
If Truppentyp = "Regimenter" Then
    Zeile_einfügen = Kommando_anhängen(Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken)
    'Eine Zeile nach unten
    If Zeile_einfügen Then
        Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
    End If
End If

'Magische Gegenstände anzeigen
If Truppentyp = "Charakter" Then
    For k = 1 To 4
        i = i + mag_Gegenstand_anhängen(k, Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken)
    Next
End If

'Reichweite anzeigen
If Truppentyp = "Kriegsgerät" Then
    Reichweite_anhängen Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken
    'Eine Zeile nach unten
    If frmHauptmenü.lab1Reichweite.Caption <> "" Then
        Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
        If frmHauptmenü.lab2Reichweite.Caption <> "" Then
            Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
        End If
    End If
    'Zwergenrunen ausgeben
    If frmHauptmenü.Caption = "Zwerge" And frmHauptmenü.labOption2 = "Zwergenrunen" Then
        Zwergenrunen_ausgeben Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken
        'Eine Zeile nach unten
        Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
    End If
End If

'Sonderregeln anzeigen
If frmHauptmenü.labSonderregeln.Caption <> "" Then
    Sonderregeln_anzeigen Schrifthöhe + (i - 1) * Zeilenhöhe, Versatz, Drucken
    'Eine Zeile nach unten
    Schrifthöhe = Schrifthöhe + TextHeight("N") + 40
End If

'Schlußlinie ziehen
Waagrechte 0, Schrifthöhe - Versatz + (i - 1) * Zeilenhöhe, 4, Drucken

'Kostenzeile
Kostenzeile Schrifthöhe + (i - 1) * Zeilenhöhe, Drucken

'Abstand zur Nächsten Tabelle einfügen
Schrifthöhe = Schrifthöhe + (i + 1) * Zeilenhöhe
End Sub

Public Sub Tabellenüberschrift(Namensfeld As Integer, Spaltenbreite As Integer, Drucken As Integer)
Dim aktuelle_Zeile As Integer
If Drucken Then
    With Drucker
        aktuelle_Zeile = Schrifthöhe
        Schreibe "Name", aktuelle_Zeile, 0, Drucken
        Schreibe "B", aktuelle_Zeile, 1, Drucken
        Schreibe "KG", aktuelle_Zeile, 2, Drucken
        Schreibe "BF", aktuelle_Zeile, 3, Drucken
        Schreibe "S", aktuelle_Zeile, 4, Drucken
        Schreibe "W", aktuelle_Zeile, 5, Drucken
        Schreibe "LP", aktuelle_Zeile, 6, Drucken
        Schreibe "I", aktuelle_Zeile, 7, Drucken
        Schreibe "A", aktuelle_Zeile, 8, Drucken
        Schreibe "MW", aktuelle_Zeile, 9, Drucken
        Schreibe "RW", aktuelle_Zeile, 10, Drucken
        Drucker.CurrentY = aktuelle_Zeile
    End With
Else
    With picDruckvorschau
        aktuelle_Zeile = Schrifthöhe
        Schreibe "Name", aktuelle_Zeile, 0, Drucken
        Schreibe "B", aktuelle_Zeile, 1, Drucken
        Schreibe "KG", aktuelle_Zeile, 2, Drucken
        Schreibe "BF", aktuelle_Zeile, 3, Drucken
        Schreibe "S", aktuelle_Zeile, 4, Drucken
        Schreibe "W", aktuelle_Zeile, 5, Drucken
        Schreibe "LP", aktuelle_Zeile, 6, Drucken
        Schreibe "I", aktuelle_Zeile, 7, Drucken
        Schreibe "A", aktuelle_Zeile, 8, Drucken
        Schreibe "MW", aktuelle_Zeile, 9, Drucken
        Schreibe "RW", aktuelle_Zeile, 10, Drucken
        .CurrentY = aktuelle_Zeile
    End With
End If
End Sub

Sub Schreibe(Ausgabe As String, Zeile As Integer, Spalte As Integer, Drucken As Integer)
If Drucken Then
    If Spalte = 0 Then
        Drucker.CurrentX = Drucker.TextWidth("i")
    Else
        Drucker.CurrentX = Namensfeldgröße + (Spalte - 1) * Spaltenbreite + (Spaltenbreite - TextWidth(Ausgabe)) / 2
    End If
    Drucker.CurrentY = Zeile
    Drucker.Print (Ausgabe)
Else
    With picDruckvorschau
        If Spalte = 0 Then
            .CurrentX = TextWidth("i")
        Else
            .CurrentX = Namensfeldgröße + (Spalte - 1) * Spaltenbreite + (Spaltenbreite - TextWidth(Ausgabe)) / 2
        End If
        .CurrentY = Zeile
        picDruckvorschau.Print (Ausgabe)
    End With
End If
End Sub


Public Sub Tabelle_füllen(Schrifthöhe As Integer, Aufrufnummer As Integer, Drucken As Integer)
With frmHauptmenü
    If Drucken Then
        Select Case Aufrufnummer
            Case Is = 1
                Schreibe .labTruppenname_klein, Schrifthöhe, 0, Drucken
                Schreibe .labB, Schrifthöhe, 1, Drucken
                Schreibe .labKG, Schrifthöhe, 2, Drucken
                Schreibe .labBF, Schrifthöhe, 3, Drucken
                Schreibe .labS, Schrifthöhe, 4, Drucken
                Schreibe .labW, Schrifthöhe, 5, Drucken
                Schreibe .labLP, Schrifthöhe, 6, Drucken
                Schreibe .labI, Schrifthöhe, 7, Drucken
                Schreibe .labA, Schrifthöhe, 8, Drucken
                Schreibe .labMW, Schrifthöhe, 9, Drucken
                Schreibe .labRW, Schrifthöhe, 10, Drucken
            Case Is = 2
                Schreibe .lab2Truppenname_klein, Schrifthöhe, 0, Drucken
                Schreibe .labB2, Schrifthöhe, 1, Drucken
                Schreibe .labKG2, Schrifthöhe, 2, Drucken
                Schreibe .labBF2, Schrifthöhe, 3, Drucken
                Schreibe .labS2, Schrifthöhe, 4, Drucken
                Schreibe .labW2, Schrifthöhe, 5, Drucken
                Schreibe .labLP2, Schrifthöhe, 6, Drucken
                Schreibe .labI2, Schrifthöhe, 7, Drucken
                Schreibe .labA2, Schrifthöhe, 8, Drucken
                Schreibe .labMW2, Schrifthöhe, 9, Drucken
                Schreibe .labRW2, Schrifthöhe, 10, Drucken
            Case Is = 3
                Schreibe .lab3Truppenname_klein, Schrifthöhe, 0, Drucken
                Schreibe .labB3, Schrifthöhe, 1, Drucken
                Schreibe .labKG3, Schrifthöhe, 2, Drucken
                Schreibe .labBF3, Schrifthöhe, 3, Drucken
                Schreibe .labS3, Schrifthöhe, 4, Drucken
                Schreibe .labW3, Schrifthöhe, 5, Drucken
                Schreibe .labLP3, Schrifthöhe, 6, Drucken
                Schreibe .labI3, Schrifthöhe, 7, Drucken
                Schreibe .labA3, Schrifthöhe, 8, Drucken
                Schreibe .labMW3, Schrifthöhe, 9, Drucken
                Schreibe .labRW3, Schrifthöhe, 10, Drucken
        End Select
    Else
        Select Case Aufrufnummer
            Case Is = 1
                Schreibe .labTruppenname_klein, Schrifthöhe, 0, Drucken
                Schreibe .labB, Schrifthöhe, 1, Drucken
                Schreibe .labKG, Schrifthöhe, 2, Drucken
                Schreibe .labBF, Schrifthöhe, 3, Drucken
                Schreibe .labS, Schrifthöhe, 4, Drucken
                Schreibe .labW, Schrifthöhe, 5, Drucken
                Schreibe .labLP, Schrifthöhe, 6, Drucken
                Schreibe .labI, Schrifthöhe, 7, Drucken
                Schreibe .labA, Schrifthöhe, 8, Drucken
                Schreibe .labMW, Schrifthöhe, 9, Drucken
                Schreibe .labRW, Schrifthöhe, 10, Drucken
            Case Is = 2
                Schreibe .lab2Truppenname_klein, Schrifthöhe, 0, Drucken
                Schreibe .labB2, Schrifthöhe, 1, Drucken
                Schreibe .labKG2, Schrifthöhe, 2, Drucken
                Schreibe .labBF2, Schrifthöhe, 3, Drucken
                Schreibe .labS2, Schrifthöhe, 4, Drucken
                Schreibe .labW2, Schrifthöhe, 5, Drucken
                Schreibe .labLP2, Schrifthöhe, 6, Drucken
                Schreibe .labI2, Schrifthöhe, 7, Drucken
                Schreibe .labA2, Schrifthöhe, 8, Drucken
                Schreibe .labMW2, Schrifthöhe, 9, Drucken
                Schreibe .labRW2, Schrifthöhe, 10, Drucken
            Case Is = 3
                Schreibe .lab3Truppenname_klein, Schrifthöhe, 0, Drucken
                Schreibe .labB3, Schrifthöhe, 1, Drucken
                Schreibe .labKG3, Schrifthöhe, 2, Drucken
                Schreibe .labBF3, Schrifthöhe, 3, Drucken
                Schreibe .labS3, Schrifthöhe, 4, Drucken
                Schreibe .labW3, Schrifthöhe, 5, Drucken
                Schreibe .labLP3, Schrifthöhe, 6, Drucken
                Schreibe .labI3, Schrifthöhe, 7, Drucken
                Schreibe .labA3, Schrifthöhe, 8, Drucken
                Schreibe .labMW3, Schrifthöhe, 9, Drucken
                Schreibe .labRW3, Schrifthöhe, 10, Drucken
        End Select
    End If
End With
End Sub

Public Sub Information_anhängen(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
Information_anzeigen Schrifthöhe, Drucken
Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
End Sub

Public Sub Information_anzeigen(Schrifthöhe As Integer, Drucken As Integer)
If Drucken Then
    Drucker.CurrentY = Schrifthöhe
    Drucker.CurrentX = Drucker.TextWidth("i")
    Drucker.Print "Ausrüstung: schwere Rüstung und Schild, Harnisch"
Else
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.CurrentX = Drucker.TextWidth("i")
    picDruckvorschau.Print "Ausrüstung: schwere Rüstung und Schild, Harnisch"
End If
End Sub

Public Sub Kostenzeile(Schrifthöhe As Integer, Drucken As Integer)
Dim Spaltenbreite As Integer
If Drucken Then
    Spaltenbreite = Int((Drucker.ScaleWidth - Rechts - 20) / 4)
    Drucker.CurrentX = 20
    Drucker.CurrentY = Schrifthöhe
    Drucker.Print "Anzahl: " & frmHauptmenü.labAnzahl.Caption
    Drucker.CurrentX = Spaltenbreite
    Drucker.CurrentY = Schrifthöhe
    Drucker.Print "Einzelkosten: " & frmHauptmenü.labEinzelkosten.Caption
    Drucker.CurrentX = 2 * Spaltenbreite
    Drucker.CurrentY = Schrifthöhe
    Drucker.Print "Gesamtkosten: " & frmHauptmenü.labPunkte.Caption
    Drucker.CurrentX = 3 * Spaltenbreite
    Drucker.CurrentY = Schrifthöhe
    Drucker.Print "Gebiet: " & frmHauptmenü.labTruppentyp.Caption
Else
    Spaltenbreite = Int((Drucker.ScaleWidth - Rechts - 20) / 4)
    picDruckvorschau.CurrentX = 20
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.Print "Anzahl: " & frmHauptmenü.labAnzahl.Caption
    picDruckvorschau.CurrentX = Spaltenbreite
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.Print "Einzelkosten: " & frmHauptmenü.labEinzelkosten.Caption
    picDruckvorschau.CurrentX = 2 * Spaltenbreite
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.Print "Gesamtkosten: " & frmHauptmenü.labPunkte.Caption
    picDruckvorschau.CurrentX = 3 * Spaltenbreite
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.Print "Gebiet: " & frmHauptmenü.labTruppentyp.Caption
End If
End Sub

Public Function Ausrüstung_anzeigen(Ausrüstung As String, Abstand_vom_Rand As Integer, Schrifthöhe As Integer, Drucken As Integer)
If Drucken Then
    Drucker.CurrentY = Schrifthöhe
    Drucker.CurrentX = Abstand_vom_Rand
    If Abstand_vom_Rand <> Drucker.TextWidth("i") Then
        Drucker.Print ", " & Ausrüstung
        Abstand_vom_Rand = Abstand_vom_Rand + TextWidth(", ")
    Else
        Drucker.Print Ausrüstung
    End If
    Ausrüstung_anzeigen = Abstand_vom_Rand + TextWidth(Ausrüstung)
Else
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.CurrentX = Abstand_vom_Rand
    If Abstand_vom_Rand <> Drucker.TextWidth("i") Then
        picDruckvorschau.Print ", " & Ausrüstung
        Abstand_vom_Rand = Abstand_vom_Rand + TextWidth(", ")
    Else
        picDruckvorschau.Print Ausrüstung
    End If
    Ausrüstung_anzeigen = Abstand_vom_Rand + TextWidth(Ausrüstung)
End If
End Function

Public Sub Ausrüstung_anhängen(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
Dim Abstand_vom_Rand As Integer
Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
With frmHauptmenü
    Abstand_vom_Rand = Drucker.TextWidth("i")
    If .labWaffe <> "" Then
        Abstand_vom_Rand = Ausrüstung_anzeigen(.labWaffe, Abstand_vom_Rand, Schrifthöhe, Drucken)
    End If
    If .labRüstung <> "" And .labRüstung <> "keine" And .labRüstung <> "keine erlaubt" Then
        Abstand_vom_Rand = Ausrüstung_anzeigen(.labRüstung, Abstand_vom_Rand, Schrifthöhe, Drucken)
    End If
    If .labFernwaffe <> "" And .labFernwaffe <> "keine" Then
        Abstand_vom_Rand = Ausrüstung_anzeigen(.labFernwaffe, Abstand_vom_Rand, Schrifthöhe, Drucken)
    End If
End With
Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
End Sub

Public Function mag_Gegenstand_anhängen(Durchlaufnummer As Integer, Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
mag_Gegenstand_anhängen = 0
With frmHauptmenü
    Select Case Durchlaufnummer
        Case 1
            If .labOption1.Caption <> "" Then
                Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
                mag_Gegenstand_anzeigen .labOption1, .labOption1_Kategorie, Schrifthöhe, Drucken
                mag_Gegenstand_anhängen = 1
                Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
            End If
        Case 2
            If .labOption2.Caption <> "" Then
                mag_Gegenstand_anzeigen .labOption2, .labOption2_Kategorie, Schrifthöhe, Drucken
                Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
                mag_Gegenstand_anhängen = 1
                Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
            End If
        Case 3
            If .labOption3.Caption <> "" Then
                mag_Gegenstand_anzeigen .labOption3, .labOption3_Kategorie, Schrifthöhe, Drucken
                Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
                mag_Gegenstand_anhängen = 1
                Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
            End If
        Case 4
            If .labOption4.Caption <> "" Then
                mag_Gegenstand_anzeigen .labOption4, .labOption4_Kategorie, Schrifthöhe, Drucken
                Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
                mag_Gegenstand_anhängen = 1
                Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
            End If
    End Select
End With
End Function

Public Sub mag_Gegenstand_anzeigen(Gegenstand As String, Kategorie As String, Schrifthöhe As Integer, Drucken As Integer)
Dim SQL_Abfrage As String
If Drucken Then
    Select Case Kategorie
        Case "Spruchrolle"
            SQL_Abfrage = "[Spruchrollenname] = '" & Gegenstand & "'"
            dsSpruchrollen.MoveFirst
            dsSpruchrollen.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsSpruchrollen.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsSpruchrollen.Fields("Punktwert") & "): " & dsSpruchrollen.Fields("Kurzinfo")
            End If
        Case "Homunkuli"
            SQL_Abfrage = "[Homunkuliname] = '" & Gegenstand & "'"
            dsHomunkuli.MoveFirst
            dsHomunkuli.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsHomunkuli.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsHomunkuli.Fields("Punktwert") & "): " & dsHomunkuli.Fields("Kurzinfo")
            End If
        Case "Mutation"
            SQL_Abfrage = "[Mutationsname] = '" & Gegenstand & "'"
            dsMutationen.MoveFirst
            dsMutationen.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsMutationen.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsMutationen.Fields("Punktwert") & "): " & dsMutationen.Fields("Kurzinfo")
            End If
        Case "Standarte"
            SQL_Abfrage = "[Standartenname] = '" & Gegenstand & "'"
            dsStandarten.MoveFirst
            dsStandarten.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsStandarten.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsStandarten.Fields("Punktwert") & "): " & dsStandarten.Fields("Kurzinfo")
            End If
        Case "Waffe"
            SQL_Abfrage = "[Waffenname] = '" & Gegenstand & "'"
            dsMagische_Waffen.MoveFirst
            dsMagische_Waffen.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsMagische_Waffen.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsMagische_Waffen.Fields("Punktwert") & "): " & dsMagische_Waffen.Fields("Kurzinfo")
            End If
        Case "Rüstung"
            SQL_Abfrage = "[Rüstungsname] = '" & Gegenstand & "'"
            dsMagische_Rüstungen.MoveFirst
            dsMagische_Rüstungen.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsMagische_Rüstungen.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsMagische_Rüstungen.Fields("Punktwert") & "): " & dsMagische_Rüstungen.Fields("Kurzinfo")
            End If
        Case "Schild"
            SQL_Abfrage = "[Schildname] = '" & Gegenstand & "'"
            dsMagische_Schilder.MoveFirst
            dsMagische_Schilder.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsMagische_Schilder.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsMagische_Schilder.Fields("Punktwert") & "): " & dsMagische_Schilder.Fields("Kurzinfo")
            End If
        Case Else
            SQL_Abfrage = "[Gegenstandsname] = '" & Gegenstand & "'"
            dsVerschiedene_mag_Gegenstände.MoveFirst
            dsVerschiedene_mag_Gegenstände.FindFirst SQL_Abfrage
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            If dsVerschiedene_mag_Gegenstände.NoMatch Then
                Drucker.Print Gegenstand
            Else
                Drucker.Print Gegenstand & " (" & dsVerschiedene_mag_Gegenstände.Fields("Punktwert") & "): " & dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
            End If
    End Select
Else
    Select Case Kategorie
        Case "Spruchrolle"
            SQL_Abfrage = "[Spruchrollenname] = '" & Gegenstand & "'"
            dsSpruchrollen.MoveFirst
            dsSpruchrollen.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsSpruchrollen.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsSpruchrollen.Fields("Punktwert") & "): " & dsSpruchrollen.Fields("Kurzinfo")
            End If
        Case "Homunkuli"
            SQL_Abfrage = "[Homunkuliname] = '" & Gegenstand & "'"
            dsHomunkuli.MoveFirst
            dsHomunkuli.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsHomunkuli.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsHomunkuli.Fields("Punktwert") & "): " & dsHomunkuli.Fields("Kurzinfo")
            End If
        Case "Mutation"
            SQL_Abfrage = "[Mutationsname] = '" & Gegenstand & "'"
            dsMutationen.MoveFirst
            dsMutationen.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsMutationen.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsMutationen.Fields("Punktwert") & "): " & dsMutationen.Fields("Kurzinfo")
            End If
        Case "Standarte"
            SQL_Abfrage = "[Standartenname] = '" & Gegenstand & "'"
            dsStandarten.MoveFirst
            dsStandarten.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsStandarten.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsStandarten.Fields("Punktwert") & "): " & dsStandarten.Fields("Kurzinfo")
            End If
        Case "Waffe"
            SQL_Abfrage = "[Waffenname] = '" & Gegenstand & "'"
            dsMagische_Waffen.MoveFirst
            dsMagische_Waffen.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsMagische_Waffen.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsMagische_Waffen.Fields("Punktwert") & "): " & dsMagische_Waffen.Fields("Kurzinfo")
            End If
        Case "Rüstung"
            SQL_Abfrage = "[Rüstungsname] = '" & Gegenstand & "'"
            dsMagische_Rüstungen.MoveFirst
            dsMagische_Rüstungen.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsMagische_Rüstungen.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsMagische_Rüstungen.Fields("Punktwert") & "): " & dsMagische_Rüstungen.Fields("Kurzinfo")
            End If
        Case "Schild"
            SQL_Abfrage = "[Schildname] = '" & Gegenstand & "'"
            dsMagische_Schilder.MoveFirst
            dsMagische_Schilder.FindFirst SQL_Abfrage
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            If dsMagische_Schilder.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsMagische_Schilder.Fields("Punktwert") & "): " & dsMagische_Schilder.Fields("Kurzinfo")
            End If
        Case Else
            SQL_Abfrage = "[Gegenstandsname] = '" & Gegenstand & "'"
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            dsVerschiedene_mag_Gegenstände.MoveFirst
            dsVerschiedene_mag_Gegenstände.FindFirst SQL_Abfrage
            If dsVerschiedene_mag_Gegenstände.NoMatch Then
                picDruckvorschau.Print Gegenstand
            Else
                picDruckvorschau.Print Gegenstand & " (" & dsVerschiedene_mag_Gegenstände.Fields("Punktwert") & "): " & dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
            End If
    End Select
End If
End Sub

Public Sub Sonderregeln_anzeigen(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
If Drucken Then
    Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
    Drucker.CurrentX = Drucker.TextWidth("i")
    Drucker.CurrentY = Schrifthöhe
    Drucker.Print frmHauptmenü.labSonderregeln.Caption
    Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
Else
    Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
    picDruckvorschau.CurrentX = Drucker.TextWidth("i")
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.Print frmHauptmenü.labSonderregeln.Caption
    Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
End If
End Sub

Public Function Option_anhängen(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
Dim Abstand_vom_Rand As Integer
Dim Rand_zeichnen As Integer
Rand_zeichnen = 0
With frmHauptmenü
    Abstand_vom_Rand = Drucker.TextWidth("i")
    If .ckbOption1.Value Then
        Abstand_vom_Rand = Option_anzeigen(.labOption1.Caption, Abstand_vom_Rand, Schrifthöhe, Drucken)
        Rand_zeichnen = -1
    End If
    If .ckbOption2.Value Then
        Abstand_vom_Rand = Option_anzeigen(.labOption2.Caption, Abstand_vom_Rand, Schrifthöhe, Drucken)
        Rand_zeichnen = -1
    End If
    If .ckbOption3.Value Then
        Abstand_vom_Rand = Option_anzeigen(.labOption3.Caption, Abstand_vom_Rand, Schrifthöhe, Drucken)
        Rand_zeichnen = -1
    End If
    If .ckbOption4.Value Then
        Abstand_vom_Rand = Option_anzeigen(.labOption4.Caption, Abstand_vom_Rand, Schrifthöhe, Drucken)
        Rand_zeichnen = -1
    End If
    If .ckbOption5.Value Then
        Abstand_vom_Rand = Option_anzeigen(.labOption5.Caption, Abstand_vom_Rand, Schrifthöhe, Drucken)
        Rand_zeichnen = -1
    End If
    If .ckbOption6.Value Then
        Abstand_vom_Rand = Option_anzeigen(.labOption6.Caption, Abstand_vom_Rand, Schrifthöhe, Drucken)
        Rand_zeichnen = -1
    End If
End With
If Rand_zeichnen Then
    Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
    Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
    Option_anhängen = -1
Else
    Option_anhängen = 0
End If
End Function

Public Function Option_anzeigen(Optionsname As String, Abstand_vom_Rand As Integer, Schrifthöhe As Integer, Drucken As Integer)
If Drucken Then
    Drucker.CurrentY = Schrifthöhe
    Drucker.CurrentX = Abstand_vom_Rand
    If Abstand_vom_Rand <> Drucker.TextWidth("i") Then
        Drucker.Print ", " & Optionsname
        Abstand_vom_Rand = Abstand_vom_Rand + TextWidth(", ")
    Else
        Drucker.Print Optionsname
    End If
    Option_anzeigen = Abstand_vom_Rand + TextWidth(Optionsname)
Else
    picDruckvorschau.CurrentY = Schrifthöhe
    picDruckvorschau.CurrentX = Abstand_vom_Rand
    If Abstand_vom_Rand <> Drucker.TextWidth("i") Then
        picDruckvorschau.Print ", " & Optionsname
        Abstand_vom_Rand = Abstand_vom_Rand + TextWidth(", ")
    Else
        picDruckvorschau.Print Optionsname
    End If
    Option_anzeigen = Abstand_vom_Rand + TextWidth(Optionsname)
End If
End Function

Public Function Kommando_anhängen(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
Dim Länge As Integer
Dim Name_der_Standarte As String
Dim SQL_Abfrage As String
Kommando_anhängen = 0
With frmHauptmenü
    If Drucken Then
        Drucker.CurrentX = Drucker.TextWidth("i")
        Drucker.CurrentY = Schrifthöhe
        If .ckbMusiker.Value Then
            Drucker.Print "Musiker"
            Drucker.CurrentX = Drucker.TextWidth("i") + Drucker.TextWidth("Musiker")
            Drucker.CurrentY = Schrifthöhe
            Kommando_anhängen = -1
        End If
        If .ckbStandartenträger.Value Then
            If .ckbMusiker.Value Then
                Drucker.Print ", "
                Drucker.CurrentX = Drucker.TextWidth("i") + Drucker.TextWidth("Musiker") + Drucker.TextWidth(", ")
                Drucker.CurrentY = Schrifthöhe
            End If
            If .labMagische_Standarte.Caption <> "" Then
                Länge = InStr(.labMagische_Standarte, "(")
                Name_der_Standarte = Left(.labMagische_Standarte, Länge - 2)
                SQL_Abfrage = "[Standartenname] = '" & Name_der_Standarte & "'"
                dsStandarten.MoveFirst
                dsStandarten.FindFirst SQL_Abfrage
                Drucker.Print "Standartenträger: " & .labMagische_Standarte & ": " & dsStandarten.Fields("Kurzinfo")
            Else
                Drucker.Print "Standartenträger"
            End If
            Kommando_anhängen = -1
        End If
        If Kommando_anhängen Then
            Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
            Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
        End If
    Else
        picDruckvorschau.CurrentX = Drucker.TextWidth("i")
        picDruckvorschau.CurrentY = Schrifthöhe
        If .ckbMusiker.Value Then
            picDruckvorschau.Print "Musiker"
            picDruckvorschau.CurrentX = Drucker.TextWidth("i") + Drucker.TextWidth("Musiker")
            picDruckvorschau.CurrentY = Schrifthöhe
            Kommando_anhängen = -1
        End If
        If .ckbStandartenträger.Value Then
            If .ckbMusiker.Value Then
                picDruckvorschau.Print ", "
                picDruckvorschau.CurrentX = Drucker.TextWidth("i") + Drucker.TextWidth("Musiker") + Drucker.TextWidth(", ")
                picDruckvorschau.CurrentY = Schrifthöhe
            End If
            If .labMagische_Standarte.Caption <> "" Then
                Länge = InStr(.labMagische_Standarte, "(")
                Name_der_Standarte = Left(.labMagische_Standarte, Länge - 2)
                SQL_Abfrage = "[Standartenname] = '" & Name_der_Standarte & "'"
                dsStandarten.MoveFirst
                dsStandarten.FindFirst SQL_Abfrage
                picDruckvorschau.Print "Standartenträger: " & .labMagische_Standarte & ": " & dsStandarten.Fields("Kurzinfo")
            Else
                picDruckvorschau.Print "Standartenträger"
            End If
            Kommando_anhängen = -1
        End If
        If Kommando_anhängen Then
            Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
            Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
        End If
    End If
End With
End Function

Private Sub mnuZReihenfolge_Click()
If lstAuswahl.ListCount Then
    MsgBox "Es wurden noch nicht alle Truppen" & Chr$(10) & "in die Druckreichnfolge eingegliedert", 16, "Armee noch nicht komplett"
Else
    i = 0
    mnuNächste_Seite.Enabled = True
    Reihenfolge_zeichnen
End If
End Sub

Private Sub mnuZTitel_Click()
Dim Titelhöhe As Integer
If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
'Schriftart ändern
Drucker.FontSize = "10"
picDruckvorschau.FontName = "Algerian"
picDruckvorschau.FontSize = Int(28 / Skalierung)
picDruckvorschau.FontUnderline = True
'Stift platziern
picDruckvorschau.CurrentY = 0
picDruckvorschau.CurrentX = Int(((Drucker.ScaleWidth - Links - Rechts - picDruckvorschau.TextWidth(frmHauptmenü.Caption)) / 2) / Skalierung)
Titelhöhe = picDruckvorschau.TextHeight(frmHauptmenü.Caption)
'Titel ausgeben
picDruckvorschau.Print frmHauptmenü.Caption
'Schriftart ändern
picDruckvorschau.FontName = "Times New Roman"
picDruckvorschau.FontSize = Int(12 / Skalierung)
picDruckvorschau.FontUnderline = False
'Leerzeile einfügen
Schrifthöhe = Titelhöhe + picDruckvorschau.TextHeight("I") + 50
End Sub



Public Function Größe_überprüfen(Schrifthöhe As Integer, Drucken As Integer)
Dim Zeilenanzahl As Integer
Dim Anzunehmende_Schrifthöhe As Integer
Zeilenanzahl = 3
With frmHauptmenü
    'Zeilen für zweite und dritte Charakteristik
    If .lab2Truppenname_klein.Caption <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
        If .lab3Truppenname_klein.Caption <> "" Then
            Zeilenanzahl = Zeilenanzahl + 1
        End If
    End If
    'Zeile für Standardausrüstung
    If (.labWaffe <> "" And .labWaffe <> "Handwaffe" And .labWaffe <> "Keule") Or (.labRüstung <> "" And .labRüstung <> "keine" And .labRüstung <> "keine erlaubt") Or (.labFernwaffe <> "" And .labFernwaffe <> "keine") Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    'Zeile  Für Zusatzausrüstung
    If .ckbOption1.Value Or .ckbOption2.Value Or .ckbOption3.Value Or .ckbOption4.Value Or .ckbOption5.Value Or .ckbOption6.Value Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    'Zeile für Musiker und Standartenträger
    If .ckbMusiker.Value Or .ckbStandartenträger.Value Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    'Zeilen für Reichweiten von Kriegsgerät
    If .lab1Reichweite <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .lab2Reichweite <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    'Zeilen für magische Gegenstände
    If .labOption1_Kategorie <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .labOption2_Kategorie <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .labOption3_Kategorie <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .labOption4_Kategorie <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .labSonderregeln.Caption <> "" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    'Zeilen für Zwergenrunen
    If .labOption1 = "Zwergenrunen" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .labOption2 = "Zwergenrunen" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If .labOption3 = "Zwergenrunen" Then
        Zeilenanzahl = Zeilenanzahl + 1
    End If
    If Drucken Then
        Zeilenhöhe = Drucker.TextHeight("I") + 50
    Else
        Zeilenhöhe = picDruckvorschau.TextHeight("I") + 50
    End If
    Anzunehmende_Schrifthöhe = Schrifthöhe + Zeilenhöhe * Zeilenanzahl + 200
    If Anzunehmende_Schrifthöhe > Drucker.ScaleHeight Then
        Größe_überprüfen = -1
    Else
        Größe_überprüfen = 0
    End If
End With
End Function

Public Sub Reichweite_anhängen(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
With frmHauptmenü
    If Drucken Then
        If .lab1Reichweite <> "" Then
            Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
            Drucker.CurrentX = Drucker.TextWidth("i")
            Drucker.CurrentY = Schrifthöhe
            Drucker.Print "Reichweite: " & .lab1Reichweite.Caption & Chr$(9) & " Stärke: " & .lab1Stärke.Caption & Chr$(9) & " Rettungswurf: " & .lab1Rettungswurf.Caption & Chr$(9) & " Schaden: "; .lab1Schaden
            Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
            If .lab2Reichweite <> "" Then
                Drucker.CurrentY = Schrifthöhe + Drucker.TextHeight("N") + 40
                Senkrechte 0, Drucker.CurrentY, 1, 4, Drucken
                Drucker.CurrentY = Schrifthöhe + Drucker.TextHeight("N") + 40
                Drucker.CurrentX = Drucker.TextWidth("i")
                Drucker.Print "Reichweite: " & .lab2Reichweite.Caption & Chr$(9) & " Stärke: " & .lab2Stärke.Caption & Chr$(9) & " Rettungswurf: " & .lab2Rettungswurf.Caption & Chr$(9) & " Schaden: "; .lab2Schaden
                Drucker.CurrentY = Schrifthöhe + Drucker.TextHeight("N") + 40
                Senkrechte Rechterrand, Drucker.CurrentY, 1, 4, Drucken
            End If
        End If
    Else
        If .lab1Reichweite <> "" Then
            Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
            picDruckvorschau.CurrentX = Drucker.TextWidth("i")
            picDruckvorschau.CurrentY = Schrifthöhe
            picDruckvorschau.Print "Reichweite: " & .lab1Reichweite.Caption & Chr$(9) & " Stärke: " & .lab1Stärke.Caption & Chr$(9) & " Rettungswurf: " & .lab1Rettungswurf.Caption & Chr$(9) & " Schaden: "; .lab1Schaden
            Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
            If .lab2Reichweite <> "" Then
                picDruckvorschau.CurrentY = Schrifthöhe + Drucker.TextHeight("N") + 40
                Senkrechte 0, picDruckvorschau.CurrentY, 1, 4, Drucken
                picDruckvorschau.CurrentY = Schrifthöhe + Drucker.TextHeight("N") + 40
                picDruckvorschau.CurrentX = Drucker.TextWidth("i")
                picDruckvorschau.Print "Reichweite: " & .lab2Reichweite.Caption & Chr$(9) & " Stärke: " & .lab2Stärke.Caption & Chr$(9) & " Rettungswurf: " & .lab2Rettungswurf.Caption & Chr$(9) & " Schaden: "; .lab2Schaden
                picDruckvorschau.CurrentY = Schrifthöhe + Drucker.TextHeight("N") + 40
                Senkrechte Rechterrand, picDruckvorschau.CurrentY, 1, 4, Drucken
            End If
        End If
    End If
End With
End Sub

Public Sub Steuerelemente_un_sichtbar(Sichtbar As Integer)
If Sichtbar Then
    vscDruckvorschau.Visible = False
    picDruckvorschau.Visible = False
    labtxtArmee.Visible = True
    labtxtDruckreihenfolge.Visible = True
    comTrennlinie.Visible = True
    labtxtAlle_Drucken.Visible = True
    labtxtAusgewählte_Drucken.Visible = True
    labtxtAusgewählte_nicht_Drucken.Visible = True
    labtxtAlle_nicht_drucken.Visible = True
    lstAuswahl.Visible = True
    lstDrucken.Visible = True
Else
    labtxtArmee.Visible = False
    labtxtDruckreihenfolge.Visible = False
    comTrennlinie.Visible = False
    labtxtAlle_Drucken.Visible = False
    labtxtAusgewählte_Drucken.Visible = False
    labtxtAusgewählte_nicht_Drucken.Visible = False
    labtxtAlle_nicht_drucken.Visible = False
    lstAuswahl.Visible = False
    lstDrucken.Visible = False
    vscDruckvorschau.Visible = True
    picDruckvorschau.Visible = True
End If
End Sub

Private Sub vscDruckvorschau_Change()
picDruckvorschau.Top = -vscDruckvorschau.Value
End Sub





Public Sub Reihenfolge_zeichnen()
'VARIABLEN DEKLARIEREN
Dim Truppentyp As String
Dim Truppennummer As Variant
Dim Seitenumbruch As Integer
Dim k As Integer
Dim PosLinkeKlammer As Integer
Dim PosRechteKlammer As Integer

'SUBSTART
'Mousepointer Sanduhr
Screen.MousePointer = 11

If Not picDruckvorschau.Visible Then
    Steuerelemente_un_sichtbar 0
End If
Seitenumbruch = 0
picDruckvorschau.Cls
Schrifthöhe = 100
If i = 0 Then
    mnuZTitel_Click
End If
Do Until i = lstDrucken.ListCount Or Seitenumbruch
    Truppentyp = Mid(lstDrucken.List(i), 2, 1)
    Select Case Truppentyp
        Case "C"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            
            Charakter_anzeigen dsCharakter, frmHauptmenü.lstCharakteroben.List(Truppennummer - 1), Truppennummer - 1
            If Größe_überprüfen(Schrifthöhe, 0) Then
                Seitenumbruch = -1
            End If
            If Seitenumbruch Then
                i = i - 1
            Else
                If frmHauptmenü.lab2Truppenname_klein.Caption = "" Then
                    Tabelle "Charakter", 1, 0
                Else
                    If frmHauptmenü.lab3Truppenname_klein.Caption = "" Then
                        Tabelle "Charakter", 2, 0
                    Else
                        Tabelle "Charakter", 3, 0
                    End If
                End If
            End If
        Case "R"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Regimenter_anzeigen dsRegimenter, frmHauptmenü.lstRegimenteroben.List(Truppennummer - 1), Truppennummer - 1
            If Größe_überprüfen(Schrifthöhe, 0) Then
                Seitenumbruch = -1
            End If
            If Seitenumbruch Then
                i = i - 1
            Else
                If frmHauptmenü.lab2Truppenname_klein.Caption = "" Then
                    Tabelle "Regimenter", 1, 0
                Else
                    If frmHauptmenü.lab3Truppenname_klein.Caption = "" Then
                        Tabelle "Regimenter", 2, 0
                    Else
                        Tabelle "Regimenter", 3, 0
                    End If
                End If
            End If
        Case "K"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Kriegsgerätinfo_anzeigen dsKriegsgerät, frmHauptmenü.lstKriegsgerätoben.List(Truppennummer - 1), Truppennummer - 1
            If Größe_überprüfen(Schrifthöhe, 0) Then
                Seitenumbruch = -1
            End If
            If Seitenumbruch Then
                i = i - 1
            Else
                If frmHauptmenü.lab2Truppenname_klein.Caption = "" Then
                    Tabelle "Kriegsgerät", 1, 0
                Else
                    If frmHauptmenü.lab3Truppenname_klein.Caption = "" Then
                        Tabelle "Kriegsgerät", 2, 0
                    Else
                        Tabelle "Kriegsgerät", 3, 0
                    End If
                End If
            End If
        Case "M"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Monsterinfo_anzeigen dsMonster, frmHauptmenü.lstMonsteroben.List(Truppennummer - 1), Truppennummer - 1
            If Größe_überprüfen(Schrifthöhe, 0) Then
                Seitenumbruch = -1
            End If
            If Seitenumbruch Then
                i = i - 1
            Else
                Tabelle "Monster", 1, 0
            End If
        Case "-"
            If Schrifthöhe <> 100 Then
                Seitenumbruch = Trennlinie(Schrifthöhe, 0)
                If Seitenumbruch Then
                    i = i - 1
                End If
            End If
        Case Else
            MsgBox "Auszudruckende Truppe nicht gefunden"
    End Select
    i = i + 1
Loop
If i = lstDrucken.ListCount Then
    If Schrifthöhe + 2000 < Drucker.ScaleHeight Then
        mnuZGesamtkosten_Click
        mnuNächste_Seite.Enabled = False
    End If
End If
'Seitenanfang zeigen
vscDruckvorschau.Value = vscDruckvorschau.Min

'Mousepointer normal
Screen.MousePointer = 0
End Sub

Public Sub Reihenfolge_drucken()
Dim Truppentyp As String
Dim Truppennummer As String
Dim Länge As Integer
Dim i As Integer
Dim k As Integer
Dim PosLinkeKlammer As Integer
Dim PosRechteKlammer As Integer

Schrifthöhe = 100
mnuDTitel_Click
i = 0
Do Until i = lstDrucken.ListCount
    Truppentyp = Mid(lstDrucken.List(i), 2, 1)
    Select Case Truppentyp
        Case "C"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Charakter_anzeigen dsCharakter, frmHauptmenü.lstCharakteroben.List(Truppennummer - 1), (Truppennummer - 1)
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            If frmHauptmenü.lab2Truppenname_klein.Caption = "" Then
                Tabelle "Charakter", 1, -1
            Else
                If frmHauptmenü.lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Charakter", 2, -1
                Else
                    Tabelle "Charakter", 3, -1
                End If
            End If
        Case "R"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Regimenter_anzeigen dsRegimenter, frmHauptmenü.lstRegimenteroben.List(Truppennummer - 1), (Truppennummer - 1)
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            If frmHauptmenü.lab2Truppenname_klein.Caption = "" Then
                Tabelle "Regimenter", 1, -1
            Else
                If frmHauptmenü.lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Regimenter", 2, -1
                Else
                    Tabelle "Regimenter", 3, -1
                End If
            End If
        Case "K"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Kriegsgerätinfo_anzeigen dsKriegsgerät, frmHauptmenü.lstKriegsgerätoben.List(Truppennummer - 1), (Truppennummer - 1)
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            If frmHauptmenü.lab2Truppenname_klein.Caption = "" Then
                Tabelle "Kriegsgerät", 1, -1
            Else
                If frmHauptmenü.lab3Truppenname_klein.Caption = "" Then
                    Tabelle "Kriegsgerät", 2, -1
                Else
                    Tabelle "Kriegsgerät", 3, -1
                End If
            End If
        Case "M"
            PosLinkeKlammer = InStr(lstDrucken.List(i), "(")
            PosRechteKlammer = InStr(lstDrucken.List(i), ")")
            Truppennummer = Mid(lstDrucken.List(i), PosLinkeKlammer + 1, PosRechteKlammer - PosLinkeKlammer - 1)
            Monsterinfo_anzeigen dsMonster, frmHauptmenü.lstMonsteroben.List(Truppennummer - 1), (Truppennummer - 1)
            If Größe_überprüfen(Schrifthöhe, -1) Then
                Drucker.NewPage
                Schrifthöhe = 100
            End If
            Tabelle "Monster", 1, -1
        Case "-"
            If Schrifthöhe <> 100 Then
                If Trennlinie(Schrifthöhe, -1) Then
                    Drucker.NewPage
                    Schrifthöhe = 100
                End If
            End If
        Case Else
            MsgBox "Auszudruckende Truppe nicht gefunden"
    End Select
    i = i + 1
Loop
If Schrifthöhe + 2000 < Drucker.ScaleHeight Then
    mnuDGesamtkosten_Click
Else
    Drucker.NewPage
    Schrifthöhe = 100
    mnuDGesamtkosten_Click
End If
End Sub

Public Function Trennlinie(Schrifthöhe As Integer, Drucken As Integer)
Dim Vorraussichtliche_Höhe As Integer
Dim Länge As Integer
If Drucken Then
    Vorraussichtliche_Höhe = Schrifthöhe + Drucker.TextHeight("N") + 290
    If Vorraussichtliche_Höhe > Drucker.ScaleHeight Then
        Trennlinie = -1
    Else
        Länge = Int(Drucker.ScaleWidth / 5)
        Drucker.Line (Länge, Schrifthöhe)-(4 * Länge, Schrifthöhe)
        Drucker.Line (Länge, Schrifthöhe + 90)-(4 * Länge, Schrifthöhe + 90)
        Schrifthöhe = Schrifthöhe + Drucker.TextHeight("N") + 90
        Trennlinie = 0
    End If
Else
    Vorraussichtliche_Höhe = Schrifthöhe + Drucker.TextHeight("N") + 290
    If Vorraussichtliche_Höhe > Drucker.ScaleHeight Then
        Trennlinie = -1
    Else
        Länge = Int(Drucker.ScaleWidth / 5)
        picDruckvorschau.Line (Länge, Schrifthöhe)-(4 * Länge, Schrifthöhe)
        picDruckvorschau.Line (Länge, Schrifthöhe + 90)-(4 * Länge, Schrifthöhe + 90)
        Schrifthöhe = Schrifthöhe + Drucker.TextHeight("N") + 90
        Trennlinie = 0
    End If
End If
End Function

Public Sub Zwergenrunen_ausgeben(Schrifthöhe As Integer, Versatz As Integer, Drucken As Integer)
With frmHauptmenü
    If Drucken Then
        Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
        Drucker.CurrentX = Drucker.TextWidth("i")
        Drucker.CurrentY = Schrifthöhe
        If Zwergenrunen_Zwischenspeicher.Rune3 <> "" Then
            Drucker.Print Zwergenrunen_Zwischenspeicher.Rune1 & ", " & Zwergenrunen_Zwischenspeicher.Rune2 & ", "; Zwergenrunen_Zwischenspeicher.Rune3
        Else
            If Zwergenrunen_Zwischenspeicher.Rune2 <> "" Then
                Drucker.Print Zwergenrunen_Zwischenspeicher.Rune1 & ", " & Zwergenrunen_Zwischenspeicher.Rune2
            Else
                Drucker.Print Zwergenrunen_Zwischenspeicher.Rune1
            End If
        End If
        Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
    Else
        Senkrechte 0, Schrifthöhe - Versatz, 1, 4, Drucken
        picDruckvorschau.CurrentX = Drucker.TextWidth("i")
        picDruckvorschau.CurrentY = Schrifthöhe
        If Zwergenrunen_Zwischenspeicher.Rune3 <> "" Then
            picDruckvorschau.Print Zwergenrunen_Zwischenspeicher.Rune1 & ", " & Zwergenrunen_Zwischenspeicher.Rune2 & ", "; Zwergenrunen_Zwischenspeicher.Rune3
        Else
            If Zwergenrunen_Zwischenspeicher.Rune2 <> "" Then
                picDruckvorschau.Print Zwergenrunen_Zwischenspeicher.Rune1 & ", " & Zwergenrunen_Zwischenspeicher.Rune2
            Else
                picDruckvorschau.Print Zwergenrunen_Zwischenspeicher.Rune1
            End If
        End If
        Senkrechte Rechterrand, Schrifthöhe - Versatz, 1, 4, Drucken
    End If
End With
End Sub
