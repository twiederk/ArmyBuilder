VERSION 4.00
Begin VB.Form frmDB 
   Caption         =   "Datenbanken:"
   ClientHeight    =   2340
   ClientLeft      =   1125
   ClientTop       =   1440
   ClientWidth     =   2490
   Height          =   2745
   Left            =   1065
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   2340
   ScaleWidth      =   2490
   Top             =   1095
   Width           =   2610
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   480
      TabIndex        =   1
      Top             =   1800
      Width           =   1455
   End
   Begin VB.ListBox lstDatenbanken 
      Height          =   1230
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   2175
   End
   Begin VB.Label labtxtGefundeneDatenbanken 
      Caption         =   "Gefundene Datenbanken"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   240
      Width           =   2055
   End
End
Attribute VB_Name = "frmDB"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub comOK_Click()
If lstDatenbanken.ListIndex = -1 Then
    If Dir(App.Path & "\warhamer.mdb") <> "" Then
        Set Datenbank = OpenDatabase(App.Path & "\warhamer.mdb" & frmDB.lstDatenbanken.Text, , True)
        frmDB.Hide
        Unload frmDB
    Else
        MsgBox "Es muﬂ eine Datenbank ausgew‰hlt werden !", vbCritical
    End If
Else
    Set Datenbank = OpenDatabase(App.Path & "\" & frmDB.lstDatenbanken.Text, , True)
    frmDB.Hide
    Unload frmDB
End If
End Sub


