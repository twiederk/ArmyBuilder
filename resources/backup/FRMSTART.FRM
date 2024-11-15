VERSION 4.00
Begin VB.MDIForm frmStart 
   AutoShowChildren=   0   'False
   BackColor       =   &H00FFFFFF&
   Caption         =   "Warhammer Armeelisten"
   ClientHeight    =   6135
   ClientLeft      =   2175
   ClientTop       =   2655
   ClientWidth     =   6900
   Height          =   6825
   Icon            =   "FRMSTART.frx":0000
   Left            =   2115
   LinkTopic       =   "MDIForm1"
   ScrollBars      =   0   'False
   Top             =   2025
   Width           =   7020
   Begin VB.PictureBox picStatuszeile 
      Align           =   2  'Align Bottom
      BeginProperty Font 
         name            =   "Times New Roman"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   0
      ScaleHeight     =   225
      ScaleWidth      =   6840
      TabIndex        =   0
      Top             =   5844
      Width           =   6900
   End
   Begin MSComDlg.CommonDialog Common_Dialog 
      Left            =   1155
      Top             =   840
      _version        =   65536
      _extentx        =   847
      _extenty        =   847
      _stockprops     =   0
   End
   Begin VB.Menu mnuDatei 
      Caption         =   "&Datei"
      Begin VB.Menu mnuDNeu 
         Caption         =   "&Neu"
      End
      Begin VB.Menu mnuDTrennlinie1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDLaden 
         Caption         =   "&Laden"
      End
      Begin VB.Menu mnuDTrennlinie2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDBeenden 
         Caption         =   "&Beenden        ALT-F4"
      End
   End
   Begin VB.Menu mnuHilfe 
      Caption         =   "&Hilfe"
      Begin VB.Menu mnuHInfo 
         Caption         =   "&Info"
      End
   End
End
Attribute VB_Name = "frmStart"
Attribute VB_Creatable = False
Attribute VB_Exposed = False








Private Sub MDIForm_Load()
Dim Entscheidung As Single
Dim DatenbankDatei As String

mnuHilfe.Caption = Chr$(8) & "&Hilfe"
With frmStart
    .Top = 0
    .Left = 0
    .Height = Screen.Height
    .Width = Screen.Width
End With
Randomize
Entscheidung = Rnd
With frmLaden
        .Top = 0
        .Left = 0
        .Width = frmStart.ScaleWidth
        .Height = frmStart.ScaleHeight
    If Entscheidung < 0.5 Then
        .ImgLaden.Picture = LoadPicture(App.Path & "\chronicl.bmp")
    Else
        .ImgLaden.Picture = LoadPicture(App.Path & "\trollsla.bmp")
    End If
        .ImgLaden.Top = Int((.Height - .ImgLaden.Height) / 2)
        .ImgLaden.Left = Int((.Width - .ImgLaden.Width) / 2)
        .Show
End With
'Mousepointer Sanduhr
Screen.MousePointer = 11

frmNeueArmee.Hide
frmHauptmenü.Hide
frmMagische_Gegenstände.Hide
frmDrucken.Hide
        
'Datenbank öffnen
DatenbankDatei = Dir(App.Path & "\*.mdb")
frmDB.lstDatenbanken.AddItem DatenbankDatei
Do While DatenbankDatei <> ""
    DatenbankDatei = Dir
    If DatenbankDatei <> "" Then
        frmDB.lstDatenbanken.AddItem DatenbankDatei
    End If
Loop

If frmDB.lstDatenbanken.ListCount > 1 Then
    'Mehrere Datenbanken gefunden
    frmStart.Enabled = False
    With frmDB
        'Datenbankfenster skalieren und ausrichten
        .Height = 2745
        .Width = 2610
        .Top = Int((frmStart.Height - frmDB.Height) / 2)
        .Left = Int((frmStart.Width - frmDB.Width) / 2)
        .Show
    End With
    frmStart.Enabled = True
