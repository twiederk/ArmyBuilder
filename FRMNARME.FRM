VERSION 5.00
Begin VB.Form frmNeueArmee 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Neue Armee"
   ClientHeight    =   1965
   ClientLeft      =   2805
   ClientTop       =   3315
   ClientWidth     =   4080
   LinkTopic       =   "0 none"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2471.698
   ScaleMode       =   0  'User
   ScaleWidth      =   1929.079
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.CommandButton comOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   210
      TabIndex        =   5
      Top             =   1575
      Width           =   1590
   End
   Begin VB.CommandButton comAbbrechen 
      Cancel          =   -1  'True
      Caption         =   "Abbrechen"
      Height          =   330
      Left            =   2205
      TabIndex        =   4
      Top             =   1575
      Width           =   1590
   End
   Begin VB.ComboBox cobArmeeAuswahl 
      Height          =   300
      Left            =   1050
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   105
      Width           =   2745
   End
   Begin VB.Image imgDoppelpfeilunten 
      Height          =   405
      Left            =   3360
      Picture         =   "FRMNARME.frx":0000
      Top             =   945
      Width           =   390
   End
   Begin VB.Image ImgDoppelpfeiloben 
      Height          =   420
      Left            =   3360
      Picture         =   "FRMNARME.frx":0736
      Top             =   525
      Width           =   390
   End
   Begin VB.Image imgPfeilunten 
      Height          =   345
      Left            =   2940
      Picture         =   "FRMNARME.frx":0E88
      Top             =   945
      Width           =   390
   End
   Begin VB.Image imgPfeiloben 
      Height          =   330
      Left            =   2940
      Picture         =   "FRMNARME.frx":154E
      Top             =   630
      Width           =   390
   End
   Begin VB.Label labPunkte 
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
      Height          =   330
      Left            =   2100
      TabIndex        =   3
      Top             =   735
      Width           =   645
   End
   Begin VB.Label labtxtMaximalpunkte 
      Caption         =   "Maximalpunkte:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   105
      TabIndex        =   2
      Top             =   735
      Width           =   1905
   End
   Begin VB.Label labtxtArmee 
      Caption         =   "Armee:"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   105
      TabIndex        =   1
      Top             =   105
      Width           =   960
   End
End
Attribute VB_Name = "frmNeueArmee"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False




Private Sub comAbbrechen_Click()
frmNeueArmee.Visible = False
frmStart.mnuDNeu.Enabled = True
frmStart.mnuDLaden.Enabled = True
End Sub

Sub comOK_Click()
'FUNKTIONS DEKLARATION
Dim Name As String
Dim Farbe As Double

'PROZEDURSTART
Do
    Farbe = Int(16 * Rnd)
Loop Until Farbe <> 7
Farbe = QBColor(Farbe)

If cobArmeeAuswahl.Text = "" Then
    MsgBox "Es muß noch eine Armee ausgewählt werden", 0, "Keine Armee"
