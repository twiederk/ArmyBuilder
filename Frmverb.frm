VERSION 5.00
Begin VB.Form frmVerb�ndete 
   BorderStyle     =   0  'None
   Caption         =   "Punkte f�r Verb�ndete"
   ClientHeight    =   1875
   ClientLeft      =   1035
   ClientTop       =   1395
   ClientWidth     =   2595
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1875
   ScaleWidth      =   2595
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton comAbbrechen 
      Cancel          =   -1  'True
      Caption         =   "Abbrechen"
      Height          =   336
      Left            =   1248
      TabIndex        =   3
      Top             =   1440
      Width           =   1260
   End
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   336
      Left            =   96
      TabIndex        =   2
      Top             =   1440
      Width           =   1068
   End
   Begin VB.Image ImgGrosserPfeilunten 
      Height          =   405
      Left            =   1770
      Picture         =   "FRMVERB.frx":0000
      Top             =   960
      Width           =   390
   End
   Begin VB.Image ImgGrosserPfeiloben 
      Height          =   420
      Left            =   1770
      Picture         =   "FRMVERB.frx":08B2
      Top             =   570
      Width           =   390
   End
   Begin VB.Label labtxtVerb�ndetepunkte 
      Caption         =   "Verb�ndetepunkte:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   336
      Left            =   192
      TabIndex        =   1
      Top             =   96
      Width           =   2220
   End
   Begin VB.Label labVerb�ndetepunkte 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   336
      Left            =   384
      TabIndex        =   0
      Top             =   768
      Width           =   648
   End
   Begin VB.Image imgEinzelPfeiloben 
      Height          =   420
      Left            =   1110
      Picture         =   "FRMVERB.frx":11B4
      Top             =   570
      Width           =   390
   End
   Begin VB.Image imgEinzelpfeilunten 
      Height          =   405
      Left            =   1110
      Picture         =   "FRMVERB.frx":1AB6
      Top             =   960
      Width           =   390
   End
   Begin VB.Image ImgDoppelpeiloben 
      Height          =   420
      Left            =   1440
      Picture         =   "FRMVERB.frx":2368
      Top             =   570
      Width           =   390
   End
   Begin VB.Image imgDoppelpfeilunten 
      Height          =   405
      Left            =   1440
      Picture         =   "FRMVERB.frx":2ABA
      Top             =   960
      Width           =   390
   End
End
Attribute VB_Name = "frmVerb�ndete"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Punkte�nderung As Variant

Private Sub comAbbrechen_Click()
frmVerb�ndete.Hide
frmHauptmen�.Enabled = True
End Sub

Private Sub comOK_Click()
frmVerb�ndete.Hide
frmHauptmen�.labVerb�ndetepunkte = frmVerb�ndete.labVerb�ndetepunkte
frmHauptmen�.Enabled = True
Wandler = frmHauptmen�.labRestpunkte - Punkte�nderung
frmHauptmen�.labRestpunkte.Caption = Wandler
Restpunkte = Wandler
Punkte�nderung = 0
End Sub


Private Sub ImgDoppelpeiloben_Click()
Wandler = labVerb�ndetepunkte.Caption + 10
labVerb�ndetepunkte.Caption = Wandler
Punkte�nderung = Punkte�nderung + 10
End Sub

Private Sub imgDoppelpfeilunten_Click()
Wandler = labVerb�ndetepunkte.Caption - 10
labVerb�ndetepunkte.Caption = Wandler
Punkte�nderung = Punkte�nderung - 10
End Sub

Private Sub imgEinzelPfeiloben_Click()
Wandler = labVerb�ndetepunkte.Caption + 1
labVerb�ndetepunkte.Caption = Wandler
Punkte�nderung = Punkte�nderung + 1
End Sub


Private Sub imgEinzelpfeilunten_Click()
Wandler = labVerb�ndetepunkte.Caption - 1
labVerb�ndetepunkte.Caption = Wandler
Punkte�nderung = Punkte�nderung - 1
End Sub

Private Sub ImgGrosserPfeiloben_Click()
Wandler = labVerb�ndetepunkte.Caption + 100
labVerb�ndetepunkte.Caption = Wandler
Punkte�nderung = Punkte�nderung + 100
End Sub


Private Sub ImgGrosserPfeilunten_Click()
Wandler = labVerb�ndetepunkte.Caption - 100
labVerb�ndetepunkte.Caption = Wandler
Punkte�nderung = Punkte�nderung - 100
End Sub


