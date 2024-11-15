Attribute VB_Name = "modWarhammer"
Option Explicit

Type Magische_Gegenstände
    Option1 As Integer
    Option2 As Integer
    Option3 As Integer
    Option4 As Integer
    Standarte As Integer
End Type

Type Zwergenrunen
    Rune1 As String
    Rune2 As String
    Rune3 As String
    Runenkosten As Integer
End Type

Type Charakterobjekt
    Reittier As String
    Waffe As String
    Rüstung As String
    Fernwaffe As String
    mag_Gegenstand1 As String
    mag_Gegenstand1_Kosten As String
    mag_Gegenstand1_Kategorie As String
    mag_Gegenstand2 As String
    mag_Gegenstand2_Kosten As String
    mag_Gegenstand2_Kategorie As String
    mag_Gegenstand3 As String
    mag_Gegenstand3_Kosten As String
    mag_Gegenstand3_Kategorie As String
    mag_Gegenstand4 As String
    mag_Gegenstand4_Kosten As String
    mag_Gegenstand4_Kategorie As String
End Type

Type Regimenterobjekt
    Anzahl As Integer
    Option1 As Integer
    Option2 As Integer
    Option3 As Integer
    Option4 As Integer
    Option5 As Integer
    Option6 As Integer
    Musiker As Integer
    Standartenträger As Integer
    MagischeStandarte As Zwergenrunen
End Type

Type Kriegsgerätobjekt
    Anzahl As Integer
    Option1 As Integer
    Option2 As Integer
    Option3 As Integer
    Option4 As Integer
    Option5 As Integer
    Zwergenrunen_Kriegsgerät As Zwergenrunen
End Type

Type Monsterobjekt
    Anzahl As Integer
End Type

'Arbeitsvariable
Global Wandler As Variant

'Flag zum initalisiern von Optionen
Global Optionen_Initalisieren As Integer

'Merkmal welches Listenfeld im Hauptmenü zuletzt deb Fokus hatte
Global Fokus_zuletzt As String

'Merkmal welches Listenfeld bei den magischen Gegenständen zuletzt den Fokus hatte
Global Aktive_zuletzt As String

'Speichert den vorher ausgewählten magischen Gegenstand
Global Letzte_Auswahl As String
Global Letzte_Auswahl_Kategorie As String

'Zeigt an ob für einen Charakter eine Waffe, Rüstung oder Fernwaffe ausgewählt wird
Global Charaktereditions_Modus As String

'Flag ob schon bezahlter Charakter nach editiert wird
Global Charakterbearbeitung As Integer

'Flag ob schon bezahlte Standarte nach editiert wird
Global Standartenbearbeitung As Integer

'Flag ob schon bezahlte Zwergenrune für Kriegsgerät nach editiert wird
Global Kriegsgerätbearbeitung As Integer

'Zwischenspeicher für gerade gewählte aber noch nicht bezahlte mag. Gegenstände
Global Zwischenspeicher As Magische_Gegenstände

'Zwergenrunen
Global Zwergenrunen_Zwischenspeicher As Zwergenrunen
Global Zwergenrunen_Info As Integer

'Punkteberechnung
Global Maximalpunkte As Variant
Global Restpunkte As Variant
Global Letzter_Punktestand As Double

'Einmalige Modell pro Armee
Global General As Integer
Global Armeestandarte As Integer


Global Armeeliste As String
Global Datenbank As Database
Global dsSpruchrollen As Dynaset

'Dynasets für magische Gegenstände
Global dsHomunkuli As Dynaset
Global dsStandarten As Dynaset
Global dsMutationen As Dynaset
Global dsMagische_Waffen As Dynaset
Global dsMagische_Rüstungen As Dynaset
Global dsMagische_Schilder As Dynaset
Global dsVerschiedene_mag_Gegenstände As Dynaset

'Dynasets für Zwergenrunen
Global dsWaffenrunen As Dynaset
Global dsRüstungsrunen As Dynaset
Global dsSchutzrunen As Dynaset
Global dsMaschinenrunen As Dynaset
Global dsTalismanrunen As Dynaset

'Dynaset für Reittiere
Global dsReittiere As Dynaset

Global dsCharakter As Dynaset
Global Charakterpunkte As Variant
Global Charakterzähler As Integer
Global Charakterfeld(24) As Charakterobjekt

Global dsRegimenter As Dynaset
Global Regimenterpunkte As Variant
Global Regimenterzähler As Integer
Global Regimenterfeld(24) As Regimenterobjekt

Global dsKriegsgerät As Dynaset
Global Kriegsgerätpunkte As Variant
Global Kriegsgerätzähler As Integer
Global Kriegsgerätfeld(19) As Kriegsgerätobjekt

Global dsMonster As Dynaset
Global Monsterpunkte As Variant
Global Monsterzähler As Integer
Global Monsterfeld(19) As Monsterobjekt

Global Verbündetepunkte As Variant

Sub Monsterinfo_anzeigen(dyna As Dynaset, Name As String, Indexnummer As Integer)
If Name <> "" Then
    dyna.MoveFirst
    Do Until dyna.Fields("Truppenname") = (Name)
        dyna.MoveNext
    Loop
    With frmHauptmenü
    'TRUPPENNAME_GROß
    .labTruppenname_groß.Caption = dyna.Fields("Truppenname")
    'TRUPPENTYP
    .labTruppentyp.Caption = dyna.Fields("Truppentyp")
    'TRUPPENNAME_KLEIN
    .labTruppenname_klein.Caption = dyna.Fields("Truppenname")
    'BEWEGUNG
    If IsNull(dyna.Fields("Bewegung")) Then
        .labB.Caption = "-"
    Else
        .labB.Caption = dyna.Fields("Bewegung")
    End If
    'KAMPFGESCHICK
    If IsNull(dyna.Fields("Kampfgeschick")) Then
        .labKG.Caption = "-"
    Else
        .labKG.Caption = dyna.Fields("Kampfgeschick")
    End If
    'BALLISTISCHE FERTIGKEITEN
    If IsNull(dyna.Fields("Ballistische Fertigkeit")) Then
        .labBF.Caption = "-"
    Else
        .labBF.Caption = dyna.Fields("Ballistische Fertigkeit")
    End If
    'STÄRKE
    If IsNull(dyna.Fields("Stärke")) Then
        .labS.Caption = "-"
    Else
        .labS.Caption = dyna.Fields("Stärke")
    End If
    'WIDERSTANDS FÄHIGKEIT
    If IsNull(dyna.Fields("Widerstand")) Then
        .labW.Caption = "-"
    Else
        .labW.Caption = dyna.Fields("Widerstand")
    End If
    'LEBENSPUNKTE
    If IsNull(dyna.Fields("Lebenspunkte")) Then
        .labLP.Caption = "-"
    Else
        .labLP.Caption = dyna.Fields("Lebenspunkte")
    End If
    'INITATIVE
    If IsNull(dyna.Fields("Initative")) Then
        .labI.Caption = "-"
    Else
        .labI.Caption = dyna.Fields("Initative")
    End If
    'ATTACKEN
    If IsNull(dyna.Fields("Attacken")) Then
        .labA.Caption = "-"
    Else
        .labA.Caption = dyna.Fields("Attacken")
    End If
    'MORALWERT
    If IsNull(dyna.Fields("Moralwert")) Then
        .labMW.Caption = "-"
    Else
        .labMW.Caption = dyna.Fields("Moralwert")
    End If
    'RÜSTUNGSRETTUNGWURF
    If IsNull(dyna.Fields("Rüstungsrettungswurf")) Then
        .labRW.Caption = "-"
    Else
        If dyna.Fields("Rüstungsrettungswurf") < 6 Then
            .labRW.Caption = dyna.Fields("Rüstungsrettungswurf") & "+"
        Else
            .labRW.Caption = dyna.Fields("Rüstungsrettungswurf")
        End If
    End If
    'Anzahl
    If IsNull(dyna.Fields("Anzahl")) Then
        .labAnz.Caption = "-"
    Else
        .labAnz.Caption = dyna.Fields("Anzahl")
    End If
    'MUSIKER UND STANDARTENTRÄGER INITALISIEREN
    Optionen_Initalisieren = -1
    .ckbMusiker.Value = 0
    .ckbStandartenträger.Value = 0
    If Zwischenspeicher.Standarte Then
        frmMagische_Gegenstände.lstmagische_standarten.AddItem .labMagische_Standarte.Caption
        Zwischenspeicher.Standarte = 0
    End If
    .labMagische_Standarte = ""
    Optionen_Initalisieren = 0
    'EINZELPUNKTE
    .labEinzelkosten = dyna.Fields("Punktwert")
    'ANZAHL UND GESAMTPUNKTE
    If Indexnummer <> -1 Then
        Wandler = Monsterfeld(Indexnummer).Anzahl
        .labAnzahl = Wandler
    Else
        .labAnzahl.Caption = "1"
    End If
    'SONDERREGELN
    If IsNull(dyna.Fields("Sonderregeln")) Then
        .labsonderregeln.Caption = ""
    Else
        .labsonderregeln.Caption = dyna.Fields("Sonderregeln")
    End If
    
    'LEEREN
    .lab2truppenname_klein.BorderStyle = 0
    .lab3Truppenname_klein.BorderStyle = 0
    If .lab2truppenname_klein.Caption <> "" Then
        'Zweite Zeile leeren
        .lab2truppenname_klein.Caption = ""
        .labB2.Caption = ""
        .labKG2.Caption = ""
        .labBF2.Caption = ""
        .labS2.Caption = ""
        .labW2.Caption = ""
        .lablp2.Caption = ""
        .labi2.Caption = ""
        .laba2.Caption = ""
        .labmw2.Caption = ""
        .labrw2.Caption = ""
        If .lab3Truppenname_klein.Caption <> "" Then
            'Dritte Zeile leeren
            .lab3Truppenname_klein.Caption = ""
            .labB3.Caption = ""
            .labKG3.Caption = ""
            .labBF3.Caption = ""
            .labS3.Caption = ""
            .labW3.Caption = ""
            .labLP3.Caption = ""
            .labI3.Caption = ""
            .labA3.Caption = ""
            .labMW3.Caption = ""
            .labRW3.Caption = ""
        End If
    End If
    'WAFFE
    If -.labWaffe.BorderStyle Then
        .labWaffe.BorderStyle = 0
    End If
    .labWaffe.Caption = ""
    'RÜSTUNG
    If -.labRüstung.BorderStyle Then
        .labRüstung.BorderStyle = 0
    End If
    .labRüstung.Caption = ""
    'FERNWAFFE
    If -.labfernwaffe.BorderStyle Then
        .labfernwaffe.BorderStyle = 0
    End If
    .labfernwaffe.Caption = ""
    'OPTIONEN
    Optionen_Initalisieren = -1
    'OPTION 1
    If Zwischenspeicher.Option1 Then
        Gegenstand_zurückgeben .laboption1_Kategorie.Caption, 1
        Zwischenspeicher.Option1 = 0
    End If
    .labOption1.BorderStyle = 0
    .ckbOption1.Value = 0
    .ckbOption1.Enabled = False
    .labOption1.Caption = ""
    .labOption1_Kosten.Caption = ""
    .laboption1_Kategorie.Caption = ""
    ' OPTION 2
    If Zwischenspeicher.Option2 Then
        Gegenstand_zurückgeben .laboption2_Kategorie.Caption, 2
        Zwischenspeicher.Option2 = 0
    End If
    .labOption2.BorderStyle = 0
    .ckbOption2.Value = 0
    .ckbOption2.Enabled = False
    .labOption2.Caption = ""
    .labOption2_Kosten.Caption = ""
    .laboption2_Kategorie.Caption = ""
    'OPTION 3
    If Zwischenspeicher.Option3 Then
        Gegenstand_zurückgeben .laboption3_Kategorie.Caption, 3
        Zwischenspeicher.Option3 = 0
    End If
    .labOption3.BorderStyle = 0
    .ckbOption3.Value = 0
    .ckbOption3.Enabled = False
    .labOption3.Caption = ""
    .labOption3_Kosten.Caption = ""
    .laboption3_Kategorie.Caption = ""
    'OPTION 4
    If Zwischenspeicher.Option4 Then
        Gegenstand_zurückgeben .laboption4_Kategorie.Caption, 4
        Zwischenspeicher.Option4 = 0
    End If
    .labOption4.BorderStyle = 0
    .ckbOption4.Value = 0
    .ckbOption4.Enabled = False
    .labOption4.Caption = ""
    .labOption4_Kosten.Caption = ""
    .laboption4_Kategorie.Caption = ""
    'OPTION 5
    .ckbOption5.Value = 0
    .ckbOption5.Enabled = False
    .labOption5.Caption = ""
    .labOption5_Kosten.Caption = ""
    'OPTION 6
    .ckbOption6.Value = 0
    .ckbOption6.Enabled = False
    .labOption6.Caption = ""
    .labOption6_Kosten.Caption = ""
    Optionen_Initalisieren = 0
    'REICHWEITE
    If .lab1Reichweite.Caption <> "" Then
        .lab1Reichweite.Caption = ""
        .lab1Stärke.Caption = ""
        .lab1Rettungswurf.Caption = ""
        .lab1Schaden.Caption = ""
        If .lab2Reichweite.Caption <> "" Then
            .lab2Reichweite.Caption = ""
            .lab2Stärke.Caption = ""
            .lab2Rettungswurf.Caption = ""
            .lab2Schaden.Caption = ""
        End If
    End If
    'MUSIKER UND STANDARTENTRÄGER
    If .ckbMusiker.Enabled Then
        .ckbMusiker.Enabled = False
        .ckbStandartenträger.Enabled = False
        .labMagische_Standarte.BorderStyle = 0
    End If
    End With
End If
End Sub

