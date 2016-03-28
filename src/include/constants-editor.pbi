#GameCreatorName = "3DGameWizard"

;Windows
Enumeration 
#Window_Main
#Window_About
#Window_Options
EndEnumeration

;Menu
Enumeration 
  #Menu_Load
  #Menu_SaveAs
  #Menu_Quit
  #Menu_New
  #Menu_Export
  #Menu_Resize
  #Menu_About
  #Menu_Homepage
  #Menu_RRSoftware
  #Menu_Donate
  #Menu_Options
EndEnumeration

;Gadgets
Enumeration 
  #GadGet_Gras
  #GadGet_Baum
  #GadGet_Wand
  #GadGet_Wand2
  #GadGet_Start
  #GadGet_Life
  #GadGet_Prick
  #GadGet_Bomb
  #GadGet_Wolf
  #GadGet_Bush
  #GadGet_Ritter
  #GadGet_Ritter2
  #GadGet_Palm
  #GadGet_End
  #GadGet_Beam
  #GadGet_Treasure
  #GadGet_MSG
  #GadGet_Lamp
  #GadGet_Flare
  #GadGet_Key
  #GadGet_Gate
  #GadGet_Gate2
  #GadGet_Gate3
  #GadGet_Gate4
  #GadGet_Woodwall
  #GadGet_Woodwall2
  #GadGet_Woodwall3
  #GadGet_Woodbox
  #GadGet_Stonebox
  
  ;****************
  #GadGet_Panel
  #GadGet_XPosition
  #GadGet_YPosition
  #GadGet_Properties
  #GadGet_Properties_Long1_text
  #GadGet_Properties_Long1
  #GadGet_Properties_Long2_text
  #GadGet_Properties_Long2
  #GadGet_Properties_String_text
  #GadGet_Properties_String
  
  #GadGet_About
  #Options_Button_Save
  #Options_Button_Cancle
  #Options_String_Title
  #Options_Text_Title
  #Options_Frame3D_WinOptions
  #Options_CheckBox_killall
  #Options_CheckBox_lifeSec
  #Options_String_lifeSec
  #Options_CheckBox_killCreatures
  #Options_String_KillCreatures
  #Options_CheckBox_treasure
  #Options_String_treasure
  #Options_String_Ico
  #Options_Button_Ico
  #Options_Text_Ico
  #Options_CheckBox_Blood
  #Options_CheckBox_low
  #Options_Combo_Shader
  #Options_Text_Shader
  #Options_CheckBox_Cheats
  #Options_CheckBox_Walk
  #Options_CheckBox_ShowCredits
  #Options_String_Music
  #Options_Text_Music
  #Options_Button_Music
  #Options_Panel
  #Options_Text_StartMSG
  #Options_String_StartMSG
  #Options_Text_LoseMSG
  #Options_String_LoseMSG
  #Options_Text_WinMSG
  #Options_String_WinMSG
  #Options_CheckBox_UseSpWindow
  #Options_CheckBox_UseMenu
  #Options_String_Logo
  #Options_Button_Logo
  #Options_Text_Logo
EndEnumeration

;Sprites
Enumeration
  #Sprite_Gras
  #Sprite_Baum
  #Sprite_Wand
  #Sprite_Wand2
  #Sprite_Start
  #Sprite_Life
  #Sprite_Prick
  #Sprite_Bomb
  #Sprite_Wolf
  #Sprite_Bush
  #Sprite_Ritter
  #Sprite_Ritter2
  #Sprite_Palm
  #Sprite_End
  #Sprite_Beam
  #Sprite_Treasure
  #Sprite_MSG
  #Sprite_Lamp
  #Sprite_Flare
  #Sprite_Key
  #Sprite_Gate
  #Sprite_Gate2
  #Sprite_Gate3
  #Sprite_Gate4
  #Sprite_Woodwall
  #Sprite_Woodwall2
  #Sprite_Woodwall3
  #Sprite_Woodbox
  #Sprite_Stonebox
  
  ;****************
  #Sprite_About
EndEnumeration


Structure Map
  Type.l
  Long.l
  Long2.l
EndStructure
Global Dim Map.Map(2049,2049) 


Structure GameSettings
  Title.s{50}
  Ico.s{200}
  Music.s{200}
  Logo.s{200}
  Blood.l
  low.l
  Cheats.l
  Credits.l
  Shader.l
  killall.l
  killCreatures.l
  lifeSec.l
  picktreasure.l
  walktoend.l
  StartMSG.s{200}
  WinMSG.s{200}
  LoseMSG.s{200}
  UseSpezialWindow.l
  UseMenu.l
