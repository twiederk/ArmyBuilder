VERSION 4.00
Begin VB.Form frmHauptmenü 
   Caption         =   "Hauptmenü"
   ClientHeight    =   7875
   ClientLeft      =   165
   ClientTop       =   825
   ClientWidth     =   12000
   Height          =   8565
   Left            =   105
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7875
   ScaleWidth      =   12000
   Top             =   195
   Visible         =   0   'False
   Width           =   12120
   Begin VB.ListBox lstCharakterunten 
      DragIcon        =   "FRMHAUPT.frx":0000
      Height          =   1815
      Left            =   105
      Sorted          =   -1  'True
      TabIndex        =   116
      Top             =   2205
      Width           =   2850
   End
   Begin VB.ListBox lstCharakteroben 
      DragIcon        =   "FRMHAUPT.frx":030A
      Height          =   1815
      Left            =   105
      TabIndex        =   115
      Top             =   315
      Width           =   2850
   End
   Begin VB.PictureBox picAnzahl_minus_eins 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   7350
      Picture         =   "FRMHAUPT.frx":0614
      ScaleHeight     =   315
      ScaleWidth      =   390
      TabIndex        =   114
      Top             =   7560
      Width           =   390
   End
   Begin VB.PictureBox picAnzahl_plus_eins 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   7350
      Picture         =   "FRMHAUPT.frx":0CA2
      ScaleHeight     =   315
      ScaleWidth      =   390
      TabIndex        =   113
      Top             =   7245
      Width           =   390
   End
   Begin VB.PictureBox picAnzahl_minus_zehn 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   405
      Left            =   7770
      Picture         =   "FRMHAUPT.frx":1330
      ScaleHeight     =   405
      ScaleWidth      =   390
      TabIndex        =   112
      Top             =   7560
      Width           =   390
   End
   Begin VB.PictureBox picAnzahl_plus_zehn 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   420
      Left            =   7770
      Picture         =   "FRMHAUPT.frx":1A66
      ScaleHeight     =   420
      ScaleWidth      =   390
      TabIndex        =   111
      Top             =   7140
      Width           =   390
   End
   Begin VB.CheckBox ckbStandartenträger 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   104
      Top             =   6720
      Width           =   225
   End
   Begin VB.CheckBox ckbMusiker 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   102
      Top             =   6408
      Width           =   225
   End
   Begin VB.CheckBox ckbOption6 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   99
      Top             =   6096
      Width           =   225
   End
   Begin VB.ListBox lstRegimenterunten 
      DragIcon        =   "FRMHAUPT.frx":21B8
      Height          =   1815
      Left            =   3045
      TabIndex        =   98
      Top             =   2205
      Width           =   2850
   End
   Begin VB.ListBox lstRegimenteroben 
      DragIcon        =   "FRMHAUPT.frx":24C2
      Height          =   1815
      Left            =   3045
      TabIndex        =   97
      Top             =   315
      Width           =   2850
   End
   Begin VB.CheckBox ckbOption5 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   73
      Top             =   5772
      Width           =   225
   End
   Begin VB.CheckBox ckbOption4 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   72
      Top             =   5460
      Width           =   225
   End
   Begin VB.CheckBox ckbOption3 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   71
      Top             =   5148
      Width           =   225
   End
   Begin VB.CheckBox ckbOption2 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   69
      Top             =   4836
      Width           =   225
   End
   Begin VB.CheckBox ckbOption1 
      Enabled         =   0   'False
      Height          =   225
      Left            =   7908
      TabIndex        =   67
      Top             =   4512
      Width           =   225
   End
   Begin VB.ListBox lstKriegsgerätunten 
      Height          =   1815
      Left            =   5988
      TabIndex        =   36
      Top             =   2208
      Width           =   2850
   End
   Begin VB.ListBox lstKriegsgerätoben 
      Height          =   1815
      Left            =   5988
      TabIndex        =   35
      Top             =   312
      Width           =   2850
   End
   Begin VB.ListBox lstMonsterunten 
      DragIcon        =   "FRMHAUPT.frx":27CC
      Height          =   1815
      Left            =   8925
      TabIndex        =   5
      Top             =   2205
      Width           =   2850
   End
   Begin VB.ListBox lstMonsteroben 
      DragIcon        =   "FRMHAUPT.frx":2AD6
      Height          =   1815
      Left            =   8940
      TabIndex        =   4
      Top             =   312
      Width           =   2850
   End
   Begin VB.Label labAnz 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   7440
      TabIndex        =   129
      Top             =   4830
      Width           =   432
   End
   Begin VB.Label labtxtAnz 
      Alignment       =   2  'Center
      Caption         =   "Anz."
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   7464
      TabIndex        =   128
      Top             =   4620
      Width           =   432
   End
   Begin VB.Label labVerbündetepunkte 
      Alignment       =   1  'Right Justify
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   11208
      TabIndex        =   127
      Top             =   72
      Width           =   564
   End
   Begin VB.Label labtxtVerbündete 
      Caption         =   "Verbündete:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   10272
      TabIndex        =   126
      Top             =   96
      Width           =   972
   End
   Begin VB.Label labOption4_Kategorie 
      Height          =   225
      Left            =   10290
      TabIndex        =   125
      Top             =   5460
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label labOption3_Kategorie 
      Height          =   225
      Left            =   10290
      TabIndex        =   124
      Top             =   5145
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label labOption2_Kategorie 
      Height          =   225
      Left            =   10290
      TabIndex        =   123
      Top             =   4830
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label labOption1_Kategorie 
      Height          =   225
      Left            =   10290
      TabIndex        =   122
      Top             =   4515
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label labMagische_Standarte 
      Height          =   276
      Left            =   9720
      TabIndex        =   121
      Top             =   6720
      Width           =   2064
   End
   Begin VB.Label labFernwaffe 
      Height          =   276
      Left            =   4728
      TabIndex        =   120
      Top             =   5772
      Width           =   2988
   End
   Begin VB.Label labtxtFernwaffe 
      Caption         =   "Fernwaffe:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3780
      TabIndex        =   119
      Top             =   5775
      Width           =   855
   End
   Begin VB.Label labCharakterpunkte 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Height          =   225
      Left            =   2100
      TabIndex        =   118
      Top             =   105
      Width           =   750
   End
   Begin VB.Label labtxtCharakter 
      Caption         =   "Charakter:"
      Height          =   225
      Left            =   105
      TabIndex        =   117
      Top             =   105
      Width           =   750
   End
   Begin VB.Label labAnzahl 
      Alignment       =   2  'Center
      Caption         =   "1"
      Height          =   225
      Left            =   6720
      TabIndex        =   110
      Top             =   7455
      Width           =   540
   End
   Begin VB.Label labtxtX 
      Caption         =   "X"
      Height          =   225
      Left            =   6405
      TabIndex        =   109
      Top             =   7455
      Width           =   225
   End
   Begin VB.Label labtxtAnzahl 
      Caption         =   "Anzahl"
      Height          =   225
      Left            =   6720
      TabIndex        =   108
      Top             =   7245
      Width           =   540
   End
   Begin VB.Label labEinzelkosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   5355
      TabIndex        =   107
      Top             =   7455
      Width           =   960
   End
   Begin VB.Label labtxtEinzelkosten 
      Caption         =   "Einzelkosten"
      Height          =   225
      Left            =   5355
      TabIndex        =   106
      Top             =   7245
      Width           =   960
   End
   Begin VB.Label labtxtStandartenträger 
      Caption         =   "Standartenträger"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   8280
      TabIndex        =   105
      Top             =   6720
      Width           =   1380
   End
   Begin VB.Label labtxtMusiker 
      Caption         =   "Musiker"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   8280
      TabIndex        =   103
      Top             =   6408
      Width           =   756
   End
   Begin VB.Label labOption6_Kosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   11130
      TabIndex        =   101
      Top             =   6090
      Width           =   540
   End
   Begin VB.Label labRegimenterpunkte 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Height          =   225
      Left            =   5040
      TabIndex        =   96
      Top             =   105
      Width           =   750
   End
   Begin VB.Label labtxtRegimenter 
      Caption         =   "Regimenter:"
      Height          =   225
      Left            =   3045
      TabIndex        =   95
      Top             =   105
      Width           =   960
   End
   Begin VB.Label lab2Schaden 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3990
      TabIndex        =   94
      Top             =   7455
      Width           =   750
   End
   Begin VB.Label lab1Schaden 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3990
      TabIndex        =   93
      Top             =   7245
      Width           =   750
   End
   Begin VB.Label lab2Rettungswurf 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2625
      TabIndex        =   92
      Top             =   7455
      Width           =   1170
   End
   Begin VB.Label lab1Rettungswurf 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2625
      TabIndex        =   91
      Top             =   7245
      Width           =   1170
   End
   Begin VB.Label lab2Stärke 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1260
      TabIndex        =   90
      Top             =   7455
      Width           =   1170
   End
   Begin VB.Label lab1Stärke 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1260
      TabIndex        =   89
      Top             =   7245
      Width           =   1170
   End
   Begin VB.Label lab2Reichweite 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   105
      TabIndex        =   88
      Top             =   7455
      Width           =   960
   End
   Begin VB.Label lab1Reichweite 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   96
      TabIndex        =   87
      Top             =   7245
      Width           =   960
   End
   Begin VB.Label labtxtSchaden 
      Alignment       =   2  'Center
      Caption         =   "Schaden"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3990
      TabIndex        =   86
      Top             =   7035
      Width           =   750
   End
   Begin VB.Label labtxtRettungswurf 
      Alignment       =   2  'Center
      Caption         =   "Rettungswurf"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2625
      TabIndex        =   85
      Top             =   7035
      Width           =   1170
   End
   Begin VB.Label labtxtStärke 
      Alignment       =   2  'Center
      Caption         =   "Stärke"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1260
      TabIndex        =   84
      Top             =   7035
      Width           =   1170
   End
   Begin VB.Label labtxtReichweite 
      Alignment       =   2  'Center
      Caption         =   "Reichweite"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   108
      TabIndex        =   83
      Top             =   7032
      Width           =   960
   End
   Begin VB.Label labOption3_Kosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   11130
      TabIndex        =   82
      Top             =   5145
      Width           =   540
   End
   Begin VB.Label labOption3 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   8280
      TabIndex        =   81
      Top             =   5148
      Width           =   2652
   End
   Begin VB.Label labOption5_Kosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   11130
      TabIndex        =   80
      Top             =   5775
      Width           =   540
   End
   Begin VB.Label labOption4_Kosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   11130
      TabIndex        =   79
      Top             =   5460
      Width           =   540
   End
   Begin VB.Label labOption2_Kosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   11130
      TabIndex        =   78
      Top             =   4830
      Width           =   540
   End
   Begin VB.Label labOption1_Kosten 
      Alignment       =   2  'Center
      Height          =   225
      Left            =   11130
      TabIndex        =   77
      Top             =   4515
      Width           =   540
   End
   Begin VB.Label labtxtKosten 
      Alignment       =   2  'Center
      Caption         =   "Kosten"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   11025
      TabIndex        =   76
      Top             =   4200
      Width           =   750
   End
   Begin VB.Label labOption5 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   8280
      TabIndex        =   75
      Top             =   5772
      Width           =   2652
   End
   Begin VB.Label labOption4 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   8280
      TabIndex        =   74
      Top             =   5460
      Width           =   2652
   End
   Begin VB.Label labOption2 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   8280
      TabIndex        =   70
      Top             =   4836
      Width           =   2652
   End
   Begin VB.Label labOption1 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   8280
      TabIndex        =   68
      Top             =   4512
      Width           =   2652
   End
   Begin VB.Label labtxtOptionen 
      Caption         =   "Optionen/Magische Gegenstände"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   8040
      TabIndex        =   66
      Top             =   4200
      Width           =   2748
   End
   Begin VB.Label labRüstung 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   948
      TabIndex        =   65
      Top             =   6096
      Width           =   6768
   End
   Begin VB.Label labtxtRüstung 
      Caption         =   "Rüstung:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   105
      TabIndex        =   64
      Top             =   6090
      Width           =   750
   End
   Begin VB.Label labWaffe 
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   735
      TabIndex        =   63
      Top             =   5775
      Width           =   2955
   End
   Begin VB.Label labtxtWaffe 
      Caption         =   "Waffe:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   105
      TabIndex        =   62
      Top             =   5775
      Width           =   540
   End
   Begin VB.Label labB3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3255
      TabIndex        =   61
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labRW3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   7035
      TabIndex        =   60
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labMW3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6615
      TabIndex        =   59
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labA3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6195
      TabIndex        =   58
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labI3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5775
      TabIndex        =   57
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labLP3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5355
      TabIndex        =   56
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labW3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4935
      TabIndex        =   55
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labS3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4515
      TabIndex        =   54
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labBF3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4095
      TabIndex        =   53
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label labKG3 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3675
      TabIndex        =   52
      Top             =   5460
      Width           =   435
   End
   Begin VB.Label lab3Truppenname_klein 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   105
      TabIndex        =   51
      Top             =   5460
      Width           =   3060
   End
   Begin VB.Label labRW2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   7035
      TabIndex        =   50
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labMW2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6615
      TabIndex        =   49
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labA2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6195
      TabIndex        =   48
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labI2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5775
      TabIndex        =   47
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labLP2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5355
      TabIndex        =   46
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labW2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4935
      TabIndex        =   45
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labS2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4515
      TabIndex        =   44
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labBF2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4095
      TabIndex        =   43
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labKG2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3675
      TabIndex        =   42
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label labB2 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3255
      TabIndex        =   41
      Top             =   5145
      Width           =   435
   End
   Begin VB.Label lab2Truppenname_klein 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   96
      TabIndex        =   40
      Top             =   5148
      Width           =   3060
   End
   Begin VB.Label labTruppenname_klein 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   108
      TabIndex        =   39
      Top             =   4800
      Width           =   3060
   End
   Begin VB.Label labKriegsgerätpunkte 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Height          =   225
      Left            =   8085
      TabIndex        =   38
      Top             =   105
      Width           =   645
   End
   Begin VB.Label labtxtKriegsgerät 
      Caption         =   "Kriegsgerät:"
      Height          =   225
      Left            =   5985
      TabIndex        =   37
      Top             =   105
      Width           =   855
   End
   Begin VB.Label labSonderregeln 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   1368
      TabIndex        =   34
      Top             =   6408
      Width           =   6348
   End
   Begin VB.Label labtxtSonderregeln 
      Caption         =   "Sonderregeln:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   105
      TabIndex        =   33
      Top             =   6405
      Width           =   1170
   End
   Begin VB.Label labPunkte 
      Alignment       =   2  'Center
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
      Height          =   330
      Left            =   8295
      TabIndex        =   32
      Top             =   7560
      Width           =   855
   End
   Begin VB.Label labRW 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   7035
      TabIndex        =   31
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labMW 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6615
      TabIndex        =   30
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labA 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6195
      TabIndex        =   29
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labI 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5775
      TabIndex        =   28
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labLP 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5355
      TabIndex        =   27
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labW 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4935
      TabIndex        =   26
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labS 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4515
      TabIndex        =   25
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labBF 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4095
      TabIndex        =   24
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labKG 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3675
      TabIndex        =   23
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labB 
      Alignment       =   2  'Center
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3255
      TabIndex        =   22
      Top             =   4830
      Width           =   435
   End
   Begin VB.Label labtxtPunkte 
      Alignment       =   2  'Center
      Caption         =   "Punkte"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   15.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   8295
      TabIndex        =   21
      Top             =   7245
      Width           =   855
   End
   Begin VB.Label labtxtRW 
      Alignment       =   2  'Center
      Caption         =   "RW"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   10.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   7035
      TabIndex        =   20
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtMW 
      Alignment       =   2  'Center
      Caption         =   "MW"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6615
      TabIndex        =   19
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtA 
      Alignment       =   2  'Center
      Caption         =   "A"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6195
      TabIndex        =   18
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtI 
      Alignment       =   2  'Center
      Caption         =   "I"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5775
      TabIndex        =   17
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtLP 
      Alignment       =   2  'Center
      Caption         =   "LP"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5355
      TabIndex        =   16
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtW 
      Alignment       =   2  'Center
      Caption         =   "W"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4935
      TabIndex        =   15
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtS 
      Alignment       =   2  'Center
      Caption         =   "S"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4515
      TabIndex        =   14
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtBF 
      Alignment       =   2  'Center
      Caption         =   "BF"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4095
      TabIndex        =   13
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtKG 
      Alignment       =   2  'Center
      Caption         =   "KG"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3675
      TabIndex        =   12
      Top             =   4620
      Width           =   435
   End
   Begin VB.Label labtxtB 
      Alignment       =   2  'Center
      Caption         =   "B"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3255
      TabIndex        =   11
      Top             =   4620
      Width           =   435
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
      Left            =   105
      TabIndex        =   10
      Top             =   4515
      Width           =   540
   End
   Begin VB.Label labTruppentyp 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   14.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   6195
      TabIndex        =   9
      Top             =   4155
      Width           =   1380
   End
   Begin VB.Label labtxtTruppentyp 
      Caption         =   "Typ:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   5775
      TabIndex        =   8
      Top             =   4200
      Width           =   435
   End
   Begin VB.Label labTruppenname_groß 
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   14.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   330
      Left            =   735
      TabIndex        =   7
      Top             =   4155
      Width           =   4965
   End
   Begin VB.Label labtxtTruppenname 
      Caption         =   "Name:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   105
      TabIndex        =   6
      Top             =   4200
      Width           =   540
   End
   Begin VB.Line linTrennstrich 
      BorderColor     =   &H00808080&
      BorderWidth     =   2
      X1              =   11760
      X2              =   105
      Y1              =   4095
      Y2              =   4095
   End
   Begin VB.Label labMonsterpunkte 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   228
      Left            =   9600
      TabIndex        =   3
      Top             =   108
      Width           =   468
   End
   Begin VB.Label labtxtMonster 
      Caption         =   "Monster:"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   8925
      TabIndex        =   2
      Top             =   105
      Width           =   750
   End
   Begin VB.Label labRestpunkte 
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
      Height          =   330
      Left            =   9870
      TabIndex        =   1
      Top             =   7560
      Width           =   1695
   End
   Begin VB.Label labRestpunktzahl 
      Caption         =   "Restpunktzahl"
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   15.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   9870
      TabIndex        =   0
      Top             =   7245
      Width           =   1800
   End
   Begin VB.Label labOption6 
      Height          =   276
      Left            =   8280
      TabIndex        =   100
      Top             =   6096
      Width           =   2652
   End
   Begin VB.Menu mnuDatei 
      Caption         =   "&Datei"
      Begin VB.Menu mnuDSpeichern 
         Caption         =   "Speichern"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuDSpeichern_unter 
         Caption         =   "Speichern unter..."
      End
      Begin VB.Menu mnuDTrennlinie1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDDrucken 
         Caption         =   "&Drucken"
      End
      Begin VB.Menu mnuDTrennlinie2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDBeenden 
         Caption         =   "Edition &Beenden"
      End
   End
   Begin VB.Menu mnuHilfe 
      Caption         =   "&Hilfe"
      Begin VB.Menu mnuHInfo 
         Caption         =   "&Info"
      End
   End