Public Sub Kriegsgerätinfo_anzeigen(dyna As Dynaset, Name As String, Indexnummer As Integer)
If Name <> "" Then
    dyna.MoveFirst
    Do Until dyna.Fields("Truppenname") = (Name)
        dyna.MoveNext
    Loop
    With frmHauptmenü
    'TRUPPENNAME_GROß
    .labTruppenname_groß.Caption = dyna.Fields("Truppenname")
    'TRUPPENTYP
    .labTruppentyp.Caption = dyna.Fields("Truppentyp")
    'KG_TRUPPENNAME
    .labTruppenname_klein.Caption = dyna.Fields("KG_Name")
    'KG_BEWEGUNG
    If IsNull(dyna.Fields("KG_Bewegung")) Then
        .labB.Caption = "-"
    Else
        .labB.Caption = dyna.Fields("KG_Bewegung")
    End If
    'KG_KAMPFGESCHICK
    If IsNull(dyna.Fields("KG_Kampfgeschick")) Then
        .labKG.Caption = "-"
    Else
        .labKG.Caption = dyna.Fields("KG_Kampfgeschick")
    End If
    'KG_BALLISTISCHE FERTIGKEITEN
    If IsNull(dyna.Fields("KG_Ballistische Fertigkeit")) Then
        .labBF.Caption = "-"
    Else
        .labBF.Caption = dyna.Fields("KG_Ballistische Fertigkeit")
    End If
    'KG_STÄRKE
    If IsNull(dyna.Fields("KG_Stärke")) Then
        .labS.Caption = "-"
    Else
        .labS.Caption = dyna.Fields("KG_Stärke")
    End If
    'KG_WIDERSTANDS FÄHIGKEIT
    If IsNull(dyna.Fields("KG_Widerstand")) Then
        .labW.Caption = "-"
    Else
        .labW.Caption = dyna.Fields("KG_Widerstand")
    End If
    'KG_LEBENSPUNKTE
    If IsNull(dyna.Fields("KG_Lebenspunkte")) Then
        .labLP.Caption = "-"
    Else
        .labLP.Caption = dyna.Fields("KG_Lebenspunkte")
    End If
    'KG_INITATIVE
    If IsNull(dyna.Fields("KG_Initative")) Then
        .labI.Caption = "-"
    Else
        .labI.Caption = dyna.Fields("KG_Initative")
    End If
    'KG_ATTACKEN
    If IsNull(dyna.Fields("KG_Attacken")) Then
        .labA.Caption = "-"
    Else
        .labA.Caption = dyna.Fields("KG_Attacken")
    End If
    'KG_MORALWERT
    If IsNull(dyna.Fields("KG_Moralwert")) Then
        .labMW.Caption = "-"
    Else
        .labMW.Caption = dyna.Fields("KG_Moralwert")
    End If
    'KG_RÜSTUNGSRETTUNGWURF
    If IsNull(dyna.Fields("KG_Rüstungsrettungswurf")) Then
        .labRW.Caption = "-"
    Else
        If dyna.Fields("KG_Rüstungsrettungswurf") < 6 Then
            .labRW.Caption = dyna.Fields("KG_Rüstungsrettungswurf") & "+"
        Else
            .labRW.Caption = dyna.Fields("KG_Rüstungsrettungswurf")
        End If
    End If
    'Anzahl
    If IsNull(dyna.Fields("Anzahl")) Then
        .labAnz.Caption = "-"
    Else
        .labAnz.Caption = dyna.Fields("Anzahl")
    End If
    'ZT_TRUPPENNAME_KLEIN
    .lab2truppenname_klein.BorderStyle = 0
    If IsNull(dyna.Fields("BS_Name")) And (.lab2truppenname_klein <> "") Then
        .lab2truppenname_klein.Caption = ""
        .labB2.Caption = ""
        .labKG2.Caption = ""
        .labBF2.Caption = ""
        .labS2.Caption = ""
        .labW2.Caption = ""
        .lablp2.Caption = ""
        .labi2.Caption = ""
        .laba2.Caption = ""
        .labmw2.Caption = ""
        .labrw2.Caption = ""
    Else
        If Not (IsNull(dyna.Fields("BS_Name"))) Then
            .lab2truppenname_klein.Caption = dyna.Fields("BS_Name")
            'BS_BEWEGUNG
            If IsNull(dyna.Fields("BS_Bewegung")) Then
                .labB2.Caption = "-"
            Else
                .labB2.Caption = dyna.Fields("BS_Bewegung")
            End If
            'BS_KAMPFGESCHICK
                If IsNull(dyna.Fields("BS_Kampfgeschick")) Then
                .labKG2.Caption = "-"
            Else
                .labKG2.Caption = dyna.Fields("BS_Kampfgeschick")
            End If
            'BS_BALLISTISCHE_FERTIGKEIT
            If IsNull(dyna.Fields("BS_Ballistische Fertigkeit")) Then
                .labBF2.Caption = "-"
            Else
                .labBF2.Caption = dyna.Fields("BS_Ballistische Fertigkeit")
            End If
            'BS_STÄRKE
            If IsNull(dyna.Fields("BS_Stärke")) Then
                .labS2.Caption = "-"
            Else
                .labS2.Caption = dyna.Fields("BS_Stärke")
            End If
            'BS_WIDERSTAND
            If IsNull(dyna.Fields("BS_Widerstand")) Then
                .labW2.Caption = "-"
            Else
                .labW2.Caption = dyna.Fields("BS_Widerstand")
            End If
            'BS_LEBENSPUNKTE
            If IsNull(dyna.Fields("BS_Lebenspunkte")) Then
                .lablp2.Caption = "-"
            Else
                .lablp2.Caption = dyna.Fields("BS_Lebenspunkte")
            End If
            'BS_INITATIVE
            If IsNull(dyna.Fields("BS_Initative")) Then
                .labi2.Caption = "-"
            Else
                .labi2.Caption = dyna.Fields("BS_Initative")
            End If
            'BS_ATTACKEN
            If IsNull(dyna.Fields("BS_Attacken")) Then
                .laba2.Caption = "-"
            Else
                .laba2.Caption = dyna.Fields("BS_Attacken")
            End If
            'BS_MORALWERT
            If IsNull(dyna.Fields("BS_Moralwert")) Then
                .labmw2.Caption = "-"
            Else
                .labmw2.Caption = dyna.Fields("BS_Moralwert")
            End If
            'BS_RÜSTUNGSRETTUNGWURF
            If IsNull(dyna.Fields("BS_Rüstungsrettungswurf")) Then
                .labrw2.Caption = "-"
            Else
                .labrw2.Caption = dyna.Fields("BS_Rüstungsrettungswurf")
            End If
        End If
    End If
    'ZT_TRUPPENNAME_KLEIN
    .lab3Truppenname_klein.BorderStyle = 0
    If IsNull(dyna.Fields("ZT_Name")) And (.lab3Truppenname_klein <> "") Then
        .lab3Truppenname_klein.Caption = ""
        .labB3.Caption = ""
        .labKG3.Caption = ""
        .labBF3.Caption = ""
        .labS3.Caption = ""
        .labW3.Caption = ""
        .labLP3.Caption = ""
        .labI3.Caption = ""
        .labA3.Caption = ""
        .labMW3.Caption = ""
        .labRW3.Caption = ""
    Else
        If Not (IsNull(dyna.Fields("ZT_Name"))) Then
            .lab3Truppenname_klein.Caption = dyna.Fields("ZT_Name")
            'ZT_BEWEGUNG
            If IsNull(dyna.Fields("ZT_Bewegung")) Then
                .labB3.Caption = "-"
            Else
                .labB3.Caption = dyna.Fields("ZT_Bewegung")
            End If
            'ZT_KAMPFGESCHICK
            If IsNull(dyna.Fields("ZT_Kampfgeschick")) Then
                .labKG3.Caption = "-"
            Else
                .labKG3.Caption = dyna.Fields("ZT_Kampfgeschick")
                End If
            'ZT_BALLISTISCHE FERTIGKEIT
            If IsNull(dyna.Fields("ZT_Ballistische Fertigkeit")) Then
                .labBF3.Caption = "-"
            Else
                .labBF3.Caption = dyna.Fields("ZT_Ballistische Fertigkeit")
            End If
            'ZT_STÄRKE
            If IsNull(dyna.Fields("ZT_Stärke")) Then
                .labS3.Caption = "-"
            Else
                .labS3.Caption = dyna.Fields("ZT_Stärke")
            End If
            'ZT_WIDERSTAND
            If IsNull(dyna.Fields("ZT_Widerstand")) Then
                .labW3.Caption = "-"
            Else
                .labW3.Caption = dyna.Fields("ZT_Widerstand")
            End If
            'ZT_LEBENSPUNKTE
            If IsNull(dyna.Fields("ZT_Lebenspunkte")) Then
                .labLP3.Caption = "-"
            Else
                .labLP3.Caption = dyna.Fields("ZT_Lebenspunkte")
            End If
            'ZT_INITATIVE
            If IsNull(dyna.Fields("ZT_Initative")) Then
                .labI3.Caption = "-"
            Else
                .labI3.Caption = dyna.Fields("ZT_Initative")
            End If
            'ZT_ATTACKEN
            If IsNull(dyna.Fields("ZT_Attacken")) Then
                .labA3.Caption = "-"
            Else
                .labA3.Caption = dyna.Fields("ZT_Attacken")
            End If
            'ZT_MORALWERT
            If IsNull(dyna.Fields("ZT_Moralwert")) Then
                .labMW3.Caption = "-"
            Else
                .labMW3.Caption = dyna.Fields("ZT_Moralwert")
            End If
            'ZT_RÜSTUNGSRETTUNGSWURF
            If IsNull(dyna.Fields("ZT_Rüstungsrettungswurf")) Then
                .labRW3.Caption = "-"
            Else
                .labRW3.Caption = dyna.Fields("ZT_Rüstungsrettungswurf")
            End If
        End If
    End If
    'WAFFE
    If -.labWaffe.BorderStyle Then
        .labWaffe.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Waffe")) Then
        .labWaffe.Caption = ""
    Else
        .labWaffe.Caption = dyna.Fields("Waffe")
    End If
    'RÜSTUNG
    If -.labRüstung.BorderStyle Then
        .labRüstung.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Rüstung")) Then
        .labRüstung.Caption = ""
    Else
        .labRüstung.Caption = dyna.Fields("Rüstung")
    End If
    'MUSIKER UND STANDARTENTRÄGER INITALISIEREN
    Optionen_Initalisieren = -1
    .ckbMusiker.Value = 0
    .ckbStandartenträger.Value = 0
    If Zwischenspeicher.Standarte Then
        frmMagische_Gegenstände.lstmagische_standarten.AddItem .labMagische_Standarte.Caption
        Zwischenspeicher.Standarte = 0
    End If
    .labMagische_Standarte.Caption = ""
    Optionen_Initalisieren = 0
    'EINZELKOSTEN
    .labEinzelkosten.Caption = dyna.Fields("Punktwert")
    'ANZAHL UND GESAMTKOSTEN
    If Indexnummer <> -1 Then
        Wandler = Kriegsgerätfeld(Indexnummer).Anzahl
        .labAnzahl = Wandler
    Else
        .labAnzahl = 1
    End If
    'OPTIONEN
    'OPTION 1
    If Zwischenspeicher.Option1 Then
        Gegenstand_zurückgeben .laboption1_Kategorie.Caption, 1
        Zwischenspeicher.Option1 = 0
    End If
    .laboption1_Kategorie.Caption = ""
    If -.labOption1.BorderStyle Then
        .labOption1.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option1_Text")) Then
        If .ckbOption1.Value Then
            Optionen_Initalisieren = -1
            .ckbOption1.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption1.Enabled = False
        .labOption1.Caption = ""
        .labOption1_Kosten.Caption = ""
    Else
        .ckbOption1.Enabled = True
        .labOption1.Caption = dyna.Fields("Option1_Text")
        .labOption1_Kosten.Caption = dyna.Fields("Option1_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption1.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption1.Value = Kriegsgerätfeld(Indexnummer).Option1
        End If
    End If
    'OPTION 2
    'Überprüfen ob noch ein Gegenstand im Zwischenspeicher liegt
    If Zwischenspeicher.Option2 Then
        Gegenstand_zurückgeben .laboption2_Kategorie.Caption, 2
        Zwischenspeicher.Option2 = 0
    End If
    'Option 2 zurücksetzen
    .laboption2_Kategorie.Caption = ""
    .labOption2.BorderStyle = 0
    'Überprüfen ob das Kriegsgerät Option 2 als Auswahl hat
    If IsNull(dyna.Fields("Option2_Text")) Then
        'Wenn keine Option 2 möglich, dann Checkbox deaktivieren ohne dies dabei auszulösen
        If .ckbOption2.Value Then
            Optionen_Initalisieren = -1
            .ckbOption2.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption2.Enabled = False
        'Bei Zwergenarmee Runensystem aktivieren
        If frmHauptmenü.Caption = "Zwerge" Then
            .labOption2.BorderStyle = 1
            If Indexnummer <> -1 Then
                If Kriegsgerätfeld(Indexnummer).Zwergenrunen_Kriegsgerät.Runenkosten <> 0 Then
                    .labOption2_Kosten = Kriegsgerätfeld(Indexnummer).Zwergenrunen_Kriegsgerät.Runenkosten
                    If .labOption2 <> "Zwergenrunen" Then
                        .labOption2 = "Zwergenrunen"
                    Else
                        Wandler = .labEinzelkosten + Kriegsgerätfeld(Indexnummer).Zwergenrunen_Kriegsgerät.Runenkosten
                        .labEinzelkosten = Wandler
                    End If
                    Zwergenrunen_Zwischenspeicher.Rune1 = Kriegsgerätfeld(Indexnummer).Zwergenrunen_Kriegsgerät.Rune1
                    Zwergenrunen_Zwischenspeicher.Rune2 = Kriegsgerätfeld(Indexnummer).Zwergenrunen_Kriegsgerät.Rune2
                    Zwergenrunen_Zwischenspeicher.Rune3 = Kriegsgerätfeld(Indexnummer).Zwergenrunen_Kriegsgerät.Rune3
                Else
                    .labOption2_Kosten.Caption = ""
                    .labOption2.Caption = ""
                End If
            Else
                .labOption2_Kosten.Caption = ""
                .labOption2.Caption = ""
            End If
        Else
        .labOption2.Caption = ""
        .labOption2_Kosten.Caption = ""
        End If
    Else
        .ckbOption2.Enabled = True
        .labOption2.Caption = dyna.Fields("Option2_Text")
        .labOption2_Kosten.Caption = dyna.Fields("Option2_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption2.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
                .ckbOption2.Value = Kriegsgerätfeld(Indexnummer).Option2
        End If
    End If
    'OPTION 3
    If Zwischenspeicher.Option3 Then
        Gegenstand_zurückgeben .laboption3_Kategorie.Caption, 3
        Zwischenspeicher.Option3 = 0
    End If
    .laboption3_Kategorie.Caption = ""
    If -.labOption3.BorderStyle Then
        .labOption3.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option3_Text")) Then
        If .ckbOption3.Value Then
            Optionen_Initalisieren = -1
            .ckbOption3.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption3.Enabled = False
        .labOption3.Caption = ""
        .labOption3_Kosten.Caption = ""
    Else
        .ckbOption3.Enabled = True
        .labOption3.Caption = dyna.Fields("Option3_Text")
        .labOption3_Kosten.Caption = dyna.Fields("Option3_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption3.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption3.Value = Kriegsgerätfeld(Indexnummer).Option3
        End If
    End If
    'OPTION 4
    If Zwischenspeicher.Option4 Then
        Gegenstand_zurückgeben .laboption4_Kategorie.Caption, 4
        Zwischenspeicher.Option4 = 0
    End If
    .laboption4_Kategorie.Caption = ""
    If -.labOption4.BorderStyle Then
        .labOption4.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option4_Text")) Then
        If .ckbOption4.Value Then
            Optionen_Initalisieren = -1
            .ckbOption4.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption4.Enabled = False
        .labOption4.Caption = ""
        .labOption4_Kosten.Caption = ""
    Else
        .ckbOption4.Enabled = True
        .labOption4.Caption = dyna.Fields("Option4_Text")
        .labOption4_Kosten.Caption = dyna.Fields("Option4_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption4.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption4.Value = Kriegsgerätfeld(Indexnummer).Option4
        End If
    End If
    'OPTION 5
    If IsNull(dyna.Fields("Option5_Text")) Then
        If .ckbOption5.Value Then
            Optionen_Initalisieren = -1
            .ckbOption5.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption5.Enabled = False
        .labOption5.Caption = ""
        .labOption5_Kosten.Caption = ""
    Else
        .ckbOption5.Enabled = True
        .labOption5.Caption = dyna.Fields("Option5_Text")
        .labOption5_Kosten.Caption = dyna.Fields("Option5_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption5.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption5.Value = Kriegsgerätfeld(Indexnummer).Option5
        End If
    End If
    'SONDERREGELN
    If IsNull(dyna.Fields("Sonderregeln")) Then
        .labsonderregeln.Caption = ""
    Else
        .labsonderregeln.Caption = dyna.Fields("Sonderregeln")
    End If
    'BESCHUß
    If IsNull(dyna.Fields("Reichweite1")) Then
        .lab1Reichweite.Caption = ""
        .lab1Stärke.Caption = ""
        .lab1Rettungswurf.Caption = ""
        .lab1Schaden.Caption = ""
    Else
        .lab1Reichweite.Caption = dyna.Fields("Reichweite1")
        .lab1Stärke.Caption = dyna.Fields("Stärke1")
        .lab1Rettungswurf.Caption = dyna.Fields("Rettungswurf1")
        .lab1Schaden.Caption = dyna.Fields("Schaden1")
    End If
    If IsNull(dyna.Fields("Reichweite2")) Then
        .lab2Reichweite.Caption = ""
        .lab2Stärke.Caption = ""
        .lab2Rettungswurf.Caption = ""
        .lab2Schaden.Caption = ""
    Else
        .lab2Reichweite.Caption = dyna.Fields("Reichweite2")
        .lab2Stärke.Caption = dyna.Fields("Stärke2")
        .lab2Rettungswurf.Caption = dyna.Fields("Rettungswurf2")
        .lab2Schaden.Caption = dyna.Fields("Schaden2")
    End If
    
    'LEEREN
    'OPTION 6
    .ckbOption6.Enabled = False
    .labOption6.Caption = ""
    .labOption6_Kosten.Caption = ""
    'MUSIKER UND STANDARTENTRÄGER
    If .ckbMusiker.Enabled Then
        If .ckbOption6.Value Then
            Optionen_Initalisieren = -1
            .ckbOption6.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbMusiker.Enabled = False
        .ckbStandartenträger.Enabled = False
        .labMagische_Standarte.BorderStyle = 0
    End If
    'FERNWAFFE
    If -.labfernwaffe.BorderStyle Then
        .labfernwaffe.BorderStyle = 0
    End If
    .labfernwaffe.Caption = ""
    End With
End If
End Sub

Public Sub Konsequenz_einfügen(Name As String)
Select Case Name
    Case "Schild"
        Schild_anlegen
    Case "leichte Rüstung"
        leichte_Ruestung_anlegen
    Case "schwere Rüstung"
        schwere_Ruestung_anlegen
    Case "Harnisch"
        Harnisch_anlegen
    Case "Chaosrüstung"
        Chaosrüstung_anlegen
    Case "Hellebarde"
        Hellebarde_anlegen
    Case "zweihändige Waffe"
        zweihändige_Waffe_anlegen
    Case "Speer"
        Speer_anlegen
    Case "zweite Handwaffe"
        zweite_Handwaffe_anlegen
    Case "Lanze"
        Lanze_anlegen
    Case "Kurzbogen"
        Kurzbogen_anlegen
    Case "Bogen"
        Bogen_anlegen
    Case "Langbogen"
        Langbogen_anlegen
    Case "Repetier-Armbrust"
        Repetier_Armbrust_anlegen
'Case "Drittes Besatzungsmitglied"
'    .ckbOption2.Value = 0
'    .ckbOption3.Value = 0
'    Wandler = .labOption2_Kosten * 1.5
'    .labOption2_Kosten.Caption = Wandler
'    Wandler = 0 + .labOption3_Kosten.Caption * 1.5
'    .labOption3_Kosten.Caption = Wandler
End Select
End Sub



Public Sub Konsequenz_herausnehmen(Name As String)
Select Case Name
    Case "Schild"
        Schild_ablegen
    Case "leichte Rüstung"
        leichte_Rüstung_ablegen
    Case "schwere Rüstung"
        schwere_Ruestung_ablegen
    Case "Harnisch"
        Harnisch_ablegen
    Case "Chaosrüstung"
        Chaosrüstung_ablegen
    Case "Hellebarde"
        Hellebarde_ablegen
    Case "zweihändige Waffe"
        zweihändige_Waffe_ablegen
    Case "Speer"
        Speer_ablegen
    Case "zweite Handwaffe"
        zweite_Handwaffe_ablegen
    Case "Lanze"
        Lanze_ablegen
'Case "Drittes Besatzungsmitglied"
'    .ckbOption2.Value = 0
'    .ckbOption3.Value = 0
'    Wandler = .labOption2_Kosten.Caption / 1.5
'    .labOption2_Kosten.Caption = Wandler
'    Wandler = .labOption3_Kosten.Caption / 1.5
'    .labOption3_Kosten.Caption = Wandler
End Select
End Sub



Public Sub Regimenter_anzeigen(dyna As Dynaset, Name As String, Indexnummer As Integer)
If Name <> "" Then
    dyna.MoveFirst
    Do Until dyna.Fields("Truppenname") = Name
        dyna.MoveNext
    Loop
    With frmHauptmenü
    'TRUPPENNAME_GROß
    .labTruppenname_groß.Caption = dyna.Fields("Truppenname")
    'TRUPPENTYP
    .labTruppentyp.Caption = dyna.Fields("Truppentyp")
    'KG_TRUPPENNAME
    .labTruppenname_klein.Caption = dyna.Fields("KG_Name")
    'KG_BEWEGUNG
    If IsNull(dyna.Fields("KG_Bewegung")) Then
        .labB.Caption = "-"
    Else
        .labB.Caption = dyna.Fields("KG_Bewegung")
    End If
    'KG_KAMPFGESCHICK
    If IsNull(dyna.Fields("KG_Kampfgeschick")) Then
        .labKG.Caption = "-"
    Else
        .labKG.Caption = dyna.Fields("KG_Kampfgeschick")
    End If
    'KG_BALLISTISCHE FERTIGKEITEN
    If IsNull(dyna.Fields("KG_Ballistische Fertigkeit")) Then
        .labBF.Caption = "-"
    Else
        .labBF.Caption = dyna.Fields("KG_Ballistische Fertigkeit")
    End If
    'KG_STÄRKE
    If IsNull(dyna.Fields("KG_Stärke")) Then
        .labS.Caption = "-"
    Else
        .labS.Caption = dyna.Fields("KG_Stärke")
    End If
    'KG_WIDERSTANDS FÄHIGKEIT
    If IsNull(dyna.Fields("KG_Widerstand")) Then
        .labW.Caption = "-"
    Else
        .labW.Caption = dyna.Fields("KG_Widerstand")
    End If
    'KG_LEBENSPUNKTE
    If IsNull(dyna.Fields("KG_Lebenspunkte")) Then
        .labLP.Caption = "-"
    Else
        .labLP.Caption = dyna.Fields("KG_Lebenspunkte")
    End If
    'KG_INITATIVE
    If IsNull(dyna.Fields("KG_Initative")) Then
        .labI.Caption = "-"
    Else
        .labI.Caption = dyna.Fields("KG_Initative")
    End If
    'KG_ATTACKEN
    If IsNull(dyna.Fields("KG_Attacken")) Then
        .labA.Caption = "-"
    Else
        .labA.Caption = dyna.Fields("KG_Attacken")
    End If
    'KG_MORALWERT
    If IsNull(dyna.Fields("KG_Moralwert")) Then
        .labMW.Caption = "-"
    Else
        .labMW.Caption = dyna.Fields("KG_Moralwert")
    End If
    'KG_RÜSTUNGSRETTUNGWURF
    If IsNull(dyna.Fields("KG_Rüstungsrettungswurf")) Then
        .labRW.Caption = "-"
    Else
        If dyna.Fields("KG_Rüstungsrettungswurf") < 6 Then
            .labRW.Caption = dyna.Fields("KG_Rüstungsrettungswurf") & "+"
        Else
            .labRW.Caption = dyna.Fields("KG_Rüstungsrettungswurf")
        End If
    End If
    'Anzahl
    If IsNull(dyna.Fields("Anzahl")) Then
        .labAnz.Caption = "-"
    Else
        .labAnz.Caption = dyna.Fields("Anzahl")
    End If

    'BS_TRUPPENNAME_KLEIN
    .lab2truppenname_klein.BorderStyle = 0
    If IsNull(dyna.Fields("BS_Name")) And (.lab2truppenname_klein <> "") Then
        .lab2truppenname_klein.Caption = ""
        .labB2.Caption = ""
        .labKG2.Caption = ""
        .labBF2.Caption = ""
        .labS2.Caption = ""
        .labW2.Caption = ""
        .lablp2.Caption = ""
        .labi2.Caption = ""
        .laba2.Caption = ""
        .labmw2.Caption = ""
        .labrw2.Caption = ""
    Else
        If Not (IsNull(dyna.Fields("BS_Name"))) Then
            .lab2truppenname_klein.Caption = dyna.Fields("BS_Name")
            'BS_BEWEGUNG
            If IsNull(dyna.Fields("BS_Bewegung")) Then
                .labB2.Caption = "-"
            Else
                .labB2.Caption = dyna.Fields("BS_Bewegung")
            End If
            'BS_KAMPFGESCHICK
            If IsNull(dyna.Fields("BS_Kampfgeschick")) Then
                .labKG2.Caption = "-"
            Else
                .labKG2.Caption = dyna.Fields("BS_Kampfgeschick")
            End If
            'BS_BALLISTISCHE_FERTIGKEIT
            If IsNull(dyna.Fields("BS_Ballistische Fertigkeit")) Then
                .labBF2.Caption = "-"
            Else
                .labBF2.Caption = dyna.Fields("BS_Ballistische Fertigkeit")
            End If
            'BS_STÄRKE
            If IsNull(dyna.Fields("BS_Stärke")) Then
                .labS2.Caption = "-"
            Else
                .labS2.Caption = dyna.Fields("BS_Stärke")
            End If
            'BS_WIDERSTAND
            If IsNull(dyna.Fields("BS_Widerstand")) Then
                .labW2.Caption = "-"
            Else
                .labW2.Caption = dyna.Fields("BS_Widerstand")
            End If
            'BS_LEBENSPUNKTE
            If IsNull(dyna.Fields("BS_Lebenspunkte")) Then
                .lablp2.Caption = "-"
            Else
                .lablp2.Caption = dyna.Fields("BS_Lebenspunkte")
            End If
            'BS_INITATIVE
            If IsNull(dyna.Fields("BS_Initative")) Then
                .labi2.Caption = "-"
            Else
                .labi2.Caption = dyna.Fields("BS_Initative")
            End If
            'BS_ATTACKEN
            If IsNull(dyna.Fields("BS_Attacken")) Then
                .laba2.Caption = "-"
            Else
                .laba2.Caption = dyna.Fields("BS_Attacken")
            End If
            'BS_MORALWERT
            If IsNull(dyna.Fields("BS_Moralwert")) Then
                .labmw2.Caption = "-"
            Else
                .labmw2.Caption = dyna.Fields("BS_Moralwert")
            End If
            'BS_RÜSTUNGSRETTUNGWURF
            If IsNull(dyna.Fields("BS_Rüstungsrettungswurf")) Then
                .labrw2.Caption = "-"
            Else
                .labrw2.Caption = dyna.Fields("BS_Rüstungsrettungswurf")
            End If
        End If
    End If
    'ZT_TRUPPENNAME_KLEIN
    .lab3Truppenname_klein.BorderStyle = 0
    If IsNull(dyna.Fields("ZT_Name")) And (.lab3Truppenname_klein <> "") Then
        .lab3Truppenname_klein.Caption = ""
        .labB3.Caption = ""
        .labKG3.Caption = ""
        .labBF3.Caption = ""
        .labS3.Caption = ""
        .labW3.Caption = ""
        .labLP3.Caption = ""
        .labI3.Caption = ""
        .labA3.Caption = ""
        .labMW3.Caption = ""
        .labRW3.Caption = ""
    Else
        If Not (IsNull(dyna.Fields("ZT_Name"))) Then
            .lab3Truppenname_klein.Caption = dyna.Fields("ZT_Name")
            'ZT_BEWEGUNG
            If IsNull(dyna.Fields("ZT_Bewegung")) Then
                .labB3.Caption = "-"
            Else
                .labB3.Caption = dyna.Fields("ZT_Bewegung")
            End If
            'ZT_KAMPFGESCHICK
            If IsNull(dyna.Fields("ZT_Kampfgeschick")) Then
                .labKG3.Caption = "-"
            Else
                .labKG3.Caption = dyna.Fields("ZT_Kampfgeschick")
            End If
            'ZT_BALLISTISCHE FERTIGKEIT
            If IsNull(dyna.Fields("ZT_Ballistische Fertigkeit")) Then
                .labBF3.Caption = "-"
            Else
                .labBF3.Caption = dyna.Fields("ZT_Ballistische Fertigkeit")
            End If
            'ZT_STÄRKE
            If IsNull(dyna.Fields("ZT_Stärke")) Then
                .labS3.Caption = "-"
            Else
                .labS3.Caption = dyna.Fields("ZT_Stärke")
            End If
            'ZT_WIDERSTAND
            If IsNull(dyna.Fields("ZT_Widerstand")) Then
                .labW3.Caption = "-"
            Else
                .labW3.Caption = dyna.Fields("ZT_Widerstand")
            End If
            'ZT_LEBENSPUNKTE
            If IsNull(dyna.Fields("ZT_Lebenspunkte")) Then
                .labLP3.Caption = "-"
            Else
                .labLP3.Caption = dyna.Fields("ZT_Lebenspunkte")
            End If
            'ZT_INITATIVE
            If IsNull(dyna.Fields("ZT_Initative")) Then
                .labI3.Caption = "-"
            Else
                .labI3.Caption = dyna.Fields("ZT_Initative")
            End If
            'ZT_ATTACKEN
            If IsNull(dyna.Fields("ZT_Attacken")) Then
                .labA3.Caption = "-"
            Else
                .labA3.Caption = dyna.Fields("ZT_Attacken")
            End If
            'ZT_MORALWERT
            If IsNull(dyna.Fields("ZT_Moralwert")) Then
                .labMW3.Caption = "-"
            Else
                .labMW3.Caption = dyna.Fields("ZT_Moralwert")
            End If
            'ZT_RÜSTUNGSRETTUNGSWURF
            If IsNull(dyna.Fields("ZT_Rüstungsrettungswurf")) Then
                .labRW3.Caption = "-"
            Else
                .labRW3.Caption = dyna.Fields("ZT_Rüstungsrettungswurf")
            End If
        End If
        'WAFFE
        If -.labWaffe.BorderStyle Then
            .labWaffe.BorderStyle = 0
        End If
        If IsNull(dyna.Fields("Waffe")) Then
            .labWaffe.Caption = ""
        Else
            .labWaffe.Caption = dyna.Fields("Waffe")
        End If
        'RÜSTUNG
        If -.labRüstung.BorderStyle Then
            .labRüstung.BorderStyle = 0
        End If
        If IsNull(dyna.Fields("Rüstung")) Then
            .labRüstung.Caption = ""
        Else
            .labRüstung.Caption = dyna.Fields("Rüstung")
        End If
        'FERNWAFFE
        If -.labfernwaffe.BorderStyle Then
            .labfernwaffe.BorderStyle = 0
        End If
        If IsNull(dyna.Fields("Fernwaffe")) Then
            .labfernwaffe.Caption = ""
        Else
            .labfernwaffe.Caption = dyna.Fields("Fernwaffe")
        End If
    End If
    'SONDERREGELN
    If IsNull(dyna.Fields("Sonderregeln")) Then
        .labsonderregeln.Caption = ""
    Else
        .labsonderregeln.Caption = dyna.Fields("Sonderregeln")
    End If
    'MUSIKER UND STANDARTENTRÄGER INITALISIEREN
    Optionen_Initalisieren = -1
    .ckbMusiker.Value = 0
    .ckbStandartenträger.Value = 0
    If Zwischenspeicher.Standarte Then
        frmMagische_Gegenstände.lstmagische_standarten.AddItem .labMagische_Standarte.Caption
        Zwischenspeicher.Standarte = 0
    End If
    .labMagische_Standarte = ""
    Optionen_Initalisieren = 0
    'BASIS PUNKTWERT
    .labEinzelkosten.Caption = dyna.Fields("Punktwert")
    If Indexnummer <> -1 Then
        Wandler = Regimenterfeld(Indexnummer).Anzahl
        .labAnzahl.Caption = Wandler
    Else
        .labAnzahl.Caption = "1"
    End If
    'OPTIONEN
    'OPTION 1
    If Zwischenspeicher.Option1 Then
        Gegenstand_zurückgeben .laboption1_Kategorie.Caption, 1
        Zwischenspeicher.Option1 = 0
    End If
    .laboption1_Kategorie.Caption = ""
    If -.labOption1.BorderStyle Then
        .labOption1.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option1_Text")) Then
        If .ckbOption1.Value Then
            Optionen_Initalisieren = -1
            .ckbOption1.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption1.Enabled = False
        .labOption1.Caption = ""
        .labOption1_Kosten.Caption = ""
    Else
        .ckbOption1.Enabled = True
        .labOption1.Caption = dyna.Fields("Option1_Text")
        .labOption1_Kosten.Caption = dyna.Fields("Option1_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption1.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption1.Value = Regimenterfeld(Indexnummer).Option1
        End If
    End If
    'OPTION 2
    If Zwischenspeicher.Option2 Then
        Gegenstand_zurückgeben .laboption2_Kategorie.Caption, 2
        Zwischenspeicher.Option2 = 0
    End If
    .laboption2_Kategorie.Caption = ""
    If -.labOption2.BorderStyle Then
        .labOption2.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option2_Text")) Then
        If .ckbOption2.Value Then
            Optionen_Initalisieren = -1
            .ckbOption2.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption2.Enabled = False
        .labOption2.Caption = ""
        .labOption2_Kosten.Caption = ""
    Else
        .ckbOption2.Enabled = True
        .labOption2.Caption = dyna.Fields("Option2_Text")
        .labOption2_Kosten.Caption = dyna.Fields("Option2_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption2.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
                .ckbOption2.Value = Regimenterfeld(Indexnummer).Option2
        End If
    End If
    'OPTION 3
    If Zwischenspeicher.Option3 Then
        Gegenstand_zurückgeben .laboption3_Kategorie.Caption, 3
        Zwischenspeicher.Option3 = 0
    End If
    .laboption3_Kategorie.Caption = ""
    If -.labOption3.BorderStyle Then
        .labOption3.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option3_Text")) Then
        If .ckbOption3.Value Then
            Optionen_Initalisieren = -1
            .ckbOption3.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption3.Enabled = False
        .labOption3.Caption = ""
        .labOption3_Kosten.Caption = ""
    Else
        .ckbOption3.Enabled = True
        .labOption3.Caption = dyna.Fields("Option3_Text")
        .labOption3_Kosten.Caption = dyna.Fields("Option3_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption3.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption3.Value = Regimenterfeld(Indexnummer).Option3
        End If
    End If
    'OPTION 4
    If Zwischenspeicher.Option4 Then
        Gegenstand_zurückgeben .laboption4_Kategorie.Caption, 4
        Zwischenspeicher.Option4 = 0
    End If
    .laboption4_Kategorie.Caption = ""
    If -.labOption4.BorderStyle Then
        .labOption4.BorderStyle = 0
    End If
    If IsNull(dyna.Fields("Option4_Text")) Then
        If .ckbOption4.Value Then
            Optionen_Initalisieren = -1
            .ckbOption4.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption4.Enabled = False
        .labOption4.Caption = ""
        .labOption4_Kosten.Caption = ""
    Else
        .ckbOption4.Enabled = True
        .labOption4.Caption = dyna.Fields("Option4_Text")
        .labOption4_Kosten.Caption = dyna.Fields("Option4_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption4.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption4.Value = Regimenterfeld(Indexnummer).Option4
        End If
    End If
    'OPTION 5
    If IsNull(dyna.Fields("Option5_Text")) Then
        If .ckbOption5.Value Then
            Optionen_Initalisieren = -1
            .ckbOption5.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption5.Enabled = False
        .labOption5.Caption = ""
        .labOption5_Kosten.Caption = ""
    Else
        .ckbOption5.Enabled = True
        .labOption5.Caption = dyna.Fields("Option5_Text")
        .labOption5_Kosten.Caption = dyna.Fields("Option5_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption5.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption5.Value = Regimenterfeld(Indexnummer).Option5
        End If
    End If
    'OPTION 6
    If IsNull(dyna.Fields("Option6_Text")) Then
         If .ckbOption6.Value Then
            Optionen_Initalisieren = -1
            .ckbOption6.Value = 0
            Optionen_Initalisieren = 0
        End If
       .ckbOption6.Enabled = False
        .labOption6.Caption = ""
        .labOption6_Kosten.Caption = ""
    Else
        .ckbOption6.Enabled = True
        .labOption6.Caption = dyna.Fields("Option6_Text")
        .labOption6_Kosten.Caption = dyna.Fields("Option6_Punkte")
        Optionen_Initalisieren = -1
        .ckbOption6.Value = 0
        Optionen_Initalisieren = 0
        If Indexnummer <> -1 Then
            .ckbOption6.Value = Regimenterfeld(Indexnummer).Option6
        End If
    End If
    'MUSIKER UND STANDARTENTRÄGER
    .labMagische_Standarte.BorderStyle = 0
    'Überprüfen ob das Regiment Musiker und Standartenträger haben darf
    If dyna.Fields("Musiker und Standartenträger") Then
        If Not .ckbMusiker.Enabled Then
            .ckbMusiker.Enabled = True
            .ckbStandartenträger.Enabled = True
        End If
        'Überprüfen ob das Regiment eine magische Standarte mit sich führen darf
        If dyna.Fields("Magische Standarte") Then
            .labMagische_Standarte.BorderStyle = 1
        End If
        'Überprüfen ob das Regiment schon bezahlt ist
        If Indexnummer <> -1 Then
            'Checkbox für Musiker und Standartenträger einstellen
            .ckbMusiker.Value = Regimenterfeld(Indexnummer).Musiker
            .ckbStandartenträger.Value = Regimenterfeld(Indexnummer).Standartenträger
            'Magische Standarte anzeigen
            If dyna.Fields("Magische Standarte") Then
                If Regimenterfeld(Indexnummer).MagischeStandarte.Rune1 <> "" Then
                    'Überprüfen ob es sich um Zwergenrunen handelt
                    If frmHauptmenü.Caption <> "Zwerge" Then
                        .labMagische_Standarte = Regimenterfeld(Indexnummer).MagischeStandarte.Rune1
                    Else
                        'Zwergenrunen als Standarte anzeigen
                        .labMagische_Standarte = "Zwergenrunen (" & Regimenterfeld(Indexnummer).MagischeStandarte.Runenkosten & ")"
                        'Zwergenrunen in Zwergenrunen_Zwischenspeicher legen
                        Zwergenrunen_Zwischenspeicher.Rune1 = Regimenterfeld(Indexnummer).MagischeStandarte.Rune1
                        Zwergenrunen_Zwischenspeicher.Rune2 = Regimenterfeld(Indexnummer).MagischeStandarte.Rune2
                        Zwergenrunen_Zwischenspeicher.Rune3 = Regimenterfeld(Indexnummer).MagischeStandarte.Rune3
                    End If
                Else
                    .labMagische_Standarte.Caption = ""
                End If
            End If
        End If
    Else
        If .ckbMusiker.Enabled Then
            .ckbMusiker.Enabled = False
            .ckbStandartenträger.Enabled = False
            .labMagische_Standarte.BorderStyle = 0
        End If
    End If
    'REICHWEITE
    If .lab1Reichweite.Caption <> "" Then
        .lab1Reichweite.Caption = ""
        .lab1Stärke.Caption = ""
        .lab1Rettungswurf.Caption = ""
        .lab1Schaden.Caption = ""
    End If
    If .lab2Reichweite.Caption <> "" Then
        .lab2Reichweite.Caption = ""
        .lab2Stärke.Caption = ""
        .lab2Rettungswurf.Caption = ""
        .lab2Schaden.Caption = ""
    End If
    End With
End If
End Sub

Public Sub zweihändige_Waffe_löschen()
With frmHauptmenü
If .labOption1.Caption = "zweihändige Waffe" Then
    .ckbOption1.Value = 0
End If
If .labOption2.Caption = "zweihändige Waffe" Then
    .ckbOption2.Value = 0
End If
If .labOption3.Caption = "zweihändige Waffe" Then
    .ckbOption3.Value = 0
End If
If .labOption4.Caption = "zweihändige Waffe" Then
    .ckbOption4.Value = 0
End If
If .labOption5.Caption = "zweihändige Waffe" Then
    .ckbOption5.Value = 0
End If
If .labOption6.Caption = "zweihändige Waffe" Then
    .ckbOption6.Value = 0
End If
End With
End Sub

Public Sub Hellebarde_löschen()
With frmHauptmenü
    If .labOption1.Caption = "Hellebarde" Then
        .ckbOption1.Value = 0
    End If
    If .labOption2.Caption = "Hellebarde" Then
        .ckbOption2.Value = 0
    End If
    If .labOption3.Caption = "Hellebarde" Then
        .ckbOption3.Value = 0
    End If
    If .labOption4.Caption = "Hellebarde" Then
        .ckbOption4.Value = 0
    End If
    If .labOption5.Caption = "Hellebarde" Then
        .ckbOption5.Value = 0
    End If
    If .labOption6.Caption = "Hellebarde" Then
        .ckbOption6.Value = 0
    End If
End With
End Sub

Public Sub Speer_löschen()
With frmHauptmenü
If .labOption1.Caption = "Speer" Then
    .ckbOption1.Value = 0
End If
If .labOption2.Caption = "Speer" Then
    .ckbOption2.Value = 0
End If
If .labOption3.Caption = "Speer" Then
    .ckbOption3.Value = 0
End If
If .labOption4.Caption = "Speer" Then
    .ckbOption4.Value = 0
End If
If .labOption5.Caption = "Speer" Then
    .ckbOption5.Value = 0
End If
If .labOption6.Caption = "Speer" Then
    .ckbOption6.Value = 0
End If
End With

End Sub

Public Sub zweite_Handwaffe_löschen()
With frmHauptmenü
If .labOption1.Caption = "zweite Handwaffe" Then
    .ckbOption1.Value = 0
End If
If .labOption2.Caption = "zweite Handwaffe" Then
    .ckbOption2.Value = 0
End If
If .labOption3.Caption = "zweite Handwaffe" Then
    .ckbOption3.Value = 0
End If
If .labOption4.Caption = "zweite Handwaffe" Then
    .ckbOption4.Value = 0
End If
If .labOption5.Caption = "zweite Handwaffe" Then
    .ckbOption5.Value = 0
End If
If .labOption6.Caption = "zweite Handwaffe" Then
    .ckbOption6.Value = 0
End If
End With
End Sub

Public Sub Charakter_anzeigen(dyna As Dynaset, Name As String, Indexnummer As Integer)
If Name <> "" Then
    dyna.MoveFirst
    Do Until dyna.Fields("Truppenname") = Name
        dyna.MoveNext
    Loop
    With frmHauptmenü
    'TRUPPENNAME_GROß
    .labTruppenname_groß.Caption = dyna.Fields("Truppenname")
    'TRUPPENTYP
    .labTruppentyp.Caption = dyna.Fields("Truppentyp")
    'KG_TRUPPENNAME
    .labTruppenname_klein.Caption = dyna.Fields("KG_Name")
    'KG_BEWEGUNG
    If IsNull(dyna.Fields("KG_Bewegung")) Then
        .labB.Caption = "-"
    Else
        .labB.Caption = dyna.Fields("KG_Bewegung")
    End If
    'KG_KAMPFGESCHICK
    If IsNull(dyna.Fields("KG_Kampfgeschick")) Then
        .labKG.Caption = "-"
    Else
        .labKG.Caption = dyna.Fields("KG_Kampfgeschick")
    End If
    'KG_BALLISTISCHE FERTIGKEITEN
    If IsNull(dyna.Fields("KG_Ballistische Fertigkeit")) Then
        .labBF.Caption = "-"
    Else
        .labBF.Caption = dyna.Fields("KG_Ballistische Fertigkeit")
    End If
    'KG_STÄRKE
    If IsNull(dyna.Fields("KG_Stärke")) Then
        .labS.Caption = "-"
    Else
        .labS.Caption = dyna.Fields("KG_Stärke")
    End If
    'KG_WIDERSTANDS FÄHIGKEIT
    If IsNull(dyna.Fields("KG_Widerstand")) Then
        .labW.Caption = "-"
    Else
        .labW.Caption = dyna.Fields("KG_Widerstand")
    End If
    'KG_LEBENSPUNKTE
    If IsNull(dyna.Fields("KG_Lebenspunkte")) Then
        .labLP.Caption = "-"
    Else
        .labLP.Caption = dyna.Fields("KG_Lebenspunkte")
    End If
    'KG_INITATIVE
    If IsNull(dyna.Fields("KG_Initative")) Then
        .labI.Caption = "-"
    Else
        .labI.Caption = dyna.Fields("KG_Initative")
    End If
    'KG_ATTACKEN
    If IsNull(dyna.Fields("KG_Attacken")) Then
        .labA.Caption = "-"
    Else
        .labA.Caption = dyna.Fields("KG_Attacken")
    End If
    'KG_MORALWERT
    If IsNull(dyna.Fields("KG_Moralwert")) Then
        .labMW.Caption = "-"
    Else
        .labMW.Caption = dyna.Fields("KG_Moralwert")
    End If
    'KG_RÜSTUNGSRETTUNGWURF
    If IsNull(dyna.Fields("KG_Rüstungsrettungswurf")) Then
        .labRW.Caption = "-"
    Else
        If dyna.Fields("KG_Rüstungsrettungswurf") < 6 Then
            .labRW.Caption = dyna.Fields("KG_Rüstungsrettungswurf") & "+"
        Else
            .labRW.Caption = dyna.Fields("KG_Rüstungsrettungswurf")
        End If
    End If
    'Anzahl
    If IsNull(dyna.Fields("Anzahl")) Then
        .labAnz.Caption = "-"
    Else
        .labAnz.Caption = dyna.Fields("Anzahl")
    End If
    'BS_TRUPPENNAME_KLEIN
    .lab2truppenname_klein.BorderStyle = 0
    If Not IsNull(dyna.Fields("BS_Name")) Then
        Reittier_anzeigen_dsCharakter dsCharakter
    Else
        If .lab2truppenname_klein = "" Then
            If Indexnummer = -1 Then
                If dyna.Fields("Reittier") Then
                    .lab2truppenname_klein.BorderStyle = 1
                End If
            Else
                If dyna.Fields("Reittier") Then
                    If Charakterfeld(Indexnummer).Reittier <> "" Then
                        Wandler = Left(Charakterfeld(Indexnummer).Reittier, InStr(Charakterfeld(Indexnummer).Reittier, "(") - 2)
                        Wandler = "[Truppenname] = '" & Wandler & "'"
                        dsReittiere.MoveFirst
                        dsReittiere.FindFirst Wandler
                        Reittier_anzeigen_dsReittier dsReittiere
                        .lab2truppenname_klein.BorderStyle = 1
                    Else
                        .lab2truppenname_klein.BorderStyle = 1
                    End If
                End If
            End If
        Else
            If Indexnummer = -1 Then
                Reittier_leeren
                If dyna.Fields("Reittier") Then
                    .lab2truppenname_klein.BorderStyle = 1
                End If
            Else
                If dyna.Fields("Reittier") Then
                    If Charakterfeld(Indexnummer).Reittier <> "" Then
                        Wandler = Left(Charakterfeld(Indexnummer).Reittier, InStr(Charakterfeld(Indexnummer).Reittier, "(") - 2)
                        Wandler = "[Truppenname] = '" & Wandler & "'"
                        dsReittiere.MoveFirst
                        dsReittiere.FindFirst Wandler
                        Reittier_anzeigen_dsReittier dsReittiere
                        .lab2truppenname_klein.BorderStyle = 1
                    Else
                        Reittier_leeren
                        .lab2truppenname_klein.BorderStyle = 1
                    End If
                Else
                    Reittier_leeren
                End If
            End If
        End If
    End If
    'ZT_TRUPPENNAME_KLEIN
    If IsNull(dyna.Fields("ZT_Name")) And (.lab3Truppenname_klein <> "") Then
        .lab3Truppenname_klein.BorderStyle = 0
        .lab3Truppenname_klein.Caption = ""
        .labB3.Caption = ""
        .labKG3.Caption = ""
        .labBF3.Caption = ""
        .labS3.Caption = ""
        .labW3.Caption = ""
        .labLP3.Caption = ""
        .labI3.Caption = ""
        .labA3.Caption = ""
        .labMW3.Caption = ""
        .labRW3.Caption = ""
    Else
        If Not IsNull(dyna.Fields("ZT_Name")) Then
            .lab3Truppenname_klein.BorderStyle = 0
            .lab3Truppenname_klein.Caption = dyna.Fields("ZT_Name")
            'ZT_BEWEGUNG
            If IsNull(dyna.Fields("ZT_Bewegung")) Then
                .labB3.Caption = "-"
            Else
                .labB3.Caption = dyna.Fields("ZT_Bewegung")
            End If
            'ZT_KAMPFGESCHICK
            If IsNull(dyna.Fields("ZT_Kampfgeschick")) Then
                .labKG3.Caption = "-"
            Else
                .labKG3.Caption = dyna.Fields("ZT_Kampfgeschick")
            End If
            'ZT_BALLISTISCHE FERTIGKEIT
            If IsNull(dyna.Fields("ZT_Ballistische Fertigkeit")) Then
                .labBF3.Caption = "-"
            Else
                .labBF3.Caption = dyna.Fields("ZT_Ballistische Fertigkeit")
            End If
            'ZT_STÄRKE
            If IsNull(dyna.Fields("ZT_Stärke")) Then
                .labS3.Caption = "-"
            Else
                .labS3.Caption = dyna.Fields("ZT_Stärke")
            End If
            'ZT_WIDERSTAND
            If IsNull(dyna.Fields("ZT_Widerstand")) Then
                .labW3.Caption = "-"
            Else
                .labW3.Caption = dyna.Fields("ZT_Widerstand")
            End If
            'ZT_LEBENSPUNKTE
            If IsNull(dyna.Fields("ZT_Lebenspunkte")) Then
                .labLP3.Caption = "-"
            Else
                .labLP3.Caption = dyna.Fields("ZT_Lebenspunkte")
            End If
            'ZT_INITATIVE
            If IsNull(dyna.Fields("ZT_Initative")) Then
                .labI3.Caption = "-"
            Else
                .labI3.Caption = dyna.Fields("ZT_Initative")
            End If
            'ZT_ATTACKEN
            If IsNull(dyna.Fields("ZT_Attacken")) Then
                .labA3.Caption = "-"
            Else
                .labA3.Caption = dyna.Fields("ZT_Attacken")
            End If
            'ZT_MORALWERT
            If IsNull(dyna.Fields("ZT_Moralwert")) Then
                .labMW3.Caption = "-"
            Else
                .labMW3.Caption = dyna.Fields("ZT_Moralwert")
            End If
            'ZT_RÜSTUNGSRETTUNGSWURF
            If IsNull(dyna.Fields("ZT_Rüstungsrettungswurf")) Then
                .labRW3.Caption = "-"
            Else
                .labRW3.Caption = dyna.Fields("ZT_Rüstungsrettungswurf")
            End If
        End If
    End If
    'AUSRÜSTUNG INITALISIEREN
    'WAFFE
    .labWaffe.BorderStyle = 0
    If IsNull(dyna.Fields("Waffe")) Then
        'Waffe frei wählbar
        If Indexnummer = -1 Then
            .labWaffe.Caption = ""
        Else
            .labWaffe.Caption = Charakterfeld(Indexnummer).Waffe
        End If
        .labWaffe.BorderStyle = 1
        frmHauptmenü.Waffe_einstellen
    Else
        'Waffe vorgegeben
        If dyna.Fields("Waffe") = "nein" Then
            .labWaffe.Caption = ""
        Else
            .labWaffe.Caption = dyna.Fields("Waffe")
        End If
    End If
    Optionen_Initalisieren = -1
    'RÜSTUNG
    .labRüstung.BorderStyle = 0
    If IsNull(dyna.Fields("Rüstung")) Then
        'Rüstung frei wählbar
        If Indexnummer = -1 Then
            .labRüstung.Caption = ""
        Else
            .labRüstung.Caption = Charakterfeld(Indexnummer).Rüstung
        End If
        .labRüstung.BorderStyle = 1
        frmHauptmenü.Rüstungsrettungswurf_einstellen
    Else
        'Rüstung vorgegeben
        If dyna.Fields("Rüstung") = "nein" Then
            .labRüstung.Caption = ""
        Else
            .labRüstung.Caption = dyna.Fields("Rüstung")
        End If
    End If
    'FERNWAFFE
    .labfernwaffe.BorderStyle = 0
    If IsNull(dyna.Fields("Fernwaffe")) Then
        If Indexnummer = -1 Then
            .labfernwaffe.Caption = ""
        Else
            .labfernwaffe.Caption = Charakterfeld(Indexnummer).Fernwaffe
        End If
        .labfernwaffe.BorderStyle = 1
    Else
        If dyna.Fields("Fernwaffe") = "nein" Then
            .labfernwaffe.Caption = ""
        Else
            .labfernwaffe.Caption = dyna.Fields("Fernwaffe")
        End If
    End If
    Optionen_Initalisieren = 0
    'SONDERREGELN
    If IsNull(dyna.Fields("Sonderregeln")) Then
        .labsonderregeln.Caption = ""
    Else
        .labsonderregeln.Caption = dyna.Fields("Sonderregeln")
    End If
    'ANZAHL
    Optionen_Initalisieren = -1
    .labAnzahl.Caption = "1"
    Optionen_Initalisieren = 0
    'MUSIKER UND STANDARTENTRÄGER INITALISIEREN
    Optionen_Initalisieren = -1
    .ckbMusiker.Value = 0
    .ckbStandartenträger.Value = 0
    If Zwischenspeicher.Standarte Then
        frmMagische_Gegenstände.lstmagische_standarten.AddItem .labMagische_Standarte.Caption
        Zwischenspeicher.Standarte = 0
    End If
    .labMagische_Standarte.Caption = ""
    Optionen_Initalisieren = 0
    'OPTIONEN
    'OPTION 1
    .labOption1.BorderStyle = 0
    If Zwischenspeicher.Option1 Then
        Gegenstand_zurückgeben .laboption1_Kategorie.Caption, 1
        Zwischenspeicher.Option1 = 0
    End If
    If IsNull(dyna.Fields("mag_Gegenstand1")) Then
        If Indexnummer = -1 Then
            .labOption1.Caption = ""
            .labOption1_Kosten.Caption = ""
            .laboption1_Kategorie.Caption = ""
        Else
            .labOption1.Caption = Charakterfeld(Indexnummer).mag_Gegenstand1
            .labOption1_Kosten.Caption = Charakterfeld(Indexnummer).mag_Gegenstand1_Kosten
            .laboption1_Kategorie.Caption = Charakterfeld(Indexnummer).mag_Gegenstand1_Kategorie
        End If
        If dyna.Fields("Anzahl_mag_Gegenstände") >= 1 Then
            .labOption1.BorderStyle = 1
        End If
    Else
        .labOption1.Caption = dyna.Fields("mag_Gegenstand1")
        .labOption1_Kosten.Caption = dyna.Fields("mag_Gegenstand1_Punkte")
        .laboption1_Kategorie.Caption = dyna.Fields("mag_Gegenstand1_Kategorie")
    End If
    If .ckbOption1.Enabled Then
        If .ckbOption1.Value Then
            Optionen_Initalisieren = -1
            .ckbOption1.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption1.Enabled = False
    End If
    'OPTION 2
    .labOption2.BorderStyle = 0
    If Zwischenspeicher.Option2 Then
        Gegenstand_zurückgeben .laboption2_Kategorie.Caption, 2
        Zwischenspeicher.Option2 = 0
    End If
    If IsNull(dyna.Fields("mag_Gegenstand2")) Then
        If Indexnummer = -1 Then
            .labOption2.Caption = ""
            .labOption2_Kosten.Caption = ""
            .laboption2_Kategorie.Caption = ""
        Else
            .labOption2.Caption = Charakterfeld(Indexnummer).mag_Gegenstand2
            .labOption2_Kosten.Caption = Charakterfeld(Indexnummer).mag_Gegenstand2_Kosten
            .laboption2_Kategorie.Caption = Charakterfeld(Indexnummer).mag_Gegenstand2_Kategorie
        End If
        If dyna.Fields("Anzahl_mag_Gegenstände") >= 2 Then
            .labOption2.BorderStyle = 1
        End If
    Else
        .labOption2.Caption = dyna.Fields("mag_Gegenstand2")
        .labOption2_Kosten.Caption = dyna.Fields("mag_Gegenstand2_Punkte")
        .laboption2_Kategorie.Caption = dyna.Fields("mag_Gegenstand2_Kategorie")
    End If
    If .ckbOption2.Enabled Then
        If .ckbOption2.Value Then
            Optionen_Initalisieren = -1
            .ckbOption2.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption2.Enabled = False
    End If
    'OPTION 3
    .labOption3.BorderStyle = 0
    If Zwischenspeicher.Option3 Then
        Gegenstand_zurückgeben .laboption3_Kategorie.Caption, 3
        Zwischenspeicher.Option3 = 0
    End If
    If IsNull(dyna.Fields("mag_Gegenstand3")) Then
        If Indexnummer = -1 Then
            .labOption3.Caption = ""
            .labOption3_Kosten.Caption = ""
            .laboption3_Kategorie.Caption = ""
        Else
            .labOption3.Caption = Charakterfeld(Indexnummer).mag_Gegenstand3
            .labOption3_Kosten.Caption = Charakterfeld(Indexnummer).mag_Gegenstand3_Kosten
            .laboption3_Kategorie.Caption = Charakterfeld(Indexnummer).mag_Gegenstand3_Kategorie
        End If
        If dyna.Fields("Anzahl_mag_Gegenstände") >= 3 Then
            .labOption3.BorderStyle = 1
        End If
    Else
        .labOption3.Caption = dyna.Fields("mag_Gegenstand3")
        .labOption3_Kosten.Caption = dyna.Fields("mag_Gegenstand3_Punkte")
        .laboption3_Kategorie.Caption = dyna.Fields("mag_Gegenstand3_Kategorie")
    End If
    If .ckbOption3.Enabled Then
        If .ckbOption3.Value Then
            Optionen_Initalisieren = -1
            .ckbOption3.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption3.Enabled = False
    End If
    'OPTION 4
    .labOption4.BorderStyle = 0
    If Zwischenspeicher.Option4 Then
        Gegenstand_zurückgeben .laboption4_Kategorie.Caption, 4
        Zwischenspeicher.Option4 = 0
    End If
    If IsNull(dyna.Fields("mag_Gegenstand4")) Then
        If Indexnummer = -1 Then
            .labOption4.Caption = ""
            .labOption4_Kosten.Caption = ""
            .laboption4_Kategorie.Caption = ""
        Else
            .labOption4.Caption = Charakterfeld(Indexnummer).mag_Gegenstand4
            .labOption4_Kosten.Caption = Charakterfeld(Indexnummer).mag_Gegenstand4_Kosten
            .laboption4_Kategorie.Caption = Charakterfeld(Indexnummer).mag_Gegenstand4_Kategorie
        End If
        If dyna.Fields("Anzahl_mag_Gegenstände") >= 4 Then
            .labOption4.BorderStyle = 1
        End If
    Else
        .labOption4.Caption = dyna.Fields("mag_Gegenstand4")
        .labOption4_Kosten.Caption = dyna.Fields("mag_Gegenstand4_Punkte")
        .laboption4_Kategorie.Caption = dyna.Fields("mag_Gegenstand4_Kategorie")
    End If
    If .ckbOption4.Enabled Then
        If .ckbOption4.Value Then
            Optionen_Initalisieren = -1
            .ckbOption4.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption4.Enabled = False
    End If
    'OPTION 5 UND 6
    If .ckbOption5.Enabled Then
        If .ckbOption5.Value Then
            Optionen_Initalisieren = -1
            .ckbOption5.Value = 0
            Optionen_Initalisieren = 0
        End If
        .ckbOption5.Enabled = False
        .labOption5.Caption = ""
        .labOption5_Kosten.Caption = ""
        If .ckbOption6.Enabled Then
            If .ckbOption6.Value Then
                Optionen_Initalisieren = -1
                .ckbOption6.Value = 0
                Optionen_Initalisieren = 0
            End If
            .ckbOption6.Enabled = False
            .labOption6.Caption = ""
            .labOption6_Kosten.Caption = ""
        End If
    End If
    'PUNKTWERTEINTRAGEN
    frmHauptmenü.Charakterkosten_Berechnung
    
    'LEEREN
    'MUSIKER UND STANDARTENTRÄGER
    If .ckbMusiker.Enabled Then
        .ckbMusiker.Enabled = False
        .ckbStandartenträger.Enabled = False
        .labMagische_Standarte.BorderStyle = 0
    End If
    'REICHWEITE
    If .lab1Reichweite.Caption <> "" Then
        .lab1Reichweite.Caption = ""
        .lab1Stärke.Caption = ""
        .lab1Rettungswurf.Caption = ""
        .lab1Schaden.Caption = ""
        If .lab2Reichweite.Caption <> "" Then
            .lab2Reichweite.Caption = ""
            .lab2Stärke.Caption = ""
            .lab2Rettungswurf.Caption = ""
            .lab2Schaden.Caption = ""
        End If
    End If
    End With
End If
End Sub

Public Sub Alles_leeren()
Optionen_Initalisieren = -1
With frmHauptmenü
    'Truppenname und -typ leeren
    .labTruppenname_groß.Caption = ""
    .labTruppentyp.Caption = ""
    'Erste Zeile leeren
    .labTruppenname_klein.Caption = ""
    .labB.Caption = ""
    .labKG.Caption = ""
    .labBF.Caption = ""
    .labS.Caption = ""
    .labW.Caption = ""
    .labLP.Caption = ""
    .labI.Caption = ""
    .labA.Caption = ""
    .labMW.Caption = ""
    .labRW.Caption = ""
    .labAnz.Caption = ""
    If .lab2truppenname_klein.Caption <> "" Then
        'Zweite Zeile leeren
        .lab2truppenname_klein.Caption = ""
        .labB2.Caption = ""
        .labKG2.Caption = ""
        .labBF2.Caption = ""
        .labS2.Caption = ""
        .labW2.Caption = ""
        .lablp2.Caption = ""
        .labi2.Caption = ""
        .laba2.Caption = ""
        .labmw2.Caption = ""
        .labrw2.Caption = ""
        If .lab3Truppenname_klein.Caption <> "" Then
            'Dritte Zeile leeren
            .lab3Truppenname_klein.Caption = ""
            .labB3.Caption = ""
            .labKG3.Caption = ""
            .labBF3.Caption = ""
            .labS3.Caption = ""
            .labW3.Caption = ""
            .labLP3.Caption = ""
            .labI3.Caption = ""
            .labA3.Caption = ""
            .labMW3.Caption = ""
            .labRW3.Caption = ""
        End If
    End If
    'WAFFE
    .labWaffe.BorderStyle = 0
    .labWaffe.Caption = ""
    'RÜSTUNG
    .labRüstung.BorderStyle = 0
    .labRüstung.Caption = ""
    'FERNWAFFE
    .labfernwaffe.BorderStyle = 0
    .labfernwaffe.Caption = ""
    'OPTIONEN
    'OPTION 1
    .ckbOption1.Value = 0
    .ckbOption1.Enabled = False
    .labOption1.BorderStyle = 0
    .labOption1.Caption = ""
    .laboption1_Kategorie.Caption = ""
    .labOption1_Kosten.Caption = ""
    'OPTION 2
    .ckbOption2.Value = 0
    .ckbOption2.Enabled = False
    .labOption2.BorderStyle = 0
    .labOption2.Caption = ""
    .laboption2_Kategorie.Caption = ""
    .labOption2_Kosten.Caption = ""
    'OPTION 3
    .ckbOption3.Value = 0
    .ckbOption3.Enabled = False
    .labOption3.BorderStyle = 0
    .labOption3.Caption = ""
    .laboption3_Kategorie.Caption = ""
    .labOption3_Kosten.Caption = ""
    'OPTION 4
    .ckbOption4.Value = 0
    .ckbOption4.Enabled = False
    .labOption4.BorderStyle = 0
    .labOption4.Caption = ""
    .laboption4_Kategorie.Caption = ""
    .labOption4_Kosten.Caption = ""
    'OPTION 5
    .ckbOption5.Value = 0
    .ckbOption5.Enabled = False
    .labOption5.BorderStyle = 0
    .labOption5.Caption = ""
    .labOption5_Kosten.Caption = ""
    'OPTION 6
    .ckbOption6.Value = 0
    .ckbOption6.Enabled = False
    .labOption6.BorderStyle = 0
    .labOption6.Caption = ""
    .labOption6_Kosten.Caption = ""
    'REICHWEITE
    If .lab1Reichweite.Caption <> "" Then
        .lab1Reichweite.Caption = ""
        .lab1Stärke.Caption = ""
        .lab1Rettungswurf.Caption = ""
        .lab1Schaden.Caption = ""
        If .lab2Reichweite.Caption <> "" Then
            .lab2Reichweite.Caption = ""
            .lab2Stärke.Caption = ""
            .lab2Rettungswurf.Caption = ""
            .lab2Schaden.Caption = ""
        End If
    End If
    'MUSIKER UND STANDARTENTRÄGER
    If .ckbMusiker.Enabled Then
        .ckbMusiker.Enabled = False
        .ckbStandartenträger.Enabled = False
        .labMagische_Standarte.BorderStyle = 0
    End If
    'Einzelkosten, Anzahl und Punkte
    .labEinzelkosten.Caption = ""
    .labAnzahl.Caption = "1"
    .labPunkte = ""
End With
Optionen_Initalisieren = 0
End Sub

Public Sub Reittier_anzeigen_dsCharakter(dyna As Dynaset)
With frmHauptmenü
    .lab2truppenname_klein.Caption = dyna.Fields("BS_Name")
    'BS_BEWEGUNG
    If IsNull(dyna.Fields("BS_Bewegung")) Then
        .labB2.Caption = "-"
    Else
        .labB2.Caption = dyna.Fields("BS_Bewegung")
    End If
    'BS_KAMPFGESCHICK
    If IsNull(dyna.Fields("BS_Kampfgeschick")) Then
        .labKG2.Caption = "-"
    Else
        .labKG2.Caption = dyna.Fields("BS_Kampfgeschick")
    End If
    'BS_BALLISTISCHE_FERTIGKEIT
    If IsNull(dyna.Fields("BS_Ballistische Fertigkeit")) Then
        .labBF2.Caption = "-"
    Else
        .labBF2.Caption = dyna.Fields("BS_Ballistische Fertigkeit")
    End If
    'BS_STÄRKE
    If IsNull(dyna.Fields("BS_Stärke")) Then
        .labS2.Caption = "-"
    Else
        .labS2.Caption = dyna.Fields("BS_Stärke")
    End If
    'BS_WIDERSTAND
    If IsNull(dyna.Fields("BS_Widerstand")) Then
        .labW2.Caption = "-"
    Else
        .labW2.Caption = dyna.Fields("BS_Widerstand")
    End If
    'BS_LEBENSPUNKTE
    If IsNull(dyna.Fields("BS_Lebenspunkte")) Then
        .lablp2.Caption = "-"
    Else
        .lablp2.Caption = dyna.Fields("BS_Lebenspunkte")
    End If
    'BS_INITATIVE
    If IsNull(dyna.Fields("BS_Initative")) Then
        .labi2.Caption = "-"
    Else
        .labi2.Caption = dyna.Fields("BS_Initative")
    End If
    'BS_ATTACKEN
    If IsNull(dyna.Fields("BS_Attacken")) Then
        .laba2.Caption = "-"
    Else
        .laba2.Caption = dyna.Fields("BS_Attacken")
    End If
    'BS_MORALWERT
    If IsNull(dyna.Fields("BS_Moralwert")) Then
        .labmw2.Caption = "-"
    Else
        .labmw2.Caption = dyna.Fields("BS_Moralwert")
    End If
    'BS_RÜSTUNGSRETTUNGWURF
    If IsNull(dyna.Fields("BS_Rüstungsrettungswurf")) Then
        .labrw2.Caption = "-"
    Else
        .labrw2.Caption = dyna.Fields("BS_Rüstungsrettungswurf")
    End If
End With
End Sub

Public Sub Reittier_leeren()
With frmHauptmenü
    .lab2truppenname_klein.Caption = ""
    .labB2.Caption = ""
    .labKG2.Caption = ""
    .labBF2.Caption = ""
    .labS2.Caption = ""
    .labW2.Caption = ""
    .lablp2.Caption = ""
    .labi2.Caption = ""
    .laba2.Caption = ""
    .labmw2.Caption = ""
    .labrw2.Caption = ""
End With
End Sub

Public Sub Reittier_anzeigen_dsReittier(dyna As Dynaset)
With frmHauptmenü
    .lab2truppenname_klein.Caption = dyna.Fields("Truppenname") & " (" & dyna.Fields("Punktwert") & ")"
    'BS_BEWEGUNG
    If IsNull(dyna.Fields("Bewegung")) Then
        .labB2.Caption = "-"
    Else
        .labB2.Caption = dyna.Fields("Bewegung")
    End If
    'BS_KAMPFGESCHICK
    If IsNull(dyna.Fields("Kampfgeschick")) Then
        .labKG2.Caption = "-"
    Else
        .labKG2.Caption = dyna.Fields("Kampfgeschick")
    End If
    'BS_BALLISTISCHE_FERTIGKEIT
    If IsNull(dyna.Fields("Ballistische Fertigkeit")) Then
        .labBF2.Caption = "-"
    Else
        .labBF2.Caption = dyna.Fields("Ballistische Fertigkeit")
    End If
    'BS_STÄRKE
    If IsNull(dyna.Fields("Stärke")) Then
        .labS2.Caption = "-"
    Else
        .labS2.Caption = dyna.Fields("Stärke")
    End If
    'BS_WIDERSTAND
    If IsNull(dyna.Fields("Widerstand")) Then
        .labW2.Caption = "-"
    Else
        .labW2.Caption = dyna.Fields("Widerstand")
    End If
    'BS_LEBENSPUNKTE
    If IsNull(dyna.Fields("Lebenspunkte")) Then
        .lablp2.Caption = "-"
    Else
        .lablp2.Caption = dyna.Fields("Lebenspunkte")
    End If
    'BS_INITATIVE
    If IsNull(dyna.Fields("Initative")) Then
        .labi2.Caption = "-"
    Else
        .labi2.Caption = dyna.Fields("Initative")
    End If
    'BS_ATTACKEN
    If IsNull(dyna.Fields("Attacken")) Then
        .laba2.Caption = "-"
    Else
        .laba2.Caption = dyna.Fields("Attacken")
    End If
    'BS_MORALWERT
    If IsNull(dyna.Fields("Moralwert")) Then
        .labmw2.Caption = "-"
    Else
        .labmw2.Caption = dyna.Fields("Moralwert")
    End If
    'BS_RÜSTUNGSRETTUNGWURF
    If IsNull(dyna.Fields("Rüstungsrettungswurf")) Then
        .labrw2.Caption = "-"
    Else
        .labrw2.Caption = dyna.Fields("Rüstungsrettungswurf")
    End If
End With
End Sub

Public Sub Gegenstand_zurückgeben(Kategorie As String, Option_Nummer As Integer)
With frmHauptmenü
    Select Case Kategorie
        Case "Spruchrolle"
        Case "Homunkuli"
        Case "Mutation"
            Select Case Option_Nummer
                Case Is = 1
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem .labOption1.Caption & " (" & .labOption1_Kosten & ")"
                Case Is = 2
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem .labOption2.Caption & " (" & .labOption2_Kosten & ")"
                Case Is = 3
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem .labOption3.Caption & " (" & .labOption3_Kosten & ")"
                Case Is = 4
                    frmMagische_Gegenstände.lstChaos_Mutationen.AddItem .labOption4.Caption & " (" & .labOption4_Kosten & ")"
            End Select
        Case "Standarte"
            Select Case Option_Nummer
                Case Is = 1
                    frmMagische_Gegenstände.lstmagische_standarten.AddItem .labOption1.Caption & " (" & .labOption1_Kosten & ")"
                Case Is = 2
                    frmMagische_Gegenstände.lstmagische_standarten.AddItem .labOption2.Caption & " (" & .labOption2_Kosten & ")"
                Case Is = 3
                    frmMagische_Gegenstände.lstmagische_standarten.AddItem .labOption3.Caption & " (" & .labOption3_Kosten & ")"
                Case Is = 4
                    frmMagische_Gegenstände.lstmagische_standarten.AddItem .labOption4.Caption & " (" & .labOption4_Kosten & ")"
            End Select
        Case "Waffe"
            Select Case Option_Nummer
                Case Is = 1
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem .labOption1.Caption & " (" & .labOption1_Kosten & ")"
                Case Is = 2
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem .labOption2.Caption & " (" & .labOption2_Kosten & ")"
                Case Is = 3
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem .labOption3.Caption & " (" & .labOption3_Kosten & ")"
                Case Is = 4
                    frmMagische_Gegenstände.lstMagische_Waffen.AddItem .labOption4.Caption & " (" & .labOption4_Kosten & ")"
            End Select
        Case "Rüstung"
            Select Case Option_Nummer
                Case Is = 1
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem .labOption1.Caption & " (" & .labOption1_Kosten & ")"
                Case Is = 2
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem .labOption2.Caption & " (" & .labOption2_Kosten & ")"
                Case Is = 3
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem .labOption3.Caption & " (" & .labOption3_Kosten & ")"
                Case Is = 4
                    frmMagische_Gegenstände.lstMagische_Rüstungen.AddItem .labOption4.Caption & " (" & .labOption4_Kosten & ")"
            End Select
        Case "Schild"
            Select Case Option_Nummer
                Case Is = 1
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem .labOption1.Caption & " (" & .labOption1_Kosten & ")"
                Case Is = 2
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem .labOption2.Caption & " (" & .labOption2_Kosten & ")"
                Case Is = 3
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem .labOption3.Caption & " (" & .labOption3_Kosten & ")"
                Case Is = 4
                    frmMagische_Gegenstände.lstMagische_Schilder.AddItem .labOption4.Caption & " (" & .labOption4_Kosten & ")"
            End Select
        Case Else
            Select Case Option_Nummer
                Case Is = 1
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem .labOption1.Caption & " (" & .labOption1_Kosten & ")"
                Case Is = 2
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem .labOption2.Caption & " (" & .labOption2_Kosten & ")"
                Case Is = 3
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem .labOption3.Caption & " (" & .labOption3_Kosten & ")"
                Case Is = 4
                    frmMagische_Gegenstände.lstVerschiedene_Magische_Gegenstände.AddItem .labOption4.Caption & " (" & .labOption4_Kosten & ")"
            End Select
    End Select
End With
End Sub

Public Sub Schild_anlegen()
With frmHauptmenü
    If (.labRW.Caption = "-") Then
        .labRW.Caption = "6"
    Else
        Wandler = .labRW.Caption - 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub Schild_ablegen()
With frmHauptmenü
    If .labRW.Caption = "6" Then
        .labRW.Caption = "-"
    Else
        Wandler = .labRW.Caption + 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub leichte_Ruestung_anlegen()
With frmHauptmenü
    If .labTruppenname_groß = "Skelettkrieger" Then
        .ckbOption3.Value = False
    End If
    If (.labRW.Caption = "-") Then
        .labRW.Caption = "6"
    Else
        Wandler = .labRW.Caption - 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub leichte_Rüstung_ablegen()
With frmHauptmenü
If .labRW.Caption = "6" Then
        .labRW.Caption = "-"
    Else
        Wandler = .labRW.Caption + 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub Hellebarde_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "zweihändige Waffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweihändige Waffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweihändige Waffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweihändige Waffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweihändige Waffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweihändige Waffe" And .ckbOption6.Value) Then
        zweihändige_Waffe_löschen
    End If
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
    If (.labOption1.Caption = "zweite Handwaffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweite Handwaffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweite Handwaffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweite Handwaffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweite Handwaffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweite Handwaffe" And .ckbOption6.Value) Then
        zweite_Handwaffe_löschen
    End If
    If (.labOption1.Caption = "Lanze" And .ckbOption1.Value) Or (.labOption2.Caption = "Lanze" And .ckbOption2.Value) Or (.labOption3.Caption = "Lanze" And .ckbOption3.Value) Or (.labOption4.Caption = "Lanze" And .ckbOption4.Value) Or (.labOption5.Caption = "Lanze" And .ckbOption5.Value) Or (.labOption6.Caption = "Lanze" And .ckbOption6.Value) Then
        Lanze_löschen
    End If
    If (.labOption1.Caption = "Bogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Bogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Bogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Bogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Bogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Bogen" And .ckbOption6.Value) Then
        Bogen_löschen
    End If
    Wandler = .labS.Caption + 1
    .labS.Caption = Wandler
End With
End Sub

Public Sub Hellebarde_ablegen()
With frmHauptmenü
    Wandler = .labS.Caption - 1
    .labS.Caption = Wandler
End With
End Sub

Public Sub zweihändige_Waffe_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "Hellebarde" And .ckbOption1.Value) Or (.labOption2.Caption = "Hellebarde" And .ckbOption2.Value) Or (.labOption3.Caption = "Hellebarde" And .ckbOption3.Value) Or (.labOption4.Caption = "Hellebarde" And .ckbOption4.Value) Or (.labOption5.Caption = "Hellebarde" And .ckbOption5.Value) Or (.labOption6.Caption = "Hellebarde" And .ckbOption6.Value) Then
        Hellebarde_löschen
    End If
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
    If (.labOption1.Caption = "zweite Handwaffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweite Handwaffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweite Handwaffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweite Handwaffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweite Handwaffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweite Handwaffe" And .ckbOption6.Value) Then
        zweite_Handwaffe_löschen
    End If
    If (.labOption1.Caption = "Bogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Bogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Bogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Bogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Bogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Bogen" And .ckbOption6.Value) Then
        Bogen_löschen
    End If
    Wandler = .labS.Caption + 2
    .labS.Caption = Wandler
    Wandler = .labI.Caption
    .labI.Caption = "*" & Wandler & "*"
End With
End Sub

Public Sub zweihändige_Waffe_ablegen()
With frmHauptmenü
    Wandler = .labS.Caption - 2
    .labS.Caption = Wandler
    Wandler = Left(.labI.Caption, 2)
    .labI.Caption = Right(Wandler, 1)
End With
End Sub

Public Sub Speer_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "Hellebarde" And .ckbOption1.Value) Or (.labOption2.Caption = "Hellebarde" And .ckbOption2.Value) Or (.labOption3.Caption = "Hellebarde" And .ckbOption3.Value) Or (.labOption4.Caption = "Hellebarde" And .ckbOption4.Value) Or (.labOption5.Caption = "Hellebarde" And .ckbOption5.Value) Or (.labOption6.Caption = "Hellebarde" And .ckbOption6.Value) Then
        Hellebarde_löschen
    End If
    If (.labOption1.Caption = "zweihändige Waffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweihändige Waffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweihändige Waffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweihändige Waffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweihändige Waffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweihändige Waffe" And .ckbOption6.Value) Then
        zweihändige_Waffe_löschen
    End If
    If (.labOption1.Caption = "zweite Handwaffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweite Handwaffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweite Handwaffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweite Handwaffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweite Handwaffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweite Handwaffe" And .ckbOption6.Value) Then
        zweite_Handwaffe_löschen
    End If
    If (.labOption1.Caption = "Lanze" And .ckbOption1.Value) Or (.labOption2.Caption = "Lanze" And .ckbOption2.Value) Or (.labOption3.Caption = "Lanze" And .ckbOption3.Value) Or (.labOption4.Caption = "Lanze" And .ckbOption4.Value) Or (.labOption5.Caption = "Lanze" And .ckbOption5.Value) Or (.labOption6.Caption = "Lanze" And .ckbOption6.Value) Then
        Lanze_löschen
    End If
    'If (.labOption1.Caption = "Kurzbogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Kurzbogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Kurzbogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Kurzbogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Kurzbogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Kurzbogen" And .ckbOption6.Value) Then
    '    Kurzbogen_löschen
    'End If
    'If (.labOption1.Caption = "Bogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Bogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Bogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Bogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Bogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Bogen" And .ckbOption6.Value) Then
    '    Bogen_löschen
    'End If
    'If (.labOption1.Caption = "Langbogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Langbogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Langbogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Langbogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Langbogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Langbogen" And .ckbOption6.Value) Then
    '    Langbogen_löschen
    'End If
    'If (.labOption1.Caption = "Repetier-Armbrust" And .ckbOption1.Value) Or (.labOption2.Caption = "Repetier-Armbrust" And .ckbOption2.Value) Or (.labOption3.Caption = "Repetier-Armbrust" And .ckbOption3.Value) Or (.labOption4.Caption = "Repetier-Armbrust" And .ckbOption4.Value) Or (.labOption5.Caption = "Repetier-Armbrust" And .ckbOption5.Value) Or (.labOption6.Caption = "Repetier-Armbrust" And .ckbOption6.Value) Then
    '    Repetier_Armbrust_löschen
    'End If
    If (.labTruppenname_groß = "Skelettreiter" Or .labTruppenname_groß = "Waldreiter" Or .labTruppenname_groß = "Wildork Schweinereiter" Or .labTruppenname_groß = "Ork Schweinereiter" Or .labTruppenname_groß = "Goblin Wolfsreiter" Or .labTruppenname_groß = "Waldgoblin Spinnenreiter" Or .labTruppenname_groß = "Grenzreiter" Or .labTruppenname_groß = "Tiranoc Streitwagen" Or .labTruppenname_groß = "Schwarze Reiter" Or .labTruppenname_groß = "Streitwagen" Or .labTruppenname_groß = "Falkenreiter") Then
        Wandler = .labS.Caption + 1 & "/" & .labS.Caption
        .labS.Caption = Wandler
    End If
End With
End Sub

Public Sub zweite_Handwaffe_anlegen()
With frmHauptmenü
    Wandler = .labA.Caption + 1
    .labA.Caption = Wandler
    If (.labOption1.Caption = "zweihändige Waffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweihändige Waffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweihändige Waffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweihändige Waffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweihändige Waffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweihändige Waffe" And .ckbOption6.Value) Then
        zweihändige_Waffe_löschen
    End If
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
    If (.labOption1.Caption = "Hellebarde" And .ckbOption1.Value) Or (.labOption2.Caption = "Hellebarde" And .ckbOption2.Value) Or (.labOption3.Caption = "Hellebarde" And .ckbOption3.Value) Or (.labOption4.Caption = "Hellebarde" And .ckbOption4.Value) Or (.labOption5.Caption = "Hellebarde" And .ckbOption5.Value) Or (.labOption6.Caption = "Hellebarde" And .ckbOption6.Value) Then
        Hellebarde_löschen
    End If
    If (.labOption1.Caption = "Lanze" And .ckbOption1.Value) Or (.labOption2.Caption = "Lanze" And .ckbOption2.Value) Or (.labOption3.Caption = "Lanze" And .ckbOption3.Value) Or (.labOption4.Caption = "Lanze" And .ckbOption4.Value) Or (.labOption5.Caption = "Lanze" And .ckbOption5.Value) Or (.labOption6.Caption = "Lanze" And .ckbOption6.Value) Then
        Lanze_löschen
    End If
    If (.labOption1.Caption = "Bogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Bogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Bogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Bogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Bogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Bogen" And .ckbOption6.Value) Then
        Bogen_löschen
    End If
End With
End Sub

Public Sub zweite_Handwaffe_ablegen()
With frmHauptmenü
    Wandler = .labA.Caption - 1
    .labA.Caption = Wandler
End With
End Sub

Public Sub Lanze_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "Hellebarde" And .ckbOption1.Value) Or (.labOption2.Caption = "Hellebarde" And .ckbOption2.Value) Or (.labOption3.Caption = "Hellebarde" And .ckbOption3.Value) Or (.labOption4.Caption = "Hellebarde" And .ckbOption4.Value) Or (.labOption5.Caption = "Hellebarde" And .ckbOption5.Value) Or (.labOption6.Caption = "Hellebarde" And .ckbOption6.Value) Then
        Hellebarde_löschen
    End If
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
    If (.labOption1.Caption = "zweite Handwaffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweite Handwaffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweite Handwaffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweite Handwaffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweite Handwaffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweite Handwaffe" And .ckbOption6.Value) Then
        zweite_Handwaffe_löschen
    End If
    If (.labOption1.Caption = "Bogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Bogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Bogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Bogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Bogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Bogen" And .ckbOption6.Value) Then
        Bogen_löschen
    End If
    If (.labOption1.Caption = "Langbogen" And .ckbOption1.Value) Or (.labOption2.Caption = "Langbogen" And .ckbOption2.Value) Or (.labOption3.Caption = "Langbogen" And .ckbOption3.Value) Or (.labOption4.Caption = "Langbogen" And .ckbOption4.Value) Or (.labOption5.Caption = "Langbogen" And .ckbOption5.Value) Or (.labOption6.Caption = "Langbogen" And .ckbOption6.Value) Then
        Langbogen_löschen
    End If
    If (.labOption1.Caption = "Repetier-Armbrust" And .ckbOption1.Value) Or (.labOption2.Caption = "Repetier-Armbrust" And .ckbOption2.Value) Or (.labOption3.Caption = "Repetier-Armbrust" And .ckbOption3.Value) Or (.labOption4.Caption = "Repetier-Armbrust" And .ckbOption4.Value) Or (.labOption5.Caption = "Repetier-Armbrust" And .ckbOption5.Value) Or (.labOption6.Caption = "Repetier-Armbrust" And .ckbOption6.Value) Then
        Repetier_Armbrust_löschen
    End If
    Wandler = .labS.Caption + 2 & "/" & .labS.Caption
    .labS.Caption = Wandler
End With
End Sub

Public Sub Lanze_löschen()
With frmHauptmenü
    If .labOption1.Caption = "Lanze" Then
        .ckbOption1.Value = 0
    End If
    If .labOption2.Caption = "Lanze" Then
        .ckbOption2.Value = 0
    End If
    If .labOption3.Caption = "Lanze" Then
        .ckbOption3.Value = 0
    End If
    If .labOption4.Caption = "Lanze" Then
        .ckbOption4.Value = 0
    End If
    If .labOption5.Caption = "Lanze" Then
        .ckbOption5.Value = 0
    End If
    If .labOption6.Caption = "Lanze" Then
        .ckbOption6.Value = 0
    End If
End With
End Sub

Public Sub Lanze_ablegen()
With frmHauptmenü
    Wandler = Right(.labS.Caption, 1)
    .labS.Caption = Wandler
End With
End Sub

Public Sub Speer_ablegen()
With frmHauptmenü
    Wandler = Right(.labS.Caption, 1)
    .labS.Caption = Wandler
End With
End Sub

Public Sub Kurzbogen_löschen()
With frmHauptmenü
    If .labOption1.Caption = "Kurzbogen" Then
        .ckbOption1.Value = 0
    End If
    If .labOption2.Caption = "Kurzbogen" Then
        .ckbOption2.Value = 0
    End If
    If .labOption3.Caption = "Kurzbogen" Then
        .ckbOption3.Value = 0
    End If
    If .labOption4.Caption = "Kurzbogen" Then
        .ckbOption4.Value = 0
    End If
    If .labOption5.Caption = "Kurzbogen" Then
        .ckbOption5.Value = 0
    End If
    If .labOption6.Caption = "Kurzbogen" Then
        .ckbOption6.Value = 0
    End If
End With
End Sub

Public Sub Bogen_löschen()
With frmHauptmenü
    If .labOption1.Caption = "Bogen" Then
        .ckbOption1.Value = 0
    End If
    If .labOption2.Caption = "Bogen" Then
        .ckbOption2.Value = 0
    End If
    If .labOption3.Caption = "Bogen" Then
        .ckbOption3.Value = 0
    End If
    If .labOption4.Caption = "Bogen" Then
        .ckbOption4.Value = 0
    End If
    If .labOption5.Caption = "Bogen" Then
        .ckbOption5.Value = 0
    End If
    If .labOption6.Caption = "Bogen" Then
        .ckbOption6.Value = 0
    End If
End With
End Sub

Public Sub Langbogen_löschen()
With frmHauptmenü
    If .labOption1.Caption = "Langbogen" Then
        .ckbOption1.Value = 0
    End If
    If .labOption2.Caption = "Langbogen" Then
        .ckbOption2.Value = 0
    End If
    If .labOption3.Caption = "Langbogen" Then
        .ckbOption3.Value = 0
    End If
    If .labOption4.Caption = "Langbogen" Then
        .ckbOption4.Value = 0
    End If
    If .labOption5.Caption = "Langbogen" Then
        .ckbOption5.Value = 0
    End If
    If .labOption6.Caption = "Langbogen" Then
        .ckbOption6.Value = 0
    End If
End With
End Sub

Public Sub Repetier_Armbrust_löschen()
With frmHauptmenü
    If .labOption1.Caption = "Repetier-Armbrust" Then
        .ckbOption1.Value = 0
    End If
    If .labOption2.Caption = "Repetier-Armbrust" Then
        .ckbOption2.Value = 0
    End If
    If .labOption3.Caption = "Repetier-Armbrust" Then
        .ckbOption3.Value = 0
    End If
    If .labOption4.Caption = "Repetier-Armbrust" Then
        .ckbOption4.Value = 0
    End If
    If .labOption5.Caption = "Repetier-Armbrust" Then
        .ckbOption5.Value = 0
    End If
    If .labOption6.Caption = "Repetier-Armbrust" Then
        .ckbOption6.Value = 0
    End If
End With
End Sub

Public Sub Kurzbogen_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
End With
End Sub

Public Sub Langbogen_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
    If (.labOption1.Caption = "Lanze" And .ckbOption1.Value) Or (.labOption2.Caption = "Lanze" And .ckbOption2.Value) Or (.labOption3.Caption = "Lanze" And .ckbOption3.Value) Or (.labOption4.Caption = "Lanze" And .ckbOption4.Value) Or (.labOption5.Caption = "Lanze" And .ckbOption5.Value) Or (.labOption6.Caption = "Lanze" And .ckbOption6.Value) Then
        Lanze_löschen
    End If
End With
End Sub

Public Sub Bogen_anlegen()
With frmHauptmenü
    'If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
    '    Speer_löschen
    'End If
    If (.labOption1.Caption = "Lanze" And .ckbOption1.Value) Or (.labOption2.Caption = "Lanze" And .ckbOption2.Value) Or (.labOption3.Caption = "Lanze" And .ckbOption3.Value) Or (.labOption4.Caption = "Lanze" And .ckbOption4.Value) Or (.labOption5.Caption = "Lanze" And .ckbOption5.Value) Or (.labOption6.Caption = "Lanze" And .ckbOption6.Value) Then
        Lanze_löschen
    End If
    If (.labOption1.Caption = "Hellebarde" And .ckbOption1.Value) Or (.labOption2.Caption = "Hellebarde" And .ckbOption2.Value) Or (.labOption3.Caption = "Hellebarde" And .ckbOption3.Value) Or (.labOption4.Caption = "Hellebarde" And .ckbOption4.Value) Or (.labOption5.Caption = "Hellebarde" And .ckbOption5.Value) Or (.labOption6.Caption = "Hellebarde" And .ckbOption6.Value) Then
        Hellebarde_löschen
    End If
    If (.labOption1.Caption = "zweihändige Waffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweihändige Waffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweihändige Waffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweihändige Waffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweihändige Waffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweihändige Waffe" And .ckbOption6.Value) Then
        zweihändige_Waffe_löschen
    End If
    If (.labOption1.Caption = "zweite Handwaffe" And .ckbOption1.Value) Or (.labOption2.Caption = "zweite Handwaffe" And .ckbOption2.Value) Or (.labOption3.Caption = "zweite Handwaffe" And .ckbOption3.Value) Or (.labOption4.Caption = "zweite Handwaffe" And .ckbOption4.Value) Or (.labOption5.Caption = "zweite Handwaffe" And .ckbOption5.Value) Or (.labOption6.Caption = "zweite Handwaffe" And .ckbOption6.Value) Then
        zweite_Handwaffe_löschen
    End If
End With
End Sub

Public Sub Repetier_Armbrust_anlegen()
With frmHauptmenü
    If (.labOption1.Caption = "Speer" And .ckbOption1.Value) Or (.labOption2.Caption = "Speer" And .ckbOption2.Value) Or (.labOption3.Caption = "Speer" And .ckbOption3.Value) Or (.labOption4.Caption = "Speer" And .ckbOption4.Value) Or (.labOption5.Caption = "Speer" And .ckbOption5.Value) Or (.labOption6.Caption = "Speer" And .ckbOption6.Value) Then
        Speer_löschen
    End If
    If (.labOption1.Caption = "Lanze" And .ckbOption1.Value) Or (.labOption2.Caption = "Lanze" And .ckbOption2.Value) Or (.labOption3.Caption = "Lanze" And .ckbOption3.Value) Or (.labOption4.Caption = "Lanze" And .ckbOption4.Value) Or (.labOption5.Caption = "Lanze" And .ckbOption5.Value) Or (.labOption6.Caption = "Lanze" And .ckbOption6.Value) Then
        Lanze_löschen
    End If
End With
End Sub

Public Sub Harnisch_anlegen()
With frmHauptmenü
    If (.labRW.Caption = "-") Then
        .labRW.Caption = "6"
    Else
        Wandler = .labRW.Caption - 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub Harnisch_ablegen()
With frmHauptmenü
If .labRW.Caption = "6" Then
        .labRW.Caption = "-"
    Else
        Wandler = .labRW.Caption + 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub Chaosrüstung_anlegen()
With frmHauptmenü
    If (.labRW.Caption = "-") Then
        .labRW.Caption = "6"
    Else
        Wandler = .labRW.Caption - 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub Chaosrüstung_ablegen()
With frmHauptmenü
If .labRW.Caption = "6" Then
        .labRW.Caption = "-"
    Else
        Wandler = .labRW.Caption + 1
        If Wandler = 6 Then
            .labRW.Caption = Wandler
        Else
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub schwere_Ruestung_anlegen()
With frmHauptmenü
    If .labTruppenname_groß.Caption <> "Skelettkrieger" Then
        If (.labRW.Caption = "-") Then
            .labRW.Caption = "6"
        Else
            Wandler = .labRW.Caption - 1
            If Wandler = 6 Then
                .labRW.Caption = Wandler
            Else
                .labRW.Caption = Wandler & "+"
            End If
        End If
    Else
        .ckbOption2.Value = False
        If (.labRW.Caption = "-") Then
            .labRW.Caption = "5+"
        Else
            Wandler = .labRW.Caption - 2
            .labRW.Caption = Wandler & "+"
        End If
    End If
End With
End Sub

Public Sub schwere_Ruestung_ablegen()
With frmHauptmenü
    If .labTruppenname_groß.Caption <> "Skelettkrieger" Then
        If .labRW.Caption = "6" Then
            .labRW.Caption = "-"
        Else
            Wandler = .labRW.Caption + 1
            If Wandler = 6 Then
                .labRW.Caption = Wandler
            Else
                .labRW.Caption = Wandler & "+"
            End If
        End If
    Else
        If .labRW.Caption = "5+" Then
            .labRW.Caption = "-"
        Else
            Wandler = .labRW.Caption + 2
            If Wandler = 6 Then
                .labRW.Caption = Wandler
            Else
                .labRW.Caption = Wandler & "+"
            End If
        End If
    End If
End With
End Sub