Else
    'Mauszeiger in Sanduhr umwandeln
    Screen.MousePointer = 11
    'Armee Auswahlfenster schließen
    frmNeueArmee.Visible = False
    'Schwertmeister anzeigen
    With frmLaden
        If cobArmeeAuswahl.Text = "Dunkelelfen" Then
            .ImgLaden.Picture = LoadPicture(App.Path & "\tullaris.bmp")
        Else
            .ImgLaden.Picture = LoadPicture(App.Path & "\swordmas.bmp")
        End If
            .ImgLaden.Top = Int((.Height - .ImgLaden.Height) / 2)
            .ImgLaden.Left = Int((.Width - .ImgLaden.Width) / 2)
    End With
        
    'Maximalpunkte übernehmen
    Wandler = frmNeueArmee.labPunkte.Caption
    Maximalpunkte = Wandler
    'Restpunkte übernehmen
    '(in diesem Fall sind noch keine Punkte ausgegeben worden,
    ' deshalb Restpunkte=Maximalpunkte)
    Restpunkte = Maximalpunkte
        
    'CHARAKTER
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Charaktermodelle einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(4500, 190), Farbe, BF
    Name = "SELECT * From [Charakter] WHERE [Charakter].Armee='" & cobArmeeAuswahl.Text & "' ORDER BY [Charakter].Truppenname"
    Set dsCharakter = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    dsCharakter.MoveFirst
    Do Until dsCharakter.EOF
        Name = dsCharakter.Fields("Truppenname")
        frmHauptmenü.lstCharakterunten.AddItem Name
        dsCharakter.MoveNext
    Loop
    'Punkte eintragen
    frmHauptmenü.labCharakterpunkte.Caption = Charakterpunkte
        
    'REGIMENTER
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Regimenter einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(5000, 190), Farbe, BF
    'SQL-Abfrage erstellen
    Name = "SELECT * From [Regimenter] WHERE [Regimenter].Armee='" & cobArmeeAuswahl.Text & "' ORDER BY [Regimenter].Truppenname"
    Set dsRegimenter = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    dsRegimenter.MoveFirst
    Do Until dsRegimenter.EOF
        Name = dsRegimenter.Fields("Truppenname")
        frmHauptmenü.lstRegimenterunten.AddItem Name
        dsRegimenter.MoveNext
    Loop
    'Punkte eintragen
    frmHauptmenü.labRegimenterpunkte.Caption = Regimenterpunkte
        
    'KRIEGSGERÄT
    If cobArmeeAuswahl.Text <> "Waldelfen" And cobArmeeAuswahl.Text <> "Echsenmenschen" And cobArmeeAuswahl.Text <> "Bretonen" And cobArmeeAuswahl.Text <> "Tiermenschen" And cobArmeeAuswahl.Text <> "Chaoskrieger" And cobArmeeAuswahl.Text <> "Dämonen" Then
        frmStart.picStatuszeile.Cls
        If cobArmeeAuswahl.Text = "Chaos" Then
            frmStart.picStatuszeile.Print " Dämonen einlesen"
            frmHauptmenü.labtxtKriegsgerät.Caption = "Dämonen:"
            frmHauptmenü.lstKriegsgerätoben.DragIcon = LoadPicture(App.Path & "\daemon.ico")
            frmHauptmenü.lstKriegsgerätunten.DragIcon = LoadPicture(App.Path & "\daemon.ico")
        Else
            frmStart.picStatuszeile.Print " Kriegsgerät einlesen"
            frmHauptmenü.labtxtKriegsgerät.Caption = "Kriegsgerät:"
            frmHauptmenü.lstKriegsgerätoben.DragIcon = LoadPicture(App.Path & "\kriegsge.ico")
            frmHauptmenü.lstKriegsgerätunten.DragIcon = LoadPicture(App.Path & "\kriegsge.ico")
        End If
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(5500, 190), Farbe, BF
        'SQL-Abfrage erstellen
        Name = "SELECT * From [Kriegsgerät] WHERE [Kriegsgerät].Armee='" & cobArmeeAuswahl.Text & "' ORDER BY [Kriegsgerät].Truppenname"
        Set dsKriegsgerät = Datenbank.CreateDynaset(Name)
        'Listenfeld füllen
        dsKriegsgerät.MoveFirst
        Do Until dsKriegsgerät.EOF
            Name = dsKriegsgerät.Fields("Truppenname")
            frmHauptmenü.lstKriegsgerätunten.AddItem Name
            dsKriegsgerät.MoveNext
        Loop
    End If
    'Punkte eintragen
    frmHauptmenü.labKriegsgerätpunkte.Caption = Kriegsgerätpunkte
    
    'MONSTER
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Monster einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(6000, 190), Farbe, BF
    'Dynaset erstellen
    'SQL-Abfrage erstellen
    Name = "SELECT * From [Monster und Reittiere] WHERE [Monster und Reittiere].Monster =-1 AND ([Monster und Reittiere].Armee='" & cobArmeeAuswahl.Text & "' OR [Monster und Reittiere].Armee='Alle') ORDER BY [Monster und Reittiere].Truppenname"
    Set dsMonster = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    dsMonster.MoveFirst
    Do Until dsMonster.EOF
        Name = dsMonster.Fields("Truppenname")
        frmHauptmenü.lstMonsterunten.AddItem Name
        dsMonster.MoveNext
    Loop
    'Punkte eintragen
    frmHauptmenü.labMonsterpunkte.Caption = Monsterpunkte
        
        
    'VERBÜNDETE
    'Punkte eintragen
    frmHauptmenü.labVerbündetepunkte.Caption = Verbündetepunkte
    
        
    'MAGISCHE GEGENSTÄNDE
    'Liste der Magischen Spruchrollen füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Spruchrollen einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(6500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Spruchrollen] WHERE [Magische Spruchrollen].Armeeliste='" & cobArmeeAuswahl.Text & "' OR [Magische Spruchrollen].Armeeliste='Alle' ORDER BY [Magische Spruchrollen].Spruchrollenname"
    Set dsSpruchrollen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstMagische_Spruchrollen.AddItem "(keine)"
    Do Until dsSpruchrollen.EOF
        Name = dsSpruchrollen.Fields("Spruchrollenname")
        Wandler = dsSpruchrollen.Fields("Punktwert")
        frmMagische_Gegenstände.lstMagische_Spruchrollen.AddItem Name & " (" & Wandler & ")"
        dsSpruchrollen.MoveNext
    Loop
        
    'Liste der Homunkulis füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Homunkulis einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(7000, 190), Farbe, BF
    Name = "SELECT * FROM [Homunkuli] WHERE [Homunkuli].Armeeliste='" & cobArmeeAuswahl.Text & "' OR [Homunkuli].Armeeliste='Alle' ORDER BY [Homunkuli].Homunkuliname"
    Set dsHomunkuli = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstHomunkuli.AddItem "(keinen)"
    Do Until dsHomunkuli.EOF
        Name = dsHomunkuli.Fields("Homunkuliname")
        Wandler = dsHomunkuli.Fields("Punktwert")
        frmMagische_Gegenstände.lstHomunkuli.AddItem Name & " (" & Wandler & ")"
        dsHomunkuli.MoveNext
    Loop
        
    'Liste der Mutationen füllen
    If cobArmeeAuswahl.Text = "Chaos" Or cobArmeeAuswahl.Text = "Chaoskrieger" Or cobArmeeAuswahl.Text = "Tiermenschen" Or cobArmeeAuswahl.Text = "Dämonen" Then
        frmStart.picStatuszeile.Cls
        frmStart.picStatuszeile.Print " Chaos Mutationen einlesen"
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(7250, 190), Farbe, BF
        Name = "SELECT * FROM [Chaos Mutationen] ORDER BY [Chaos Mutationen].Mutationsname"
        Set dsMutationen = Datenbank.CreateDynaset(Name)
        frmMagische_Gegenstände.lstChaos_Mutationen.AddItem "(keine)"
        Do Until dsMutationen.EOF
            Name = dsMutationen.Fields("Mutationsname")
            Wandler = dsMutationen.Fields("Punktwert")
            frmMagische_Gegenstände.lstChaos_Mutationen.AddItem Name & " (" & Wandler & ")"
            dsMutationen.MoveNext
        Loop
    End If
        
    'Liste der Magischen Standarten füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Standarten einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(7500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Standarten] WHERE [Magische Standarten].Armeeliste='" & cobArmeeAuswahl.Text & "' OR [Magische Standarten].Armeeliste='Alle' ORDER BY [Magische Standarten].Standartenname"
    Set dsStandarten = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstMagische_Standarten.AddItem "(keine)"
    Do Until dsStandarten.EOF
        Name = dsStandarten.Fields("Standartenname")
        Wandler = dsStandarten.Fields("Punktwert")
        frmMagische_Gegenstände.lstMagische_Standarten.AddItem Name & " (" & Wandler & ")"
        dsStandarten.MoveNext
    Loop
                
    'Liste der Magischen Waffen füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Waffen einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(8000, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Waffen] WHERE [Magische Waffen].Armeeliste='" & cobArmeeAuswahl.Text & "' OR [Magische Waffen].Armeeliste='Alle' ORDER BY [Magische Waffen].Waffenname"
    Set dsMagische_Waffen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstMagische_Waffen.AddItem "(keine)"
    Do Until dsMagische_Waffen.EOF
        Name = dsMagische_Waffen.Fields("Waffenname")
        Wandler = dsMagische_Waffen.Fields("Punktwert")
        frmMagische_Gegenstände.lstMagische_Waffen.AddItem Name & " (" & Wandler & ")"
        dsMagische_Waffen.MoveNext
    Loop
            
    'Liste der Magischen Rüstungen füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Rüstungen einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(8500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Rüstungen] WHERE [Magische Rüstungen].Armeeliste='" & cobArmeeAuswahl.Text & "' OR [Magische Rüstungen].Armeeliste='Alle' ORDER BY [Magische Rüstungen].Rüstungsname"
    Set dsMagische_Rüstungen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem "(keine)"
    Do Until dsMagische_Rüstungen.EOF
        Name = dsMagische_Rüstungen.Fields("Rüstungsname")
        Wandler = dsMagische_Rüstungen.Fields("Punktwert")
        frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem Name & " (" & Wandler & ")"
        dsMagische_Rüstungen.MoveNext
    Loop
        
    'Liste der Magischen Schilder füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Schilder einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(9000, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Schilder] WHERE [Magische Schilder].Armeeliste='" & cobArmeeAuswahl.Text & "' OR [Magische Schilder].Armeeliste='Alle' ORDER BY [Magische Schilder].Schildname"
    Set dsMagische_Schilder = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstMagische_Schilder.AddItem "(keine)"
    Do Until dsMagische_Schilder.EOF
        Name = dsMagische_Schilder.Fields("Schildname")
        Wandler = dsMagische_Schilder.Fields("Punktwert")
        frmMagische_Gegenstände.lstMagische_Schilder.AddItem Name & " (" & Wandler & ")"
        dsMagische_Schilder.MoveNext
    Loop
        
    'Liste der Verschiedenen magischen Gegenstände füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Verschiedene magische Gegenstände einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(9500, 190), Farbe, BF
    Name = "SELECT * FROM [Verschiedene Magische Gegenstände] WHERE [Verschiedene Magische Gegenstände].Armeeliste='" & cobArmeeAuswahl.Text & "' Or [Verschiedene Magische Gegenstände].Armeeliste='Alle' ORDER BY [Verschiedene Magische Gegenstände].Gegenstandsname"
    Set dsVerschiedene_mag_Gegenstände = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem "(keine)"
    Do Until dsVerschiedene_mag_Gegenstände.EOF
        Name = dsVerschiedene_mag_Gegenstände.Fields("Gegenstandsname")
        Wandler = dsVerschiedene_mag_Gegenstände.Fields("Punktwert")
        frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem Name & " (" & Wandler & ")"
        dsVerschiedene_mag_Gegenstände.MoveNext
    Loop
    
    
    'ZWERGENRUNEN
    If cobArmeeAuswahl.Text = "Zwerge" Then
        'Anzeigen das Zwergenrunen eingelesen werden
        frmStart.picStatuszeile.Cls
        frmStart.picStatuszeile.Print " Zwergenrunen einlesen"
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(9750, 190), Farbe, BF
        
        'Liste der Waffenrunen füllen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Waffenrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsWaffenrunen = Datenbank.CreateDynaset(Name)
        Do Until dsWaffenrunen.EOF
            Name = dsWaffenrunen.Fields("Runenname")
            Wandler = dsWaffenrunen.Fields("Punktwert")
            frmZwergenrunen.lstWaffenrunen.AddItem Name & " (" & Wandler & ")"
            dsWaffenrunen.MoveNext
        Loop
    
        'Liste der Rüstungsrunen füllen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Rüstungsrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsRüstungsrunen = Datenbank.CreateDynaset(Name)
        Do Until dsRüstungsrunen.EOF
            Name = dsRüstungsrunen.Fields("Runenname")
            Wandler = dsRüstungsrunen.Fields("Punktwert")
            frmZwergenrunen.lstRüstungsrunen.AddItem Name & " (" & Wandler & ")"
            dsRüstungsrunen.MoveNext
        Loop
    
        'Liste der Schutzrunen füllen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Schutzrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsSchutzrunen = Datenbank.CreateDynaset(Name)
        Do Until dsSchutzrunen.EOF
            Name = dsSchutzrunen.Fields("Runenname")
            Wandler = dsSchutzrunen.Fields("Punktwert")
            frmZwergenrunen.lstSchutzrunen.AddItem Name & " (" & Wandler & ")"
            dsSchutzrunen.MoveNext
        Loop
    
        'Liste der Maschinenrunen füllen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Maschinenrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsMaschinenrunen = Datenbank.CreateDynaset(Name)
        Do Until dsMaschinenrunen.EOF
            Name = dsMaschinenrunen.Fields("Runenname")
            Wandler = dsMaschinenrunen.Fields("Punktwert")
            frmZwergenrunen.lstMaschinenrunen.AddItem Name & " (" & Wandler & ")"
            dsMaschinenrunen.MoveNext
        Loop
    
        'Liste der Waffenrunen füllen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Talismanrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsTalismanrunen = Datenbank.CreateDynaset(Name)
        Do Until dsTalismanrunen.EOF
            Name = dsTalismanrunen.Fields("Runenname")
            Wandler = dsTalismanrunen.Fields("Punktwert")
            frmZwergenrunen.lstTalismanrunen.AddItem Name & " (" & Wandler & ")"
            dsTalismanrunen.MoveNext
        Loop
    End If
            
            
    'Liste der Reittiere füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Reittiere einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(10000, 190), Farbe, BF
    Name = "SELECT * From [Monster und Reittiere] WHERE [Monster und Reittiere].Reittier =-1 and ([Monster und Reittiere].Armee='" & cobArmeeAuswahl.Text & "' OR [Monster und Reittiere].Armee='Alle') ORDER BY [Monster und Reittiere].Truppenname"
    Set dsReittiere = Datenbank.CreateDynaset(Name)
    frmReittiere.cobReittiere.AddItem "(keines)"
    Do Until dsReittiere.EOF
        Name = dsReittiere.Fields("Truppenname")
        frmReittiere.cobReittiere.AddItem Name
        dsReittiere.MoveNext
    Loop

        
    'Statuszeile voll
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), Farbe, BF

        
    'Restpunkte eintragen
    frmHauptmenü.labRestpunkte.Caption = Restpunkte
    'Schwertmeister ausblenden
    frmLaden.Hide
    'Statuszeile leeren
    frmStart.picStatuszeile.Cls
    'Hauptmenü-Fenster ausrichten, Titel benennen und anzeigen
    With frmHauptmenü
        .Top = -345
        .Left = -60
        .Height = frmStart.ScaleHeight + 345
        .Width = frmStart.ScaleWidth + 60
        .Caption = cobArmeeAuswahl.Text
        .Visible = True
    End With
    'Magische Gegenstände Fenster ausrichten
    With frmMagische_Gegenstände
        .Top = -345
        .Left = 0
        .Width = frmHauptmenü.ScaleWidth
        .Height = frmHauptmenü.linTrennstrich.Y1 + 300
    End With
    'Bei Zwergenarmee Zwergenrunen Fenster ausrichten
    If cobArmeeAuswahl.Text = "Zwerge" Then
        With frmZwergenrunen
            .Top = -345
            .Left = 0
            .Width = frmHauptmenü.ScaleWidth
            .Height = frmHauptmenü.linTrennstrich.Y1 + 300
        End With
    End If
    'Mousepointer in Zeiger zurück verwandeln
    Screen.MousePointer = 0
