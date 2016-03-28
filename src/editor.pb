#USE_EXE_ALONE=#False

Declare New(SizeX=100, SizeY=100)
Declare Resize(SizeX, SizeY)
Declare Load(File.s="")
Declare Save(File.s="")
Declare Export()
Declare ExtractIncludetFiles(OnlyZlib=#False,Low=#False)
ExtractIncludetFiles(#True)


IncludeFile "include\constants-editor.pbi"
IncludeFile "include\zpac.pbi"
IncludeFile "include\editor-gui.pbi"
IncludeFile "include\editor-drawing.pbi"
IncludeFile "include\screen-events.pbi"
IncludeFile "include\EXE_Includer.pbi"
IncludeFile "include\ChangeIco.pbi"

Procedure ExtractIncludetFiles(OnlyZlib=#False,Low=#False)
TempDir.s=GetTemporaryDirectory()+"3DGameWizard\"
If FileSize(TempDir)=-1
  CreateDirectory(TempDir)
EndIf

If OnlyZlib=#False
  
  If low
    If CreateFile(0,TempDir+"Data.dat")
      WriteData(0, ?File_Data_low,?File_Data_low_end-?File_Data_low)
      CloseFile(0)
    EndIf
  Else
    If CreateFile(0,TempDir+"Data.dat")
      WriteData(0, ?File_Data,?File_Data_end-?File_Data)
      CloseFile(0)
    EndIf
  EndIf

  
  If CreateFile(0,TempDir+"I3DEngine.dll")
    WriteData(0, ?File_I3DEngine,?File_I3DEngine_end-?File_I3DEngine)
    CloseFile(0)
  EndIf
  
  If CreateFile(0,TempDir+"3DGameWizard.exe")
    WriteData(0, ?File_3DGameWizard,?File_3DGameWizard_end-?File_3DGameWizard)
    CloseFile(0)
  EndIf
  
EndIf

If CreateFile(0,TempDir+"zlib1.dll")
  WriteData(0, ?File_zlib,?File_zlib_end-?File_zlib)
  CloseFile(0)
EndIf
EndProcedure
Procedure DeleteExtractedFile()
TempDir.s=GetTemporaryDirectory()+"3DGameWizard\"
;DeleteFile(TempDir)
DeleteDirectory(TempDir,"",#PB_FileSystem_Recursive)
EndProcedure



Procedure New(SizeX=100, SizeY=100)
  If SizeX>2048:SizeX=2048:EndIf
  If SizeY>2048:SizeY=2048:EndIf
  If SizeX<50:SizeX=50:EndIf
  If SizeY<50:SizeY=50:EndIf
  MapSizeX = SizeX
  MapSizeY = SizeY
  ScrollPosX = 0
  ScrollPosY = 0
  For X=0 To MapSizeX-1;2048
  For Y=0 To MapSizeY-1;2048
    If X=0 Or Y=0 Or X=MapSizeX-1 Or Y=MapSizeY-1
    Map(X, Y)\Type = #Sprite_Baum
    Else
    Map(X, Y)\Type = #Sprite_Gras
    EndIf
  Next
  Next
  

GameSettings\Title.s="Noname"
GameSettings\Ico.s=""
GameSettings\Music.s=""
GameSettings\StartMSG.s=""
GameSettings\LoseMSG.s="You lost"
GameSettings\WinMSG.s="You won"
GameSettings\Blood.l=1
GameSettings\low.l=0
GameSettings\Cheats.l=1
GameSettings\Credits.l=0
GameSettings\Shader.l=0
GameSettings\killall.l=0
GameSettings\killCreatures.l=0
GameSettings\lifeSec.l=0
GameSettings\picktreasure.l=0
GameSettings\walktoend.l=1
GameSettings\UseSpezialWindow.l=0
GameSettings\UseMenu.l=1

For i=0 To 999
Strings(i)\String=""
Strings(i)\X = 0
Strings(i)\Y = 0
Next


EndProcedure
Procedure Resize(SizeX, SizeY)
  If SizeX>2048:SizeX=2048:EndIf
  If SizeY>2048:SizeY=2048:EndIf
  If SizeX<50:SizeX=50:EndIf
  If SizeY<50:SizeY=50:EndIf
  OldMapSizeX = MapSizeX
  OldMapSizeY = MapSizeY
  MapSizeX = SizeX
  MapSizeY = SizeY
  ScrollPosX = 0
  ScrollPosY = 0
  
  
EndProcedure

Procedure ProcessAllEvents()
  Repeat
  Until WindowEvent()=0
EndProcedure  

Procedure Save(File.s="")
  If File=""
  Pattern.s = "3DGameWizard (*.3DGW)|*.3DGW|Alle Dateien (*.*)|*.*"
  File.s=Trim(SaveFileRequester("Save","",Pattern,0))
  EndIf
  If File
    If UCase(Mid(File,Len(File)-4))<>".3DGW":File=File+".3DGW":EndIf
    ZPAC_CreatePack(File)
    ProcessAllEvents()
    Str.s=Str(MapSizeX)
    ZPAC_AddMemoryPack(@Str,StringByteLength(Str), 9)
    ProcessAllEvents()
    Str=Str(MapSizeY)
    ZPAC_AddMemoryPack(@Str,StringByteLength(Str), 9)
    ProcessAllEvents()
    ZPAC_AddMemoryPack(@Map(),SizeOf(Map)*2049*2049, 9)
    ProcessAllEvents()
    ZPAC_AddMemoryPack(@GameSettings,SizeOf(GameSettings), 9)
    ProcessAllEvents()
    ZPAC_AddMemoryPack(@Strings(),SizeOf(Strings)*1000, 9)
    ProcessAllEvents()
    ZPAC_CloseCreatePack()
    ProcessAllEvents()
  EndIf
EndProcedure
Procedure Load(File.s="")
  If File.s=""
    Pattern.s = "3DGameWizard (*.3DGW)|*.3DGW|Alle Dateien (*.*)|*.*"
    File.s=Trim(OpenFileRequester("Open","",Pattern,0))
  EndIf
  If File
    ZPAC_ReadPack(File)
    MapSizeX=Val(PeekS(ZPAC_NextPackFile()))
    MapSizeY=Val(PeekS(ZPAC_NextPackFile()))
    *Pointer=ZPAC_NextPackFile()
    Size=ZPAC_NextPackFileSize() 
    CopyMemory(*Pointer, @Map(), Size)  
    
    *Pointer=ZPAC_NextPackFile()
    Size=ZPAC_NextPackFileSize() 
    CopyMemory(*Pointer, @GameSettings, Size)  
    
    *Pointer=ZPAC_NextPackFile()
    Size=ZPAC_NextPackFileSize() 
    CopyMemory(*Pointer, @Strings(), Size) 
    
    ZPAC_CloseReadPack()
  EndIf
EndProcedure
Procedure Export()
Pattern.s = "Game (*.exe)|*.exe|Alle Dateien (*.*)|*.*"
SaveFile.s=Trim(SaveFileRequester("Export Game","",Pattern,0))
If SaveFile
If UCase(Mid(SaveFile,Len(SaveFile)-3))<>".EXE":SaveFile=SaveFile+".exe":EndIf
If MessageRequester("Export Game","This will take a few minutes!"+#LF$+"To continue press yes",#PB_MessageRequester_YesNo)=#PB_MessageRequester_Yes
ExtractIncludetFiles(0,GameSettings\low)
Save(TempDir+"Map.3DGW")
File.s=TempDir+"3DGameWizard.exe"

If GameSettings\Ico
  ChangeIcon(GameSettings\Ico, File) 
  ;ReplaceEXEIcon(GameSettings\Ico, File) 
EndIf

AttachFileToExe(File, TempDir+"I3DEngine.dll")
AttachFileToExe(File, TempDir+"zlib1.dll")
AttachFileToExe(File, TempDir+"Map.3DGW")
AttachFileToExe(File, TempDir+"Data.dat")
If GameSettings\Music
  CopyFile(GameSettings\Music,TempDir+"Music.ogg")
  AttachFileToExe(File, TempDir+"Music.ogg")
EndIf
If GameSettings\Logo
  CopyFile(GameSettings\Logo,TempDir+"Logo.png")
  AttachFileToExe(File, TempDir+"Logo.png")
EndIf
EndAttachToExe(File)



CopyFile(File,SaveFile)
EndIf
EndIf
DeleteExtractedFile()
EndProcedure

Procedure SetFileType(File.s,Type.s)
  CompilerIf #PB_editor_createexecutable
    FileName.s = GetFilePart(File)
    
    
    If RegCreateKeyEx_(#HKEY_CLASSES_ROOT, "Applications\"+FileName+"\shell\open\command", 0, 0, #REG_OPTION_NON_VOLATILE, #KEY_ALL_ACCESS, 0, @NewKey, @KeyInfo) = #ERROR_SUCCESS
      StringBuffer$ = Chr(34)+File+Chr(34)+" "+Chr(34)+"%1"+Chr(34)
      RegSetValueEx_(NewKey, "", 0, #REG_SZ,  StringBuffer$, Len(StringBuffer$)+1)
      RegCloseKey_(NewKey)
    EndIf
    
    If RegCreateKeyEx_(#HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\"+Type, 0, 0, #REG_OPTION_NON_VOLATILE, #KEY_ALL_ACCESS, 0, @NewKey, @KeyInfo) = #ERROR_SUCCESS
      RegSetValueEx_(NewKey, "Application", 0, #REG_SZ,  FileName, Len(FileName)+1)
      RegCloseKey_(NewKey)
    EndIf
    
    
  CompilerEndIf
EndProcedure
SetFileType(ProgramFilename(),".3DGW")





Init()
LoadImages()
OpenMain()
LoadSprites()
New()


ProgramMap.s=ProgramParameter()
ProgramMap=ReplaceString(ProgramMap,Chr(34),"")
If ProgramMap
Load(ProgramMap)
EndIf


Repeat
  Delay(1)
  Repeat
    Event=WindowEvent()
    EventWindow=EventWindow()
    EventManager(Event, EventWindow)
    If EventWindow = #Window_Main And Event = #PB_Event_CloseWindow:QuitMain=#True:EndIf
  Until Event=0
  ScreenEvents()
  
  
  Drawing()
Until QuitMain=#True
ZPAC_Free()
CloseWindow(#Window_Main)
DeleteExtractedFile()


; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 192
; FirstLine = 21
; Folding = A7
; EnableThread
; EnableXP
; EnableUser
; EnableOnError
; UseIcon = Editor-Data\Ritter.ico
; Executable = 3DGameWizard.exe
; EnableCompileCount = 471
; EnableBuildCount = 100
; EnableExeConstant
; IncludeVersionInfo
; VersionField0 = 1,2,0,0
; VersionField1 = 1,2,0,0
; VersionField2 = RRSoftware
; VersionField3 = 3DGameWizard
; VersionField4 = 1.20
; VersionField5 = 1.20
; VersionField6 = 3D Gamecreator
; VersionField7 = 3DGameWizard
; VersionField9 = (c) 2008-2010 RocketRider
; VersionField14 = http://3DGW.RRSoftware.de
; VersionField18 = RRSoftware
; VersionField19 = Forum
; VersionField21 = http://www.RRSoftware.de
; VersionField22 = http://www.RocketRider.eu