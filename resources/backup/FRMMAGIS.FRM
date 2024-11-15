VERSION 4.00
Begin VB.Form frmMagische_Gegenstände 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Magische Gegestände"
   ClientHeight    =   4950
   ClientLeft      =   30
   ClientTop       =   1395
   ClientWidth     =   11895
   Height          =   5355
   Left            =   -30
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4950
   ScaleWidth      =   11895
   ShowInTaskbar   =   0   'False
   Top             =   1050
   Visible         =   0   'False
   Width           =   12015
   Begin VB.CommandButton comRunensystem 
      Caption         =   "Runensystem"
      Height          =   330
      Left            =   9312
      TabIndex        =   22
      Top             =   3672
      Visible         =   0   'False
      Width           =   1260
   End
   Begin VB.ListBox lstMagische_Standarten 
      Height          =   1200
      Left            =   8928
      Sorted          =   -1  'True
      TabIndex        =   9
      Top             =   312
      Width           =   2850
   End
   Begin VB.ListBox lstChaos_Mutationen 
      Height          =   1200
      Left            =   5988
      Sorted          =   -1  'True
      TabIndex        =   8
      Top             =   312
      Width           =   2850
   End
   Begin VB.ListBox lstHomunkuli 
      Height          =   1200
      Left            =   3048
      Sorted          =   -1  'True
      TabIndex        =   7
      Top             =   312
      Width           =   2850
   End
   Begin VB.ListBox lstMagische_Spruchrollen 
      Height          =   1200
      Left            =   108
      Sorted          =   -1  'True
      TabIndex        =   6
      Top             =   312
      Width           =   2850
   End
   Begin VB.ListBox lstVerschiedene_Magische_Gegenstände 
      Height          =   1395
      Left            =   8928
      Sorted          =   -1  'True
      TabIndex        =   5
      Top             =   1776
      Width           =   2850
   End
   Begin VB.ListBox lstMagische_Schilder 
      Height          =   1395
      Left            =   5988
      Sorted          =   -1  'True
      TabIndex        =   4
      Top             =   1776
      Width           =   2850
   End
   Begin VB.ListBox lstMagische_Rüstungen 
      Height          =   1395
      Left            =   3048
      Sorted          =   -1  'True
      TabIndex        =   3
      Top             =   1776
      Width           =   2850
   End
   Begin VB.CommandButton comAbbrechen 
      Cancel          =   -1  'True
      Caption         =   "Abbrechen"
      Height          =   330
      Left            =   10716
      TabIndex        =   2
      Top             =   3672
      Width           =   960
   End
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   10716
      TabIndex        =   1
      Top             =   3252
      Width           =   960
   End
   Begin VB.ListBox lstMagische_Waffen 
      Height          =   1395
      Left            =   108
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   1776
      Width           =   2850
   End
   Begin VB.Label labKategorie 
      Height          =   336
      Left            =   9348
      TabIndex        =   21
      Top             =   3672
      Visible         =   0   'False
      Width           =   1272
   End
   Begin VB.Label labKosten 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   700
         size            =   15.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   336
      Left            =   9240
      TabIndex        =   20
      Top             =   3252
      Width           =   1272
   End
   Begin VB.Label labKurzinfo 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   336
      Left            =   108
      TabIndex        =   19
      Top             =   3672
      Width           =   10416
   End
   Begin VB.Label labMagischer_Gegenstand 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   15.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   336
      Left            =   108
      TabIndex        =   18
      Top             =   3252
      Width           =   8940
   End
   Begin VB.Label labtxtVerschiedenes 
      Caption         =   "Verschiedenes"
      Height          =   228
      Left            =   8928
      TabIndex        =   17
      Top             =   1572
      Width           =   1068
   End
   Begin VB.Label labtxtSchilder 
      Caption         =   "Schilder"
      Height          =   228
      Left            =   5988
      TabIndex        =   16
      Top             =   1572
      Width           =   648
   End
   Begin VB.Label labtxtRüstungen 
      Caption         =   "Rüstungen"
      Height          =   228
      Left            =   3048
      TabIndex        =   15
      Top             =   1572
      Width           =   852
   End
   Begin VB.Label labtxtWaffen 
      Caption         =   "Waffen"
      Height          =   228
      Left            =   108
      TabIndex        =   14
      Top             =   1572
      Width           =   648
   End
   Begin VB.Label labtxtStandarten 
      Caption         =   "Standarten"
      Height          =   228
      Left            =   8928
      TabIndex        =   13
      Top             =   96
      Width           =   852
   End
   Begin VB.Label labtxtChaos_Mutationen 
      Caption         =   "Chaos Mutationen"
      Height          =   228
      Left            =   5988
      TabIndex        =   12
      Top             =   96
      Width           =   1380
   End
   Begin VB.Label labtxtHomunkuli 
      Caption         =   "Homunkuli"
      Height          =   228
      Left            =   3048
      TabIndex        =   11
      Top             =   96
      Width           =   852
   End
   Begin VB.Label labtxtSpruchrollen 
      Caption         =   "Spruchrollen"
      Height          =   228
      Left            =   108
      TabIndex        =   10
      Top             =   96
      Width           =   960
   End