EndStructure
Global GameSettings.GameSettings

Structure Strings
  X.l
  Y.l
  String.s{100}
EndStructure
Global Dim Strings.Strings(1000)


Global ShowShaderWarining=#False

Global MapSizeX.l, ScrollPosX.l
Global MapSizeY.l, ScrollPosY.l
Global MouseX.l, MouseY.l
Global SelMouseX.l=-1, SelMouseY.l=-1
Global MouseScrolling.l = #False

Global QuitMain.l
Global TempDir.s=GetTemporaryDirectory()+"3DGameWizard\"

DataSection
  Pic_baum:        IncludeBinary "Editor-Data\baum.png"
  Pic_bomb:        IncludeBinary "Editor-Data\bomb.png"
  Pic_bush:        IncludeBinary "Editor-Data\Bush.png"
  Pic_end:         IncludeBinary "Editor-Data\end.png"
  Pic_gras:        IncludeBinary "Editor-Data\gras.png"
  Pic_palm:        IncludeBinary "Editor-Data\palm.png"
  Pic_ritter2:     IncludeBinary "Editor-Data\Ritter2.png"
  Pic_ritter:      IncludeBinary "Editor-Data\Ritter.png"
  Pic_start:       IncludeBinary "Editor-Data\start.png"
  Pic_wand2:       IncludeBinary "Editor-Data\Wand2.png"
  Pic_wand:        IncludeBinary "Editor-Data\wand.png"
  Pic_wolf:        IncludeBinary "Editor-Data\wolf.png"
  Pic_spikes:      IncludeBinary "Editor-Data\Spikes.png"
  Pic_life:        IncludeBinary "Editor-Data\life.png"
  Pic_beam:        IncludeBinary "Editor-Data\beam.png"
  Pic_treasure:    IncludeBinary "Editor-Data\treasure.png"
  Pic_MSG:         IncludeBinary "Editor-Data\msg.png"
  Pic_Lamp:        IncludeBinary "Editor-Data\Lamp.png"
  Pic_Flare:       IncludeBinary "Editor-Data\Flare.png"
  Pic_Key:         IncludeBinary "Editor-Data\Key.png"
  Pic_Gate:        IncludeBinary "Editor-Data\Gate.png"
  Pic_Gate2:       IncludeBinary "Editor-Data\Gate2.png"
  Pic_Gate_looked: IncludeBinary "Editor-Data\Gate_looked.png"
  Pic_Gate2_looked:IncludeBinary "Editor-Data\Gate2_looked.png"
  Pic_WoodWall:    IncludeBinary "Editor-Data\Wall.png"
  Pic_WoodWall2:   IncludeBinary "Editor-Data\Wall2.png"
  Pic_WoodWall3:   IncludeBinary "Editor-Data\Wall3.png"
  Pic_Woodbox:   IncludeBinary "Editor-Data\Woodbox.png"
  Pic_Stonebox:   IncludeBinary "Editor-Data\Stonebox.png"
  

  
  
  Pic_About:   IncludeBinary "Editor-Data\3DGameWizard.jpg"
  
  Menu_New: IncludeBinary "Editor-Data\Icon-Blue-New-File_16x16.ico"
  Menu_Load: IncludeBinary "Editor-Data\Icon-Blue-Data_16x16.ico"
  Menu_Save: IncludeBinary "Editor-Data\Icon-Blue-Save_16x16.ico"
  Menu_Export: IncludeBinary "Editor-Data\download2-16x16.ico"
  Menu_Quit: IncludeBinary "Editor-Data\quit-16x16_2.ico"
  Menu_Resize: IncludeBinary "Editor-Data\Bulldozer2-16x16.ico"
  Menu_Options: IncludeBinary "Editor-Data\Icon-Main-Database_16x16.ico"
  Menu_Homepage: IncludeBinary "Editor-Data\home.ico"
  Menu_About: IncludeBinary "Editor-Data\Btn_Question3.png"
  Menu_Donate: IncludeBinary "Editor-Data\earth-16x16.ico"
  
  
  File_Data:IncludeBinary "data.dat"
  File_Data_end:
  File_Data_low:IncludeBinary "data_low.dat"
  File_Data_low_end:
  File_zlib:IncludeBinary "Editor-Data\zlib1.dll"
  File_zlib_end:
  File_I3DEngine:IncludeBinary "Editor-Data\I3DEngine.dll"
  File_I3DEngine_end:
  
  File_3DGameWizard:IncludeBinary "3DGameWizard_game.exe"
  File_3DGameWizard_end:
  
EndDataSection


; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 239
; FirstLine = 210
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant