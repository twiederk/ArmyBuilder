VERSION 4.00
Begin VB.Form frmZwergenrunen 
   Caption         =   "Zwergenrunen"
   ClientHeight    =   4128
   ClientLeft      =   24
   ClientTop       =   8124
   ClientWidth     =   12024
   Height          =   4464
   Left            =   -24
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4128
   ScaleWidth      =   12024
   Top             =   7836
   Width           =   12120
   Begin VB.ListBox lstWaffenrunen 
      Height          =   1584
      Left            =   96
      TabIndex        =   25
      Top             =   384
      Width           =   2300
   End
   Begin VB.ListBox lstTalismanrunen 
      Height          =   1584
      Left            =   9696
      TabIndex        =   24
      Top             =   384
      Width           =   2300
   End
   Begin VB.ListBox lstRüstungsrunen 
      Height          =   1584
      Left            =   2496
      TabIndex        =   23
      Top             =   384
      Width           =   2300
   End
   Begin VB.ListBox lstSchutzrunen 
      Height          =   1584
      Left            =   4896
      TabIndex        =   22
      Top             =   384
      Width           =   2300
   End
   Begin VB.CommandButton comAbbrechen 
      Caption         =   "Abbrechen"
      Height          =   396
      Left            =   10848
      TabIndex        =   2
      Top             =   3552
      Width           =   1068
   End
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Height          =   396
      Left            =   10848
      TabIndex        =   1
      Top             =   3072
      Width           =   1068
   End
   Begin VB.ListBox lstMaschinenrunen 
      DragIcon        =   "FRMZWERG.frx":0000
      Height          =   1584
      Left            =   7296
      MouseIcon       =   "FRMZWERG.frx":030A
      TabIndex        =   0
      Top             =   384
      Width           =   2300
   End
   Begin VB.Label labtxtTalismanrunen 
      Caption         =   "Talismanrunen"
      Height          =   204
      Left            =   9696
      TabIndex        =   29
      Top             =   192
      Width           =   1356
   End
   Begin VB.Label labtxtSchutzrunen 
      Caption         =   "Schutzrunen"
      Height          =   204
      Left            =   4896
      TabIndex        =   28
      Top             =   192
      Width           =   972
   End
   Begin VB.Label labtxtRüstungsrunen 
      Caption         =   "Rüstungsrunen"
      Height          =   204
      Left            =   2496
      TabIndex        =   27
      Top             =   192
      Width           =   1164
   End
   Begin VB.Label labtxtWaffenrunen 
      Caption         =   "Waffenrunen"
      Height          =   204
      Left            =   96
      TabIndex        =   26
      Top             =   192
      Width           =   972
   End
   Begin VB.Label labtxtGesamtkosten 
      Alignment       =   2  'Center
      Caption         =   "Gesamtkosten"
      Height          =   204
      Left            =   10848
      TabIndex        =   21
      Top             =   2208
      Width           =   1068
   End
   Begin VB.Label labGesamtkosten 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   700
         size            =   16.2
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   396
      Left            =   11040
      TabIndex        =   20
      Top             =   2496
      Width           =   684
   End
   Begin VB.Label labRune3_Kategorie 
      Height          =   300
      Left            =   8928
      TabIndex        =   19
      Top             =   3648
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Label labRune3_Kurzinfo 
      Height          =   300
      Left            =   3648
      TabIndex        =   18
      Top             =   3648
      Width           =   6924
   End
   Begin VB.Label labRune3_Kosten 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Left            =   2976
      TabIndex        =   17
      Top             =   3648
      Width           =   492
   End
   Begin VB.Label labRune3 
      BorderStyle     =   1  'Fixed Single
      DragIcon        =   "FRMZWERG.frx":0614
      Height          =   300
      Left            =   96
      TabIndex        =   16
      Top             =   3648
      Width           =   2700
   End
   Begin VB.Label labRune2_Kategorie 
      Height          =   300
      Left            =   8928
      TabIndex        =   15
      Top             =   3168
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Label labRune2_Kurzinfo 
      Height          =   300
      Left            =   3648
      TabIndex        =   14
      Top             =   3168
      Width           =   6924
   End
   Begin VB.Label labRune2_Kosten 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Left            =   2976
      TabIndex        =   13
      Top             =   3168
      Width           =   492
   End
   Begin VB.Label labRune1_Kategorie 
      Height          =   300
      Left            =   8928
      TabIndex        =   12
      Top             =   2688
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Label labaktuelle_Rune_Kategorie 
      Height          =   300
      Left            =   8832
      TabIndex        =   11
      Top             =   2208
      Visible         =   0   'False
      Width           =   876
   End
   Begin VB.Label labRune1_Kosten 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   300
      Left            =   2976
      TabIndex        =   10
      Top             =   2688
      Width           =   492
   End
   Begin VB.Label labRune1_Kurzinfo 
      Height          =   300
      Left            =   3648
      TabIndex        =   9
      Top             =   2688
      Width           =   6924
   End
   Begin VB.Label labaktuelle_Rune_Kosten 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   700
         size            =   16.2
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   396
      Left            =   2976
      TabIndex        =   8
      Top             =   2112
      Width           =   492
   End
   Begin VB.Label labaktuelle_Rune_Kurzinfo 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3648
      TabIndex        =   7
      Top             =   2208
      Width           =   6924
   End
   Begin VB.Label labaktuelle_Rune 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   16.2
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   396
      Left            =   96
      TabIndex        =   6
      Top             =   2112
      Width           =   2700
   End
   Begin VB.Label labtxtMaschinenrunen 
      Caption         =   "Maschinenrunen"
      Height          =   204
      Left            =   7296
      TabIndex        =   5
      Top             =   192
      Width           =   1260
   End
   Begin VB.Label labRune2 
      BorderStyle     =   1  'Fixed Single
      DragIcon        =   "FRMZWERG.frx":091E
      Height          =   300
      Left            =   96
      TabIndex        =   4
      Top             =   3168
      Width           =   2700
   End
   Begin VB.Label labRune1 
      BorderStyle     =   1  'Fixed Single
      DragIcon        =   "FRMZWERG.frx":0C28
      Height          =   300
      Left            =   96
      TabIndex        =   3
      Top             =   2688
      Width           =   2700
   End
End
Attribute VB_Name = "frmZwergenrunen"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub comAbbrechen_Click()
Select Case frmZwergenrunen.Tag
    Case "Maschinenrunen"
        'Kriegsgerätbearbeitung abschalten
        Kriegsgerätbearbeitung = 0
        'Hauptmenüanzeigen
        frmHauptmenü.Enabled = True
    Case "Schutzrunen"
End Select
        'frmZwergenrunen verstecken
        frmZwergenrunen.Hide
End Sub

Private Sub comOK_Click()
frmZwergenrunen.Hide
Select Case frmZwergenrunen.Tag
    Case "Maschinenrunen"
        Maschinenrunen_OK
    Case "Schutzrunen"
        Schutzrunen_OK
End Select
frmHauptmenü.Enabled = True
End Sub


Private Sub labRune1_DragDrop(Source As Control, X As Single, Y As Single)
labRune1 = labaktuelle_Rune
labRune1_Kosten = labaktuelle_rune_kosten
labRune1_Kurzinfo = labaktuelle_Rune_Kurzinfo
labRune1_Kategorie = labaktuelle_Rune_Kategorie
End Sub


Private Sub labRune1_Kosten_Change()
Kosten_berechnen
End Sub

Private Sub labRune1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
labRune1.Drag
End Sub


Private Sub labRune2_DragDrop(Source As Control, X As Single, Y As Single)
labRune2 = labaktuelle_Rune
labRune2_Kosten = labaktuelle_rune_kosten
labRune2_Kurzinfo = labaktuelle_Rune_Kurzinfo
labRune2_Kategorie = labaktuelle_Rune_Kategorie
End Sub

Private Sub labRune2_Kosten_Change()
Kosten_berechnen
End Sub

Private Sub labRune2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
labRune2.Drag
End Sub


Private Sub labRune3_DragDrop(Source As Control, X As Single, Y As Single)
labRune3 = labaktuelle_Rune
labRune3_Kosten = labaktuelle_rune_kosten
labRune3_Kurzinfo = labaktuelle_Rune_Kurzinfo
labRune3_Kategorie = labaktuelle_Rune_Kategorie
End Sub

Private Sub labRune3_Kosten_Change()
Kosten_berechnen
End Sub

Private Sub labRune3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
labRune3.Drag
End Sub


Private Sub lstMaschinenrunen_Click()
Dim Länge As Integer
Dim Name_der_Rune As String

Länge = InStr(lstMaschinenrunen.Text, "(")
Name_der_Rune = Left(lstMaschinenrunen.Text, Länge - 2)
dsMaschinenrunen.MoveFirst
Do Until dsMaschinenrunen.Fields("Runenname") = Name_der_Rune
    dsMaschinenrunen.MoveNext
Loop
labaktuelle_Rune = Name_der_Rune
labaktuelle_rune_kosten = dsMaschinenrunen.Fields("Punktwert")
If IsNull(dsMaschinenrunen.Fields("Kurzinfo")) Then
    labaktuelle_Rune_Kurzinfo = ""
Else
    labaktuelle_Rune_Kurzinfo = dsMaschinenrunen.Fields("Kurzinfo")
End If
labaktuelle_Rune_Kategorie = "Maschinenrune"
End Sub

Private Sub lstMaschinenrunen_DragDrop(Source As Control, X As Single, Y As Single)
If (TypeOf Source Is Label) Then
    Select Case Source.Name
        Case "labRune1"
            If labRune1_Kategorie = "Maschinenrune" Then
                labRune1 = ""
                labRune1_Kosten = ""
                labRune1_Kurzinfo = ""
                labRune1_Kategorie = ""
            End If
        Case "labRune2"
            If labRune2_Kategorie = "Maschinenrune" Then
                labRune2 = ""
                labRune2_Kosten = ""
                labRune2_Kurzinfo = ""
                labRune2_Kategorie = ""
            End If
        Case "labRune3"
            If labRune3_Kategorie = "Maschinenrune" Then
                labRune3 = ""
                labRune3_Kosten = ""
                labRune3_Kurzinfo = ""
                labRune3_Kategorie = ""
            End If
    End Select
End If
End Sub


Private Sub lstMaschinenrunen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lstMaschinenrunen.Drag
End Sub



Public Sub Kosten_berechnen()
Wandler = 0
If labRune1_Kosten <> "" Then
    Wandler = Wandler + labRune1_Kosten
End If
If labRune2_Kosten <> "" Then
    Wandler = Wandler + labRune2_Kosten
End If
If labRune3_Kosten <> "" Then
    Wandler = Wandler + labRune3_Kosten
End If
labGesamtkosten = Wandler
End Sub

Public Sub Slots_ordnen()
If labRune1 = "" Then
    If labRune2 = "" Then
        labRune1 = labRune3
        labRune1_Kosten = labRune3_Kosten
        labRune3_Kosten = ""
        labRune3 = ""
    Else
        If labRune3 = "" Then
            labRune1 = labRune2
            labRune1_Kosten = labRune2_Kosten
            labRune2_Kosten = ""
            labRune2 = ""
        Else
            labRune1 = labRune3
            labRune1_Kosten = labRune3_Kosten
            labRune3_Kosten = ""
            labRune3 = ""
        End If
    End If
Else
    If labRune2 = "" Then
        labRune2 = labRune3
        labRune2_Kosten = labRune3_Kosten
        labRune3_Kosten = ""
        labRune3 = ""
    End If
End If
End Sub