End
Attribute VB_Name = "frmMagische_Gegenstände"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub comAbbrechen_Click()
'frmMagische_Gegenstände verstecken
frmMagische_Gegenstände.Hide
'Runensystem-Commandbutton unsichtbar machen
comRunensystem.Visible = False
'Charakterbearbeitung ausschalten
Charakterbearbeitung = 0
'Standartenbearbeitung ausschalten
Standartenbearbeitung = 0
'Hauptmenü anzeigen
frmHauptmenü.Enabled = True
End Sub

Private Sub comOK_Click()
Dim Doppelter_Gegenstand As Integer

'Doppelter_Gegenstand Flag aus FALSE setzen
Doppelter_Gegenstand = 0
'Runensystem-Commandbutton unsichtbar machen
comRunensystem.Visible = False
'Auswählen welche Option oder Standarte den frmMagische_Gegenstände aufgerufen hat
Select Case frmMagische_Gegenstände.Tag
    Case "Option1"
        If labKategorie.Caption <> "" And labKategorie.Caption <> "Spruchrolle" And labKategorie.Caption <> "Mutation" And (labKategorie.Caption = frmHauptmenü.laboption2_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption3_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption4_Kategorie.Caption) Then
            MsgBox "Der Charakter besitzt schon eine/einen " & labKategorie.Caption & " !", 16, "Doppelter Gegenstand"
            Doppelter_Gegenstand = -1
        Else
            frmHauptmenü.laboption1_Kategorie.Caption = labKategorie.Caption
            frmHauptmenü.labOption1_Kosten.Caption = labKosten.Caption
            frmHauptmenü.labOption1.Caption = labMagischer_Gegenstand.Caption
        End If
    Case "Option2"
        If labKategorie.Caption <> "" And labKategorie.Caption <> "Spruchrolle" And labKategorie.Caption <> "Mutation" And (labKategorie.Caption = frmHauptmenü.laboption1_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption3_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption4_Kategorie.Caption) Then
            MsgBox "Der Charakter besitzt schon eine/einen " & labKategorie.Caption & " !", 16, "Doppelter Gegenstand"
            Doppelter_Gegenstand = -1
        Else
            frmHauptmenü.laboption2_Kategorie.Caption = labKategorie.Caption
            frmHauptmenü.labOption2_Kosten.Caption = labKosten.Caption
            frmHauptmenü.labOption2.Caption = labMagischer_Gegenstand.Caption
        End If
    Case "Option3"
        If labKategorie.Caption <> "" And labKategorie.Caption <> "Spruchrolle" And labKategorie.Caption <> "Mutation" And (labKategorie.Caption = frmHauptmenü.laboption1_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption2_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption4_Kategorie.Caption) Then
            MsgBox "Der Charakter besitzt schon eine/einen " & labKategorie.Caption & " !", 16, "Doppelter Gegenstand"
            Doppelter_Gegenstand = -1
        Else
            frmHauptmenü.laboption3_Kategorie.Caption = labKategorie.Caption
            frmHauptmenü.labOption3_Kosten.Caption = labKosten.Caption
            frmHauptmenü.labOption3.Caption = labMagischer_Gegenstand.Caption
        End If
    Case "Option4"
        If labKategorie.Caption <> "" And labKategorie.Caption <> "Spruchrolle" And labKategorie.Caption <> "Mutation" And (labKategorie.Caption = frmHauptmenü.laboption1_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption2_Kategorie.Caption Or labKategorie.Caption = frmHauptmenü.laboption3_Kategorie.Caption) Then
            MsgBox "Der Charakter besitzt schon eine/einen " & labKategorie.Caption & " !", 16, "Doppelter Gegenstand"
            Doppelter_Gegenstand = -1
        Else
            frmHauptmenü.laboption4_Kategorie.Caption = labKategorie.Caption
            frmHauptmenü.labOption4_Kosten.Caption = labKosten.Caption
            frmHauptmenü.labOption4.Caption = labMagischer_Gegenstand.Caption
        End If
    Case "Standarte"
        If labMagischer_Gegenstand <> "" Then
            frmHauptmenü.labMagische_Standarte.Caption = labMagischer_Gegenstand.Caption & " (" & labKosten.Caption & ")"
        Else
            frmHauptmenü.labMagische_Standarte.Caption = ""
        End If
    Case Else
        MsgBox "Aufruf nicht gefunden", 0, "TAG-Fehler"
