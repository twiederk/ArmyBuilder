VERSION 4.00
Begin VB.Form frmCharakter 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Charakter"
   ClientHeight    =   2175
   ClientLeft      =   2370
   ClientTop       =   2910
   ClientWidth     =   2595
   Height          =   2580
   Left            =   2310
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   2595
   ShowInTaskbar   =   0   'False
   Top             =   2565
   Visible         =   0   'False
   Width           =   2715
   Begin VB.CommandButton comAbbrechen 
      Cancel          =   -1  'True
      Caption         =   "Abbrechen"
      Height          =   330
      Left            =   1155
      TabIndex        =   2
      Top             =   1680
      Width           =   1275
   End
   Begin VB.ListBox lstAusrüstung 
      Height          =   1425
      Left            =   105
      TabIndex        =   1
      Top             =   105
      Width           =   2325
   End
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   105
      TabIndex        =   0
      Top             =   1680
      Width           =   855
   End
End
Attribute VB_Name = "frmCharakter"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub comAbbrechen_Click()
Unload frmCharakter
frmHauptmenü.Enabled = True
End Sub

Private Sub comOK_Click()
Select Case frmCharakter.Caption
Case "Waffe"
    frmHauptmenü.labWaffe.Caption = lstAusrüstung.Text
Case "Rüstung"
    frmHauptmenü.labRüstung.Caption = lstAusrüstung.Text
Case "Fernwaffe"
    frmHauptmenü.labfernwaffe.Caption = lstAusrüstung.Text
End Select
Unload frmCharakter
frmHauptmenü.Enabled = True
End Sub


Private Sub Form_Load()
frmCharakter.Caption = Charaktereditions_Modus
Select Case frmHauptmenü.Caption
    Case "Orks & Goblins"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Kurzbogen (1)"
                lstAusrüstung.AddItem "Bogen (2)"
                lstAusrüstung.AddItem "Armbrust (3)"
            Case "Rüstung"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Schild (1)"
                lstAusrüstung.AddItem "leichte Rüstung (2)"
                lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
        End Select
    Case "Zwerge"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Pistole (2)"
                lstAusrüstung.AddItem "Armbrust (3)"
            Case "Rüstung"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Schild (1)"
                lstAusrüstung.AddItem "leichte Rüstung (2)"
                lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                lstAusrüstung.AddItem "schwere Rüstung (3)"
                lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
        End Select
    Case "Hochelfen"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Kurzbogen (1)"
                lstAusrüstung.AddItem "Bogen (2)"
                lstAusrüstung.AddItem "Langbogen (3)"
                lstAusrüstung.AddItem "Wurfspies (1)"
                lstAusrüstung.AddItem "Schleuder (1)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild, Harnisch (8)"
                End If
        End Select
    Case "Imperium"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Bogen (2)"
                lstAusrüstung.AddItem "Langbogen (3)"
                lstAusrüstung.AddItem "Armbrust (3)"
                lstAusrüstung.AddItem "Muskete (3)"
                lstAusrüstung.AddItem "Pistole (2)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild, Harnisch (8)"
                End If
        End Select
    Case "Chaos"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Bogen (2)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild, Harnisch (8)"
                End If
        End Select
    Case "Untote"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Bogen (2)"
                lstAusrüstung.AddItem "Armbrust (3)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild, Harnisch (8)"
                End If
        End Select
    Case "Dunkelelfen"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Repetier-Armbrust (3)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Drachenumhang (5)"
                    lstAusrüstung.AddItem "Drachenumhang und Schild (6)"
                End If
        End Select
    Case "Waldelfen"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "Langbogen (3)"
                lstAusrüstung.AddItem "Wurfspeer (1)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                End If
        End Select
    Case "Skaven"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
            Case "Rüstung"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Schild (1)"
                lstAusrüstung.AddItem "leichte Rüstung (2)"
                lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                lstAusrüstung.AddItem "schwere Rüstung (3)"
                lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Wurfspeer (1)"
                lstAusrüstung.AddItem "Schleuder (1)"
                lstAusrüstung.AddItem "Pistole (2)"
                lstAusrüstung.AddItem "Muskete (3)"
        End Select
    Case "Echsenmenschen"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "Kurzbogen (1)"
                lstAusrüstung.AddItem "Wurfspeer (1)"
            Case "Rüstung"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Schild (1)"
                lstAusrüstung.AddItem "leichte Rüstung (2)"
                lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
        End Select
    Case "Bretonen"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Bogen (2)"
                lstAusrüstung.AddItem "Langbogen (3)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Harnisch (4)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild, Harnisch (8)"
                End If
        End Select
    Case "Chaoszwerge"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
            Case "Fernwaffe"
                lstAusrüstung.AddItem "keine"
                lstAusrüstung.AddItem "Kurzbogen (1)"
                lstAusrüstung.AddItem "Bogen (2)"
                lstAusrüstung.AddItem "Wurfspeer (1)"
                lstAusrüstung.AddItem "Schleuder (1)"
                lstAusrüstung.AddItem "Pistole (2)"
                lstAusrüstung.AddItem "Muskete (3)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                End If
        End Select
    Case "Tiermenschen"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                End If
        End Select
    Case "Chaoskrieger"
        Select Case frmCharakter.Caption
            Case "Waffe"
                lstAusrüstung.AddItem "Handwaffe"
                lstAusrüstung.AddItem "zweite Handwaffe (1)"
                lstAusrüstung.AddItem "zweihändige Waffe (2)"
                lstAusrüstung.AddItem "Flegel (1)"
                lstAusrüstung.AddItem "Hellebarde (2)"
                lstAusrüstung.AddItem "Speer (1)"
                lstAusrüstung.AddItem "Lanze (2)"
            Case "Rüstung"
                If dsCharakter.Fields("Zauberer") Then
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Chaosrüstung (10)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Chaosrüstung, Harnisch (14)"
                Else
                    lstAusrüstung.AddItem "keine"
                    lstAusrüstung.AddItem "Schild (1)"
                    lstAusrüstung.AddItem "leichte Rüstung (2)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild (3)"
                    lstAusrüstung.AddItem "schwere Rüstung (3)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild (4)"
                    lstAusrüstung.AddItem "Harnisch (4)"
                    lstAusrüstung.AddItem "Schild, Harnisch (5)"
                    lstAusrüstung.AddItem "leichte Rüstung, Harnisch (6)"
                    lstAusrüstung.AddItem "leichte Rüstung und Schild, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung, Harnisch (7)"
                    lstAusrüstung.AddItem "schwere Rüstung und Schild, Harnisch (8)"
                    lstAusrüstung.AddItem "Chaosrüstung (10)"
                    lstAusrüstung.AddItem "Chaosrüstung und Schild (11)"
                    lstAusrüstung.AddItem "Chaosrüstung, Harnisch (14)"
                    lstAusrüstung.AddItem "Chaosrüstung und Schild, Harnisch (15)"
                End If
        End Select
    Case Else
        lstAusrüstung.AddItem "keine Auswahl"
End Select
End Sub