Public Sub Runenlisten_aktivieren(Runenliste As String)
Select Case Runenliste
    Case "Kriegsgerätrunen"
        lstMaschinenrunen.Enabled = True
        lstSchutzrunen.Enabled = False
        lstRüstungsrunen.Enabled = False
        lstTalismanrunen.Enabled = False
        lstWaffenrunen.Enabled = False
    Case "Schutzrunen"
        lstMaschinenrunen.Enabled = False
        lstSchutzrunen.Enabled = True
        lstRüstungsrunen.Enabled = False
        lstTalismanrunen.Enabled = False
        lstWaffenrunen.Enabled = False
    Case "Charakterrunen"
        lstMaschinenrunen.Enabled = False
        lstSchutzrunen.Enabled = False
        lstRüstungsrunen.Enabled = True
        lstTalismanrunen.Enabled = True
        lstWaffenrunen.Enabled = True
End Select
End Sub

Public Sub Runen_Slot_leeren(Slotnummer As Integer)
Select Case Slotnummer
    Case 0
        'aktuelle Rune
        frmZwergenrunen.labaktuelle_Rune = ""
        frmZwergenrunen.labaktuelle_rune_kosten = ""
        frmZwergenrunen.labaktuelle_Rune_Kurzinfo = ""
        frmZwergenrunen.labaktuelle_Rune_Kategorie = ""
    Case 1
        'Rune 1
        frmZwergenrunen.labRune1 = ""
        frmZwergenrunen.labRune1_Kosten = ""
        frmZwergenrunen.labRune1_Kurzinfo = ""
        frmZwergenrunen.labRune1_Kategorie = ""
    Case 2
        'Rune 2
        frmZwergenrunen.labRune2 = ""
        frmZwergenrunen.labRune2_Kosten = ""
        frmZwergenrunen.labRune2_Kurzinfo = ""
        frmZwergenrunen.labRune2_Kategorie = ""
    Case 3
        'Rune 3
        frmZwergenrunen.labRune3 = ""
        frmZwergenrunen.labRune3_Kosten = ""
        frmZwergenrunen.labRune3_Kurzinfo = ""
        frmZwergenrunen.labRune3_Kategorie = ""
End Select

End Sub

Private Sub lstSchutzrunen_Click()
Dim Länge As Integer
Dim Name_der_Rune As String

Länge = InStr(lstSchutzrunen.Text, "(")
Name_der_Rune = Left(lstSchutzrunen.Text, Länge - 2)
dsSchutzrunen.MoveFirst
Do Until dsSchutzrunen.Fields("Runenname") = Name_der_Rune
    dsSchutzrunen.MoveNext
Loop
labaktuelle_Rune = Name_der_Rune
labaktuelle_rune_kosten = dsSchutzrunen.Fields("Punktwert")
If IsNull(dsSchutzrunen.Fields("Kurzinfo")) Then
    labaktuelle_Rune_Kurzinfo = ""
Else
    labaktuelle_Rune_Kurzinfo = dsSchutzrunen.Fields("Kurzinfo")
End If
labaktuelle_Rune_Kategorie = "Schutzrune"

End Sub



Public Sub Maschinenrunen_OK()
If labGesamtkosten = "0" Then
    'In frmHauptmenü Zwergenrunen löschen
    frmHauptmenü.labOption2_Kosten = ""
    frmHauptmenü.labOption2 = ""
    frmHauptmenü.laboption2_Kategorie = ""
Else
    'In frmHauptmenü Standardwerte setzen
    frmHauptmenü.labOption2_Kosten = labGesamtkosten
    frmHauptmenü.labOption2 = ""
    frmHauptmenü.labOption2 = "Zwergenrunen"
    frmHauptmenü.laboption2_Kategorie = "Maschinenrunen"
End If
        
'Slots von oben nach unten füllen
Slots_ordnen
        
'Neue Runenkombination für schon bezahltes Kriegsgerät aktualisieren
If Kriegsgerätbearbeitung Then
    'Namen der Zwergenrunen speichern
    If labRune1 <> "" Then
        Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Rune1 = labRune1 & " (" & labRune1_Kosten & ")"
    Else
        Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Rune1 = ""
    End If
    If labRune2 <> "" Then
        Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Rune2 = labRune2 & " (" & labRune2_Kosten & ")"
    Else
        Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Rune2 = ""
    End If
    If labRune3 <> "" Then
        Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Rune3 = labRune3 & " (" & labRune3_Kosten & ")"
    Else
        Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Rune3 = ""
    End If
    'Kosten der Zwergenrunen speichern
    Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListIndex).Zwergenrunen_Kriegsgerät.Runenkosten = labGesamtkosten