End
Attribute VB_Name = "frmHauptmenü"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ckbMusiker_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbMusiker.Value Then
        'Einzelkosten ermitteln
        If labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = labEinzelkosten.Caption * 1 + labPunkte.Caption
        Else
            Wandler = .labEinzelkosten.Caption * 2 + labPunkte.Caption
        End If
        .labPunkte.Caption = Wandler
    Else
        'Einzelkosten ermitteln
        If labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = (0 + .labPunkte.Caption) - (.labEinzelkosten.Caption * 1)
        Else
            Wandler = (0 + .labPunkte.Caption) - (.labEinzelkosten.Caption * 2)
        End If
        .labPunkte.Caption = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Musiker = .ckbMusiker.Value
    End If
End If
End With
End Sub

Private Sub ckbOption1_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbOption1.Value Then
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption + .labOption1_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_einfügen (.labOption1.Caption)
    Else
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption - .labOption1_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_herausnehmen (.labOption1.Caption)
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Option1 = .ckbOption1.Value
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Option1 = .ckbOption1.Value
    End If
End If
End With
End Sub


Private Sub ckbOption2_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbOption2.Value Then
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption + .labOption2_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_einfügen (.labOption2.Caption)
    Else
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption - .labOption2_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_herausnehmen (.labOption2.Caption)
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Option2 = .ckbOption2.Value
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Option2 = .ckbOption2.Value
    End If
End If
End With
End Sub


Private Sub ckbOption3_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbOption3.Value Then
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption + .labOption3_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_einfügen (.labOption3.Caption)
    Else
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption - .labOption3_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_herausnehmen (.labOption3.Caption)
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Option3 = .ckbOption3.Value
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Option3 = .ckbOption3.Value
    End If
End If
End With
End Sub


Private Sub ckbOption4_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbOption4.Value Then
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption + .labOption4_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_einfügen (.labOption4.Caption)
    Else
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption - .labOption4_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_herausnehmen (.labOption4.Caption)
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Option4 = .ckbOption4.Value
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Option4 = .ckbOption4.Value
    End If
End If
End With
End Sub

Private Sub ckbOption5_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbOption5.Value Then
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption + .labOption5_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_einfügen (.labOption5.Caption)
    Else
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption - .labOption5_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_herausnehmen (.labOption5.Caption)
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Option5 = .ckbOption5.Value
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Option5 = .ckbOption5.Value
    End If
End If
End With
End Sub


Private Sub ckbOption6_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbOption6.Value Then
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption + .labOption6_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_einfügen (.labOption6.Caption)
    Else
        'Einzelkosten ermitteln
        Wandler = 0 + .labEinzelkosten.Caption - .labOption6_Kosten
        .labEinzelkosten.Caption = Wandler
        'Konsequenzen ermitteln
        Konsequenz_herausnehmen (.labOption6.Caption)
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Option6 = .ckbOption6.Value
    End If
End If
End With
End Sub


Private Sub ckbStandartenträger_Click()
With frmHauptmenü
If Optionen_Initalisieren Then
Else
    If .ckbStandartenträger.Value Then
        'Einzelkosten ermitteln
        If labTruppenname_groß = "Drachenprinzen von Caledor" Or labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = .labEinzelkosten.Caption * 1 + labPunkte.Caption
        Else
            Wandler = .labEinzelkosten.Caption * 2 + labPunkte.Caption
        End If
        .labPunkte.Caption = Wandler
    Else
        'Einzelkosten ermitteln
        If labTruppenname_groß = "Drachenprinzen von Caledor" Or labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = (0 + .labPunkte.Caption) - (.labEinzelkosten.Caption * 1)
        Else
            Wandler = (0 + .labPunkte.Caption) - (.labEinzelkosten.Caption * 2)
        End If
        .labPunkte.Caption = Wandler
        If .labMagische_Standarte.Caption <> "" Then
            frmMagische_Gegenstände.lstmagische_standarten.AddItem .labMagische_Standarte.Caption
            Zwischenspeicher.Standarte = 0
        End If
        .labMagische_Standarte.Caption = ""
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Standartenträger = .ckbStandartenträger.Value
    End If
End If
End With
End Sub

Private Sub Form_Load()
mnuHilfe.Caption = Chr$(8) & "&Hilfe"

Fokus_zuletzt = ""
Aktive_zuletzt = ""
Letzte_Auswahl = ""
Letzte_Auswahl_Kategorie = ""
Charaktereditions_Modus = ""
Letzter_Punktestand = 0

Charakterpunkte = 0
Charakterzähler = 0
Charakterbearbeitung = 0
General = 0
Armeestandarte = 0

Regimenterpunkte = 0
Regimenterzähler = 0
Standartenbearbeitung = 0

Kriegsgerätpunkte = 0
Kriegsgerätzähler = 0

Monsterpunkte = 0
Monsterzähler = 0

Verbündetepunkte = 0
End Sub


Private Sub imgAnzahl_minus_eins_Click()
If labAnzahl.Caption <> "1" And labEinzelkosten.Caption <> "" Then
    Wandler = labAnzahl.Caption - 1
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub

Private Sub imgAnzahl_minus_zehn_Click()
Wandler = 0 + labAnzahl.Caption
If labAnzahl.Caption > 10 And labEinzelkosten.Caption <> "" Then
    Wandler = labAnzahl.Caption - 10
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub


Private Sub imgAnzahl_plus_eins_Click()
If labEinzelkosten.Caption <> "" Then
    Wandler = labAnzahl.Caption + 1
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub

Private Sub imgAnzahl_plus_zehn_Click()
If labEinzelkosten.Caption <> "" Then
    Wandler = labAnzahl.Caption + 10
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub




Private Sub lab2truppenname_klein_Change()
If Optionen_Initalisieren Then
Else
    If -lab2truppenname_klein.BorderStyle Then
        Charakterkosten_Berechnung
        Rüstungsrettungswurf_einstellen
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).Reittier = lab2truppenname_klein.Caption
        End If
    End If
End If
End Sub

Private Sub lab2truppenname_klein_Click()
Dim Zähler As Integer
If -lab2truppenname_klein.BorderStyle Then
    If Fokus_zuletzt = "lstCharakteroben" Then
        Charakterbearbeitung = -1
    End If
    If lab2truppenname_klein.Caption <> "" Then
        Wandler = Left(lab2truppenname_klein.Caption, InStr(lab2truppenname_klein.Caption, "(") - 2)
        Zähler = 0
        Do Until frmReittiere.cobReittiere.List(Zähler) = Wandler
            Zähler = Zähler + 1
        Loop
        frmReittiere.cobReittiere.ListIndex = Zähler
    End If
    frmReittiere.Top = 1035
    frmReittiere.Left = 2500
    frmReittiere.Show
    frmHauptmenü.Enabled = False
End If
End Sub

Private Sub labAnzahl_Change()
If labEinzelkosten.Caption <> "" Then
    'Kosten für Anzahl berechnen
    Wandler = labEinzelkosten.Caption * labAnzahl.Caption
    
    'Kosten für Musiker berechnen
    If ckbMusiker.Value Then
        If labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = Wandler + (labEinzelkosten.Caption * 1)
        Else
            Wandler = Wandler + (labEinzelkosten.Caption * 2)
        End If
    End If
        
    'Kosten für Standartenträger berechnen
    If ckbStandartenträger.Value Then
        If labTruppenname_groß = "Drachenprinzen von Caledor" Or labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = Wandler + (labEinzelkosten.Caption * 1)
        Else
            Wandler = Wandler + (labEinzelkosten.Caption * 2)
        End If
    End If
    
    'Kosten für magische Standarte berechnen
    If labMagische_Standarte.Caption <> "" And Not Optionen_Initalisieren Then
        Länge = InStr(labMagische_Standarte.Caption, "(")
        Name_der_Standarte = Left(labMagische_Standarte.Caption, Länge - 2)
        If Name_der_Standarte <> "Zwergenrunen" Then
            dsStandarten.MoveFirst
            Do Until dsStandarten.Fields("Standartenname") = Name_der_Standarte
                dsStandarten.MoveNext
            Loop
            If labTruppenname_groß = "Drachenprinzen von Caledor" Then
                Wandler = Wandler + (dsStandarten.Fields("Punktwert") / 2)
            Else
                Wandler = Wandler + dsStandarten.Fields("Punktwert")
            End If
        Else
            'Überprüfen ob Standarte über oder unter 100 Punkte kostet
            If Len(frmHauptmenü.labMagische_Standarte.Caption) = 17 Then
                'Punkte kosten für zweistellige Zahl herausschneiden
                Zwergenstandarte_Kosten = Left(Right(labMagische_Standarte, 3), 2)
            Else
                'Punkte kosten für dreistellige Zahl herausschneiden
                Zwergenstandarte_Kosten = Left(Right(labMagische_Standarte, 4), 3)
            End If
            Wandler = Wandler + Zwergenstandarte_Kosten
        End If
    End If
    
    'Berchnete Kosten eintragen
    labPunkte = Wandler
    
End If
End Sub

Private Sub labCharakterpunkte_Change()
Dim Umwandler As Variant
Umwandler = labCharakterpunkte.Caption + 0
If Umwandler > Maximalpunkte * 0.5 Then
    MsgBox "Sie dürfen maximal " & Int(Maximalpunkte * 0.5) & " Punkte auf Charakter verwenden", 64, "Charakteranteil Überschritten"
    labCharakterpunkte.ForeColor = &HFF&
Else
    If labCharakterpunkte.ForeColor = &HFF& Then
        labCharakterpunkte.ForeColor = &H0&
    End If
End If
End Sub

Public Sub labEinzelkosten_Change()
Dim Name_der_Standarte As String
Dim Länge As Integer
If Optionen_Initalisieren Then
Else
    'Kosten für Anzahl berechnen
    Wandler = labEinzelkosten.Caption * labAnzahl.Caption
    'Kosten für Musiker berechnen
    If ckbMusiker.Value And Not Optionen_Initalisieren Then
    Wandler = Wandler + (labEinzelkosten.Caption * 2)
    End If
    'Kosten für Standartenträger berechnen
    If ckbStandartenträger.Value And Not Optionen_Initalisieren Then
    Wandler = Wandler + (labEinzelkosten.Caption * 2)
    End If
    'Kosten für magische Standarte berechnen
    If labMagische_Standarte.Caption <> "" And Not Optionen_Initalisieren Then
        Länge = InStr(labMagische_Standarte.Caption, "(")
        Name_der_Standarte = Left(labMagische_Standarte.Caption, Länge - 2)
        dsStandarten.MoveFirst
        Do Until dsStandarten.Fields("Standartenname") = Name_der_Standarte
            dsStandarten.MoveNext
        Loop
        Wandler = Wandler + dsStandarten.Fields("Punktwert")
    End If
    'Berechnete Kosten eintragen
    labPunkte = Wandler
End If
End Sub

Private Sub labfernwaffe_Change()
If Optionen_Initalisieren Then
Else
    If -labfernwaffe.BorderStyle Then
        Charakterkosten_Berechnung
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).Fernwaffe = labfernwaffe.Caption
        End If
    End If
End If
End Sub

Private Sub labfernwaffe_Click()
If -labfernwaffe.BorderStyle Then
    If Fokus_zuletzt = "lstCharakteroben" Then
        Charakterbearbeitung = -1
    End If
    Charaktereditions_Modus = "Fernwaffe"
    frmCharakter.Top = 4700
    frmCharakter.Left = 4800
    frmCharakter.Width = 2800
    frmCharakter.lstAusrüstung.Width = 2300
    frmCharakter.Show
    frmHauptmenü.Enabled = False
End If
End Sub

Private Sub labKriegsgerätpunkte_Change()
Dim Umwandler As Variant
Umwandler = labKriegsgerätpunkte.Caption + 0
If frmHauptmenü.Caption = "Chaos" Then
    If Umwandler > Maximalpunkte * 0.5 Then
        MsgBox "Sie dürfen maximal " & Int(Maximalpunkte * 0.5) & " Punkte auf Dämonen verwenden", 64, "Kriegsgerätanteil Überschritten"
        labKriegsgerätpunkte.ForeColor = &HFF&
    Else
        If labKriegsgerätpunkte.ForeColor = &HFF& Then
            labKriegsgerätpunkte.ForeColor = &H0&
        End If
    End If
Else
    If Umwandler > Maximalpunkte * 0.25 Then
        MsgBox "Sie dürfen maximal " & Int(Maximalpunkte * 0.25) & " Punkte auf Kriegsgerät verwenden", 64, "Kriegsgerätanteil Überschritten"
        labKriegsgerätpunkte.ForeColor = &HFF&
    Else
        If labKriegsgerätpunkte.ForeColor = &HFF& Then
            labKriegsgerätpunkte.ForeColor = &H0&
        End If
    End If
End If
End Sub

Private Sub labMagische_Standarte_Change()
Dim Zwergenstandarte_Kosten As Variant

If Optionen_Initalisieren Then
Else
    If labMagische_Standarte.Caption <> "" Then
        'Standartenträger hinzunehmen
        ckbStandartenträger.Value = 1
        'Kosten für Anzahl berechnen
        Wandler = labEinzelkosten.Caption * labAnzahl.Caption
        'Kosten für Musiker berechnen
        If ckbMusiker.Value Then
            If labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
                Wandler = Wandler + (labEinzelkosten.Caption * 1)
            Else
                Wandler = Wandler + (labEinzelkosten.Caption * 2)
            End If
        End If
        'Kosten für Standartenträger berechnen
        If labTruppenname_groß = "Drachenprinzen von Caledor" Or labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
            Wandler = Wandler + (labEinzelkosten.Caption * 1)
        Else
            Wandler = Wandler + (labEinzelkosten.Caption * 2)
        End If
        'Kosten der Standarte ermitteln
        Länge = InStr(labMagische_Standarte.Caption, "(")
        Name_der_Standarte = Left(labMagische_Standarte.Caption, Länge - 2)
        If Name_der_Standarte <> "Zwergenrunen" Then
            dsStandarten.MoveFirst
            Do Until dsStandarten.Fields("Standartenname") = Name_der_Standarte
                dsStandarten.MoveNext
            Loop
            If labTruppenname_groß = "Drachenprinzen von Caledor" Then
                Wandler = Wandler + (dsStandarten.Fields("Punktwert") / 2)
            Else
                Wandler = Wandler + dsStandarten.Fields("Punktwert")
            End If
        Else
            'Überprüfen ob Standarte über oder unter 100 Punkte kostet
            If Len(frmHauptmenü.labMagische_Standarte.Caption) = 17 Then
                'Punkte kosten für zweistellige Zahl herausschneiden
                Zwergenstandarte_Kosten = Left(Right(labMagische_Standarte, 3), 2)
            Else
                'Punkte kosten für dreistellige Zahl herausschneiden
                Zwergenstandarte_Kosten = Left(Right(labMagische_Standarte, 4), 3)
            End If
            Wandler = Wandler + Zwergenstandarte_Kosten
        End If
    Else
        'Kosten für Anzahl berechnen
        Wandler = labEinzelkosten.Caption * labAnzahl.Caption
        'Kosten für Musiker berechnen
        If ckbMusiker.Value Then
            If labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
                Wandler = Wandler + (labEinzelkosten.Caption * 1)
            Else
                Wandler = Wandler + (labEinzelkosten.Caption * 2)
            End If
        End If
        'Kosten für Standartenträger berechnen
        If ckbStandartenträger.Value Then
            If labTruppenname_groß = "Drachenprinzen von Caledor" Or labTruppenname_groß = "Weiße Löwen von Chrace" Or labTruppenname_groß = "Fahrende Ritter" Or labTruppenname_groß = "Gralsritter" Or labTruppenname_groß = "Questritter" Or labTruppenname_groß = "Ritter des Königs" Or labTruppenname_groß = "Chaosritter" Then
                Wandler = Wandler + (labEinzelkosten.Caption * 1)
            Else
                Wandler = Wandler + (labEinzelkosten.Caption * 2)
            End If
        End If
    End If
    'Berechnete Kosten eintragen
    labPunkte.Caption = Wandler
    Standartenbearbeitung = 0
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Regimenterfeld(lstRegimenteroben.ListIndex).Standartenträger = ckbStandartenträger.Value
        If frmHauptmenü.Caption <> "Zwerge" Then
            Regimenterfeld(lstRegimenteroben.ListIndex).MagischeStandarte.Rune1 = labMagische_Standarte.Caption
        End If
    End If
End If
End Sub

Private Sub labMagische_Standarte_Click()
Dim Längs As Integer
Dim Name_der_Standarte As String
Dim SQL_Abfrage As String

