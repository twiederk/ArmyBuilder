VERSION 4.00
Begin VB.Form frmNeueArmee 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Neue Armee"
   ClientHeight    =   1965
   ClientLeft      =   2805
   ClientTop       =   3315
   ClientWidth     =   4080
   Height          =   2370
   Left            =   2745
   LinkTopic       =   "0 none"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2471.698
   ScaleMode       =   0  'User
   ScaleWidth      =   1929.079
   ShowInTaskbar   =   0   'False
   Top             =   2970
   Visible         =   0   'False
   Width           =   4200
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
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   14.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
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
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   14.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
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
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   14.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   105
      TabIndex        =   1
      Top             =   105
      Width           =   960
   End
End
Attribute VB_Name = "frmNeueArmee"
Attribute VB_Creatable = False
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

If CobArmeeAuswahl.Text = "" Then
    MsgBox "Es mu� noch eine Armee ausgew�hlt werden", 0, "Keine Armee"
Else
    'Mauszeiger in Sanduhr umwandeln
    Screen.MousePointer = 11
    'Armee Auswahlfenster schlie�en
    frmNeueArmee.Visible = False
    'Schwertmeister anzeigen
    With frmLaden
        If CobArmeeAuswahl.Text = "Dunkelelfen" Then
            .ImgLaden.Picture = LoadPicture(App.Path & "\tullaris.bmp")
        Else
            .ImgLaden.Picture = LoadPicture(App.Path & "\swordmas.bmp")
        End If
            .ImgLaden.Top = Int((.Height - .ImgLaden.Height) / 2)
            .ImgLaden.Left = Int((.Width - .ImgLaden.Width) / 2)
    End With
        
    'Maximalpunkte �bernehmen
    Wandler = frmNeueArmee.labPunkte.Caption
    Maximalpunkte = Wandler
    'Restpunkte �bernehmen
    '(in diesem Fall sind noch keine Punkte ausgegeben worden,
    ' deshalb Restpunkte=Maximalpunkte)
    Restpunkte = Maximalpunkte
        
    'CHARAKTER
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Charaktermodelle einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(4500, 190), Farbe, BF
    Name = "SELECT * From [Charakter] WHERE [Charakter].Armee='" & CobArmeeAuswahl.Text & "' ORDER BY [Charakter].Truppenname"
    Set dsCharakter = Datenbank.CreateDynaset(Name)
    'Listenfeld f�llen
    dsCharakter.MoveFirst
    Do Until dsCharakter.EOF
        Name = dsCharakter.Fields("Truppenname")
        frmHauptmen�.lstCharakterunten.AddItem Name
        dsCharakter.MoveNext
    Loop
    'Punkte eintragen
    frmHauptmen�.labCharakterpunkte.Caption = Charakterpunkte
        
    'REGIMENTER
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Regimenter einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(5000, 190), Farbe, BF
    'SQL-Abfrage erstellen
    Name = "SELECT * From [Regimenter] WHERE [Regimenter].Armee='" & CobArmeeAuswahl.Text & "' ORDER BY [Regimenter].Truppenname"
    Set dsRegimenter = Datenbank.CreateDynaset(Name)
    'Listenfeld f�llen
    dsRegimenter.MoveFirst
    Do Until dsRegimenter.EOF
        Name = dsRegimenter.Fields("Truppenname")
        frmHauptmen�.lstRegimenterunten.AddItem Name
        dsRegimenter.MoveNext
    Loop
    'Punkte eintragen
    frmHauptmen�.labRegimenterpunkte.Caption = Regimenterpunkte
        
    'KRIEGSGER�T
    If CobArmeeAuswahl.Text <> "Waldelfen" And CobArmeeAuswahl.Text <> "Echsenmenschen" And CobArmeeAuswahl.Text <> "Bretonen" And CobArmeeAuswahl.Text <> "Tiermenschen" And CobArmeeAuswahl.Text <> "Chaoskrieger" And CobArmeeAuswahl.Text <> "D�monen" Then
        frmStart.picStatuszeile.Cls
        If CobArmeeAuswahl.Text = "Chaos" Then
            frmStart.picStatuszeile.Print " D�monen einlesen"
            frmHauptmen�.labtxtKriegsger�t.Caption = "D�monen:"
            frmHauptmen�.lstKriegsger�toben.DragIcon = LoadPicture(App.Path & "\daemon.ico")
            frmHauptmen�.lstkriegsger�tunten.DragIcon = LoadPicture(App.Path & "\daemon.ico")
        Else
            frmStart.picStatuszeile.Print " Kriegsger�t einlesen"
            frmHauptmen�.labtxtKriegsger�t.Caption = "Kriegsger�t:"
            frmHauptmen�.lstKriegsger�toben.DragIcon = LoadPicture(App.Path & "\kriegsge.ico")
            frmHauptmen�.lstkriegsger�tunten.DragIcon = LoadPicture(App.Path & "\kriegsge.ico")
        End If
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(5500, 190), Farbe, BF
        'SQL-Abfrage erstellen
        Name = "SELECT * From [Kriegsger�t] WHERE [Kriegsger�t].Armee='" & CobArmeeAuswahl.Text & "' ORDER BY [Kriegsger�t].Truppenname"
        Set dsKriegsger�t = Datenbank.CreateDynaset(Name)
        'Listenfeld f�llen
        dsKriegsger�t.MoveFirst
        Do Until dsKriegsger�t.EOF
            Name = dsKriegsger�t.Fields("Truppenname")
            frmHauptmen�.lstkriegsger�tunten.AddItem Name
            dsKriegsger�t.MoveNext
        Loop
    End If
    'Punkte eintragen
    frmHauptmen�.labKriegsger�tpunkte.Caption = Kriegsger�tpunkte
    
    'MONSTER
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Monster einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(6000, 190), Farbe, BF
    'Dynaset erstellen
    'SQL-Abfrage erstellen
    Name = "SELECT * From [Monster und Reittiere] WHERE [Monster und Reittiere].Monster =-1 AND ([Monster und Reittiere].Armee='" & CobArmeeAuswahl.Text & "' OR [Monster und Reittiere].Armee='Alle') ORDER BY [Monster und Reittiere].Truppenname"
    Set dsMonster = Datenbank.CreateDynaset(Name)
    'Listenfeld f�llen
    dsMonster.MoveFirst
    Do Until dsMonster.EOF
        Name = dsMonster.Fields("Truppenname")
        frmHauptmen�.lstMonsterunten.AddItem Name
        dsMonster.MoveNext
    Loop
    'Punkte eintragen
    frmHauptmen�.labMonsterpunkte.Caption = Monsterpunkte
        
        
    'VERB�NDETE
    'Punkte eintragen
    frmHauptmen�.labVerb�ndetepunkte.Caption = Verb�ndetepunkte
    
        
    'MAGISCHE GEGENST�NDE
    'Liste der Magischen Spruchrollen f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Spruchrollen einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(6500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Spruchrollen] WHERE [Magische Spruchrollen].Armeeliste='" & CobArmeeAuswahl.Text & "' OR [Magische Spruchrollen].Armeeliste='Alle' ORDER BY [Magische Spruchrollen].Spruchrollenname"
    Set dsSpruchrollen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstMagische_Spruchrollen.AddItem "(keine)"
    Do Until dsSpruchrollen.EOF
        Name = dsSpruchrollen.Fields("Spruchrollenname")
        Wandler = dsSpruchrollen.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstMagische_Spruchrollen.AddItem Name & " (" & Wandler & ")"
        dsSpruchrollen.MoveNext
    Loop
        
    'Liste der Homunkulis f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Homunkulis einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(7000, 190), Farbe, BF
    Name = "SELECT * FROM [Homunkuli] WHERE [Homunkuli].Armeeliste='" & CobArmeeAuswahl.Text & "' OR [Homunkuli].Armeeliste='Alle' ORDER BY [Homunkuli].Homunkuliname"
    Set dsHomunkuli = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstHomunkuli.AddItem "(keinen)"
    Do Until dsHomunkuli.EOF
        Name = dsHomunkuli.Fields("Homunkuliname")
        Wandler = dsHomunkuli.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstHomunkuli.AddItem Name & " (" & Wandler & ")"
        dsHomunkuli.MoveNext
    Loop
        
    'Liste der Mutationen f�llen
    If CobArmeeAuswahl.Text = "Chaos" Or CobArmeeAuswahl.Text = "Chaoskrieger" Or CobArmeeAuswahl.Text = "Tiermenschen" Or CobArmeeAuswahl.Text = "D�monen" Then
        frmStart.picStatuszeile.Cls
        frmStart.picStatuszeile.Print " Chaos Mutationen einlesen"
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(7250, 190), Farbe, BF
        Name = "SELECT * FROM [Chaos Mutationen] ORDER BY [Chaos Mutationen].Mutationsname"
        Set dsMutationen = Datenbank.CreateDynaset(Name)
        frmMagische_Gegenst�nde.lstChaos_Mutationen.AddItem "(keine)"
        Do Until dsMutationen.EOF
            Name = dsMutationen.Fields("Mutationsname")
            Wandler = dsMutationen.Fields("Punktwert")
            frmMagische_Gegenst�nde.lstChaos_Mutationen.AddItem Name & " (" & Wandler & ")"
            dsMutationen.MoveNext
        Loop
    End If
        
    'Liste der Magischen Standarten f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Standarten einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(7500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Standarten] WHERE [Magische Standarten].Armeeliste='" & CobArmeeAuswahl.Text & "' OR [Magische Standarten].Armeeliste='Alle' ORDER BY [Magische Standarten].Standartenname"
    Set dsStandarten = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstmagische_standarten.AddItem "(keine)"
    Do Until dsStandarten.EOF
        Name = dsStandarten.Fields("Standartenname")
        Wandler = dsStandarten.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstmagische_standarten.AddItem Name & " (" & Wandler & ")"
        dsStandarten.MoveNext
    Loop
                
    'Liste der Magischen Waffen f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Waffen einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(8000, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Waffen] WHERE [Magische Waffen].Armeeliste='" & CobArmeeAuswahl.Text & "' OR [Magische Waffen].Armeeliste='Alle' ORDER BY [Magische Waffen].Waffenname"
    Set dsMagische_Waffen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstMagische_Waffen.AddItem "(keine)"
    Do Until dsMagische_Waffen.EOF
        Name = dsMagische_Waffen.Fields("Waffenname")
        Wandler = dsMagische_Waffen.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstMagische_Waffen.AddItem Name & " (" & Wandler & ")"
        dsMagische_Waffen.MoveNext
    Loop
            
    'Liste der Magischen R�stungen f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische R�stungen einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(8500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische R�stungen] WHERE [Magische R�stungen].Armeeliste='" & CobArmeeAuswahl.Text & "' OR [Magische R�stungen].Armeeliste='Alle' ORDER BY [Magische R�stungen].R�stungsname"
    Set dsMagische_R�stungen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstMagische_R�stungen.AddItem "(keine)"
    Do Until dsMagische_R�stungen.EOF
        Name = dsMagische_R�stungen.Fields("R�stungsname")
        Wandler = dsMagische_R�stungen.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstMagische_R�stungen.AddItem Name & " (" & Wandler & ")"
        dsMagische_R�stungen.MoveNext
    Loop
        
    'Liste der Magischen Schilder f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Magische Schilder einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(9000, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Schilder] WHERE [Magische Schilder].Armeeliste='" & CobArmeeAuswahl.Text & "' OR [Magische Schilder].Armeeliste='Alle' ORDER BY [Magische Schilder].Schildname"
    Set dsMagische_Schilder = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstMagische_Schilder.AddItem "(keine)"
    Do Until dsMagische_Schilder.EOF
        Name = dsMagische_Schilder.Fields("Schildname")
        Wandler = dsMagische_Schilder.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstMagische_Schilder.AddItem Name & " (" & Wandler & ")"
        dsMagische_Schilder.MoveNext
    Loop
        
    'Liste der Verschiedenen magischen Gegenst�nde f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Verschiedene magische Gegenst�nde einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(9500, 190), Farbe, BF
    Name = "SELECT * FROM [Verschiedene Magische Gegenst�nde] WHERE [Verschiedene Magische Gegenst�nde].Armeeliste='" & CobArmeeAuswahl.Text & "' Or [Verschiedene Magische Gegenst�nde].Armeeliste='Alle' ORDER BY [Verschiedene Magische Gegenst�nde].Gegenstandsname"
    Set dsVerschiedene_mag_Gegenst�nde = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenst�nde.lstVerschiedene_Magische_Gegenst�nde.AddItem "(keine)"
    Do Until dsVerschiedene_mag_Gegenst�nde.EOF
        Name = dsVerschiedene_mag_Gegenst�nde.Fields("Gegenstandsname")
        Wandler = dsVerschiedene_mag_Gegenst�nde.Fields("Punktwert")
        frmMagische_Gegenst�nde.lstVerschiedene_Magische_Gegenst�nde.AddItem Name & " (" & Wandler & ")"
        dsVerschiedene_mag_Gegenst�nde.MoveNext
    Loop
    
    
    'ZWERGENRUNEN
    If CobArmeeAuswahl.Text = "Zwerge" Then
        'Anzeigen das Zwergenrunen eingelesen werden
        frmStart.picStatuszeile.Cls
        frmStart.picStatuszeile.Print " Zwergenrunen einlesen"
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(9750, 190), Farbe, BF
        
        'Liste der Waffenrunen f�llen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Waffenrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsWaffenrunen = Datenbank.CreateDynaset(Name)
        Do Until dsWaffenrunen.EOF
            Name = dsWaffenrunen.Fields("Runenname")
            Wandler = dsWaffenrunen.Fields("Punktwert")
            frmZwergenrunen.lstWaffenrunen.AddItem Name & " (" & Wandler & ")"
            dsWaffenrunen.MoveNext
        Loop
    
        'Liste der R�stungsrunen f�llen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='R�stungsrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsR�stungsrunen = Datenbank.CreateDynaset(Name)
        Do Until dsR�stungsrunen.EOF
            Name = dsR�stungsrunen.Fields("Runenname")
            Wandler = dsR�stungsrunen.Fields("Punktwert")
            frmZwergenrunen.lstR�stungsrunen.AddItem Name & " (" & Wandler & ")"
            dsR�stungsrunen.MoveNext
        Loop
    
        'Liste der Schutzrunen f�llen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Schutzrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsSchutzrunen = Datenbank.CreateDynaset(Name)
        Do Until dsSchutzrunen.EOF
            Name = dsSchutzrunen.Fields("Runenname")
            Wandler = dsSchutzrunen.Fields("Punktwert")
            frmZwergenrunen.lstSchutzrunen.AddItem Name & " (" & Wandler & ")"
            dsSchutzrunen.MoveNext
        Loop
    
        'Liste der Maschinenrunen f�llen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Maschinenrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsMaschinenrunen = Datenbank.CreateDynaset(Name)
        Do Until dsMaschinenrunen.EOF
            Name = dsMaschinenrunen.Fields("Runenname")
            Wandler = dsMaschinenrunen.Fields("Punktwert")
            frmZwergenrunen.lstMaschinenrunen.AddItem Name & " (" & Wandler & ")"
            dsMaschinenrunen.MoveNext
        Loop
    
        'Liste der Waffenrunen f�llen
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Talismanrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsTalismanrunen = Datenbank.CreateDynaset(Name)
        Do Until dsTalismanrunen.EOF
            Name = dsTalismanrunen.Fields("Runenname")
            Wandler = dsTalismanrunen.Fields("Punktwert")
            frmZwergenrunen.lstTalismanrunen.AddItem Name & " (" & Wandler & ")"
            dsTalismanrunen.MoveNext
        Loop
    End If
            
            
    'Liste der Reittiere f�llen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Reittiere einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(10000, 190), Farbe, BF
    Name = "SELECT * From [Monster und Reittiere] WHERE [Monster und Reittiere].Reittier =-1 and ([Monster und Reittiere].Armee='" & CobArmeeAuswahl.Text & "' OR [Monster und Reittiere].Armee='Alle') ORDER BY [Monster und Reittiere].Truppenname"
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
    frmHauptmen�.labRestpunkte.Caption = Restpunkte
    'Schwertmeister ausblenden
    frmLaden.Hide
    'Statuszeile leeren
    frmStart.picStatuszeile.Cls
    'Hauptmen�-Fenster ausrichten, Titel benennen und anzeigen
    With frmHauptmen�
        .Top = -345
        .Left = -60
        .Height = frmStart.ScaleHeight + 345
        .Width = frmStart.ScaleWidth + 60
        .Caption = CobArmeeAuswahl.Text
        .Visible = True
    End With
    'Magische Gegenst�nde Fenster ausrichten
    With frmMagische_Gegenst�nde
        .Top = -345
        .Left = 0
        .Width = frmHauptmen�.ScaleWidth
        .Height = frmHauptmen�.linTrennstrich.Y1 + 300
    End With
    'Bei Zwergenarmee Zwergenrunen Fenster ausrichten
    If CobArmeeAuswahl.Text = "Zwerge" Then
        With frmZwergenrunen
            .Top = -345
            .Left = 0
            .Width = frmHauptmen�.ScaleWidth
            .Height = frmHauptmen�.linTrennstrich.Y1 + 300
        End With
    End If
    'Mousepointer in Zeiger zur�ck verwandeln
    Screen.MousePointer = 0
End If
End Sub

Private Sub Form_Load()
frmNeueArmee.Height = 2475
frmNeueArmee.Width = 4170
CobArmeeAuswahl.AddItem "Bretonen"
CobArmeeAuswahl.AddItem "Chaos"
CobArmeeAuswahl.AddItem "Chaoskrieger"
CobArmeeAuswahl.AddItem "Dunkelelfen"
CobArmeeAuswahl.AddItem "D�monen"
CobArmeeAuswahl.AddItem "Echsenmenschen"
CobArmeeAuswahl.AddItem "Hochelfen"
CobArmeeAuswahl.AddItem "Imperium"
CobArmeeAuswahl.AddItem "Orks & Goblins"
CobArmeeAuswahl.AddItem "Skaven"
CobArmeeAuswahl.AddItem "Tiermenschen"
CobArmeeAuswahl.AddItem "Untote"
CobArmeeAuswahl.AddItem "Waldelfen"
CobArmeeAuswahl.AddItem "Zwerge"
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
CobArmeeAuswahl.Visible = True
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