End If
End Sub

Private Sub Form_Load()
frmNeueArmee.Height = 2475
frmNeueArmee.Width = 4170
cobArmeeAuswahl.AddItem "Bretonen"
cobArmeeAuswahl.AddItem "Chaos"
cobArmeeAuswahl.AddItem "Chaoskrieger"
cobArmeeAuswahl.AddItem "Dunkelelfen"
cobArmeeAuswahl.AddItem "Dämonen"
cobArmeeAuswahl.AddItem "Echsenmenschen"
cobArmeeAuswahl.AddItem "Hochelfen"
cobArmeeAuswahl.AddItem "Imperium"
cobArmeeAuswahl.AddItem "Orks & Goblins"
cobArmeeAuswahl.AddItem "Skaven"
cobArmeeAuswahl.AddItem "Tiermenschen"
cobArmeeAuswahl.AddItem "Untote"
cobArmeeAuswahl.AddItem "Waldelfen"
cobArmeeAuswahl.AddItem "Zwerge"
Maximalpunkte = 3000
labPunkte.Caption = Maximalpunkte
End Sub


Private Sub ImgDoppelpfeiloben_Click()
Maximalpunkte = Maximalpunkte + 1000
labPunkte.Caption = Maximalpunkte
End Sub

Private Sub imgDoppelpfeilunten_Click()
Maximalpunkte = Maximalpunkte - 1000
If Maximalpunkte < 1000 Then
    Maximalpunkte = 1000
End If
labPunkte.Caption = Maximalpunkte
End Sub


Private Sub imghochelfen_Click()
MsgBox "Die Armeeliste der Hochelfen ist noch nicht vorhanden", 0, "Hochelfen"
imghochelfen.Visible = False
cobArmeeAuswahl.Visible = True
comOK.Visible = True
comAbbrechen.Visible = True
frmNeueArmee.Height = 2475
frmNeueArmee.Width = 4170
End Sub

Private Sub imgPfeiloben_Click()
Maximalpunkte = Maximalpunkte + 100
labPunkte.Caption = Maximalpunkte
End Sub


Private Sub imgPfeilunten_Click()
Maximalpunkte = Maximalpunkte - 100
If Maximalpunkte < 1000 Then
    Maximalpunkte = 1000
End If
labPunkte = Maximalpunkte
End Sub