'Überprüfen ob magische Standarten erlaubt sind
If -labMagische_Standarte.BorderStyle Then
    'Überprüfen ob Infobox über Zwergenrunen angezeigt werden soll
    If frmHauptmenü.Caption = "Zwerge" And Zwergenrunen_Info Then
        'frmInfobox zeigt Informationen über Zwergenrunen an
        Zwergenrunen_Info = 0
    Else
        With frmMagische_Gegenstände
            'Listenfelder in frmMagische_Gegenstände de-/aktivieren
            .lstMagische_Spruchrollen.Enabled = False
            .lstHomunkuli.Enabled = False
            .lstChaos_Mutationen.Enabled = False
            .lstmagische_standarten.Enabled = True
            .lstMagische_Waffen.Enabled = False
            .lstMagische_Rüstungen.Enabled = False
            .lstMagische_Schilder.Enabled = False
            .lstVerschiedene_Magische_Gegenstände.Enabled = False
            'Tag für magische Standarten setzen
            .Tag = "Standarte"
            'Überprüfen ob es sich um ein Zwergenregiment handelt
            If frmHauptmenü.Caption = "Zwerge" Then
                .comRunensystem.Visible = True
            End If
            'Ermitteln ob schon bezahltes Regiment editiert wird
            If Fokus_zuletzt = "lstRegimenteroben" Then
                Standartenbearbeitung = -1
            End If
            'Standartenname ermitteln
            If labMagische_Standarte.Caption <> "" Then
                Länge = InStr(labMagische_Standarte, "(")
                Name_der_Standarte = Left(labMagische_Standarte, Länge - 2)
            End If
            'Magischen Gegenstand merken
            Letzte_Auswahl = Name_der_Standarte
            'Magische Standarte herraussuchen
            If Name_der_Standarte <> "Zwergenrunen" Then
                If labMagische_Standarte.Caption <> "" Then
                    SQL_Abfrage = "[Standartenname] = '" & Name_der_Standarte & "'"
                    dsStandarten.MoveFirst
                    dsStandarten.FindFirst SQL_Abfrage
                    If Not dsStandarten.NoMatch Then
                        'Magische Standarte in Felder von frmMagische_Gegenstande eintragen
                        .labMagischer_Gegenstand.Caption = dsStandarten.Fields("Standartenname")
                        .labKosten.Caption = dsStandarten.Fields("Punktwert")
                        If IsNull(dsStandarten.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsStandarten.Fields("Kurzinfo")
                        End If
                        Letzte_Auswahl_Kategorie = "Standarte"
                    Else
                        MsgBox "Standarte nicht gefunden"
                    End If
                Else
                    .labMagischer_Gegenstand.Caption = ""
                    .labKosten.Caption = ""
                    .labKurzinfo.Caption = ""
                End If
                frmMagische_Gegenstände.Show
            Else
                'aktuelle Rune leeren
                frmZwergenrunen.Runen_Slot_leeren 0
                'Rune 1 eintragen
                If Zwergenrunen_Zwischenspeicher.Rune1 <> "" Then
                    Rune_herraussuchen Zwergenrunen_Zwischenspeicher.Rune1, "Schutzrunen", 1
                Else
                    frmZwergenrunen.Runen_Slot_leeren 1
                End If
                'Rune 2 eintragen
                If Zwergenrunen_Zwischenspeicher.Rune2 <> "" Then
                    Rune_herraussuchen Zwergenrunen_Zwischenspeicher.Rune2, "Schutzrunen", 2
                Else
                    frmZwergenrunen.Runen_Slot_leeren 2
                End If
                'Rune 3 eintragen
                If Zwergenrunen_Zwischenspeicher.Rune3 <> "" Then
                    Rune_herraussuchen Zwergenrunen_Zwischenspeicher.Rune3, "Schutzrunen", 3
                Else
                    frmZwergenrunen.Runen_Slot_leeren 3
                End If
                'Gesamtkosten
                frmZwergenrunen.labGesamtkosten = Zwergenrunen_Zwischenspeicher.Runenkosten
                'Tag
                frmZwergenrunen.Tag = "Schutzrunen"
                'Listenfelder de-/aktivieren
                frmZwergenrunen.Runenlisten_aktivieren "Schutzrunen"
                'frmZwergenrunen anzeigen
                frmZwergenrunen.Show
            End If
            frmHauptmenü.Enabled = False
        End With
    End If
End If
End Sub



Private Sub labMagische_Standarte_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If frmHauptmenü.Caption = "Zwerge" And Button = 2 Then
    If Left(labMagische_Standarte, 12) = "Zwergenrunen" Then
        'Infobox über Zwergenrunen anzeigen
        frmInfobox.labRune1 = Zwergenrunen_Zwischenspeicher.Rune1
        frmInfobox.labRune2 = Zwergenrunen_Zwischenspeicher.Rune2
        frmInfobox.labRune3 = Zwergenrunen_Zwischenspeicher.Rune3
        frmInfobox.Top = labMagische_Standarte.Top + Y
        frmInfobox.Left = labMagische_Standarte.Left + X
        frmInfobox.Show
    End If
    Zwergenrunen_Info = -1
End If
End Sub

Private Sub labMagische_Standarte_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If frmHauptmenü.Caption = "Zwerge" And Left(labMagische_Standarte, 12) = "Zwergenrunen" And Button = 2 Then
    frmInfobox.Hide
End If
End Sub


Private Sub labMonsterpunkte_Change()
Dim Umwandler As Variant
Umwandler = labMonsterpunkte.Caption + 0
If Umwandler > Maximalpunkte * 0.25 Then
    MsgBox "Sie dürfen maximal " & Int(Maximalpunkte * 0.25) & " Punkte auf Monster verwenden", 64, "Monsteranteil Überschritten"
    labMonsterpunkte.ForeColor = &HFF&
Else
    If labMonsterpunkte.ForeColor = &HFF& Then
        labMonsterpunkte.ForeColor = &H0&
    End If
End If
End Sub

Private Sub labOption1_Change()
If Optionen_Initalisieren Then
Else
    If -labOption1.BorderStyle Then
        Charakterkosten_Berechnung
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand1 = labOption1.Caption
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand1_Kosten = labOption1_Kosten.Caption
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand1_Kategorie = laboption1_Kategorie.Caption
       End If
    End If
End If
End Sub

Private Sub labOption1_Click()
Dim SQL_Abfrage As String
If -labOption1.BorderStyle Then
    With frmMagische_Gegenstände
        If dsCharakter.Fields("Zauberer") Then
            .lstMagische_Spruchrollen.Enabled = True
            .lstHomunkuli.Enabled = True
            If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                .lstChaos_Mutationen.Enabled = True
            Else
                .lstChaos_Mutationen.Enabled = False
            End If
            .lstmagische_standarten.Enabled = False
            .lstMagische_Waffen.Enabled = True
            .lstMagische_Schilder.Enabled = False
            .lstMagische_Rüstungen.Enabled = False
            .lstVerschiedene_Magische_Gegenstände.Enabled = True
        Else
            .lstMagische_Spruchrollen.Enabled = False
            .lstHomunkuli.Enabled = False
            If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                .lstChaos_Mutationen.Enabled = True
            Else
                .lstChaos_Mutationen.Enabled = False
            End If
            If dsCharakter.Fields("Armeestandarte") Then
                .lstmagische_standarten.Enabled = True
            Else
                .lstmagische_standarten.Enabled = False
            End If
            .lstMagische_Waffen.Enabled = True
            .lstMagische_Schilder.Enabled = True
            .lstMagische_Rüstungen.Enabled = True
            .lstVerschiedene_Magische_Gegenstände.Enabled = True
        End If
        .Tag = "Option1"
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterbearbeitung = -1
        End If
        'Magischen Gegenstand merken
        Letzte_Auswahl = labOption1.Caption
        If labOption1.Caption <> "" Then
            'Kategorie des Magischen Gegenstandes feststellen
            Select Case laboption1_Kategorie.Caption
                Case "Spruchrolle"
                    'SPRUCHROLLEN
                    SQL_Abfrage = "[Spruchrollenname] = '" & labOption1.Caption & "'"
                    dsSpruchrollen.MoveFirst
                    dsSpruchrollen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsSpruchrollen.Fields("Spruchrollenname")
                    .labKosten.Caption = dsSpruchrollen.Fields("Punktwert")
                    If IsNull(dsSpruchrollen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsSpruchrollen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Spruchrolle"
                    Letzte_Auswahl_Kategorie = "Spruchrolle"
                Case "Homunkuli"
                    'HOMUNKULIS
                    SQL_Abfrage = "[Homunkuliname] = '" & labOption1.Caption & "'"
                    dsHomunkuli.MoveFirst
                    dsHomunkuli.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsHomunkuli.Fields("Homunkuliname")
                    .labKosten.Caption = dsHomunkuli.Fields("Punktwert")
                    If IsNull(dsHomunkuli.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsHomunkuli.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Homunkuli"
                    Letzte_Auswahl_Kategorie = "Homunkuli"
                Case "Mutation"
                    'MUTATIONEN
                    SQL_Abfrage = "[Mutationsname] = '" & labOption1.Caption & "'"
                    dsMutationen.MoveFirst
                    dsMutationen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMutationen.Fields("Mutationsname")
                    .labKosten.Caption = dsMutationen.Fields("Punktwert")
                    If IsNull(dsMutationen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMutationen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Mutation"
                    Letzte_Auswahl_Kategorie = "Mutation"
                Case "Standarte"
                    'STANDARTEN
                    SQL_Abfrage = "[Standartenname] = '" & labOption1.Caption & "'"
                    dsStandarten.MoveFirst
                    dsStandarten.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsStandarten.Fields("Standartenname")
                    .labKosten.Caption = dsStandarten.Fields("Punktwert")
                    If IsNull(dsStandarten.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsStandarten.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Standarte"
                    Letzte_Auswahl_Kategorie = "Standarte"
                Case "Waffe"
                    'WAFFEN
                    SQL_Abfrage = "[Waffenname] = '" & labOption1.Caption & "'"
                    dsMagische_Waffen.MoveFirst
                    dsMagische_Waffen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Waffen.Fields("Waffenname")
                    .labKosten.Caption = dsMagische_Waffen.Fields("Punktwert")
                    If IsNull(dsMagische_Waffen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Waffen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Waffe"
                    Letzte_Auswahl_Kategorie = "Waffe"
                Case "Rüstung"
                    'RÜSTUNGEN
                    SQL_Abfrage = "[Rüstungsname] = '" & labOption1.Caption & "'"
                    dsMagische_Rüstungen.MoveFirst
                    dsMagische_Rüstungen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Rüstungen.Fields("Rüstungsname")
                    .labKosten.Caption = dsMagische_Rüstungen.Fields("Punktwert")
                    If IsNull(dsMagische_Rüstungen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Rüstungen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Rüstung"
                    Letzte_Auswahl_Kategorie = "Rüstung"
                Case "Schild"
                    'SCHILDER
                    SQL_Abfrage = "[Schildname] = '" & labOption1.Caption & "'"
                    dsMagische_Schilder.MoveFirst
                    dsMagische_Schilder.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Schilder.Fields("Schildname")
                    .labKosten.Caption = dsMagische_Schilder.Fields("Punktwert")
                    If IsNull(dsMagische_Schilder.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Schilder.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Schild"
                    Letzte_Auswahl_Kategorie = "Schild"
                Case Else
                    'VERSCHIEDENE MAGISCHER GEGENSTÄNDE
                    SQL_Abfrage = "[Gegenstandsname] = '" & labOption1.Caption & "'"
                    dsVerschiedene_mag_Gegenstände.MoveFirst
                    dsVerschiedene_mag_Gegenstände.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsVerschiedene_mag_Gegenstände.Fields("Gegenstandsname")
                    .labKosten.Caption = dsVerschiedene_mag_Gegenstände.Fields("Punktwert")
                    If IsNull(dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
                    Letzte_Auswahl_Kategorie = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
            End Select
        Else
            .labMagischer_Gegenstand.Caption = ""
            .labKosten.Caption = ""
            .labKurzinfo.Caption = ""
        End If
        .Show
        frmHauptmenü.Enabled = False
    End With
End If
End Sub


Private Sub labOption2_Change()
If Optionen_Initalisieren Then
Else
    If -labOption2.BorderStyle Then
        If (Fokus_zuletzt = "lstKriegsgerätoben" Or Fokus_zuletzt = "lstKriegsgerätunten") And frmHauptmenü.Caption = "Zwerge" Then
            Zwergen_Kriegsgerät_Kosten_Berechnung
        Else
            Charakterkosten_Berechnung
            If Fokus_zuletzt = "lstCharakteroben" Then
                Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand2 = labOption2.Caption
                Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand2_Kosten = labOption2_Kosten.Caption
                Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand2_Kategorie = laboption2_Kategorie.Caption
            End If
        End If
    End If
End If
End Sub

Private Sub labOption2_Click()
If -labOption2.BorderStyle Then
    If (Fokus_zuletzt = "lstKriegsgerätoben" Or Fokus_zuletzt = "lstKriegsgerätunten") And frmHauptmenü.Caption = "Zwerge" Then
        If Zwergenrunen_Info Then
            'frmInfobox zeigt Informationen über Zwergenrunen an
            Zwergenrunen_Info = 0
        Else
            'frmZwergenrunen initalisieren und anzeigen
            frmHauptmenü.Enabled = False
            If Fokus_zuletzt = "lstKriegsgerätoben" Then
                Kriegsgerätbearbeitung = -1
            End If
            If labOption2 = "Zwergenrunen" Then
                'aktuelle Rune
                    frmZwergenrunen.Runen_Slot_leeren 0
                'Rune 1
                If Zwergenrunen_Zwischenspeicher.Rune1 <> "" Then
                    Rune_herraussuchen Zwergenrunen_Zwischenspeicher.Rune1, "Maschinenrunen", 1
                Else
                    frmZwergenrunen.Runen_Slot_leeren 1
                End If
                'Rune 2
                If Zwergenrunen_Zwischenspeicher.Rune2 <> "" Then
                    Rune_herraussuchen Zwergenrunen_Zwischenspeicher.Rune2, "Maschinenrunen", 2
                Else
                    frmZwergenrunen.Runen_Slot_leeren 2
                End If
                'Rune 3
                If Zwergenrunen_Zwischenspeicher.Rune3 <> "" Then
                    Rune_herraussuchen Zwergenrunen_Zwischenspeicher.Rune3, "Maschinenrunen", 3
                Else
                    frmZwergenrunen.Runen_Slot_leeren 3
                End If
                'Tag
                frmZwergenrunen.Tag = "Maschinenrunen"
                frmZwergenrunen.Show
            Else
                'aktuelle Rune
                frmZwergenrunen.Runen_Slot_leeren 0
                'Rune 1
                frmZwergenrunen.Runen_Slot_leeren 1
                'Rune 2
                frmZwergenrunen.Runen_Slot_leeren 2
                'Rune 3
                frmZwergenrunen.Runen_Slot_leeren 3
                'Gesamtkosten
                frmZwergenrunen.labGesamtkosten = 0
                'Tag
                frmZwergenrunen.Tag = "Maschinenrunen"
                'Listenfelder de-/aktivieren
                frmZwergenrunen.Runenlisten_aktivieren "Kriegsgerätrunen"
                If Fokus_zuletzt = "lstKriegsgerätoben" Then
                    Kriegsgerätbearbeitung = -1
                End If
                frmZwergenrunen.Show
            End If
        End If
    Else
        With frmMagische_Gegenstände
            If dsCharakter.Fields("Zauberer") Then
                .lstMagische_Spruchrollen.Enabled = True
                .lstHomunkuli.Enabled = True
                If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                    .lstChaos_Mutationen.Enabled = True
                Else
                    .lstChaos_Mutationen.Enabled = False
                End If
                .lstmagische_standarten.Enabled = False
                .lstMagische_Waffen.Enabled = True
                .lstMagische_Schilder.Enabled = False
                .lstMagische_Rüstungen.Enabled = False
                .lstVerschiedene_Magische_Gegenstände.Enabled = True
            Else
                .lstMagische_Spruchrollen.Enabled = False
                .lstHomunkuli.Enabled = False
                If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                    .lstChaos_Mutationen.Enabled = True
                Else
                    .lstChaos_Mutationen.Enabled = False
                End If
                If dsCharakter.Fields("Armeestandarte") Then
                    .lstmagische_standarten.Enabled = True
                Else
                 .lstmagische_standarten.Enabled = False
                End If
                .lstMagische_Waffen.Enabled = True
                .lstMagische_Schilder.Enabled = True
                .lstMagische_Rüstungen.Enabled = True
                .lstVerschiedene_Magische_Gegenstände.Enabled = True
            End If
            .Tag = "Option2"
            If Fokus_zuletzt = "lstCharakteroben" Then
                Charakterbearbeitung = -1
            End If
            'Magischen Gegenstand merken
            Letzte_Auswahl = labOption2.Caption
            If labOption2.Caption <> "" Then
                'Kategorie des Magischen Gegenstandes feststellen
                Select Case laboption2_Kategorie.Caption
                    Case "Spruchrolle"
                        'SPRUCHROLLEN
                        SQL_Abfrage = "[Spruchrollenname] = '" & labOption2.Caption & "'"
                        dsSpruchrollen.MoveFirst
                        dsSpruchrollen.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsSpruchrollen.Fields("Spruchrollenname")
                        .labKosten.Caption = dsSpruchrollen.Fields("Punktwert")
                        If IsNull(dsSpruchrollen.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsSpruchrollen.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Spruchrolle"
                        Letzte_Auswahl_Kategorie = "Spruchrolle"
                    Case "Homunkuli"
                        'HOMUNKULIS
                        SQL_Abfrage = "[Homunkuliname] = '" & labOption2.Caption & "'"
                        dsHomunkuli.MoveFirst
                        dsHomunkuli.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsHomunkuli.Fields("Homunkuliname")
                        .labKosten.Caption = dsHomunkuli.Fields("Punktwert")
                        If IsNull(dsHomunkuli.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsHomunkuli.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Homunkuli"
                        Letzte_Auswahl_Kategorie = "Homunkuli"
                    Case "Mutation"
                        'MUTATIONEN
                        SQL_Abfrage = "[Mutationsname] = '" & labOption2.Caption & "'"
                        dsMutationen.MoveFirst
                        dsMutationen.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsMutationen.Fields("Mutationsname")
                        .labKosten.Caption = dsMutationen.Fields("Punktwert")
                        If IsNull(dsMutationen.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsMutationen.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Mutation"
                        Letzte_Auswahl_Kategorie = "Mutation"
                    Case "Standarten"
                        'STANDARTEN
                        SQL_Abfrage = "[Standartenname] = '" & labOption1.Caption & "'"
                        dsStandarten.MoveFirst
                        dsStandarten.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsStandarten.Fields("Standartenname")
                        .labKosten.Caption = dsStandarten.Fields("Punktwert")
                        If IsNull(dsStandarten.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsStandarten.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Standarte"
                        Letzte_Auswahl_Kategorie = "Standarte"
                    Case "Waffe"
                        'WAFFEN
                        SQL_Abfrage = "[Waffenname] = '" & labOption2.Caption & "'"
                        dsMagische_Waffen.MoveFirst
                        dsMagische_Waffen.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsMagische_Waffen.Fields("Waffenname")
                        .labKosten.Caption = dsMagische_Waffen.Fields("Punktwert")
                        If IsNull(dsMagische_Waffen.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsMagische_Waffen.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Waffe"
                        Letzte_Auswahl_Kategorie = "Waffe"
                    Case "Rüstung"
                        'RÜSTUNGEN
                        SQL_Abfrage = "[Rüstungsname] = '" & labOption2.Caption & "'"
                        dsMagische_Rüstungen.MoveFirst
                        dsMagische_Rüstungen.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsMagische_Rüstungen.Fields("Rüstungsname")
                        .labKosten.Caption = dsMagische_Rüstungen.Fields("Punktwert")
                        If IsNull(dsMagische_Rüstungen.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsMagische_Rüstungen.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Rüstung"
                        Letzte_Auswahl_Kategorie = "Rüstung"
                    Case "Schild"
                        'SCHILDER
                        SQL_Abfrage = "[Schildname] = '" & labOption2.Caption & "'"
                        dsMagische_Schilder.MoveFirst
                        dsMagische_Schilder.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsMagische_Schilder.Fields("Schildname")
                        .labKosten.Caption = dsMagische_Schilder.Fields("Punktwert")
                        If IsNull(dsMagische_Schilder.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsMagische_Schilder.Fields("Kurzinfo")
                        End If
                        .labKategorie.Caption = "Schild"
                        Letzte_Auswahl_Kategorie = "Schild"
                    Case Else
                        'VERSCHIEDENE MAGISCHER GEGENSTÄNDE
                        SQL_Abfrage = "[Gegenstandsname] = '" & labOption2.Caption & "'"
                        dsVerschiedene_mag_Gegenstände.MoveFirst
                        dsVerschiedene_mag_Gegenstände.FindFirst SQL_Abfrage
                        .labMagischer_Gegenstand.Caption = dsVerschiedene_mag_Gegenstände.Fields("Gegenstandsname")
                        .labKosten.Caption = dsVerschiedene_mag_Gegenstände.Fields("Punktwert")
                        .labKurzinfo.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
                        If IsNull(dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")) Then
                            .labKurzinfo.Caption = ""
                        Else
                            .labKurzinfo.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
                        End If
                        Letzte_Auswahl_Kategorie = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
                End Select
            Else
                .labMagischer_Gegenstand.Caption = ""
                .labKosten.Caption = ""
                .labKurzinfo.Caption = ""
            End If
            .Show
            frmHauptmenü.Enabled = False
        End With
    End If
End If
End Sub


Private Sub labOption2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If frmHauptmenü.Caption = "Zwerge" And Button = 2 Then
    If labOption2 = "Zwergenrunen" Then
        'Infobox über Zwergenrunen anzeigen
        frmInfobox.labRune1 = Zwergenrunen_Zwischenspeicher.Rune1
        frmInfobox.labRune2 = Zwergenrunen_Zwischenspeicher.Rune2
        frmInfobox.labRune3 = Zwergenrunen_Zwischenspeicher.Rune3
        frmInfobox.Top = labOption2.Top + Y
        frmInfobox.Left = labOption2.Left + X + 20
        frmInfobox.Show
    End If
    Zwergenrunen_Info = -1
End If
End Sub


Private Sub labOption2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If frmHauptmenü.Caption = "Zwerge" And labOption2 = "Zwergenrunen" And Button = 2 Then
    frmInfobox.Hide
End If
End Sub


Private Sub labOption3_Change()
If Optionen_Initalisieren Then
Else
    If -labOption3.BorderStyle Then
        Charakterkosten_Berechnung
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand3 = labOption3.Caption
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand3_Kosten = labOption3_Kosten.Caption
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand3_Kategorie = laboption3_Kategorie.Caption
        End If
    End If
End If
End Sub

Private Sub labOption3_Click()
If -labOption3.BorderStyle Then
    With frmMagische_Gegenstände
        If dsCharakter.Fields("Zauberer") Then
            .lstMagische_Spruchrollen.Enabled = True
            .lstHomunkuli.Enabled = True
            If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                .lstChaos_Mutationen.Enabled = True
            Else
                .lstChaos_Mutationen.Enabled = False
            End If
            .lstmagische_standarten.Enabled = False
            .lstMagische_Waffen.Enabled = True
            .lstMagische_Schilder.Enabled = False
            .lstMagische_Rüstungen.Enabled = False
            .lstVerschiedene_Magische_Gegenstände.Enabled = True
        Else
            .lstMagische_Spruchrollen.Enabled = False
            .lstHomunkuli.Enabled = False
            If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                .lstChaos_Mutationen.Enabled = True
            Else
                .lstChaos_Mutationen.Enabled = False
            End If
            If dsCharakter.Fields("Armeestandarte") Then
                .lstmagische_standarten.Enabled = True
            Else
                .lstmagische_standarten.Enabled = False
            End If
            .lstMagische_Waffen.Enabled = True
            .lstMagische_Schilder.Enabled = True
            .lstMagische_Rüstungen.Enabled = True
            .lstVerschiedene_Magische_Gegenstände.Enabled = True
        End If
        .Tag = "Option3"
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterbearbeitung = -1
        End If
        'Magischen Gegenstand merken
        Letzte_Auswahl = labOption3.Caption
        If labOption3.Caption <> "" Then
            'Kategorie des Magischen Gegenstandes feststellen
            Select Case laboption3_Kategorie.Caption
                Case "Spruchrolle"
                    'SPRUCHROLLEN
                    SQL_Abfrage = "[Spruchrollenname] = '" & labOption3.Caption & "'"
                    dsSpruchrollen.MoveFirst
                    dsSpruchrollen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsSpruchrollen.Fields("Spruchrollenname")
                    .labKosten.Caption = dsSpruchrollen.Fields("Punktwert")
                    If IsNull(dsSpruchrollen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsSpruchrollen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Spruchrolle"
                    Letzte_Auswahl_Kategorie = "Spruchrolle"
                Case "Homunkuli"
                    'HOMUNKULIS
                    SQL_Abfrage = "[Homunkuliname] = '" & labOption3.Caption & "'"
                    dsHomunkuli.MoveFirst
                    dsHomunkuli.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsHomunkuli.Fields("Homunkuliname")
                    .labKosten.Caption = dsHomunkuli.Fields("Punktwert")
                    If IsNull(dsHomunkuli.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsHomunkuli.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Homunkuli"
                    Letzte_Auswahl_Kategorie = "Homunkuli"
                Case "Mutation"
                    'MUTATIONEN
                    SQL_Abfrage = "[Mutationsname] = '" & labOption3.Caption & "'"
                    dsMutationen.MoveFirst
                    dsMutationen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMutationen.Fields("Mutationsname")
                    .labKosten.Caption = dsMutationen.Fields("Punktwert")
                    If IsNull(dsMutationen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMutationen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Mutation"
                    Letzte_Auswahl_Kategorie = "Mutation"
                Case "Waffe"
                    'WAFFEN
                    SQL_Abfrage = "[Waffenname] = '" & labOption3.Caption & "'"
                    dsMagische_Waffen.MoveFirst
                    dsMagische_Waffen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Waffen.Fields("Waffenname")
                    .labKosten.Caption = dsMagische_Waffen.Fields("Punktwert")
                    If IsNull(dsMagische_Waffen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Waffen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Waffe"
                    Letzte_Auswahl_Kategorie = "Waffe"
                Case "Rüstung"
                    'RÜSTUNGEN
                    SQL_Abfrage = "[Rüstungsname] = '" & labOption3.Caption & "'"
                    dsMagische_Rüstungen.MoveFirst
                    dsMagische_Rüstungen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Rüstungen.Fields("Rüstungsname")
                    .labKosten.Caption = dsMagische_Rüstungen.Fields("Punktwert")
                    If IsNull(dsMagische_Rüstungen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Rüstungen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Rüstung"
                    Letzte_Auswahl_Kategorie = "Rüstung"
                Case "Schild"
                    'SCHILDER
                    SQL_Abfrage = "[Schildname] = '" & labOption3.Caption & "'"
                    dsMagische_Schilder.MoveFirst
                    dsMagische_Schilder.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Schilder.Fields("Schildname")
                    .labKosten.Caption = dsMagische_Schilder.Fields("Punktwert")
                    If IsNull(dsMagische_Schilder.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Schilder.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Schild"
                    Letzte_Auswahl_Kategorie = "Schild"
                Case Else
                    'VERSCHIEDENE MAGISCHER GEGENSTÄNDE
                    SQL_Abfrage = "[Gegenstandsname] = '" & labOption3.Caption & "'"
                    dsVerschiedene_mag_Gegenstände.MoveFirst
                    dsVerschiedene_mag_Gegenstände.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsVerschiedene_mag_Gegenstände.Fields("Gegenstandsname")
                    .labKosten.Caption = dsVerschiedene_mag_Gegenstände.Fields("Punktwert")
                    If IsNull(dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
                    Letzte_Auswahl_Kategorie = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
            End Select
        Else
            .labMagischer_Gegenstand.Caption = ""
            .labKosten.Caption = ""
            .labKurzinfo.Caption = ""
        End If
        .Show
        frmHauptmenü.Enabled = False
    End With
End If
End Sub

Private Sub labOption4_Change()
If Optionen_Initalisieren Then
Else
    If -labOption4.BorderStyle Then
        Charakterkosten_Berechnung
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand4 = labOption4.Caption
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand4_Kosten = labOption4_Kosten.Caption
            Charakterfeld(lstcharakteroben.ListIndex).mag_Gegenstand4_Kategorie = laboption4_Kategorie.Caption
        End If
    End If
End If
End Sub

Private Sub labOption4_Click()
If -labOption4.BorderStyle Then
    With frmMagische_Gegenstände
        If dsCharakter.Fields("Zauberer") Then
            .lstMagische_Spruchrollen.Enabled = True
            .lstHomunkuli.Enabled = True
            If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                .lstChaos_Mutationen.Enabled = True
            Else
                .lstChaos_Mutationen.Enabled = False
            End If
            .lstmagische_standarten.Enabled = False
            .lstMagische_Waffen.Enabled = True
            .lstMagische_Schilder.Enabled = False
            .lstMagische_Rüstungen.Enabled = False
            .lstVerschiedene_Magische_Gegenstände.Enabled = True
        Else
            .lstMagische_Spruchrollen.Enabled = False
            .lstHomunkuli.Enabled = False
            If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
                .lstChaos_Mutationen.Enabled = True
            Else
                .lstChaos_Mutationen.Enabled = False
            End If
            If dsCharakter.Fields("Armeestandarte") Then
                .lstmagische_standarten.Enabled = True
            Else
                .lstmagische_standarten.Enabled = False
            End If
            .lstMagische_Waffen.Enabled = True
            .lstMagische_Schilder.Enabled = True
            .lstMagische_Rüstungen.Enabled = True
            .lstVerschiedene_Magische_Gegenstände.Enabled = True
        End If
        .Tag = "Option4"
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterbearbeitung = -1
        End If
        'Magischen Gegenstand merken
        Letzte_Auswahl = labOption4.Caption
        If labOption4.Caption <> "" Then
            'Kategorie des Magischen Gegenstandes feststellen
            Select Case laboption4_Kategorie.Caption
                Case "Spruchrolle"
                    'SPRUCHROLLEN
                    SQL_Abfrage = "[Spruchrollenname] = '" & labOption4.Caption & "'"
                    dsSpruchrollen.MoveFirst
                    dsSpruchrollen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsSpruchrollen.Fields("Spruchrollenname")
                    .labKosten.Caption = dsSpruchrollen.Fields("Punktwert")
                    If IsNull(dsSpruchrollen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsSpruchrollen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Spruchrolle"
                    Letzte_Auswahl_Kategorie = "Spruchrolle"
                Case "Homunkuli"
                    'HOMUNKULIS
                    SQL_Abfrage = "[Homunkuliname] = '" & labOption4.Caption & "'"
                    dsHomunkuli.MoveFirst
                    dsHomunkuli.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsHomunkuli.Fields("Homunkuliname")
                    .labKosten.Caption = dsHomunkuli.Fields("Punktwert")
                    If IsNull(dsHomunkuli.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsHomunkuli.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Homunkuli"
                    Letzte_Auswahl_Kategorie = "Homunkuli"
                Case "Mutation"
                    'MUTATIONEN
                    SQL_Abfrage = "[Mutationsname] = '" & labOption4.Caption & "'"
                    dsMutationen.MoveFirst
                    dsMutationen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMutationen.Fields("Mutationsname")
                    .labKosten.Caption = dsMutationen.Fields("Punktwert")
                    If IsNull(dsMutationen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMutationen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Mutation"
                    Letzte_Auswahl_Kategorie = "Mutation"
                Case "Waffe"
                    'WAFFEN
                    SQL_Abfrage = "[Waffenname] = '" & labOption4.Caption & "'"
                    dsMagische_Waffen.MoveFirst
                    dsMagische_Waffen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Waffen.Fields("Waffenname")
                    .labKosten.Caption = dsMagische_Waffen.Fields("Punktwert")
                    If IsNull(dsMagische_Waffen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Waffen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Waffe"
                    Letzte_Auswahl_Kategorie = "Waffe"
                Case "Rüstung"
                    'RÜSTUNGEN
                    SQL_Abfrage = "[Rüstungsname] = '" & labOption4.Caption & "'"
                    dsMagische_Rüstungen.MoveFirst
                    dsMagische_Rüstungen.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Rüstungen.Fields("Rüstungsname")
                    .labKosten.Caption = dsMagische_Rüstungen.Fields("Punktwert")
                    If IsNull(dsMagische_Rüstungen.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Rüstungen.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Rüstung"
                    Letzte_Auswahl_Kategorie = "Rüstung"
                Case "Schild"
                    'SCHILDER
                    SQL_Abfrage = "[Schildname] = '" & labOption4.Caption & "'"
                    dsMagische_Schilder.MoveFirst
                    dsMagische_Schilder.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsMagische_Schilder.Fields("Schildname")
                    .labKosten.Caption = dsMagische_Schilder.Fields("Punktwert")
                    If IsNull(dsMagische_Schilder.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsMagische_Schilder.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = "Schild"
                    Letzte_Auswahl_Kategorie = "Schild"
                Case Else
                    'VERSCHIEDENE MAGISCHER GEGENSTÄNDE
                    SQL_Abfrage = "[Gegenstandsname] = '" & labOption4.Caption & "'"
                    dsVerschiedene_mag_Gegenstände.MoveFirst
                    dsVerschiedene_mag_Gegenstände.FindFirst SQL_Abfrage
                    .labMagischer_Gegenstand.Caption = dsVerschiedene_mag_Gegenstände.Fields("Gegenstandsname")
                    .labKosten.Caption = dsVerschiedene_mag_Gegenstände.Fields("Punktwert")
                    If IsNull(dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")) Then
                        .labKurzinfo.Caption = ""
                    Else
                        .labKurzinfo.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kurzinfo")
                    End If
                    .labKategorie.Caption = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
                    Letzte_Auswahl_Kategorie = dsVerschiedene_mag_Gegenstände.Fields("Kategorie")
            End Select
        Else
            .labMagischer_Gegenstand.Caption = ""
            .labKosten.Caption = ""
            .labKurzinfo.Caption = ""
        End If
        .Show
        frmHauptmenü.Enabled = False
    End With
End If
End Sub



Private Sub labPunkte_Change()
If Optionen_Initalisieren Then
Else
    If (Fokus_zuletzt = "lstCharakteroben" And ActiveControl.Name <> "lstCharakteroben") Or Charakterbearbeitung Then
        'Veränderung der Punktekosten ermitteln
        Wandler = Letzter_Punktestand - labPunkte.Caption
        'Charakterpunktesand ändern
        Charakterpunkte = Charakterpunkte - Wandler
        labCharakterpunkte = Charakterpunkte
        'Restpunktestand ändern
        Restpunkte = Restpunkte + Wandler + 0
        labRestpunkte = Restpunkte
    End If
    If (Fokus_zuletzt = "lstRegimenteroben" And ActiveControl.Name <> "lstRegimenteroben") Or Standartenbearbeitung Then
        'Veränderung der Punktekosten ermitteln
        Wandler = Letzter_Punktestand - labPunkte.Caption
        'Regimenterpunktestand ändern
        Regimenterpunkte = Regimenterpunkte - Wandler
        labRegimenterpunkte = Regimenterpunkte
        'Restpunktestand ändern
        Restpunkte = Restpunkte + Wandler + 0
        labRestpunkte = Restpunkte
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" And ActiveControl.Name <> "lstKriegsgerätoben" Or Kriegsgerätbearbeitung Then
        'Veränderung der Punktekosten ermitteln
        Wandler = Letzter_Punktestand - labPunkte.Caption
        'Regimenterpunktesand ändern
        Kriegsgerätpunkte = Kriegsgerätpunkte - Wandler
        labKriegsgerätpunkte = Kriegsgerätpunkte
        'Restpunktestand ändern
        Restpunkte = Restpunkte + Wandler + 0
        labRestpunkte = Restpunkte
    End If
    If Fokus_zuletzt = "lstMonsteroben" And ActiveControl.Name <> "lstMonsteroben" Then
        'Veränderung der Punktekosten ermitteln
        Wandler = Letzter_Punktestand - labPunkte.Caption
        'Regimenterpunktesand ändern
        Monsterpunkte = Monsterpunkte - Wandler
        labMonsterpunkte = Monsterpunkte
        'Restpunktestand ändern
        Restpunkte = Restpunkte + Wandler + 0
        labRestpunkte = Restpunkte
    End If
    Wandler = labPunkte.Caption
    Letzter_Punktestand = Wandler
End If
End Sub



Private Sub labRestpunkte_Change()
Dim Umwandler As Variant
Umwandler = labRestpunkte.Caption + 0
If Umwandler < 0 Then
    MsgBox "Sie haben die Gesamtanzahl ihrer Punkte überschritten", 48, "Gesamtpunktzahl überschritten"
    labRestpunkte.ForeColor = &HFF&
Else
    If labRestpunkte.ForeColor = &HFF& Then
        labRestpunkte.ForeColor = &H0&
    End If
End If
End Sub




Private Sub labRüstung_Change()
If Optionen_Initalisieren Then
Else
    If -labRüstung.BorderStyle Then
        Rüstungsrettungswurf_einstellen
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterbearbeitung = -1
        End If
        Charakterkosten_Berechnung
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).Rüstung = labRüstung.Caption
        End If
    End If
End If
End Sub

Private Sub labRüstung_Click()
If -labRüstung.BorderStyle Then
    Charaktereditions_Modus = "Rüstung"
    frmCharakter.Top = 5000
    frmCharakter.Left = 1500
    frmCharakter.Width = 4000
    frmCharakter.lstAusrüstung.Width = 3500
    frmCharakter.Show
    frmHauptmenü.Enabled = False
End If
End Sub




Private Sub labVerbündetepunkte_Change()
Wandler = labVerbündetepunkte.Caption + 0
If Wandler > Maximalpunkte * 0.25 Then
    MsgBox "Sie dürfen maximal " & Int(Maximalpunkte * 0.25) & " Punkte auf Verbündete verwenden", 64, "Verbündetenanteil Überschritten"
    labVerbündetepunkte.ForeColor = &HFF&
Else
    If labVerbündetepunkte.ForeColor = &HFF& Then
        labVerbündetepunkte.ForeColor = &H0&
    End If
End If
End Sub

Private Sub labVerbündetepunkte_Click()
frmVerbündete.Top = 300
frmVerbündete.Left = 8930
frmVerbündete.Width = 2856
frmVerbündete.Height = 1776
frmVerbündete.labVerbündetepunkte = frmHauptmenü.labVerbündetepunkte
frmVerbündete.Show
frmHauptmenü.Enabled = False
End Sub


Private Sub labVerbündetepunkte_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Fokus_zuletzt = labVerbündetepunkte
End Sub

Private Sub labWaffe_Change()
If Optionen_Initalisieren Then
Else
    If -labWaffe.BorderStyle Then
        Waffe_einstellen
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterbearbeitung = -1
        End If
        Charakterkosten_Berechnung
        If Fokus_zuletzt = "lstCharakteroben" Then
            Charakterfeld(lstcharakteroben.ListIndex).Waffe = labWaffe.Caption
        End If
    End If
End If
End Sub

Private Sub labWaffe_Click()
If -labWaffe.BorderStyle Then
    Charaktereditions_Modus = "Waffe"
    frmHauptmenü.Enabled = False
    frmCharakter.Top = 4400
    frmCharakter.Left = 900
    frmCharakter.Width = 2800
    frmCharakter.lstAusrüstung.Width = 2300
    frmCharakter.Show
End If
End Sub

Private Sub lstCharakteroben_DragDrop(Source As Control, X As Single, Y As Single)
Dim Zähler As Integer
Dim Alter_Index As Integer
If (TypeOf Source Is ListBox) And (Source.Name = "lstCharakterunten") Then
    If lstCharakterunten.ListIndex <> -1 Then
        If dsCharakter.Fields("General") Then
            If General Then
                MsgBox "Die Armee bestitzt schon einen General", 16, "General"
            Else
                General = -1
                'Indexnummer des Charakters merken
                Alter_Index = lstCharakterunten.ListIndex
                'Charakter als Listeneintrag ergänzen
                lstcharakteroben.AddItem lstCharakterunten.List(lstCharakterunten.ListIndex)
                'Einzigartige Charakter aus Auswahlliste entfernen
                lstCharakterunten.RemoveItem lstCharakterunten.ListIndex
                'Charakter in Charakterliste hinzufügen
                Charakterliste_hinzufügen
                'Punktekosten zu Charakterpunkte hinzuzählen
                Charakterpunkte = Charakterpunkte + labPunkte.Caption
                labCharakterpunkte.Caption = Charakterpunkte
                'Punktekosten von Restpunkten abziehen
                Restpunkte = Restpunkte - labPunkte.Caption
                labRestpunkte.Caption = Restpunkte
                'Charakteranzeige neu anzeigen
                If Alter_Index + 1 > lstCharakterunten.ListCount Then
                    lstCharakterunten.ListIndex = Alter_Index - 1
                Else
                    lstCharakterunten.ListIndex = Alter_Index
                End If
                Charakter_anzeigen dsCharakter, lstCharakterunten.Text, -1
            End If
        Else
            If dsCharakter.Fields("Armeestandarte") Then
                If Armeestandarte Then
                    MsgBox "Die Armee besitzt schon eine Armeestandarte", 16, "Armeestandarte"
                Else
                    Armeestandarte = -1
                    'Indexnummer des Charakters merken
                    Alter_Index = lstCharakterunten.ListIndex
                    'Charakter als Listeneintrag ergänzen
                    lstcharakteroben.AddItem lstCharakterunten.List(lstCharakterunten.ListIndex)
                    'Einzigartige Charakter aus Auswahlliste entfernen
                    lstCharakterunten.RemoveItem lstCharakterunten.ListIndex
                    'Charakter in Charakterliste hinzufügen
                    Charakterliste_hinzufügen
                    'Punktekosten zu Charakterpunkte hinzuzählen
                    Charakterpunkte = Charakterpunkte + labPunkte.Caption
                    labCharakterpunkte.Caption = Charakterpunkte
                    'Punktekosten von Restpunkten abziehen
                    Restpunkte = Restpunkte - labPunkte.Caption
                    labRestpunkte.Caption = Restpunkte
                    'Charakteranzeige neu anzeigen
                    If Alter_Index + 1 > lstCharakterunten.ListCount Then
                        lstCharakterunten.ListIndex = Alter_Index - 1
                    Else
                        lstCharakterunten.ListIndex = Alter_Index
                    End If
                    Charakter_anzeigen dsCharakter, lstCharakterunten.Text, -1
                End If
            Else
                'Indexnummer des Charakters merken
                Alter_Index = lstCharakterunten.ListIndex
                'Charakter als Listeneintrag ergänzen
                lstcharakteroben.AddItem lstCharakterunten.List(lstCharakterunten.ListIndex)
                'Einzigartige Charakter aus Auswahlliste entfernen
                If dsCharakter.Fields("Einzigartig") Then
                    lstCharakterunten.RemoveItem lstCharakterunten.ListIndex
                End If
                'Charakter in Charakterliste hinzufügen
                Charakterliste_hinzufügen
                'Punktekosten zu Charakterpunkte hinzuzählen
                Charakterpunkte = Charakterpunkte + labPunkte.Caption
                labCharakterpunkte.Caption = Charakterpunkte
                'Punktekosten von Restpunkten abziehen
                Restpunkte = Restpunkte - labPunkte.Caption
                labRestpunkte.Caption = Restpunkte
                'Charakteranzeige neu anzeigen
                If Alter_Index + 1 > lstCharakterunten.ListCount Then
                    lstCharakterunten.ListIndex = Alter_Index - 1
                Else
                    lstCharakterunten.ListIndex = Alter_Index
                End If
                Charakter_anzeigen dsCharakter, lstCharakterunten.Text, -1
            End If
        End If
    Else
        MsgBox "Es muß ein Charakter ausgewählt werden", 0, "Kein Charakter ausgewählt"
    End If
End If
End Sub


Private Sub lstCharakteroben_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Fokus auf lstCharakteroben setzen
    Fokus_zuletzt = "lstCharakteroben"
    'Info anzeigen
    Charakter_anzeigen dsCharakter, lstcharakteroben.Text, lstcharakteroben.ListIndex
    'Drag & Drop
    lstcharakteroben.Drag
End If
End Sub


Private Sub lstCharakterunten_DblClick()
Charakter_anzeigen dsCharakter, lstCharakterunten.Text, -1
End Sub

Private Sub lstCharakterunten_DragDrop(Source As Control, X As Single, Y As Single)
Dim Alter_Index As Integer
If (TypeOf Source Is ListBox) And (Source.Name = "lstCharakteroben") Then
    If lstcharakteroben.ListIndex <> -1 Then
        'Punktekosten von Charakterpunkte abziehen
        Charakterpunkte = Charakterpunkte - labPunkte.Caption
        labCharakterpunkte.Caption = Charakterpunkte
        'Punktekosten zu Restpunkten hinzuzählen
        Restpunkte = Restpunkte + labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Magische Gegenstände zurückgeben
        'Magischer Gegenstand Nr.1
        If -labOption1.BorderStyle And labOption1.Caption <> "" Then
            Select Case laboption1_Kategorie.Caption
                Case "Spruchrolle"
                Case "Homunkuli"
                Case "Mutation"
                    Wandler = labOption1.Caption & " (" & labOption1_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem Wandler
                Case "Waffe"
                    Wandler = labOption1.Caption & " (" & labOption1_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem Wandler
                Case "Rüstung"
                    Wandler = labOption1.Caption & " (" & labOption1_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem Wandler
                Case "Schild"
                    Wandler = labOption1.Caption & " (" & labOption1_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem Wandler
                Case Else
                    Wandler = labOption1.Caption & " (" & labOption1_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem Wandler
            End Select
        End If
        'Magischer Gegenstand Nr.2
        If -labOption2.BorderStyle And labOption2.Caption <> "" Then
            Select Case laboption2_Kategorie.Caption
                Case "Spruchrolle"
                Case "Homunkuli"
                Case "Mutation"
                    Wandler = labOption2.Caption & " (" & labOption2_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem Wandler
                Case "Waffe"
                    Wandler = labOption2.Caption & " (" & labOption2_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem Wandler
                Case "Rüstung"
                    Wandler = labOption2.Caption & " (" & labOption2_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem Wandler
                Case "Schild"
                    Wandler = labOption2.Caption & " (" & labOption2_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem Wandler
                Case Else
                    Wandler = labOption2.Caption & " (" & labOption2_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem Wandler
            End Select
        End If
        'Magischer Gegenstand Nr.3
        If -labOption3.BorderStyle And labOption3.Caption <> "" Then
            Select Case laboption3_Kategorie.Caption
                Case "Spruchrolle"
                Case "Homunkuli"
                Case "Mutation"
                    Wandler = labOption3.Caption & " (" & labOption3_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem Wandler
                Case "Waffe"
                    Wandler = labOption3.Caption & " (" & labOption3_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem Wandler
                Case "Rüstung"
                    Wandler = labOption3.Caption & " (" & labOption3_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem Wandler
                Case "Schild"
                    Wandler = labOption3.Caption & " (" & labOption3_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem Wandler
                Case Else
                    Wandler = labOption3.Caption & " (" & labOption3_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem Wandler
            End Select
        End If
        'Magischer Gegenstand Nr.4
        If -labOption4.BorderStyle And labOption4.Caption <> "" Then
            Select Case laboption4_Kategorie.Caption
                Case "Spruchrolle"
                Case "Homunkuli"
                Case "Mutation"
                    Wandler = labOption4.Caption & " (" & labOption4_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem Wandler
                Case "Waffe"
                    Wandler = labOption4.Caption & " (" & labOption4_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem Wandler
                Case "Rüstung"
                    Wandler = labOption4.Caption & " (" & labOption4_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem Wandler
                Case "Schild"
                    Wandler = labOption4.Caption & " (" & labOption4_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem Wandler
                Case Else
                    Wandler = labOption4.Caption & " (" & labOption4_Kosten.Caption & ")"
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem Wandler
            End Select
        End If
        'Charakter aus Charakterliste streichen
        Charakterliste_herausnehmen lstcharakteroben.ListIndex
        'Überprüfen ob einzigartiger Charakter wieder in Auswahlliste hinzugefügt werden muß
        If dsCharakter.Fields("Einzigartig") Or dsCharakter.Fields("General") Or dsCharakter.Fields("Armeestandarte") Then
            lstCharakterunten.AddItem lstcharakteroben.Text
            If dsCharakter.Fields("General") Then
                General = 0
            End If
            If dsCharakter.Fields("Armeestandarte") Then
                Armeestandarte = 0
            End If
        End If
        'Indexnummer des zu entfernen Charakters merken
        Alter_Index = lstcharakteroben.ListIndex
        'Charakter aus Listenfeld streichen
        lstcharakteroben.RemoveItem lstcharakteroben.ListIndex
        'Nachfolgenden Charakter oder Charakter von unten anzeigen
        If Alter_Index > Charakterzähler - 1 Then
            If Alter_Index - 1 = -1 Then
                Alles_leeren
            Else
                lstcharakteroben.ListIndex = Alter_Index - 1
                Charakter_anzeigen dsCharakter, lstcharakteroben.Text, lstcharakteroben.ListIndex
            End If
        Else
            lstcharakteroben.ListIndex = Alter_Index
            Charakter_anzeigen dsCharakter, lstcharakteroben.Text, lstcharakteroben.ListIndex
        End If
    Else
        MsgBox "Es muß ein Charakter ausgewählt werden", 0, "Kein Charakter ausgewählt"
    End If
End If
End Sub

Private Sub lstCharakterunten_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Überprüfen ob Charakterinfo angezeigt werden muß
    If Fokus_zuletzt = "lstCharakteroben" Or labTruppenname_groß.Caption <> lstCharakterunten.Text Then
        Fokus_zuletzt = "lstCharakterunten"
        'Charakterinfo anzeigen
        Charakter_anzeigen dsCharakter, lstCharakterunten.Text, -1
    Else
        Fokus_zuletzt = "lstCharakterunten"
    End If
    'Drag & Drop
    lstCharakterunten.Drag
End If
End Sub

Private Sub lstKriegsgerätoben_DragDrop(Source As Control, X As Single, Y As Single)
If (TypeOf Source Is ListBox) And (Source.Name = "lstKriegsgerätunten") Then
    If lstkriegsgerätunten.ListIndex <> -1 Then
        'Indexnummer des Kriegsgeräts merken
        Alter_Index = lstkriegsgerätunten.ListIndex
        'Kriegsgerät als Listeneintrag ergänzen
        lstKriegsgerätoben.AddItem lstkriegsgerätunten.List(lstkriegsgerätunten.ListIndex)
        Kriegsgerätliste_hinzufügen
        'Punktekosten zu Kriegsgerätpunkte hinzuzählen
        Kriegsgerätpunkte = Kriegsgerätpunkte + labPunkte.Caption
        labKriegsgerätpunkte.Caption = Kriegsgerätpunkte
        'Punktekosten von Restpunkten abziehen
        Restpunkte = Restpunkte - labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Kriegsgerätanzeige neu anzeigen
        lstkriegsgerätunten.ListIndex = Alter_Index
        Kriegsgerätinfo_anzeigen dsKriegsgerät, lstkriegsgerätunten.Text, -1
    Else
        MsgBox "Es muß ein Kriegsgerät ausgewählt werden", 0, "Kein Kriegsgerät ausgewählt"
    End If
End If
End Sub




Private Sub lstKriegsgerätoben_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Fokus auf lstKriegsgrätoben setzen
    Fokus_zuletzt = "lstKriegsgerätoben"
    'Info anzeigen
    Kriegsgerätinfo_anzeigen dsKriegsgerät, lstKriegsgerätoben.Text, lstKriegsgerätoben.ListIndex
    'Drag & Drop
    lstKriegsgerätoben.Drag
End If
End Sub


Private Sub lstkriegsgerätunten_DblClick()
Kriegsgerätinfo_anzeigen dsKriegsgerät, lstkriegsgerätunten.Text, -1
End Sub

Private Sub lstkriegsgerätunten_DragDrop(Source As Control, X As Single, Y As Single)
If (TypeOf Source Is ListBox) And (Source.Name = "lstKriegsgerätoben") Then
    If lstKriegsgerätoben.ListIndex <> -1 Then
        'Punktekosten von Kriegsgerätpunkte abziehen
        Kriegsgerätpunkte = Kriegsgerätpunkte - labPunkte.Caption
        labKriegsgerätpunkte.Caption = Kriegsgerätpunkte
        'Punktekosten zu Restpunkten hinzuzählen
        Restpunkte = Restpunkte + labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Kriegsgerät aus Kriegsgerätliste streichen
        Kriegsgerätliste_herausnehmen lstKriegsgerätoben.ListIndex
        'Indexnummer des zu entfernen Regiments merken
        Alter_Index = lstKriegsgerätoben.ListIndex
        'Kriegsgerät aus Listenfeld streichen
        lstKriegsgerätoben.RemoveItem lstKriegsgerätoben.ListIndex
        'Nachfolgendes Kriegsgerät anzeigen oder Anzeige leeren
        If Alter_Index > Kriegsgerätzähler - 1 Then
            If Alter_Index - 1 = -1 Then
                Alles_leeren
            Else
                lstKriegsgerätoben.ListIndex = Alter_Index - 1
                Kriegsgerätinfo_anzeigen dsKriegsgerät, lstKriegsgerätoben.Text, lstKriegsgerätoben.ListIndex
            End If
        Else
            lstKriegsgerätoben.ListIndex = Alter_Index
            Kriegsgerätinfo_anzeigen dsKriegsgerät, lstKriegsgerätoben.Text, lstKriegsgerätoben.ListIndex
        End If
    Else
        MsgBox "Es muß ein Kriegsgerät ausgewählt werden", 0, "Kein Kriegsgerät ausgewählt"
    End If
End If
End Sub






Private Sub lstkriegsgerätunten_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Überprüfen ob Info angezeigt werden muß
    If labTruppenname_groß.Caption <> lstkriegsgerätunten.Text Or Fokus_zuletzt <> "lstKriegsgerätunten" Then
        'Fokus auf lstKriegsgerätunten setzen
        Fokus_zuletzt = "lstKriegsgerätunten"
        'Info anzeigen
        Kriegsgerätinfo_anzeigen dsKriegsgerät, lstkriegsgerätunten.Text, -1
    End If
    'Fokus auf lstKriegsgerätunten setzen
    Fokus_zuletzt = "lstKriegsgerätunten"
    'Drag & Drop
    lstkriegsgerätunten.Drag
End If
End Sub
Private Sub lstMonsteroben_DragDrop(Source As Control, X As Single, Y As Single)
If (TypeOf Source Is ListBox) And (Source.Name = "lstMonsterunten") Then
    If lstMonsterunten.ListIndex <> -1 Then
        'Indexnummer des Monsterss merken
        Alter_Index = lstMonsterunten.ListIndex
        'Monster in Monsterfeld ergänzen
        Monsterliste_hinzufügen
        'Monster als Listeneintrag ergänzen
        lstMonsteroben.AddItem lstMonsterunten.List(lstMonsterunten.ListIndex)
        'Punktekosten zu Monsterpunkte hinzuzählen
        Monsterpunkte = 0 + Monsterpunkte + labPunkte.Caption
        labMonsterpunkte.Caption = Monsterpunkte
        'Punktekosten von Restpunkten abziehen
        Restpunkte = Restpunkte - labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Monsteranzeige neu anzeigen
        lstMonsterunten.ListIndex = Alter_Index
        Monsterinfo_anzeigen dsMonster, lstMonsterunten.Text, -1
    Else
        MsgBox "Es muß ein Monster ausgewählt werden", 0, "Kein Monster ausgewählt"
    End If
End If
End Sub



Private Sub lstMonsteroben_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Fokus auf lstMosterobern setzen
    Fokus_zuletzt = "lstMonsteroben"
    'Info anzeigen
    Monsterinfo_anzeigen dsMonster, lstMonsteroben.Text, lstMonsteroben.ListIndex
    'Drag & Drop
    lstMonsteroben.Drag
End If
End Sub


Private Sub lstMonsterunten_DragDrop(Source As Control, X As Single, Y As Single)
If (TypeOf Source Is ListBox) And (Source.Name = "lstMonsteroben") Then
    If lstMonsteroben.ListIndex <> -1 Then
        'Punktekosten von Monsterpunkte abziehen
        Monsterpunkte = Monsterpunkte - labPunkte.Caption
        labMonsterpunkte.Caption = Monsterpunkte
        'Punktekosten zu Restpunkten hinzuzählen
        Restpunkte = Restpunkte + labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Monster aus Monsterfeld streichen
        Monsterliste_herausnehmen lstMonsteroben.ListIndex
        'Indexnummer des zu entfernen Monsters merken
        Alter_Index = lstMonsteroben.ListIndex
        'Monster aus Listenfeld streichen
        lstMonsteroben.RemoveItem lstMonsteroben.ListIndex
        'Nachfolgendes Monster oder Anzeige leeren
        If Alter_Index > Monsterzähler - 1 Then
            If Alter_Index - 1 = -1 Then
                Alles_leeren
            Else
                lstMonsteroben.ListIndex = Alter_Index - 1
                Monsterinfo_anzeigen dsMonster, lstMonsteroben.Text, lstMonsteroben.ListIndex
            End If
        Else
            lstMonsteroben.ListIndex = Alter_Index
            Monsterinfo_anzeigen dsMonster, lstMonsteroben.Text, lstMonsteroben.ListIndex
        End If

    Else
        MsgBox "Es muß ein Monster ausgewählt werden", 0, "Kein Monster ausgewählt"
    End If
End If
End Sub


Private Sub lstMonsterunten_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Fokus auf lstMonsteruntern setzen
    Fokus_zuletzt = "lstMonsterunten"
    'Überprüfen ob Monsterinfo angezeigt werden muß
    If labTruppenname_groß.Caption <> lstMonsterunten.Text Then
        'Info anzeigen
        Monsterinfo_anzeigen dsMonster, lstMonsterunten.Text, -1
    End If
    'Drag & Drop
    lstMonsterunten.Drag
End If
End Sub



Public Sub Kriegsgerätliste_hinzufügen()
Wandler = labAnzahl.Caption
Kriegsgerätfeld(Kriegsgerätzähler).Anzahl = Wandler
If frmHauptmenü.Caption = "Zwerge" Then
    'Namen der Zwergenrunen speichern
    Kriegsgerätfeld(Kriegsgerätzähler).Zwergenrunen_Kriegsgerät.Rune1 = Zwergenrunen_Zwischenspeicher.Rune1
    Kriegsgerätfeld(Kriegsgerätzähler).Zwergenrunen_Kriegsgerät.Rune2 = Zwergenrunen_Zwischenspeicher.Rune2
    Kriegsgerätfeld(Kriegsgerätzähler).Zwergenrunen_Kriegsgerät.Rune3 = Zwergenrunen_Zwischenspeicher.Rune3
    'Kosten der Zwergenrunen speichern
    If labOption2_Kosten <> "" Then
        Kriegsgerätfeld(Kriegsgerätzähler).Zwergenrunen_Kriegsgerät.Runenkosten = Zwergenrunen_Zwischenspeicher.Runenkosten
    End If
    'Zwergenrunen_Zwischenspeicher leeren
    Zwergenrunen_Zwischenspeicher.Rune1 = ""
    Zwergenrunen_Zwischenspeicher.Rune2 = ""
    Zwergenrunen_Zwischenspeicher.Rune3 = ""
    Zwergenrunen_Zwischenspeicher.Runenkosten = 0
End If
If ckbOption1.Visible Then
    Kriegsgerätfeld(Kriegsgerätzähler).Option1 = ckbOption1.Value
    If ckbOption2.Visible Then
        Kriegsgerätfeld(Kriegsgerätzähler).Option2 = ckbOption2.Value
        If ckbOption3.Visible Then
            Kriegsgerätfeld(Kriegsgerätzähler).Option3 = ckbOption3.Value
            If ckbOption4.Visible Then
                Kriegsgerätfeld(Kriegsgerätzähler).Option4 = ckbOption4.Value
                If ckbOption5.Visible Then
                    Kriegsgerätfeld(Kriegsgerätzähler).Option5 = ckbOption5.Value
                End If
            End If
        End If
    End If
End If
Kriegsgerätzähler = Kriegsgerätzähler + 1
End Sub

Public Sub Kriegsgerätliste_herausnehmen(Indexnummer As Integer)
Do Until Indexnummer = Kriegsgerätzähler
    Kriegsgerätfeld(Indexnummer) = Kriegsgerätfeld(Indexnummer + 1)
    Indexnummer = Indexnummer + 1
Loop
Kriegsgerätzähler = Kriegsgerätzähler - 1
End Sub

Private Sub lstRegimenteroben_DragDrop(Source As Control, X As Single, Y As Single)
Dim Alter_Index As Integer

If (TypeOf Source Is ListBox) And (Source.Name = "lstRegimenterunten") Then
    If lstRegimenterunten.ListIndex <> -1 Then
        'Indexnummer des Regiments merken
        Alter_Index = lstRegimenterunten.ListIndex
        'Regiment als Listeneintrag ergänzen
        lstRegimenteroben.AddItem lstRegimenterunten.List(lstRegimenterunten.ListIndex)
        Regimenterliste_hinzufügen
        'Punktekosten zu Regimenterpunkte hinzuzählen
        Regimenterpunkte = Regimenterpunkte + labPunkte.Caption
        labRegimenterpunkte.Caption = Regimenterpunkte
        'Punktekosten von Restpunkten abziehen
        Restpunkte = Restpunkte - labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Regimenteranzeige neu anzeigen
        lstRegimenterunten.ListIndex = Alter_Index
        Regimenter_anzeigen dsRegimenter, lstRegimenterunten.Text, -1
    Else
        MsgBox "Es muß ein Regiment ausgewählt werden", 0, "Kein Regiment ausgewählt"
    End If
End If
End Sub


Private Sub lstRegimenteroben_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Fokus auf lstRegimenteroben setzen
    Fokus_zuletzt = "lstRegimenteroben"
    'Info anzeigen
    Regimenter_anzeigen dsRegimenter, lstRegimenteroben.Text, lstRegimenteroben.ListIndex
    'Drag & Drop
    lstRegimenteroben.Drag
End If
End Sub


Private Sub lstRegimenterunten_DblClick()
Regimenter_anzeigen dsRegimenter, lstRegimenterunten.Text, -1
End Sub

Private Sub lstRegimenterunten_DragDrop(Source As Control, X As Single, Y As Single)
Dim Name_der_Standarte As String
Dim Länge As Integer
If (TypeOf Source Is ListBox) And (Source.Name = "lstRegimenteroben") Then
    If lstRegimenteroben.ListIndex <> -1 Then
        'Punktekosten von Regimenterpunkte abziehen
        Regimenterpunkte = Regimenterpunkte - labPunkte.Caption
        labRegimenterpunkte.Caption = Regimenterpunkte
        'Punktekosten zu Restpunkten hinzuzählen
        Restpunkte = Restpunkte - 0 + labPunkte.Caption
        labRestpunkte.Caption = Restpunkte
        'Magische Standarte zurückgeben
        If labMagische_Standarte.Caption <> "" Then
            Länge = InStr(labMagische_Standarte.Caption, "(")
            Name_der_Standarte = Left(labMagische_Standarte, Länge - 2)
            Wandler = "[Standartenname] ='" & Name_der_Standarte & "'"
            dsStandarten.MoveFirst
            dsStandarten.FindNext Wandler
            If dsStandarten.NoMatch Then
                MsgBox "Standarte nicht gefunden", 0, "Rückgabefehler"
            Else
                frmMagische_Gegenstände.lstmagische_standarten.AddItem Name_der_Standarte & " (" & dsStandarten.Fields("Punktwert") & ")"
            End If
        End If
        'Regiment aus Regimenterliste streichen
        Regimenterliste_herausnehmen lstRegimenteroben.ListIndex
        'Indexnummer des zu entfernen Regiments merken
        Alter_Index = lstRegimenteroben.ListIndex
        'Regiment aus Listenfeld streichen
        lstRegimenteroben.RemoveItem lstRegimenteroben.ListIndex
        'Nachfolgenden Charakter oder Charakter von unten anzeigen
        If Alter_Index > Regimenterzähler - 1 Then
            If Alter_Index - 1 = -1 Then
                Alles_leeren
            Else
                lstRegimenteroben.ListIndex = Alter_Index - 1
                Regimenter_anzeigen dsRegimenter, lstRegimenteroben.Text, lstRegimenteroben.ListIndex
            End If
        Else
            lstRegimenteroben.ListIndex = Alter_Index
            Regimenter_anzeigen dsRegimenter, lstRegimenteroben.Text, lstRegimenteroben.ListIndex
        End If
    Else
        MsgBox "Es muß ein Regiment ausgewählt werden", 0, "Kein Regiment ausgewählt"
    End If
End If
End Sub

Private Sub lstRegimenterunten_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Überprüfen ob die linke Maustaste gedrückt wurde
If Button = 1 Then
    'Überprüfen ob Regimenterinfo angezeit werden muß
    If Fokus_zuletzt = "lstRegimenteroben" Or labTruppenname_groß.Caption <> lstRegimenterunten.Text Then
        'Fokus auf lstRegimenterunten setzen
        Fokus_zuletzt = "lstRegimenterunten"
        'Regimenterinfo anzeigen
        Regimenter_anzeigen dsRegimenter, lstRegimenterunten.Text, -1
    Else
        'Fokus auf lstRegimenterunten setzen
        Fokus_zuletzt = "lstRegimenterunten"
    End If
    'Drag & Drop
    lstRegimenterunten.Drag
End If
End Sub

Public Sub Regimenterliste_hinzufügen()
Wandler = labAnzahl.Caption
Regimenterfeld(Regimenterzähler).Anzahl = Wandler
If ckbOption1.Visible Then
    Regimenterfeld(Regimenterzähler).Option1 = ckbOption1.Value
    If ckbOption2.Visible Then
        Regimenterfeld(Regimenterzähler).Option2 = ckbOption2.Value
        If ckbOption3.Visible Then
            Regimenterfeld(Regimenterzähler).Option3 = ckbOption3.Value
            If ckbOption4.Visible Then
                Regimenterfeld(Regimenterzähler).Option4 = ckbOption4.Value
                If ckbOption5.Visible Then
                    Regimenterfeld(Regimenterzähler).Option5 = ckbOption5.Value
                    If ckbOption6.Visible Then
                        Regimenterfeld(Regimenterzähler).Option6 = ckbOption6.Value
                    End If
                End If
            End If
        End If
    End If
End If
Regimenterfeld(Regimenterzähler).Musiker = ckbMusiker.Value
Regimenterfeld(Regimenterzähler).Standartenträger = ckbStandartenträger.Value
If Left(labMagische_Standarte, 12) <> "Zwergenrunen" Then
    Regimenterfeld(Regimenterzähler).MagischeStandarte.Rune1 = labMagische_Standarte.Caption
Else
    Regimenterfeld(Regimenterzähler).MagischeStandarte.Rune1 = Zwergenrunen_Zwischenspeicher.Rune1
    Regimenterfeld(Regimenterzähler).MagischeStandarte.Rune2 = Zwergenrunen_Zwischenspeicher.Rune2
    Regimenterfeld(Regimenterzähler).MagischeStandarte.Rune3 = Zwergenrunen_Zwischenspeicher.Rune3
    Regimenterfeld(Regimenterzähler).MagischeStandarte.Runenkosten = Zwergenrunen_Zwischenspeicher.Runenkosten
End If
Zwischenspeicher.Standarte = 0
Regimenterzähler = Regimenterzähler + 1
End Sub

Public Sub Regimenterliste_herausnehmen(Indexnummer As Integer)
Do Until Indexnummer = Regimenterzähler
    Regimenterfeld(Indexnummer) = Regimenterfeld(Indexnummer + 1)
    Indexnummer = Indexnummer + 1
Loop
Regimenterzähler = Regimenterzähler - 1
End Sub

Public Sub Monsterliste_hinzufügen()
Wandler = labAnzahl.Caption
Monsterfeld(Monsterzähler).Anzahl = Wandler
Monsterzähler = Monsterzähler + 1
End Sub

Public Sub Monsterliste_herausnehmen(Indexnummer As Integer)
Do Until Indexnummer = Monsterzähler
    Monsterfeld(Indexnummer) = Monsterfeld(Indexnummer + 1)
    Indexnummer = Indexnummer + 1
Loop
Monsterzähler = Monsterzähler - 1
End Sub

Private Sub mnuDBeenden_Click()
Dim Entscheidung As Single
Dim i As Integer

'Mousepointer Sanduhr
Screen.MousePointer = 11

'Hauptmenü und Magische Gegenstände ausblenden
frmMagische_Gegenstände.Hide
frmHauptmenü.Hide

'Anzeige leeren
Alles_leeren

'Titelbild einblenden
Randomize
Entscheidung = Rnd
With frmLaden
    If Entscheidung < 0.5 Then
        .ImgLaden.Picture = LoadPicture(App.Path & "\chronicl.bmp")
    Else
        .ImgLaden.Picture = LoadPicture(App.Path & "\trollsla.bmp")
    End If
        .ImgLaden.Top = Int((.Height - .ImgLaden.Height) / 2)
        .ImgLaden.Left = Int((.Width - .ImgLaden.Width) / 2)
        .Show
End With

'Listenfelder im Hauptmenü leeren
lstcharakteroben.Clear
lstCharakterunten.Clear
lstRegimenteroben.Clear
lstRegimenterunten.Clear
lstKriegsgerätoben.Clear
lstkriegsgerätunten.Clear
lstMonsteroben.Clear
lstMonsterunten.Clear

'Listenfelder der Magischen Gegenstände leeren
With frmMagische_Gegenstände
    .lstMagische_Spruchrollen.Clear
    .lstHomunkuli.Clear
    .lstChaos_Mutationen.Clear
    .lstmagische_standarten.Clear
    .lstMagische_Waffen.Clear
    .lstMagische_Rüstungen.Clear
    .lstMagische_Schilder.Clear
    .lstVerschiedene_Magische_Gegenstände.Clear
End With

'Listenfelder der Zwergenrunen leeren
With frmZwergenrunen
    .lstWaffenrunen.Clear
    .lstRüstungsrunen.Clear
    .lstSchutzrunen.Clear
    .lstMaschinenrunen.Clear
    .lstTalismanrunen.Clear
End With

'Listenfeld der Reittiere leeren
frmReittiere.cobReittiere.Clear

'Globale Variablen zurücksetzten
Optionen_Initalisieren = 0
Fokus_zuletzt = ""
Aktive_zuletzt = ""
Letzte_Auswahl = ""
Letzte_Auswahl_Kategorie = ""
Charaktereditions_Modus = ""
Charakterbearbeitung = 0
Standartenbearbeitung = 0
Maximalpunkte = 3000
frmNeueArmee.labPunkte.Caption = Maximalpunkte
Letzter_Punktestand = 0

'Zwischenspeicher für magische Gegenstände zurücksetzten
Zwischenspeicher.Option1 = 0
Zwischenspeicher.Option2 = 0
Zwischenspeicher.Option3 = 0
Zwischenspeicher.Option4 = 0
Zwischenspeicher.Standarte = 0

'Zwergenrunen Zwischenspeicher zurücksetzen
Zwergenrunen_Zwischenspeicher.Rune1 = ""
Zwergenrunen_Zwischenspeicher.Rune2 = ""
Zwergenrunen_Zwischenspeicher.Rune3 = ""
Zwergenrunen_Zwischenspeicher.Runenkosten = 0


'Dynasetes des Hauptmenüs schließen
dsCharakter.Close
dsRegimenter.Close
If frmHauptmenü.Caption <> "Waldelfen" And frmHauptmenü.Caption <> "Echsenmenschen" And frmHauptmenü.Caption <> "Bretonen" And frmHauptmenü.Caption <> "Tiermenschen" And frmHauptmenü.Caption <> "Chaoskrieger" And frmHauptmenü.Caption <> "Dämonen" Then
    dsKriegsgerät.Close
End If
dsMonster.Close

'Dynasets der Magischen Gegenstände schließen
dsSpruchrollen.Close
dsHomunkuli.Close
dsStandarten.Close
If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
    dsMutationen.Close
End If
dsMagische_Waffen.Close
dsMagische_Rüstungen.Close
dsMagische_Schilder.Close
dsVerschiedene_mag_Gegenstände.Close

'Dynasets der Zwergenrunen schließen
If frmHauptmenü.Caption = "Zwerge" Then
    dsWaffenrunen.Close
    dsRüstungsrunen.Close
    dsSchutzrunen.Close
    dsMaschinenrunen.Close
    dsTalismanrunen.Close
End If

'Dynaset der Reittiere schließen
dsReittiere.Close

'Punkte auf Null setzen
Charakterpunkte = 0
Regimenterpunkte = 0
Kriegsgerätpunkte = 0
Monsterpunkte = 0
Verbündetepunkte = 0

'General und Armeestandartenträger zurücksetzen
General = 0
Armeestandarte = 0

'Felder im Hauptmenü zurücksetzten
'Charakterfeld zurücksetzen
For i = 0 To Charakterzähler
    Charakterfeld(i).Reittier = ""
    Charakterfeld(i).Waffe = ""
    Charakterfeld(i).Rüstung = ""
    Charakterfeld(i).Fernwaffe = ""
    Charakterfeld(i).mag_Gegenstand1 = ""
    Charakterfeld(i).mag_Gegenstand1_Kosten = ""
    Charakterfeld(i).mag_Gegenstand1_Kategorie = ""
    Charakterfeld(i).mag_Gegenstand2 = ""
    Charakterfeld(i).mag_Gegenstand2_Kosten = ""
    Charakterfeld(i).mag_Gegenstand2_Kategorie = ""
    Charakterfeld(i).mag_Gegenstand3 = ""
    Charakterfeld(i).mag_Gegenstand3_Kosten = ""
    Charakterfeld(i).mag_Gegenstand3_Kategorie = ""
    Charakterfeld(i).mag_Gegenstand4 = ""
    Charakterfeld(i).mag_Gegenstand4_Kosten = ""
    Charakterfeld(i).mag_Gegenstand4_Kategorie = ""
Next
Charakterzähler = 0

'Regimenterfeld zurücksetzen
For i = 0 To Regimenterzähler
    Regimenterfeld(i).Anzahl = 0
    Regimenterfeld(i).Option1 = 0
    Regimenterfeld(i).Option2 = 0
    Regimenterfeld(i).Option3 = 0
    Regimenterfeld(i).Option4 = 0
    Regimenterfeld(i).Option5 = 0
    Regimenterfeld(i).Option6 = 0
    Regimenterfeld(i).Musiker = 0
    Regimenterfeld(i).Standartenträger = 0
    Regimenterfeld(i).MagischeStandarte.Rune1 = ""
    Regimenterfeld(i).MagischeStandarte.Rune2 = ""
    Regimenterfeld(i).MagischeStandarte.Rune3 = ""
    Regimenterfeld(i).MagischeStandarte.Runenkosten = 0
Next
Regimenterzähler = 0

'Kriegsgerätfeld zurücksetzen
For i = 0 To Kriegsgerätzähler
    Kriegsgerätfeld(i).Anzahl = 0
    Kriegsgerätfeld(i).Option1 = 0
    Kriegsgerätfeld(i).Option2 = 0
    Kriegsgerätfeld(i).Option3 = 0
    Kriegsgerätfeld(i).Option4 = 0
    Kriegsgerätfeld(i).Option5 = 0
    Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Rune1 = ""
    Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Rune2 = ""
    Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Rune3 = ""
    Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Runenkosten = 0
Next
Kriegsgerätzähler = 0

'Monsterfeld zurücksetzen
For i = 0 To Monsterzähler
    Monsterfeld(i).Anzahl = 0
Next
Monsterzähler = 0

'Mousepointer Normal
Screen.MousePointer = 0
End Sub

Private Sub mnuDDrucken_Click()
Dim i As Integer
With frmDrucken
    'Fokus deaktivieren
    Fokus_zuletzt = ""

    'Auswahlfeld füllen
    For i = 0 To lstcharakteroben.ListCount - 1
        .lstAuswahl.AddItem "[Charakter] " & lstcharakteroben.List(i) & " (" & (i + 1) & ")"
    Next
    For i = 0 To lstRegimenteroben.ListCount - 1
        .lstAuswahl.AddItem "[Regiment] " & lstRegimenteroben.List(i) & " (" & (i + 1) & ")"
    Next
    For i = 0 To lstKriegsgerätoben.ListCount - 1
        .lstAuswahl.AddItem "[Kriegsgerät] " & lstKriegsgerätoben.List(i) & " (" & (i + 1) & ")"
    Next
    For i = 0 To lstMonsteroben.ListCount - 1
        .lstAuswahl.AddItem "[Monster] " & lstMonsteroben.List(i) & " (" & (i + 1) & ")"
    Next
    
    'frmdrucken-Rahmen positionieren
    .Top = 0
    .Left = 0
    .Width = frmHauptmenü.ScaleWidth
    .Height = frmHauptmenü.ScaleHeight
    .Show
End With
End Sub

Private Sub mnuDSpeichern_Click()
Speichern 0
End Sub

Private Sub mnuDSpeichern_unter_Click()
Speichern -1
End Sub

Private Sub mnuHInfo_Click()
frmInfo.Visible = True
End Sub

Private Sub picAnzahl_minus_eins_Click()
If labAnzahl.Caption <> "1" And labEinzelkosten.Caption <> "" And Fokus_zuletzt <> "lstCharakteroben" And Fokus_zuletzt <> "lstCharakterunten" Then
    Wandler = labAnzahl.Caption - 1
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub

Private Sub picAnzahl_minus_zehn_Click()
Wandler = 0 + labAnzahl.Caption
If labAnzahl.Caption > 10 And labEinzelkosten.Caption <> "" And Fokus_zuletzt <> "lstCharakteroben" And Fokus_zuletzt <> "lstCharakterunten" Then
    Wandler = labAnzahl.Caption - 10
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub

Private Sub picAnzahl_plus_eins_Click()
If labEinzelkosten.Caption <> "" And Fokus_zuletzt <> "lstCharakteroben" And Fokus_zuletzt <> "lstCharakterunten" Then
    Wandler = labAnzahl.Caption + 1
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub

Private Sub picAnzahl_plus_zehn_Click()
If labEinzelkosten.Caption <> "" And Fokus_zuletzt <> "lstCharakteroben" And Fokus_zuletzt <> "lstCharakterunten" Then
    Wandler = labAnzahl.Caption + 10
    labAnzahl.Caption = Wandler
    If Fokus_zuletzt = "lstMonsteroben" Then
        Wandler = labAnzahl.Caption
        Monsterfeld(lstMonsteroben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstKriegsgerätoben" Then
        Wandler = labAnzahl.Caption
        Kriegsgerätfeld(lstKriegsgerätoben.ListIndex).Anzahl = Wandler
    End If
    If Fokus_zuletzt = "lstRegimenteroben" Then
        Wandler = labAnzahl.Caption
        Regimenterfeld(lstRegimenteroben.ListIndex).Anzahl = Wandler
    End If
End If
End Sub





Public Sub Charakterkosten_Berechnung()
Dim Position As Integer
Dim Länge As Integer
Dim Kosten As Integer

'Grundkosten ermitteln
Kosten = dsCharakter("Punktwert")
'Waffenkosten hinzuzählen
Position = InStr(labWaffe.Caption, "(")
If Position <> 0 Then
    Kosten = Kosten + Mid(labWaffe.Caption, Position + 1, 1)
End If
'Rüstungskosten hinzuzählen
Position = InStr(labRüstung.Caption, "(")
If Position <> 0 Then
    Länge = InStr(labRüstung.Caption, ")")
    Wandler = Mid(labRüstung.Caption, Position + 1, Länge - (Position + 1))
    Kosten = Kosten + Wandler
End If
'Fernwaffekosten hinzuzählen
Position = InStr(labfernwaffe.Caption, "(")
If Position <> 0 Then
    Kosten = Kosten + Mid(labfernwaffe.Caption, Position + 1, 1)
End If
'Kosten für den Magischen Gegenstand Nr.1 hinzuzählen
If -labOption1.BorderStyle And labOption1.Caption <> "" Then
    Kosten = Kosten + labOption1_Kosten.Caption
End If
'Kosten für den Magischen Gegenstand Nr.2 hinzuzählen
If -labOption2.BorderStyle And labOption2.Caption <> "" Then
    Kosten = Kosten + labOption2_Kosten.Caption
End If
'Kosten für den Magischen Gegenstand Nr.3 hinzuzählen
If -labOption3.BorderStyle And labOption3.Caption <> "" Then
    Kosten = Kosten + labOption3_Kosten.Caption
End If
'Kosten für den Magischen Gegenstand Nr.4 hinzuzählen
If -labOption4.BorderStyle And labOption4.Caption <> "" Then
    Kosten = Kosten + labOption4_Kosten.Caption
End If
'Kosten für Reittier hinzuzählen
If -lab2truppenname_klein.BorderStyle And lab2truppenname_klein.Caption <> "" Then
    Position = InStr(lab2truppenname_klein.Caption, "(") + 1
    Länge = InStr(lab2truppenname_klein.Caption, ")")
    Wandler = Mid(lab2truppenname_klein.Caption, Position, Länge - Position)
    Kosten = Kosten + Wandler
End If
'Gesamtkosten ausgeben
labEinzelkosten.Caption = Kosten
Charakterbearbeitung = 0
End Sub

Public Sub Charakterliste_hinzufügen()
If -lab2truppenname_klein.BorderStyle And lab2truppenname_klein.Caption <> "" Then
    Charakterfeld(Charakterzähler).Reittier = lab2truppenname_klein.Caption
End If
If IsNull(dsCharakter.Fields("Waffe")) Then
    Charakterfeld(Charakterzähler).Waffe = labWaffe.Caption
End If
If IsNull(dsCharakter.Fields("Rüstung")) Then
    Charakterfeld(Charakterzähler).Rüstung = labRüstung.Caption
End If
If IsNull(dsCharakter.Fields("Fernwaffe")) Then
    Charakterfeld(Charakterzähler).Fernwaffe = labfernwaffe.Caption
End If
If IsNull(dsCharakter.Fields("mag_Gegenstand1")) Then
    Charakterfeld(Charakterzähler).mag_Gegenstand1 = labOption1.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand1_Kosten = labOption1_Kosten.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand1_Kategorie = laboption1_Kategorie.Caption
    Zwischenspeicher.Option1 = 0
End If
If IsNull(dsCharakter.Fields("mag_Gegenstand2")) Then
    Charakterfeld(Charakterzähler).mag_Gegenstand2 = labOption2.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand2_Kosten = labOption2_Kosten.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand2_Kategorie = laboption2_Kategorie.Caption
    Zwischenspeicher.Option2 = 0
End If
If IsNull(dsCharakter.Fields("mag_Gegenstand3")) Then
    Charakterfeld(Charakterzähler).mag_Gegenstand3 = labOption3.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand3_Kosten = labOption3_Kosten.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand3_Kategorie = laboption3_Kategorie.Caption
    Zwischenspeicher.Option3 = 0
End If
If IsNull(dsCharakter.Fields("mag_Gegenstand4")) Then
    Charakterfeld(Charakterzähler).mag_Gegenstand4 = labOption4.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand4_Kosten = labOption4_Kosten.Caption
    Charakterfeld(Charakterzähler).mag_Gegenstand4_Kategorie = laboption4_Kategorie.Caption
    Zwischenspeicher.Option4 = 0
End If

'Charakterzähler für nächsten Charakter um eins erhöhen
Charakterzähler = Charakterzähler + 1
End Sub

Public Sub Charakterliste_herausnehmen(Indexnummer As Integer)
Do Until Indexnummer = Charakterzähler
    Charakterfeld(Indexnummer) = Charakterfeld(Indexnummer + 1)
    Indexnummer = Indexnummer + 1
Loop
Charakterzähler = Charakterzähler - 1
End Sub



Public Sub Speichern(Speichern_unter As Integer)
'VARIABLEN DEKLARATION
Static Dateiname As String
Dim i As Integer
'PROZEDURSTART
With frmStart
    .Common_Dialog.DialogTitle = "Speichern unter..."
    .Common_Dialog.Filter = "Armee (*.arm)|*.arm|Alle Dateien (*.*)|*.*"
    .Common_Dialog.DefaultExt = "ARM"
    .Common_Dialog.filename = ""
    If Speichern_unter Or Dateiname = "" Then
        .Common_Dialog.Action = 2
        Dateiname = .Common_Dialog.filename
    End If
End With
If Dateiname <> "" Then
    'Mousepointer Sanduhr
    Screen.MousePointer = 11

    'Datei öffnen
    Open Dateiname For Output As 1
    
    'Armeenamen speichern
    Print #1, frmHauptmenü.Caption
    
    'Maximalpunkte speichern
    Print #1, Maximalpunkte
    
    'Restpunkte speichern
    Print #1, Restpunkte
        
    'Restpunktzahl speichern
    Print #1, labRestpunkte.Caption
    
    'Letzter Punktestand speichern
    Print #1, Letzter_Punktestand
    
    'General speichern
    Print #1, General
    
    'Armeestandarte speichern
    Print #1, Armeestandarte
    
    'CHARAKTER
    'lstCharakterunten speichern
    i = 0
    Do Until i = lstCharakterunten.ListCount
        Print #1, lstCharakterunten.List(i)
        i = i + 1
    Loop
    Print #1, "lstCharakterunten"
    'lstCharateroben speichern
    i = 0
    Do Until i = lstcharakteroben.ListCount
        Print #1, lstcharakteroben.List(i)
        Print #1, Charakterfeld(i).Reittier
        Print #1, Charakterfeld(i).Waffe
        Print #1, Charakterfeld(i).Rüstung
        Print #1, Charakterfeld(i).Fernwaffe
        Print #1, Charakterfeld(i).mag_Gegenstand1
        Print #1, Charakterfeld(i).mag_Gegenstand1_Kosten
        Print #1, Charakterfeld(i).mag_Gegenstand1_Kategorie
        Print #1, Charakterfeld(i).mag_Gegenstand2
        Print #1, Charakterfeld(i).mag_Gegenstand2_Kosten
        Print #1, Charakterfeld(i).mag_Gegenstand2_Kategorie
        Print #1, Charakterfeld(i).mag_Gegenstand3
        Print #1, Charakterfeld(i).mag_Gegenstand3_Kosten
        Print #1, Charakterfeld(i).mag_Gegenstand3_Kategorie
        Print #1, Charakterfeld(i).mag_Gegenstand4
        Print #1, Charakterfeld(i).mag_Gegenstand4_Kosten
        Print #1, Charakterfeld(i).mag_Gegenstand4_Kategorie
        i = i + 1
    Loop
    Print #1, "lstCharakteroben"
    'Charakterpunkte speichern
    Print #1, labCharakterpunkte.Caption


    'REGIMENTER
    'lstRegimenteroben speichern
    i = 0
    Do Until i = lstRegimenteroben.ListCount
        Print #1, lstRegimenteroben.List(i)
        Print #1, Regimenterfeld(i).Anzahl
        Print #1, Regimenterfeld(i).Option1
        Print #1, Regimenterfeld(i).Option2
        Print #1, Regimenterfeld(i).Option3
        Print #1, Regimenterfeld(i).Option4
        Print #1, Regimenterfeld(i).Option5
        Print #1, Regimenterfeld(i).Option6
        Print #1, Regimenterfeld(i).Musiker
        Print #1, Regimenterfeld(i).Standartenträger
        Print #1, Regimenterfeld(i).MagischeStandarte.Rune1
        i = i + 1
    Loop
    Print #1, "lstRegimenteroben"
    'Regimenterpunkte speichern
    Print #1, labRegimenterpunkte.Caption


    'KRIEGSGERÄT
    'lstKriegsgerätoben speichern
    i = 0
    Do Until i = lstKriegsgerätoben.ListCount
        Print #1, lstKriegsgerätoben.List(i)
        Print #1, Kriegsgerätfeld(i).Anzahl
        Print #1, Kriegsgerätfeld(i).Option1
        Print #1, Kriegsgerätfeld(i).Option2
        Print #1, Kriegsgerätfeld(i).Option3
        Print #1, Kriegsgerätfeld(i).Option4
        Print #1, Kriegsgerätfeld(i).Option5
        If frmHauptmenü.Caption = "Zwerge" Then
            Print #1, Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Rune1
            Print #1, Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Rune2
            Print #1, Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Rune3
            Print #1, Kriegsgerätfeld(i).Zwergenrunen_Kriegsgerät.Runenkosten
        End If
        i = i + 1
    Loop
    Print #1, "lstKriegsgerätoben"
    'Kriegsgerätpunkte speichern
    Print #1, labKriegsgerätpunkte.Caption

    
    'MONSTER
    'lstMonsteroben speichern
    i = 0
    Do Until i = lstMonsteroben.ListCount
        Print #1, lstMonsteroben.List(i)
        Print #1, Monsterfeld(i).Anzahl
        i = i + 1
    Loop
    Print #1, "lstMonsteroben"
    'Monsterpunkte speichern
    Print #1, labMonsterpunkte.Caption
    
    
    'VERBÜNDETE
    'Verbündetepunkte speichern
    Print #1, labVerbündetepunkte.Caption
    
    
    'MAGISCHE GEGENSTÄNDE
    With frmMagische_Gegenstände
    
        'lstChaos_Mutationen speichern
        If frmHauptmenü.Caption = "Chaos" Or frmHauptmenü.Caption = "Chaoskrieger" Or frmHauptmenü.Caption = "Tiermenschen" Or frmHauptmenü.Caption = "Dämonen" Then
            i = 0
            Do Until i = .lstChaos_Mutationen.ListCount
                Print #1, .lstChaos_Mutationen.List(i)
                i = i + 1
            Loop
            Zwischenspeicher_speichern "Mutation"
            Print #1, "lstChaos_Mutationen"
        End If
        
        'lstMagische_Standarten
        i = 0
        Do Until i = .lstmagische_standarten.ListCount
            Print #1, .lstmagische_standarten.List(i)
            i = i + 1
        Loop
        Zwischenspeicher_speichern "Standarte"
        Print #1, "lstMagische_Standarten"
        
        'lstMagische_Waffen
        i = 0
        Do Until i = .lstMagische_Waffen.ListCount
            Print #1, .lstMagische_Waffen.List(i)
            i = i + 1
        Loop
        Zwischenspeicher_speichern "Waffe"
        Print #1, "lstMagische_Waffen"
        
        'lstMagische_Rüstungen
        i = 0
        Do Until i = .lstMagische_Rüstungen.ListCount
            Print #1, .lstMagische_Rüstungen.List(i)
            i = i + 1
        Loop
        Zwischenspeicher_speichern "Rüstung"
        Print #1, "lstMagische_Rüstungen"
        
        'lstMagische_Schilder
        i = 0
        Do Until i = .lstMagische_Schilder.ListCount
            Print #1, .lstMagische_Schilder.List(i)
            i = i + 1
        Loop
        Zwischenspeicher_speichern "Schild"
        Print #1, "lstMagische_Schilder"
        
        'lstVerschiedene_Magische_Gegenstände
        i = 0
        Do Until i = .lstVerschiedene_Magische_Gegenstände.ListCount
            Print #1, .lstVerschiedene_Magische_Gegenstände.List(i)
            i = i + 1
        Loop
        Zwischenspeicher_speichern "Sonstige"
        Print #1, "lstVerschiedene_Magische_Gegenstände"
    End With
    
    
    Close #1
    
    'Mousepointer Sanduhr
    Screen.MousePointer = 0
Else
    MsgBox "Die Armee wurde nicht abgespeichert", 16, "Nicht gespeichert"
End If


End Sub

Public Sub Zwischenspeicher_speichern(Kategorie As String)
Select Case Kategorie
    Case "Mutation"
        If Zwischenspeicher.Option1 Then
            If laboption1_Kategorie.Caption = "Mutation" Then
                Print #1, labOption1.Caption & " (" & labOption1_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option2 Then
            If laboption2_Kategorie.Caption = "Mutation" Then
                Print #1, labOption2.Caption & " (" & labOption2_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option3 Then
            If laboption3_Kategorie.Caption = "Mutation" Then
                Print #1, labOption3.Caption & " (" & labOption3_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option4 Then
            If laboption4_Kategorie.Caption = "Mutation" Then
                Print #1, labOption4.Caption & " (" & labOption4_Kosten.Caption; ")"
            End If
        End If
    Case "Standarte"
        If Zwischenspeicher.Option1 Then
            If laboption1_Kategorie.Caption = "Standarte" Then
                Print #1, labOption1.Caption & " (" & labOption1_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option2 Then
            If laboption2_Kategorie.Caption = "Standarte" Then
                Print #1, labOption2.Caption & " (" & labOption2_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option3 Then
            If laboption3_Kategorie.Caption = "Standarte" Then
                Print #1, labOption3.Caption & " (" & labOption3_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option4 Then
            If laboption4_Kategorie.Caption = "Standarte" Then
                Print #1, labOption4.Caption & " (" & labOption4_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Standarte Then
            Print #1, labMagische_Standarte.Caption
        End If
    Case "Waffe"
        If Zwischenspeicher.Option1 Then
            If laboption1_Kategorie.Caption = "Waffe" Then
                Print #1, labOption1.Caption & " (" & labOption1_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option2 Then
            If laboption2_Kategorie.Caption = "Waffe" Then
                Print #1, labOption2.Caption & " (" & labOption2_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option3 Then
            If laboption3_Kategorie.Caption = "Waffe" Then
                Print #1, labOption3.Caption & " (" & labOption3_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option4 Then
            If laboption4_Kategorie.Caption = "Waffe" Then
                Print #1, labOption4.Caption & " (" & labOption4_Kosten.Caption; ")"
            End If
        End If
    Case "Rüstung"
        If Zwischenspeicher.Option1 Then
            If laboption1_Kategorie.Caption = "Rüstung" Then
                Print #1, labOption1.Caption & " (" & labOption1_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option2 Then
            If laboption2_Kategorie.Caption = "Rüstung" Then
                Print #1, labOption2.Caption & " (" & labOption2_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option3 Then
            If laboption3_Kategorie.Caption = "Rüstung" Then
                Print #1, labOption3.Caption & " (" & labOption3_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option4 Then
            If laboption4_Kategorie.Caption = "Rüstung" Then
                Print #1, labOption4.Caption & " (" & labOption4_Kosten.Caption; ")"
            End If
        End If
    Case "Schild"
        If Zwischenspeicher.Option1 Then
            If laboption1_Kategorie.Caption = "Schild" Then
                Print #1, labOption1.Caption & " (" & labOption1_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option2 Then
            If laboption2_Kategorie.Caption = "Schild" Then
                Print #1, labOption2.Caption & " (" & labOption2_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option3 Then
            If laboption3_Kategorie.Caption = "Schild" Then
                Print #1, labOption3.Caption & " (" & labOption3_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option4 Then
            If laboption4_Kategorie.Caption = "Schild" Then
                Print #1, labOption4.Caption & " (" & labOption4_Kosten.Caption; ")"
            End If
        End If
    Case "Sonstige"
        If Zwischenspeicher.Option1 Then
            If laboption1_Kategorie.Caption <> "Spruchrolle" And laboption1_Kategorie.Caption <> "Homunkuli" And laboption1_Kategorie.Caption <> "Mutation" And laboption1_Kategorie.Caption <> "Standarte" And laboption1_Kategorie.Caption <> "Waffe" And laboption1_Kategorie.Caption <> "Rüstung" And laboption1_Kategorie.Caption <> "Schild" Then
                Print #1, labOption1.Caption & " (" & labOption1_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option2 Then
            If laboption2_Kategorie.Caption <> "Spruchrolle" And laboption2_Kategorie.Caption <> "Homunkuli" And laboption2_Kategorie.Caption <> "Mutation" And laboption2_Kategorie.Caption <> "Standarte" And laboption2_Kategorie.Caption <> "Waffe" And laboption2_Kategorie.Caption <> "Rüstung" And laboption2_Kategorie.Caption <> "Schild" Then
                Print #1, labOption2.Caption & " (" & labOption2_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option3 Then
            If laboption3_Kategorie.Caption <> "Spruchrolle" And laboption3_Kategorie.Caption <> "Homunkuli" And laboption3_Kategorie.Caption <> "Mutation" And laboption3_Kategorie.Caption <> "Standarte" And laboption3_Kategorie.Caption <> "Waffe" And laboption3_Kategorie.Caption <> "Rüstung" And laboption3_Kategorie.Caption <> "Schild" Then
                Print #1, labOption3.Caption & " (" & labOption3_Kosten.Caption; ")"
            End If
        End If
        If Zwischenspeicher.Option4 Then
            If laboption4_Kategorie.Caption <> "Spruchrolle" And laboption4_Kategorie.Caption <> "Homunkuli" And laboption4_Kategorie.Caption <> "Mutation" And laboption4_Kategorie.Caption <> "Standarte" And laboption4_Kategorie.Caption <> "Waffe" And laboption4_Kategorie.Caption <> "Rüstung" And laboption4_Kategorie.Caption <> "Schild" Then
                Print #1, labOption4.Caption & " (" & labOption4_Kosten.Caption; ")"
            End If
        End If
End Select
End Sub



Public Sub Rüstungsrettungswurf_einstellen()
Select Case labRüstung.Caption
    Case "keine", ""
        If lab2truppenname_klein.Caption = "Chaospferd (4)" Or lab2truppenname_klein.Caption = "Dunkelelfenroß (3)" Or lab2truppenname_klein.Caption = "Elfenroß (3)" Or lab2truppenname_klein.Caption = "Flugdämon des Tzeentch (4)" Or lab2truppenname_klein.Caption = "Kampfechse (10)" Or lab2truppenname_klein.Caption = "Kriegsfalke (20)" Or lab2truppenname_klein.Caption = "Kriegspferd (3)" Or lab2truppenname_klein.Caption = "Riesenspinne (4)" Or lab2truppenname_klein.Caption = "Riesenwolf (4)" Or lab2truppenname_klein.Caption = "Skelettpferd (3)" Or lab2truppenname_klein.Caption = "Slaaneshpferd (5)" Or lab2truppenname_klein.Caption = "Wildschwein (8)" Then
            labRW.Caption = "6"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            labB2.Caption = dsReittiere.Fields("Bewegung")
        Else
            labRW.Caption = "-"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
                labB2.Caption = dsReittiere.Fields("Bewegung")
            End If
        End If
    Case "Schild (1)"
        If lab2truppenname_klein.Caption = "Chaospferd (4)" Or lab2truppenname_klein.Caption = "Dunkelelfenroß (3)" Or lab2truppenname_klein.Caption = "Elfenroß (3)" Or lab2truppenname_klein.Caption = "Flugdämon des Tzeentch (4)" Or lab2truppenname_klein.Caption = "Kampfechse (10)" Or lab2truppenname_klein.Caption = "Kriegsfalke (20)" Or lab2truppenname_klein.Caption = "Kriegspferd (3)" Or lab2truppenname_klein.Caption = "Riesenspinne (4)" Or lab2truppenname_klein.Caption = "Riesenwolf (4)" Or lab2truppenname_klein.Caption = "Skelettpferd (3)" Or lab2truppenname_klein.Caption = "Slaaneshpferd (5)" Or lab2truppenname_klein.Caption = "Wildschwein (8)" Then
            labRW.Caption = "5+"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            labB2.Caption = dsReittiere.Fields("Bewegung")
        Else
            labRW.Caption = "6"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
                labB2.Caption = dsReittiere.Fields("Bewegung")
            End If
        End If
    Case "leichte Rüstung (2)"
        If lab2truppenname_klein.Caption = "Chaospferd (4)" Or lab2truppenname_klein.Caption = "Dunkelelfenroß (3)" Or lab2truppenname_klein.Caption = "Elfenroß (3)" Or lab2truppenname_klein.Caption = "Flugdämon des Tzeentch (4)" Or lab2truppenname_klein.Caption = "Kampfechse (10)" Or lab2truppenname_klein.Caption = "Kriegsfalke (20)" Or lab2truppenname_klein.Caption = "Kriegspferd (3)" Or lab2truppenname_klein.Caption = "Riesenspinne (4)" Or lab2truppenname_klein.Caption = "Riesenwolf (4)" Or lab2truppenname_klein.Caption = "Skelettpferd (3)" Or lab2truppenname_klein.Caption = "Slaaneshpferd (5)" Or lab2truppenname_klein.Caption = "Wildschwein (8)" Then
            labRW.Caption = "5+"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            labB2.Caption = dsReittiere.Fields("Bewegung")
        Else
            labRW.Caption = "6"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
                labB2.Caption = dsReittiere.Fields("Bewegung")
            End If
        End If
    Case "leichte Rüstung und Schild (3)"
        If lab2truppenname_klein.Caption = "Chaospferd (4)" Or lab2truppenname_klein.Caption = "Dunkelelfenroß (3)" Or lab2truppenname_klein.Caption = "Elfenroß (3)" Or lab2truppenname_klein.Caption = "Flugdämon des Tzeentch (4)" Or lab2truppenname_klein.Caption = "Kampfechse (10)" Or lab2truppenname_klein.Caption = "Kriegsfalke (20)" Or lab2truppenname_klein.Caption = "Kriegspferd (3)" Or lab2truppenname_klein.Caption = "Riesenspinne (4)" Or lab2truppenname_klein.Caption = "Riesenwolf (4)" Or lab2truppenname_klein.Caption = "Skelettpferd (3)" Or lab2truppenname_klein.Caption = "Slaaneshpferd (5)" Or lab2truppenname_klein.Caption = "Wildschwein (8)" Then
            labRW.Caption = "4+"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            labB2.Caption = dsReittiere.Fields("Bewegung")
        Else
            labRW.Caption = "5+"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
                labB2.Caption = dsReittiere.Fields("Bewegung")
            End If
        End If
    Case "schwere Rüstung (3)"
        If lab2truppenname_klein.Caption = "Chaospferd (4)" Or lab2truppenname_klein.Caption = "Dunkelelfenroß (3)" Or lab2truppenname_klein.Caption = "Elfenroß (3)" Or lab2truppenname_klein.Caption = "Flugdämon des Tzeentch (4)" Or lab2truppenname_klein.Caption = "Kampfechse (10)" Or lab2truppenname_klein.Caption = "Kriegsfalke (20)" Or lab2truppenname_klein.Caption = "Kriegspferd (3)" Or lab2truppenname_klein.Caption = "Riesenspinne (4)" Or lab2truppenname_klein.Caption = "Riesenwolf (4)" Or lab2truppenname_klein.Caption = "Skelettpferd (3)" Or lab2truppenname_klein.Caption = "Slaaneshpferd (5)" Or lab2truppenname_klein.Caption = "Wildschwein (8)" Then
            labRW.Caption = "4+"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            labB2.Caption = dsReittiere.Fields("Bewegung")
        Else
            labRW.Caption = "5+"
            labB.Caption = dsCharakter.Fields("KG_Bewegung")
            If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
                labB2.Caption = dsReittiere.Fields("Bewegung")
            End If
        End If
    Case "schwere Rüstung und Schild (4)"
        If lab2truppenname_klein.Caption = "Chaospferd (4)" Or lab2truppenname_klein.Caption = "Dunkelelfenroß (3)" Or lab2truppenname_klein.Caption = "Elfenroß (3)" Or lab2truppenname_klein.Caption = "Flugdämon des Tzeentch (4)" Or lab2truppenname_klein.Caption = "Kampfechse (10)" Or lab2truppenname_klein.Caption = "Kriegsfalke (20)" Or lab2truppenname_klein.Caption = "Kriegspferd (3)" Or lab2truppenname_klein.Caption = "Riesenspinne (4)" Or lab2truppenname_klein.Caption = "Riesenwolf (4)" Or lab2truppenname_klein.Caption = "Skelettpferd (3)" Or lab2truppenname_klein.Caption = "Slaaneshpferd (5)" Or lab2truppenname_klein.Caption = "Wildschwein (8)" Then
            labRW.Caption = "3+"
            Wandler = dsCharakter.Fields("KG_Bewegung") - 1
            labB.Caption = Wandler
            Wandler = dsReittiere.Fields("Bewegung") - 1
            labB2.Caption = Wandler
        Else
            labRW.Caption = "4+"
            If frmHauptmenü.Caption <> "Zwerge" Then
                Wandler = dsCharakter.Fields("KG_Bewegung") - 1
                labB.Caption = Wandler
                If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
                    Wandler = dsReittiere.Fields("Bewegung") - 1
                    labB2.Caption = Wandler
                End If
            End If
        End If
    'Berittene Charaktere
    Case "Harnisch (4)"
        labRW.Caption = "5+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
        If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
            Wandler = dsReittiere.Fields("Bewegung") - 1
            labB2.Caption = Wandler
        End If
    Case "Schild, Harnisch (5)"
        labRW.Caption = "4+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
        If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
            Wandler = dsReittiere.Fields("Bewegung") - 1
            labB2.Caption = Wandler
        End If
    Case "leichte Rüstung, Harnisch (6)"
        labRW.Caption = "4+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
        If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
            Wandler = dsReittiere.Fields("Bewegung") - 1
            labB2.Caption = Wandler
        End If
    Case "leichte Rüstung und Schild, Harnisch (7)"
        labRW.Caption = "3+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
        If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
            Wandler = dsReittiere.Fields("Bewegung") - 1
            labB2.Caption = Wandler
        End If
    Case "schwere Rüstung, Harnisch (7)"
        labRW.Caption = "3+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
        If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
            Wandler = dsReittiere.Fields("Bewegung") - 1
            labB2.Caption = Wandler
        End If
    Case "schwere Rüstung und Schild, Harnisch (8)"
        labRW.Caption = "2+"
        Wandler = dsCharakter.Fields("KG_Bewegung") - 1
        labB.Caption = Wandler
        If lab2truppenname_klein.Caption <> "" And lab2truppenname_klein.BorderStyle = 1 Then
            Wandler = dsReittiere.Fields("Bewegung") - 2
            labB2.Caption = Wandler
        End If
    'Champions der Schwarzen Korsaren
    Case "Drachenumhang (5)"
        labRW.Caption = "5+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
    Case "Drachenumhang und Schild (6)"
        labRW.Caption = "4+"
        labB.Caption = dsCharakter.Fields("KG_Bewegung")
End Select
End Sub

Public Sub Waffe_einstellen()
Select Case labWaffe.Caption
    Case "Handwaffe"
        labA.Caption = dsCharakter.Fields("KG_Attacken")
        labI.Caption = dsCharakter.Fields("KG_Initative")
        labS.Caption = dsCharakter.Fields("KG_Stärke")
    Case "zweite Handwaffe (1)"
        labA.Caption = labA.Caption & "+1"
        labI.Caption = dsCharakter.Fields("KG_Initative")
        labS.Caption = dsCharakter.Fields("KG_Stärke")
    Case "zweihändige Waffe (2)"
        labA.Caption = dsCharakter.Fields("KG_Attacken")
        labI.Caption = "*" & dsCharakter.Fields("KG_Initative") & "*"
        Wandler = dsCharakter.Fields("KG_Stärke") + 2
        labS.Caption = Wandler
    Case "Hellebarde (2)"
        labA.Caption = dsCharakter.Fields("KG_Attacken")
        labI.Caption = dsCharakter.Fields("KG_Initative")
        Wandler = dsCharakter.Fields("KG_Stärke") + 1
        labS.Caption = Wandler
    Case "Speer (1)"
        labA.Caption = dsCharakter.Fields("KG_Attacken")
        labI.Caption = dsCharakter.Fields("KG_Initative")
        labS.Caption = dsCharakter.Fields("KG_Stärke")
    Case "Flegel (1)"
        labA.Caption = dsCharakter.Fields("KG_Attacken")
        labI.Caption = dsCharakter.Fields("KG_Initative")
        Wandler = dsCharakter.Fields("KG_Stärke") + 2 & "/" & dsCharakter.Fields("KG_Stärke")
        labS.Caption = Wandler
    Case "Lanze (2)"
        labA.Caption = dsCharakter.Fields("KG_Attacken")
        labI.Caption = dsCharakter.Fields("KG_Initative")
        labS.Caption = dsCharakter.Fields("KG_Stärke")
        Wandler = dsCharakter.Fields("KG_Stärke") + 2 & "/" & dsCharakter.Fields("KG_Stärke")
        labS.Caption = Wandler
End Select
End Sub

Public Sub Zwergen_Kriegsgerät_Kosten_Berechnung()
'Grundkosten auslesen
Wandler = dsKriegsgerät.Fields("Punktwert")
If ckbOption1 Then
    Wandler = Wandler + labOption1_Kosten
End If
If labOption2_Kosten <> "" Then
    Wandler = Wandler + labOption2_Kosten
End If
labEinzelkosten = Wandler
End Sub

Public Sub Rune_herraussuchen(Runenname As String, Runenkategorie As String, Slot As Integer)
Runenname = Left(Runenname, InStr(Runenname, "(") - 2)
Select Case Runenkategorie
    Case "Maschinenrunen"
        Maschinenrunen_herraussuchen Runenname, Slot
    Case "Schutzrunen"
        Schutzrunen_herraussuchen Runenname, Slot
End Select
End Sub



Public Sub Maschinenrunen_herraussuchen(Runenname As String, Slot As Integer)
Dim SQL_Abfrage As String

SQL_Abfrage = "[Runenname] = '" & Runenname & "'"
dsMaschinenrunen.MoveFirst
dsMaschinenrunen.FindFirst SQL_Abfrage
Select Case Slot
    Case 1
        frmZwergenrunen.labRune1 = Runenname
        frmZwergenrunen.labRune1_Kosten = dsMaschinenrunen.Fields("Punktwert")
        frmZwergenrunen.labRune1_Kurzinfo = dsMaschinenrunen.Fields("Kurzinfo")
        frmZwergenrunen.labRune1_Kategorie = "Maschinenrune"
    Case 2
        frmZwergenrunen.labRune2 = Runenname
        frmZwergenrunen.labRune2_Kosten = dsMaschinenrunen.Fields("Punktwert")
        frmZwergenrunen.labRune2_Kurzinfo = dsMaschinenrunen.Fields("Kurzinfo")
        frmZwergenrunen.labRune2_Kategorie = "Maschinenrune"
    Case 3
        frmZwergenrunen.labRune3 = Runenname
        frmZwergenrunen.labRune3_Kosten = dsMaschinenrunen.Fields("Punktwert")
        frmZwergenrunen.labRune3_Kurzinfo = dsMaschinenrunen.Fields("Kurzinfo")
        frmZwergenrunen.labRune3_Kategorie = "Maschinenrune"
End Select

End Sub

Public Sub Schutzrunen_herraussuchen(Runenname As String, Slot As Integer)
Dim SQL_Abfrage As String

SQL_Abfrage = "[Runenname] = '" & Runenname & "'"
dsSchutzrunen.MoveFirst
dsSchutzrunen.FindFirst SQL_Abfrage
Select Case Slot
    Case 1
        frmZwergenrunen.labRune1 = Runenname
        frmZwergenrunen.labRune1_Kosten = dsSchutzrunen.Fields("Punktwert")
        frmZwergenrunen.labRune1_Kurzinfo = dsSchutzrunen.Fields("Kurzinfo")
        frmZwergenrunen.labRune1_Kategorie = "Schutzrune"
    Case 2
        frmZwergenrunen.labRune2 = Runenname
        frmZwergenrunen.labRune2_Kosten = dsSchutzrunen.Fields("Punktwert")
        frmZwergenrunen.labRune2_Kurzinfo = dsSchutzrunen.Fields("Kurzinfo")
        frmZwergenrunen.labRune2_Kategorie = "Schutzrune"
    Case 3
        frmZwergenrunen.labRune3 = Runenname
        frmZwergenrunen.labRune3_Kosten = dsSchutzrunen.Fields("Punktwert")
        frmZwergenrunen.labRune3_Kurzinfo = dsSchutzrunen.Fields("Kurzinfo")
        frmZwergenrunen.labRune3_Kategorie = "Schutzrune"
End Select

End Sub