Else
    'Nur eine Datenbank gefunden
    frmDB.lstDatenbanken.ListIndex = 0
    Set Datenbank = OpenDatabase(App.Path & "\" & frmDB.lstDatenbanken.Text, , True)
End If


'Mouspointer normal
Screen.MousePointer = 0
End Sub

Private Sub MDIForm_Resize()
If (frmHauptmenü.Top <> -345) And (frmHauptmenü.Left <> -60) And (frmHauptmenü.Visible) Then
    With frmHauptmenü
    .Height = frmStart.ScaleHeight
    .Width = frmStart.ScaleWidth
    End With
End If
End Sub


Private Sub mnuDatei_Click()
If (frmNeueArmee.Visible) Or (frmHauptmenü.Visible) Then
    mnuDNeu.Enabled = False
    mnuDLaden.Enabled = False
End If
End Sub
Private Sub mnuDBeenden_Click()
    Datenbank.Close
    AppActivate "Warhammer"
    SendKeys "%{F4}"
End Sub


Private Sub mnuDLaden_Click()
'VARIABLEN DEKLARATION
Dim Dateiname As String
Dim Farbe As Double
Dim Datenzeile As String
Dim Name As String
Dim Armeename As String

'PROZEDURSTART
Common_Dialog.DialogTitle = "Armee laden"
Common_Dialog.Filter = "Armee (*.arm)|*.arm|Alle Dateien (*.*)|*.*"
Common_Dialog.filename = ""
Common_Dialog.Action = 1
Dateiname = Common_Dialog.filename
If Dateiname <> "" Then
    'Mauspointer Sanduhr
    Screen.MousePointer = 11
    
    'Zufallfarbe für Statusbalken bestimmen
    Do
        Farbe = Int(16 * Rnd)
    Loop Until Farbe <> 7
    Farbe = QBColor(Farbe)
        
    'Datei öffnen
    Open Dateiname For Input As 1
    
    'Armeenamen einlesen
    Line Input #1, Armeename
    frmHauptmenü.Caption = Armeename
    
    'Schwertmeister anzeigen
    With frmLaden
        If Armeename = "Dunkelelfen" Then
            .ImgLaden.Picture = LoadPicture(App.Path & "\tullaris.bmp")
        Else
            .ImgLaden.Picture = LoadPicture(App.Path & "\swordmas.bmp")
        End If
        .ImgLaden.Top = Int((.Height - .ImgLaden.Height) / 2)
        .ImgLaden.Left = Int((.Width - .ImgLaden.Width) / 2)
    End With
    
    'Maximalpunkte einlesen
    Line Input #1, Datenzeile
    Maximalpunkte = Datenzeile - 0
        
    'Restpunkte einlesen
    Line Input #1, Datenzeile
    Restpunkte = Datenzeile - 0
            
    'Restpunkte einlesen
    Line Input #1, Datenzeile
    frmHauptmenü.labRestpunkte.Caption = Datenzeile - 0
    
    'Letzter Punktestand einlesen
    Line Input #1, Datenzeile
    Letzter_Punktestand = Datenzeile - 0
        
    'General einlesen
    Line Input #1, Datenzeile
    General = Datenzeile
        
    'Armeestandarte
    Line Input #1, Datenzeile
    Armeestandarte = Datenzeile
        
        
    'CHARAKTER
    picStatuszeile.Cls
    picStatuszeile.Print " Charaktermodelle einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(4500, 190), Farbe, BF
    Name = "SELECT * From [Charakter] WHERE [Charakter].Armee='" & Armeename & "' ORDER BY [Charakter].Truppenname"
    Set dsCharakter = Datenbank.CreateDynaset(Name)
    'Listenfeldunten füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstCharakterunten"
            frmHauptmenü.lstCharakterunten.AddItem Datenzeile
            Line Input #1, Datenzeile
    Loop
    'Listenfeldoben füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstCharakteroben"
            frmHauptmenü.lstcharakteroben.AddItem Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).Reittier = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).Waffe = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).Rüstung = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).Fernwaffe = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand1 = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand1_Kosten = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand1_Kategorie = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand2 = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand2_Kosten = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand2_Kategorie = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand3 = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand3_Kosten = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand3_Kategorie = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand4 = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand4_Kosten = Datenzeile
            Line Input #1, Datenzeile
            Charakterfeld(frmHauptmenü.lstcharakteroben.ListCount - 1).mag_Gegenstand4_Kategorie = Datenzeile
            Line Input #1, Datenzeile
    Loop
    Charakterzähler = frmHauptmenü.lstcharakteroben.ListCount
    'Punkte eintragen
    Line Input #1, Datenzeile
    Charakterpunkte = Datenzeile - 0
    frmHauptmenü.labCharakterpunkte.Caption = Charakterpunkte
    
    
    'REGIMENTER
    picStatuszeile.Cls
    picStatuszeile.Print " Regimenter einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(5000, 190), Farbe, BF
    'SQL-Abfrage erstellen
    Name = "SELECT * From [Regimenter] WHERE [Regimenter].Armee='" & Armeename & "' ORDER BY [Regimenter].Truppenname"
    Set dsRegimenter = Datenbank.CreateDynaset(Name)
    'Listenfeldunten füllen
    dsRegimenter.MoveFirst
    Do Until dsRegimenter.EOF
        Name = dsRegimenter.Fields("Truppenname")
        frmHauptmenü.lstRegimenterunten.AddItem Name
        dsRegimenter.MoveNext
    Loop
    'Listenfeldoben füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstRegimenteroben"
            frmHauptmenü.lstRegimenteroben.AddItem Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Anzahl = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Option1 = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Option2 = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Option3 = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Option4 = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Option5 = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Option6 = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Musiker = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).Standartenträger = Datenzeile
            Line Input #1, Datenzeile
            Regimenterfeld(frmHauptmenü.lstRegimenteroben.ListCount - 1).MagischeStandarte.Rune1 = Datenzeile
            Line Input #1, Datenzeile
    Loop
    Regimenterzähler = frmHauptmenü.lstRegimenteroben.ListCount
    'Punkte eintragen
    Line Input #1, Datenzeile
    Regimenterpunkte = Datenzeile - 0
    frmHauptmenü.labRegimenterpunkte.Caption = Regimenterpunkte
        
    
    'KRIEGSGERÄT
    If Armeename <> "Waldelfen" And Armeename <> "Echsenmenschen" And Armeename <> "Bretonen" And Armeename <> "Tiermenschen" And Armeename <> "Chaoskrieger" And Armeename <> "Dämonen" Then
        frmStart.picStatuszeile.Cls
        If Armeename = "Chaos" Then
            picStatuszeile.Print " Dämonen einlesen"
            frmHauptmenü.labtxtKriegsgerät.Caption = "Dämonen:"
            frmHauptmenü.lstKriegsgerätoben.DragIcon = LoadPicture(App.Path & "\daemon.ico")
            frmHauptmenü.lstkriegsgerätunten.DragIcon = LoadPicture(App.Path & "\daemon.ico")
        Else
            picStatuszeile.Print " Kriegsgerät einlesen"
            frmHauptmenü.labtxtKriegsgerät.Caption = "Kriegsgerät:"
            frmHauptmenü.lstKriegsgerätoben.DragIcon = LoadPicture(App.Path & "\kriegsge.ico")
            frmHauptmenü.lstkriegsgerätunten.DragIcon = LoadPicture(App.Path & "\kriegsge.ico")
        End If
        picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        picStatuszeile.Line (4000, 30)-(5500, 190), Farbe, BF
        'SQL-Abfrage erstellen
        Name = "SELECT * From [Kriegsgerät] WHERE [Kriegsgerät].Armee='" & Armeename & "' ORDER BY [Kriegsgerät].Truppenname"
        Set dsKriegsgerät = Datenbank.CreateDynaset(Name)
        'Listenfeldunten füllen
        dsKriegsgerät.MoveFirst
        Do Until dsKriegsgerät.EOF
            Name = dsKriegsgerät.Fields("Truppenname")
            frmHauptmenü.lstkriegsgerätunten.AddItem Name
            dsKriegsgerät.MoveNext
        Loop
    End If
    'Listenfeldoben füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstKriegsgerätoben"
            frmHauptmenü.lstKriegsgerätoben.AddItem Datenzeile
            Line Input #1, Datenzeile
            Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Anzahl = Datenzeile
            Line Input #1, Datenzeile
            Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Option1 = Datenzeile
            Line Input #1, Datenzeile
            Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Option2 = Datenzeile
            Line Input #1, Datenzeile
            Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Option3 = Datenzeile
            Line Input #1, Datenzeile
            Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Option4 = Datenzeile
            Line Input #1, Datenzeile
            Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Option5 = Datenzeile
            If Armeename = "Zwerge" Then
                Line Input #1, Datenzeile
                Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Zwergenrunen_Kriegsgerät.Rune1 = Datenzeile
                Line Input #1, Datenzeile
                Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Zwergenrunen_Kriegsgerät.Rune2 = Datenzeile
                Line Input #1, Datenzeile
                Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Zwergenrunen_Kriegsgerät.Rune3 = Datenzeile
                Line Input #1, Datenzeile
                Kriegsgerätfeld(frmHauptmenü.lstKriegsgerätoben.ListCount - 1).Zwergenrunen_Kriegsgerät.Runenkosten = Datenzeile
            End If
            Line Input #1, Datenzeile
    Loop
    Kriegsgerätzähler = frmHauptmenü.lstKriegsgerätoben.ListCount
    'Punkte eintragen
    Line Input #1, Datenzeile
    Kriegsgerätpunkte = Datenzeile - 0
    frmHauptmenü.labKriegsgerätpunkte.Caption = Kriegsgerätpunkte
    
    
    'MONSTER
    picStatuszeile.Cls
    picStatuszeile.Print " Monster einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(6000, 190), Farbe, BF
    'Dynaset erstellen
    'SQL-Abfrage erstellen
    Name = "SELECT * From [Monster und Reittiere] WHERE [Monster und Reittiere].Monster =-1 AND ([Monster und Reittiere].Armee='" & Armeename & "' OR [Monster und Reittiere].Armee='Alle') ORDER BY [Monster und Reittiere].Truppenname"
    Set dsMonster = Datenbank.CreateDynaset(Name)
    'Listenfeldunten füllen
    dsMonster.MoveFirst
    Do Until dsMonster.EOF
        Name = dsMonster.Fields("Truppenname")
        frmHauptmenü.lstMonsterunten.AddItem Name
        dsMonster.MoveNext
    Loop
    'Listenfeldoben füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstMonsteroben"
            frmHauptmenü.lstMonsteroben.AddItem Datenzeile
            Line Input #1, Datenzeile
            Monsterfeld(frmHauptmenü.lstMonsteroben.ListCount - 1).Anzahl = Datenzeile
            Line Input #1, Datenzeile
    Loop
    Monsterzähler = frmHauptmenü.lstMonsteroben.ListCount
    'Punkte eintragen
    Line Input #1, Datenzeile
    Monsterpunkte = Datenzeile - 0
    frmHauptmenü.labMonsterpunkte.Caption = Monsterpunkte
        
        
    'VERBÜNDETE
    Line Input #1, Datenzeile
    Verbündetepunkte = Datenzeile - 0
    frmHauptmenü.labVerbündetepunkte.Caption = Verbündetepunkte
        
        
    'MAGISCHE GEGENSTÄNDE
    'Liste der Magischen Spruchrollen füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Magische Spruchrollen einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(6500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Spruchrollen] WHERE [Magische Spruchrollen].Armeeliste='" & Armeename & "' OR [Magische Spruchrollen].Armeeliste='Alle' ORDER BY [Magische Spruchrollen].Spruchrollenname"
    Set dsSpruchrollen = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstMagische_Spruchrollen.AddItem "(keine)"
    Do Until dsSpruchrollen.EOF
        Name = dsSpruchrollen.Fields("Spruchrollenname")
        Wandler = dsSpruchrollen.Fields("Punktwert")
        frmMagische_Gegenstände.lstMagische_Spruchrollen.AddItem Name & " (" & Wandler & ")"
        dsSpruchrollen.MoveNext
    Loop
        
    
    'Liste der Homunkulis füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Homunkulis einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(7000, 190), Farbe, BF
    Name = "SELECT * FROM [Homunkuli] WHERE [Homunkuli].Armeeliste='" & Armeename & "' OR [Homunkuli].Armeeliste='Alle' ORDER BY [Homunkuli].Homunkuliname"
    Set dsHomunkuli = Datenbank.CreateDynaset(Name)
    frmMagische_Gegenstände.lstHomunkuli.AddItem "(keinen)"
    Do Until dsHomunkuli.EOF
        Name = dsHomunkuli.Fields("Homunkuliname")
        Wandler = dsHomunkuli.Fields("Punktwert")
        frmMagische_Gegenstände.lstHomunkuli.AddItem Name & " (" & Wandler & ")"
        dsHomunkuli.MoveNext
    Loop
    
    
    'Liste der Mutationen füllen
    If Armeename = "Chaos" Or Armeename = "Chaoskrieger" Or Armeename = "Tiermenschen" Or Armeename = "Dämonen" Then
        picStatuszeile.Cls
        picStatuszeile.Print " Chaos Mutationen einlesen"
        picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        picStatuszeile.Line (4000, 30)-(7250, 190), Farbe, BF
        Name = "SELECT * FROM [Chaos Mutationen] ORDER BY [Chaos Mutationen].Mutationsname"
        Set dsMutationen = Datenbank.CreateDynaset(Name)
        'Listenfeld füllen
        Line Input #1, Datenzeile
        Do Until Datenzeile = "lstChaos_Mutationen"
                frmMagische_Gegenstände.lstChaos_Mutationen.AddItem Datenzeile
                Line Input #1, Datenzeile
        Loop
    End If
    
    
    'Liste der Magischen Standarten füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Magische Standarten einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(7500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Standarten] WHERE [Magische Standarten].Armeeliste='" & Armeename & "' OR [Magische Standarten].Armeeliste='Alle' ORDER BY [Magische Standarten].Standartenname"
    Set dsStandarten = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstMagische_Standarten"
            frmMagische_Gegenstände.lstmagische_standarten.AddItem Datenzeile
            Line Input #1, Datenzeile
    Loop
    
    
    'Liste der Magischen Waffen füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Magische Waffen einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(8000, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Waffen] WHERE [Magische Waffen].Armeeliste='" & Armeename & "' OR [Magische Waffen].Armeeliste='Alle' ORDER BY [Magische Waffen].Waffenname"
    Set dsMagische_Waffen = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstMagische_Waffen"
            frmMagische_Gegenstände.lstMagische_Waffen.AddItem Datenzeile
            Line Input #1, Datenzeile
    Loop
    
    
    'Liste der Magischen Rüstungen füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Magische Rüstungen einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(8500, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Rüstungen] WHERE [Magische Rüstungen].Armeeliste='" & Armeename & "' OR [Magische Rüstungen].Armeeliste='Alle' ORDER BY [Magische Rüstungen].Rüstungsname"
    Set dsMagische_Rüstungen = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstMagische_Rüstungen"
            frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem Datenzeile
            Line Input #1, Datenzeile
    Loop
    
    
    'Liste der Magischen Schilder füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Magische Schilder einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(9000, 190), Farbe, BF
    Name = "SELECT * FROM [Magische Schilder] WHERE [Magische Schilder].Armeeliste='" & Armeename & "' OR [Magische Schilder].Armeeliste='Alle' ORDER BY [Magische Schilder].Schildname"
    Set dsMagische_Schilder = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstMagische_Schilder"
            frmMagische_Gegenstände.lstMagische_Schilder.AddItem Datenzeile
            Line Input #1, Datenzeile
    Loop
    
    
    'Liste der Verschiedenen magischen Gegenstände füllen
    picStatuszeile.Cls
    picStatuszeile.Print " Verschiedene magische Gegenstände einlesen"
    picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    picStatuszeile.Line (4000, 30)-(9500, 190), Farbe, BF
    Name = "SELECT * FROM [Verschiedene Magische Gegenstände] WHERE [Verschiedene Magische Gegenstände].Armeeliste='" & Armeename & "' Or [Verschiedene Magische Gegenstände].Armeeliste='Alle' ORDER BY [Verschiedene Magische Gegenstände].Gegenstandsname"
    Set dsVerschiedene_mag_Gegenstände = Datenbank.CreateDynaset(Name)
    'Listenfeld füllen
    Line Input #1, Datenzeile
    Do Until Datenzeile = "lstVerschiedene_Magische_Gegenstände"
            frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem Datenzeile
            Line Input #1, Datenzeile
    Loop
    
    'ZWERGENRUNEN
    'Liste der Maschinenrunen füllen
    If Armeename = "Zwerge" Then
        frmStart.picStatuszeile.Cls
        frmStart.picStatuszeile.Print " Zwergenrunen einlesen"
        frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
        frmStart.picStatuszeile.Line (4000, 30)-(9750, 190), Farbe, BF
        Name = "SELECT * FROM [Zwergenrunen] WHERE [Zwergenrunen].Runenart='Maschinenrune' ORDER BY [Zwergenrunen].Runenname"
        Set dsMaschinenrunen = Datenbank.CreateDynaset(Name)
        Do Until dsMaschinenrunen.EOF
            Name = dsMaschinenrunen.Fields("Runenname")
            Wandler = dsMaschinenrunen.Fields("Punktwert")
            frmZwergenrunen.lstMaschinenrunen.AddItem Name & " (" & Wandler & ")"
            dsMaschinenrunen.MoveNext
        Loop
    End If
    
    'Datei schließen
    Close #1
    
    'Liste der Reittiere füllen
    frmStart.picStatuszeile.Cls
    frmStart.picStatuszeile.Print " Reittiere einlesen"
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), QBColor(0), B
    frmStart.picStatuszeile.Line (4000, 30)-(10000, 190), Farbe, BF
    Name = "SELECT * From [Monster und Reittiere] WHERE [Monster und Reittiere].Reittier =-1 and ([Monster und Reittiere].Armee='" & Armeename & "' OR [Monster und Reittiere].Armee='Alle') ORDER BY [Monster und Reittiere].Truppenname"
    Set dsReittiere = Datenbank.CreateDynaset(Name)
    frmReittiere.cobReittiere.AddItem "(keines)"
    Do Until dsReittiere.EOF
        Name = dsReittiere.Fields("Truppenname")
        frmReittiere.cobReittiere.AddItem Name
        dsReittiere.MoveNext
    Loop
    
    'Statuszeile voll
    frmStart.picStatuszeile.Line (4000, 30)-(10500, 190), Farbe, BF
                
    'Hauptmenü-Fenster ausrichten und Titel benennen
    With frmHauptmenü
        .Top = -345
        .Left = -60
        .Height = frmStart.ScaleHeight + 345
        .Width = frmStart.ScaleWidth + 60
        .Caption = Armeename
    End With


    'Magische Gegenstände Fenster ausrichten
    With frmMagische_Gegenstände
        .Top = -345
        .Left = 0
        .Width = frmHauptmenü.ScaleWidth
        .Height = frmHauptmenü.linTrennstrich.Y1 + 300
    End With
    
    'Bei Zwergenarmee Zwergenrunen Fenster ausrichten
    If Armeename = "Zwerge" Then
        With frmZwergenrunen
            .Top = -345
            .Left = 0
            .Width = frmHauptmenü.ScaleWidth
            .Height = frmHauptmenü.linTrennstrich.Y1 + 300
        End With
    End If
    
    'Schwertmeister ausblenden
    frmLaden.Hide
    
    'Statuszeile leeren
    frmStart.picStatuszeile.Cls
    
    'Hauptmenü-Fenster anzeigen
    frmHauptmenü.Show
    
    'Mousepointer in Zeiger zurück verwandeln
    Screen.MousePointer = 0
End If
End Sub

Private Sub mnuDNeu_Click()
frmNeueArmee.Visible = True
End Sub


Private Sub mnuHInfo_Click()
frmInfo.Visible = True
End Sub

Private Sub picWarhammer_Click()
picWarhammer.Visible = False
End Sub


