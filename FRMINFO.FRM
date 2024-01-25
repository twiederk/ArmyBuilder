VERSION 4.00
Begin VB.Form frmInfo 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Info"
   ClientHeight    =   5175
   ClientLeft      =   3090
   ClientTop       =   2550
   ClientWidth     =   5115
   Height          =   5580
   Left            =   3030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   5115
   ShowInTaskbar   =   0   'False
   Top             =   2205
   Visible         =   0   'False
   Width           =   5235
   Begin VB.CommandButton comInfoOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   2112
      TabIndex        =   3
      Top             =   4608
      Width           =   855
   End
   Begin VB.Label labtxtVersion1_1_Neuigkeiten4 
      Caption         =   "- Berechnung des Profilbonus für Charakter"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   672
      TabIndex        =   15
      Top             =   1824
      Width           =   3852
   End
   Begin VB.Label labtxtVersion1_1_Neuigkeiten3 
      Caption         =   "- Berechnung des  RW für Charakter"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   672
      TabIndex        =   14
      Top             =   2112
      Width           =   3180
   End
   Begin VB.Label labtxtVersion1_1_Neuigkeiten2 
      Caption         =   "- Ergänzungen in der Ausrüstung für Regimenter"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   675
      TabIndex        =   13
      Top             =   1530
      Width           =   4260
   End
   Begin VB.Label labtxtVersion1_1_Neuigkeiten1 
      Caption         =   "- Punktezähler für Verbündete"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   204
      Left            =   672
      TabIndex        =   12
      Top             =   1248
      Width           =   3372
   End
   Begin VB.Label labtxtEMail 
      Caption         =   "E-Mail: wiederke@rumms.uni-mannheim.de"
      ForeColor       =   &H00000000&
      Height          =   204
      Left            =   1056
      TabIndex        =   11
      Top             =   4224
      Width           =   3180
   End
   Begin VB.Label labtxtVersion1_1_Datum 
      Caption         =   "3. April 97"
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
      Left            =   3456
      TabIndex        =   10
      Top             =   864
      Width           =   1164
   End
   Begin VB.Label labtxtVersion1_1 
      Caption         =   "Version 1.1"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   570
      TabIndex        =   9
      Top             =   870
      Width           =   1260
   End
   Begin VB.Label labtxtBeta_Version_Datum 
      Alignment       =   1  'Right Justify
      Caption         =   "26. September.96"
      Height          =   228
      Left            =   3024
      TabIndex        =   8
      Top             =   3072
      Width           =   1272
   End
   Begin VB.Label labtxtBeta_Version 
      Caption         =   "Beta-Version"
      Height          =   228
      Left            =   828
      TabIndex        =   7
      Top             =   3072
      Width           =   1380
   End
   Begin VB.Label labtxtVersion1_0_Datum 
      Alignment       =   1  'Right Justify
      Caption         =   "28. November 96"
      Height          =   228
      Left            =   2688
      TabIndex        =   6
      Top             =   2880
      Width           =   1596
   End
   Begin VB.Label labtxtProgrammierbeginn_Datum1 
      Alignment       =   1  'Right Justify
      Caption         =   "28. August.96"
      Height          =   228
      Left            =   3240
      TabIndex        =   5
      Top             =   3264
      Width           =   1068
   End
   Begin VB.Label labtxtProgrammierbeginn 
      Caption         =   "Programmierbeginn"
      Height          =   228
      Left            =   828
      TabIndex        =   4
      Top             =   3264
      Width           =   1488
   End
   Begin VB.Label labinfoText 
      Alignment       =   2  'Center
      Caption         =   "Programmiert von Torsten Wiederkehr"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   14.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   288
      TabIndex        =   2
      Top             =   3840
      Width           =   4632
   End
   Begin VB.Label labtxtVersion1_0 
      Caption         =   "Version 1.0"
      Height          =   228
      Left            =   828
      TabIndex        =   1
      Top             =   2880
      Width           =   1176
   End
   Begin VB.Label labInfoTitel 
      Alignment       =   2  'Center
      Caption         =   "Warhammer Armeelisten"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   18
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   336
      Left            =   672
      TabIndex        =   0
      Top             =   216
      Width           =   3696
   End
End
Attribute VB_Name = "frmInfo"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub comInfoOK_Click()
frmInfo.Visible = False
End Sub



Private Sub Form_Load()
Top = frmStart.ScaleHeight / 6
Left = frmStart.ScaleWidth / 4
Height = 5500
Width = 5200
End Sub


