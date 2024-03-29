'-------------------------------------------------------------------------------
'-- VBS script file
'-- Created on 05/12/2023 10:57:19
'-- Author: NI Yongtao Tan
'-- Comment: ---
'-------------------------------------------------------------------------------
Option Explicit  'Forces the explicit declaration of all the variables in a script.
Dim wShell, oExec, sFileSelected
Dim oMyChn, oMyChn0, oMyChnGp, TS0, TS1, WFStep0, WFStep1
Dim i, sChannelList, ExportFilePath, sOutput
'------------------------------- Browse and load data source file -------------------------------
Call Data.Root.Clear()
For i = 1 to 2
  Set wShell=CreateObject("WScript.Shell")
  Set oExec=wShell.Exec("mshta.exe ""about:<input type=file id=FILE><script>FILE.click();new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);close();resizeTo(0,0);</script>""")
  sFileSelected = oExec.StdOut.ReadLine
  Call DataFileLoad(sFileSelected, "TDMS", "LoadOnWriteAccess|ChnXYRelation")
  If i = 1 Then
    ExportFilePath = Left(sFileSelected, InstrRev(sFileSelected, ".")) & "mat"
  End If
Next

'------------------------------- Sync channels -------------------------------
Set TS0 = Data.Root.Properties.Item("datetime")

For Each oMyChnGp in Data.Root.ChannelGroups
  if oMyChnGp.Channels.Count > 0 Then
    Set oMyChn0 = oMyChnGp.Channels.Item(1)
    Set TS1 = oMyChn0.Properties.Item("wf_start_time")
    Set WFStep0 = oMyChn0.Properties.Item("wf_increment")
    sChannelList = ""
'    sOutput = sOutput & vbCrLf & oMyChnGp.Name & " - " & TS0.Value & "," &  TS1.Value & "," & (TS1.Value-TS0.Value)*86400
    For Each oMyChn in oMyChnGp.Channels
      Set WFStep1 = oMyChn.Properties.Item("wf_increment")
      If (WFStep0.Value = WFStep1.Value) Then
        sChannelList = sChannelList & "'" & oMyChnGp.Name & "/" & oMyChn.Name & "',"
      End If
    Next
    sChannelList = Left(sChannelList, Len(sChannelList)-1)
    Call ChnResampleFreqBasedXOffsetCalc2("", oMyChn0, sChannelList, (TS1.Value-TS0.Value) * 86400 + 5, "", oMyChn0, oMyChn0, 0, True, "Custom", 1/WFStep0.Value, "Automatic", False, False, "TimeDomain")
  End If
Next
'MsgBox sOutput

Call DataFileSave(ExportFilePath, "MatLab", True)