End Select
If Doppelter_Gegenstand Then
Else
    frmMagische_Gegenstände.Hide
    frmHauptmenü.Enabled = True
    If labMagischer_Gegenstand.Caption <> Letzte_Auswahl Then
        Select Case Aktive_zuletzt
            Case "lstmagische_standarten"
                If labMagischer_Gegenstand <> "" Then
                    lstmagische_standarten.RemoveItem lstmagische_standarten.ListIndex
                    If Fokus_zuletzt = "lstRegimenterunten" Or Fokus_zuletzt = "lstCharakterunten" Then
                        Select Case frmMagische_Gegenstände.Tag
                            Case "Standarte"
                                Zwischenspeicher.Standarte = -1
                            Case "Option1"
                                Zwischenspeicher.Option1 = -1
                            Case "Option2"
                                Zwischenspeicher.Option2 = -1
                            Case "Option3"
                                Zwischenspeicher.Option3 = -1
                            Case "Option4"
                                Zwischenspeicher.Option4 = -1
                        End Select
                    End If
                End If
            Case "lstChaos_Mutationen"
                If labMagischer_Gegenstand <> "" Then
                    lstChaos_Mutationen.RemoveItem lstChaos_Mutationen.ListIndex
                    If Fokus_zuletzt = "lstCharakterunten" Then
                        Select Case frmMagische_Gegenstände.Tag
                            Case "Option1"
                                Zwischenspeicher.Option1 = -1
                            Case "Option2"
                                Zwischenspeicher.Option2 = -1
                            Case "Option3"
                                Zwischenspeicher.Option3 = -1
                            Case "Option4"
                                Zwischenspeicher.Option4 = -1
                        End Select
                    End If
                End If
            Case "lstMagische_Waffen"
                If labMagischer_Gegenstand <> "" Then
                    lstMagische_Waffen.RemoveItem lstMagische_Waffen.ListIndex
                    If Fokus_zuletzt = "lstCharakterunten" Then
                        Select Case frmMagische_Gegenstände.Tag
                            Case "Option1"
                                Zwischenspeicher.Option1 = -1
                            Case "Option2"
                                Zwischenspeicher.Option2 = -1
                            Case "Option3"
                                Zwischenspeicher.Option3 = -1
                            Case "Option4"
                                Zwischenspeicher.Option4 = -1
                        End Select
                    End If
                End If
            Case "lstMagische_Rüstungen"
                If labMagischer_Gegenstand <> "" Then
                    lstMagische_Rüstungen.RemoveItem lstMagische_Rüstungen.ListIndex
                    If Fokus_zuletzt = "lstCharakterunten" Then
                        Select Case frmMagische_Gegenstände.Tag
                            Case "Option1"
                                Zwischenspeicher.Option1 = -1
                            Case "Option2"
                                Zwischenspeicher.Option2 = -1
                            Case "Option3"
                                Zwischenspeicher.Option3 = -1
                            Case "Option4"
                                Zwischenspeicher.Option4 = -1
                        End Select
                    End If
                End If
            Case "lstMagische_Schilder"
                If labMagischer_Gegenstand <> "" Then
                    lstMagische_Schilder.RemoveItem lstMagische_Schilder.ListIndex
                    If Fokus_zuletzt = "lstCharakterunten" Then
                        Select Case frmMagische_Gegenstände.Tag
                            Case "Option1"
                                Zwischenspeicher.Option1 = -1
                            Case "Option2"
                                Zwischenspeicher.Option2 = -1
                            Case "Option3"
                                Zwischenspeicher.Option3 = -1
                            Case "Option4"
                                Zwischenspeicher.Option4 = -1
                        End Select
                    End If
                End If
            Case "lstVerschiedene_Magische_Gegenstände"
                If labMagischer_Gegenstand <> "" Then
                    lstVerschiedene_Magische_Gegenstände.RemoveItem lstVerschiedene_Magische_Gegenstände.ListIndex
                    If Fokus_zuletzt = "lstCharakterunten" Then
                        Select Case frmMagische_Gegenstände.Tag
                            Case "Option1"
                                Zwischenspeicher.Option1 = -1
                            Case "Option2"
                                Zwischenspeicher.Option2 = -1
                            Case "Option3"
                                Zwischenspeicher.Option3 = -1
                            Case "Option4"
                                Zwischenspeicher.Option4 = -1
                        End Select
                    End If
                End If
        End Select
        Select Case Letzte_Auswahl_Kategorie
            Case "Spruchrolle"
            Case "Homunkuli"
            Case "Mutation"
                If Letzte_Auswahl <> "" Then
                    Wandler = "[Mutationsname] = '" & Letzte_Auswahl & "'"
                    dsMutationen.MoveFirst
                    dsMutationen.FindFirst Wandler
                    If Not dsMutationen.NoMatch Then
                        Wandler = Letzte_Auswahl & " (" & dsMutationen.Fields("Punktwert") & ")"
                        lstChaos_Mutationen.AddItem Wandler
                    End If
                End If
            Case "Standarte"
                If Letzte_Auswahl <> "" Then
                    Wandler = "[Standartenname] = '" & Letzte_Auswahl & "'"
                    dsStandarten.MoveFirst
                    dsStandarten.FindFirst Wandler
                    If Not dsStandarten.NoMatch Then
                        Wandler = Letzte_Auswahl & " (" & dsStandarten.Fields("Punktwert") & ")"
                        lstmagische_standarten.AddItem Wandler
                    End If
                End If
            Case "Waffe"
                If Letzte_Auswahl <> "" Then
                    Wandler = "[Waffenname] = '" & Letzte_Auswahl & "'"
                    dsMagische_Waffen.MoveFirst
                    dsMagische_Waffen.FindFirst Wandler
                    If Not dsMagische_Waffen.NoMatch Then
                        Wandler = Letzte_Auswahl & " (" & dsMagische_Waffen.Fields("Punktwert") & ")"
                        lstMagische_Waffen.AddItem Wandler
                    End If
                End If
            Case "Rüstung"
                If Letzte_Auswahl <> "" Then
                    Wandler = "[Rüstungsname] = '" & Letzte_Auswahl & "'"
                    dsMagische_Rüstungen.MoveFirst
                    dsMagische_Rüstungen.FindFirst Wandler
                    If Not dsMagische_Rüstungen.NoMatch Then
                        Wandler = Letzte_Auswahl & " (" & dsMagische_Rüstungen.Fields("Punktwert") & ")"
                        lstMagische_Rüstungen.AddItem Wandler
                    End If
                End If
            Case "Schild"
                If Letzte_Auswahl <> "" Then
                    Wandler = "[Schildname] = '" & Letzte_Auswahl & "'"
                    dsMagische_Schilder.MoveFirst
                    dsMagische_Schilder.FindFirst Wandler
                    If Not dsMagische_Schilder.NoMatch Then
                        Wandler = Letzte_Auswahl & " (" & dsMagische_Schilder.Fields("Punktwert") & ")"
                        lstMagische_Schilder.AddItem Wandler
                    End If
                End If
            Case Else
                If Letzte_Auswahl <> "" Then
                    Wandler = "[Gegenstandsname] = '" & Letzte_Auswahl & "'"
                    dsVerschiedene_mag_Gegenstände.MoveFirst
                    dsVerschiedene_mag_Gegenstände.FindFirst Wandler
                    If Not dsVerschiedene_mag_Gegenstände.NoMatch Then
                        Wandler = Letzte_Auswahl & " (" & dsVerschiedene_mag_Gegenstände.Fields("Punktwert") & ")"
                        lstVerschiedene_Magische_Gegenstände.AddItem Wandler
                    End If
               End If
        End Select
    Else
        Standartenbearbeitung = 0
    End If