End If
'Kriegsgeräteditionsmodus abschalten
Kriegsgerätbearbeitung = 0
        
'Runen in Zwergenrunen_Zwischenspeicher übertragen
If labRune1 <> "" Then
    Zwergenrunen_Zwischenspeicher.Rune1 = labRune1 & " (" & labRune1_Kosten & ")"
Else
    Zwergenrunen_Zwischenspeicher.Rune1 = ""
End If
If labRune2 <> "" Then
    Zwergenrunen_Zwischenspeicher.Rune2 = labRune2 & " (" & labRune2_Kosten & ")"
Else
    Zwergenrunen_Zwischenspeicher.Rune2 = ""
End If
If labRune3 <> "" Then
    Zwergenrunen_Zwischenspeicher.Rune3 = labRune3 & " (" & labRune3_Kosten & ")"
Else
    Zwergenrunen_Zwischenspeicher.Rune3 = ""
End If
'Gesamtkosten der Zwergenrunen in Zwischenspeicher ablegen
Wandler = labGesamtkosten
Zwergenrunen_Zwischenspeicher.Runenkosten = Wandler

'Alle Runen_Slots_leeren
'Runen_Slot_leeren 0
'Runen_Slot_leeren 1
'Runen_Slot_leeren 2
'Runen_Slot_leeren 3

End Sub

Public Sub Schutzrunen_OK()
If labGesamtkosten = "0" Then
    'In frmHauptmenü Zwergenrunen löschen
    frmHauptmenü.labMagische_Standarte = ""
Else
    'In frmHauptmenü Standardwerte setzen
    frmHauptmenü.labMagische_Standarte = "Zwergenrunen (" & labGesamtkosten & ")"
End If

'Slots von oben nach unten füllen
Slots_ordnen

'Runen in Zwergenrunen_Zwischenspeicher übertragen
If labRune1 <> "" Then
    Zwergenrunen_Zwischenspeicher.Rune1 = labRune1 & " (" & labRune1_Kosten & ")"
Else
    Zwergenrunen_Zwischenspeicher.Rune1 = ""
End If
If labRune2 <> "" Then
    Zwergenrunen_Zwischenspeicher.Rune2 = labRune2 & " (" & labRune2_Kosten & ")"
Else
    Zwergenrunen_Zwischenspeicher.Rune2 = ""
End If
If labRune3 <> "" Then
    Zwergenrunen_Zwischenspeicher.Rune3 = labRune3 & " (" & labRune3_Kosten & ")"
Else
    Zwergenrunen_Zwischenspeicher.Rune3 = ""
End If
'Gesamtkosten der Zwergenrunen in Zwischenspeicher ablegen
Wandler = labGesamtkosten
Zwergenrunen_Zwischenspeicher.Runenkosten = Wandler


'frmMagische_Gegenstände.comOK_Click

End Sub

Private Sub lstSchutzrunen_DragDrop(Source As Control, X As Single, Y As Single)
If (TypeOf Source Is Label) Then
    Select Case Source.Name
        Case "labRune1"
            If labRune1_Kategorie = "Schutzrune" Then
                labRune1 = ""
                labRune1_Kosten = ""
                labRune1_Kurzinfo = ""
                labRune1_Kategorie = ""
            End If
        Case "labRune2"
            If labRune2_Kategorie = "Schutzrune" Then
                labRune2 = ""
                labRune2_Kosten = ""
                labRune2_Kurzinfo = ""
                labRune2_Kategorie = ""
            End If
        Case "labRune3"
            If labRune3_Kategorie = "Schutzrune" Then
                labRune3 = ""
                labRune3_Kosten = ""
                labRune3_Kurzinfo = ""
                labRune3_Kategorie = ""
            End If
    End Select
End If

End Sub


