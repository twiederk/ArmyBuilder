VERSION 4.00
Begin VB.Form frmReittiere 
   Caption         =   "Reittiere"
   ClientHeight    =   2196
   ClientLeft      =   1128
   ClientTop       =   2916
   ClientWidth     =   6936
   Height          =   2580
   Left            =   1080
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   2196
   ScaleWidth      =   6936
   Top             =   2580
   Width           =   7032
   Begin VB.ComboBox cobReittiere 
      Height          =   300
      Left            =   1290
      Style           =   2  'Dropdown List
      TabIndex        =   29
      Top             =   165
      Width           =   3165
   End
   Begin VB.CommandButton comAbbrechen 
      Cancel          =   -1  'True
      Caption         =   "Abbrechen"
      Height          =   330
      Left            =   5565
      TabIndex        =   28
      Top             =   1785
      Width           =   1170
   End
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   5565
      TabIndex        =   27
      Top             =   1365
      Width           =   1170
   End
   Begin VB.Label labtxtPunkte 
      Alignment       =   2  'Center
      Caption         =   "Punkte:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   15.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4725
      TabIndex        =   26
      Top             =   105
      Width           =   960
   End
   Begin VB.Label labPunkte 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   700
         size            =   15.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   330
      Left            =   5775
      TabIndex        =   25
      Top             =   105
      Width           =   855
   End
   Begin VB.Label labtxtTruppenname 
      Caption         =   "Reittier:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   15.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   210
      TabIndex        =   24
      Top             =   150
      Width           =   1065
   End
   Begin VB.Label labtxtSonderregeln 
      Caption         =   "Sonderregeln:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   210
      TabIndex        =   23
      Top             =   1410
      Width           =   1170
   End
   Begin VB.Label labSonderregeln 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   1365
      TabIndex        =   22
      Top             =   1410
      Width           =   3900
   End
   Begin VB.Label labtxtProfil 
      Caption         =   "Profil:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   315
      TabIndex        =   21
      Top             =   630
      Width           =   540
   End
   Begin VB.Label labtxtB 
      Alignment       =   2  'Center
      Caption         =   "B"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2100
      TabIndex        =   20
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtKG 
      Alignment       =   2  'Center
      Caption         =   "KG"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2520
      TabIndex        =   19
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtBF 
      Alignment       =   2  'Center
      Caption         =   "BF"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2940
      TabIndex        =   18
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtS 
      Alignment       =   2  'Center
      Caption         =   "S"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3360
      TabIndex        =   17
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtW 
      Alignment       =   2  'Center
      Caption         =   "W"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3780
      TabIndex        =   16
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtLP 
      Alignment       =   2  'Center
      Caption         =   "LP"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4200
      TabIndex        =   15
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtI 
      Alignment       =   2  'Center
      Caption         =   "I"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4620
      TabIndex        =   14
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtA 
      Alignment       =   2  'Center
      Caption         =   "A"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5040
      TabIndex        =   13
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtMW 
      Alignment       =   2  'Center
      Caption         =   "MW"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5460
      TabIndex        =   12
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labtxtRW 
      Alignment       =   2  'Center
      Caption         =   "RW"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5880
      TabIndex        =   11
      Top             =   735
      Width           =   435
   End
   Begin VB.Label labB 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2100
      TabIndex        =   10
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labKG 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2520
      TabIndex        =   9
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labBF 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2940
      TabIndex        =   8
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labS 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3360
      TabIndex        =   7
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labW 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3780
      TabIndex        =   6
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labLP 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4200
      TabIndex        =   5
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labI 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4620
      TabIndex        =   4
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labA 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5040
      TabIndex        =   3
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labMW 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5460
      TabIndex        =   2
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labRW 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5880
      TabIndex        =   1
      Top             =   945
      Width           =   435
   End
   Begin VB.Label labTruppenname_klein 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.6
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   315
      TabIndex        =   0
      Top             =   945
      Width           =   1695
   End
End
Attribute VB_Name = "frmReittiere"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