End If
End Sub







Private Sub comRunensystem_Click()
'Magische Gegenstände verstecken
frmMagische_Gegenstände.Hide
'Listenfelder de-/aktivieren
If frmMagische_Gegenstände.Tag = "Standarte" Then
    frmZwergenrunen.Runenlisten_aktivieren "Schutzrunen"
    frmZwergenrunen.Tag = "Schutzrunen"
End If
'Runensystem anzeigen
frmZwergenrunen.Show
End Sub


Private Sub lstChaos_Mutationen_Click()
Dim Länge As Integer
Dim Name_der_Mutation As String
If lstChaos_Mutationen.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstChaos_Mutationen.Text, "(")
    Name_der_Mutation = Left(lstChaos_Mutationen.Text, Länge - 2)
    dsMutationen.MoveFirst
    Do Until dsMutationen.Fields("Mutationsname") = Name_der_Mutation
        dsMutationen.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_der_Mutation
    labKosten.Caption = dsMutationen.Fields("Punktwert")
    labKategorie.Caption = "Mutation"
    If IsNull(dsMutationen.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsMutationen.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstChaos_Mutationen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstChaos_Mutationen"
End Sub


Private Sub lstHomunkuli_Click()
Dim Länge As Integer
Dim Name_des_Homunkuli As String
If lstHomunkuli.Text = "(keinen)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstHomunkuli.Text, "(")
    Name_des_Homunkuli = Left(lstHomunkuli.Text, Länge - 2)
    dsHomunkuli.MoveFirst
    Do Until dsHomunkuli.Fields("Homunkuliname") = Name_des_Homunkuli
        dsHomunkuli.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_des_Homunkuli
    labKosten.Caption = dsHomunkuli.Fields("Punktwert")
    labKategorie.Caption = "Homunkuli"
    If IsNull(dsHomunkuli.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsHomunkuli.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstHomunkuli_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstHomunkuli"
End Sub


Private Sub lstMagische_Rüstungen_Click()
Dim Länge As Integer
Dim Name_der_Rüstung As String
If lstMagische_Rüstungen.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstMagische_Rüstungen.Text, "(")
    Name_der_Rüstung = Left(lstMagische_Rüstungen.Text, Länge - 2)
    dsMagische_Rüstungen.MoveFirst
    Do Until dsMagische_Rüstungen.Fields("Rüstungsname") = Name_der_Rüstung
        dsMagische_Rüstungen.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_der_Rüstung
    labKosten.Caption = dsMagische_Rüstungen.Fields("Punktwert")
    labKategorie.Caption = "Rüstung"
    If IsNull(dsMagische_Rüstungen.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsMagische_Rüstungen.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstMagische_Rüstungen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstMagische_Rüstungen"
End Sub


Private Sub lstMagische_Schilder_Click()
Dim Länge As Integer
Dim Name_des_Schildes As String
If lstMagische_Schilder.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstMagische_Schilder.Text, "(")
    Name_des_Schildes = Left(lstMagische_Schilder.Text, Länge - 2)
    dsMagische_Schilder.MoveFirst
    Do Until dsMagische_Schilder.Fields("Schildname") = Name_des_Schildes
        dsMagische_Schilder.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_des_Schildes
    labKosten.Caption = dsMagische_Schilder.Fields("Punktwert")
    labKategorie.Caption = "Schild"
    If IsNull(dsMagische_Schilder.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsMagische_Schilder.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstMagische_Schilder_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstMagische_Schilder"
End Sub


Private Sub lstMagische_Spruchrollen_Click()
Dim Länge As Integer
Dim Name_der_Spruchrolle As String
If lstMagische_Spruchrollen.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstMagische_Spruchrollen.Text, "(")
    Name_der_Spruchrolle = Left(lstMagische_Spruchrollen.Text, Länge - 2)
    dsSpruchrollen.MoveFirst
    Do Until dsSpruchrollen.Fields("Spruchrollenname") = Name_der_Spruchrolle
        dsSpruchrollen.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_der_Spruchrolle
    labKosten.Caption = dsSpruchrollen.Fields("Punktwert")
    labKategorie.Caption = "Spruchrolle"
    If IsNull(dsSpruchrollen.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsSpruchrollen.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstMagische_Spruchrollen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstMagische_Spruchrollen"
End Sub


Private Sub lstmagische_standarten_Click()
Dim Länge As Integer
Dim Name_der_Standarte As String
If lstmagische_standarten.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstmagische_standarten.Text, "(")
    Name_der_Standarte = Left(lstmagische_standarten.Text, Länge - 2)
    dsStandarten.MoveFirst
    Do Until dsStandarten.Fields("Standartenname") = Name_der_Standarte
        dsStandarten.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_der_Standarte
    labKosten.Caption = dsStandarten.Fields("Punktwert")
    labKategorie.Caption = "Standarte"
    If IsNull(dsStandarten.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsStandarten.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstmagische_standarten_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstmagische_standarten"
End Sub


Private Sub lstMagische_Waffen_Click()
Dim Länge As Integer
Dim Name_der_Waffe As String
If lstMagische_Waffen.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstMagische_Waffen.Text, "(")
    Name_der_Waffe = Left(lstMagische_Waffen.Text, Länge - 2)
    dsMagische_Waffen.MoveFirst
    Do Until dsMagische_Waffen.Fields("Waffenname") = Name_der_Waffe
        dsMagische_Waffen.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_der_Waffe
    labKosten.Caption = dsMagische_Waffen.Fields("Punktwert")
    labKategorie.Caption = "Waffe"
    If IsNull(dsMagische_Waffen.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsMagische_Waffen.Fields("Kurzinfo")
    End If
End If
End Sub


Private Sub lstMagische_Waffen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstMagische_Waffen"
End Sub


Private Sub lstVerschiedene_Magische_Gegenstände_Click()
Dim Länge As Integer
Dim Name_des_Gegenstands As String
If lstVerschiedene_Magische_Gegenstände.Text = "(keine)" Then
    labMagischer_Gegenstand.Caption = ""
    labKosten.Caption = ""
    labKurzinfo.Caption = ""
    labKategorie.Caption = ""
Else
    Länge = InStr(lstVerschiedene_Magische_Gegenstände.Text, "(")
    Name_des_Gegenstands = Left(lstVerschiedene_Magische_Gegenstände.Text, Länge - 2)
    dsVerschiedene_mag_Gegenstände.MoveFirst
    Do Until dsVerschiedene_mag_Gegenstände.Fields("Gegenstandsname") = Name_des_Gegenstands
        dsVerschiedene_mag_Gegenstände.MoveNext
    Loop
    labMagischer_Gegenstand.Caption = Name_des_Gegenstands
    labKosten.Caption = dsVerschiedene_mag_Gegenstände.Fields("Punktwert")
    labKategorie.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
    If IsNull(dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")) Then
        labKurzinfo.Caption = ""
    Else
        labKurzinfo.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
    End If
End If
End Sub

Private Sub lstVerschiedene_Magische_Gegenstände_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Aktive_zuletzt = "lstVerschiedene_Magische_Gegenstände"
End Sub