Private Sub cobReittiere_Click()
If cobReittiere.Text <> "" Then
    If cobReittiere.Text = "(keines)" Then
        labPunkte = ""
        labTruppenname_klein.Caption = ""
        labB.Caption = ""
        labKG.Caption = ""
        labBF.Caption = ""
        labS.Caption = ""
        labW.Caption = ""
        labLP.Caption = ""
        labI.Caption = ""
        labA.Caption = ""
        labMW.Caption = ""
        labRW.Caption = ""
        labsonderregeln = ""
    Else
        Wandler = "[Truppenname] = '" & cobReittiere.Text & "'"
        dsReittiere.MoveFirst
        dsReittiere.FindFirst Wandler
        'PUNKTWERT
        labPunkte.Caption = dsReittiere.Fields("Punktwert")
        'TRUPPENNAME_KLEIN
        labTruppenname_klein.Caption = dsReittiere.Fields("Truppenname")
        'KG_BEWEGUNG
        If IsNull(dsReittiere.Fields("Bewegung")) Then
            labB.Caption = "-"
        Else
            labB.Caption = dsReittiere.Fields("Bewegung")
        End If
        'KG_KAMPFGESCHICK
        If IsNull(dsReittiere.Fields("Kampfgeschick")) Then
            labKG.Caption = "-"
        Else
            labKG.Caption = dsReittiere.Fields("Kampfgeschick")
        End If
        'KG_BALLISTISCHE FERTIGKEITEN
        If IsNull(dsReittiere.Fields("Ballistische Fertigkeit")) Then
            labBF.Caption = "-"
        Else
            labBF.Caption = dsReittiere.Fields("Ballistische Fertigkeit")
        End If
        'KG_STÄRKE
        If IsNull(dsReittiere.Fields("Stärke")) Then
            labS.Caption = "-"
        Else
            labS.Caption = dsReittiere.Fields("Stärke")
        End If
        'KG_WIDERSTANDS FÄHIGKEIT
        If IsNull(dsReittiere.Fields("Widerstand")) Then
            labW.Caption = "-"
        Else
            labW.Caption = dsReittiere.Fields("Widerstand")
        End If
        'KG_LEBENSPUNKTE
        If IsNull(dsReittiere.Fields("Lebenspunkte")) Then
            labLP.Caption = "-"
        Else
            labLP.Caption = dsReittiere.Fields("Lebenspunkte")
        End If
        'KG_INITATIVE
        If IsNull(dsReittiere.Fields("Initative")) Then
            labI.Caption = "-"
        Else
            labI.Caption = dsReittiere.Fields("Initative")
        End If
        'KG_ATTACKEN
        If IsNull(dsReittiere.Fields("Attacken")) Then
            labA.Caption = "-"
        Else
            labA.Caption = dsReittiere.Fields("Attacken")
        End If
        'KG_MORALWERT
        If IsNull(dsReittiere.Fields("Moralwert")) Then
            labMW.Caption = "-"
        Else
            labMW.Caption = dsReittiere.Fields("Moralwert")
        End If
        'KG_RÜSTUNGSRETTUNGWURF
        If IsNull(dsReittiere.Fields("Rüstungsrettungswurf")) Then
            labRW.Caption = "-"
        Else
            If dsReittiere.Fields("Rüstungsrettungswurf") < 6 Then
                labRW.Caption = dsReittiere.Fields("Rüstungsrettungswurf") & "+"
            Else
                labRW.Caption = dsReittiere.Fields("Rüstungsrettungswurf")
            End If
        End If
        'SONDERREGELN
        If IsNull(dsReittiere.Fields("Sonderregeln")) Then
            labsonderregeln.Caption = ""
        Else
            labsonderregeln.Caption = dsReittiere.Fields("Sonderregeln")
        End If
    End If
End If

End Sub


Private Sub comAbbrechen_Click()
frmReittiere.Hide
frmHauptmenü.Enabled = True
End Sub

Private Sub comOK_Click()
frmReittiere.Hide
frmHauptmenü.Enabled = True
With frmHauptmenü
    'Bewegung wird zuerst übertragen, wegen RW-Berechnung
    .labB2.Caption = labB.Caption
    If labTruppenname_klein <> "" Then
        .lab2truppenname_klein.Caption = labTruppenname_klein.Caption & " (" & labPunkte.Caption & ")"
    Else
        .lab2truppenname_klein.Caption = ""
    End If
    .labKG2.Caption = labKG.Caption
    .labBF2.Caption = labBF.Caption
    .labS2.Caption = labS.Caption
    .labW2.Caption = labW.Caption
    .lablp2.Caption = labLP.Caption
    .labi2.Caption = labI.Caption
    .laba2.Caption = labA.Caption
    .labmw2.Caption = labMW.Caption
    .labrw2.Caption = labRW.Caption
End With
End Sub


Private Sub Form_Load()
frmReittiere.Width = 7050
frmReittiere.Height = 2595
End Sub


