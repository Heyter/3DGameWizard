
Structure ObjectButton
GadGet.l
Type.l
Long.l
Long2.l
String.s
TextLong.s
TextLong2.s
TextString.s
EndStructure
Global Dim ObjectButtons.ObjectButton(100)
Global ObjectButtonX=5, ObjectButtonY=5, ObjectButtonNum.l, ObjectButtonPressed.l,ObjectButtonLong.l,ObjectButtonLong2.l,ObjectButtonString.s
Procedure ToolTip(Gadget, Text$ , Title$=#GameCreatorName, Icon=#TOOLTIP_INFO_ICON)
  WindowID=GadgetID(Gadget)
  ToolTip=CreateWindowEx_(0,"ToolTips_Class32","",#WS_POPUP | #TTS_NOPREFIX | #TTS_BALLOON,0,0,0,0,WindowID,0,GetModuleHandle_(0),0)
  SendMessage_(ToolTip,#TTM_SETTIPTEXTCOLOR,GetSysColor_(#COLOR_INFOTEXT),0)
  SendMessage_(ToolTip,#TTM_SETTIPBKCOLOR,GetSysColor_(#COLOR_INFOBK),0)
  SendMessage_(ToolTip,#TTM_SETMAXTIPWIDTH,0,180)
  Balloon.TOOLINFO\cbSize=SizeOf(TOOLINFO)
  Balloon\uFlags=#TTF_IDISHWND | #TTF_SUBCLASS
  Balloon\hWnd=GadgetID(Gadget)
  Balloon\uId=GadgetID(Gadget)
  Balloon\lpszText=@Text$
  SendMessage_(ToolTip, #TTM_ADDTOOL, 0, Balloon)
  If Title$ > ""
    SendMessage_(ToolTip, #TTM_SETTITLE, Icon, @Title$)
  EndIf
EndProcedure



Procedure AddObjectButton(GadGet, Type.l, Text.s, walkable.l=-1,Long.l=0,Long2.l=0,TextLong.s="",TextLong2.s="",String.s="",StringText.s="", Icon.i=#False)
  If Icon
    ButtonImageGadget(GadGet, ObjectButtonX, ObjectButtonY, 38, 38, ImageID(Icon), #PB_Button_Toggle)
  Else  
    ButtonImageGadget(GadGet, ObjectButtonX, ObjectButtonY, 38, 38, ImageID(Type), #PB_Button_Toggle)
  EndIf
  
;   ObjectButtons(ObjectButtonNum)\GadGet=GadGet
;   ObjectButtons(ObjectButtonNum)\Type=Type
;   ObjectButtons(ObjectButtonNum)\Long=Long
;   ObjectButtons(ObjectButtonNum)\Long2=Long2
;   ObjectButtons(ObjectButtonNum)\String=String
;   ObjectButtons(ObjectButtonNum)\TextLong=TextLong
;   ObjectButtons(ObjectButtonNum)\TextLong2=TextLong2
;   ObjectButtons(ObjectButtonNum)\TextString=TextString

  ObjectButtons(Type)\GadGet=GadGet
  ObjectButtons(Type)\Type=Type
  ObjectButtons(Type)\Long=Long
  ObjectButtons(Type)\Long2=Long2
  ObjectButtons(Type)\TextLong=TextLong
  ObjectButtons(Type)\TextLong2=TextLong2
  ObjectButtons(Type)\TextString=StringText
  ObjectButtons(Type)\String=String

  ObjectButtonX+38
  ObjectButtonNum+1
  If ObjectButtonX>170:ObjectButtonY+38:ObjectButtonX=5:EndIf
  
  Text=UCase(Text)
  If walkable=#False
  Text+#LF$+"walkable: no"
  EndIf
  If walkable=#True
  Text+#LF$+"walkable: yes"
  EndIf
    
  ToolTip(Gadget, Text)
EndProcedure
Procedure ObjectButtonEvents(Event)
  EventGadget=EventGadget()
  For i=0 To ObjectButtonNum-1
    If EventGadget=ObjectButtons(i)\GadGet
      ObjectButtonPressed = ObjectButtons(i)\Type
      ObjectButtonLong = ObjectButtons(i)\Long
      ObjectButtonLong2 = ObjectButtons(i)\Long2
      ObjectButtonString = ObjectButtons(i)\String
      For i=0 To ObjectButtonNum-1
        SetGadgetState(ObjectButtons(i)\GadGet, #False)
      Next
      SetGadgetState(EventGadget, #True)
      Break
    EndIf
  Next
EndProcedure



Procedure Init()
  InitSprite()
  InitSound()
  InitKeyboard()
  UsePNGImageDecoder()
  UseJPEGImageDecoder()
  ZPAC_Init(#True)
EndProcedure
Procedure OpenMain()

  OpenWindow(#Window_Main, 0, 0, 850, 480+MenuHeight(), #GameCreatorName, #PB_Window_SystemMenu|#PB_Window_MinimizeGadget|#PB_Window_ScreenCentered)
  OpenWindowedScreen(WindowID(#Window_Main), 0, 0, 640, 480, 0, 0, 0, #PB_Screen_WaitSynchronization)
  
  If CreateImageMenu(0, WindowID(0), #PB_Menu_ModernLook)
    MenuTitle("File")
      MenuItem( #Menu_New, "New", ImageID(CatchImage(#PB_Any, ?Menu_New)))
      MenuBar()
      MenuItem( #Menu_Load, "Load", ImageID(CatchImage(#PB_Any, ?Menu_Load)))
      MenuItem( #Menu_SaveAs, "Save As", ImageID(CatchImage(#PB_Any, ?Menu_Save)))
      MenuItem( #Menu_Export, "Export", ImageID(CatchImage(#PB_Any, ?Menu_Export)))
      MenuBar()      
      MenuItem( #Menu_Quit, "Quit", ImageID(CatchImage(#PB_Any, ?Menu_Quit)))
      
    MenuTitle("Edit")  
      MenuItem( #Menu_Resize, "Resize", ImageID(CatchImage(#PB_Any, ?Menu_Resize)))
      MenuItem( #Menu_Options, "Game options", ImageID(CatchImage(#PB_Any, ?Menu_Options)))
      
    MenuTitle("?")  
      MenuItem( #Menu_RRSoftware, "RRSoftware", ImageID(CatchImage(#PB_Any, ?Menu_Homepage)))
      MenuItem( #Menu_Donate, "Donate", ImageID(CatchImage(#PB_Any, ?Menu_Donate)))
      MenuBar()
      MenuItem( #Menu_Homepage, "Homepage", ImageID(CatchImage(#PB_Any, ?Menu_Homepage)))
      MenuItem( #Menu_About, "About", ImageID(CatchImage(#PB_Any, ?Menu_About)))
      
  EndIf
  
  TextGadget(#GadGet_XPosition,640, 464,105,17,"X: 0",#PB_Text_Border|#PB_Text_Center)
  TextGadget(#GadGet_YPosition,745, 464,105,17,"Y: 0",#PB_Text_Border|#PB_Text_Center)
  
  Frame3DGadget(#GadGet_Properties, 645,  305, 200, 155, "Properties")
  TextGadget(#GadGet_Properties_Long1_text,650,325,190,18,"Long1:")
  StringGadget(#GadGet_Properties_Long1,650,345,190,20,"Test",#PB_String_Numeric)

  TextGadget(#GadGet_Properties_Long2_text,650,370,190,18,"Long2:")
  StringGadget(#GadGet_Properties_Long2,650,390,190,20,"Test",#PB_String_Numeric)

  TextGadget(#GadGet_Properties_String_text,650,415,190,18,"String:")
  StringGadget(#GadGet_Properties_String,650,435,190,20,"Test")
  
  
  PanelGadget(#GadGet_Panel,640,0,210,300)
  ;****Landscape****
  AddGadgetItem(#GadGet_Panel, -1, "landscape")
  AddObjectButton(#GadGet_Gras, #Sprite_Gras, "weed", #True)
  SetGadgetState(#GadGet_Gras,#True)
  AddObjectButton(#GadGet_Baum, #Sprite_Baum, "tree", #False)
  AddObjectButton(#GadGet_Bush, #Sprite_Bush, "Bush", #False)
  

  AddObjectButton(#GadGet_Palm, #Sprite_Palm, "Palm", #False)

  ;****Buildings****
;   AddGadgetItem(#GadGet_Panel, -1, "buildings"):ObjectButtonX=5:ObjectButtonY=5
;   AddObjectButton(#GadGet_Wand, #Sprite_Wand, "wall", #False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_wand))
;   AddObjectButton(#GadGet_Wand2, #Sprite_Wand2, "wall II", #False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_wand2))
;   AddObjectButton(#GadGet_Lamp, #Sprite_Lamp, "lamp", #False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_Lamp))
;   AddObjectButton(#GadGet_Flare, #Sprite_Flare, "Flare", #False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_Flare))
;   AddObjectButton(#GadGet_Gate, #Sprite_Gate, "Gate Looked"+Chr(13)+"walkable: yes with key", -1, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_Gate))
;   AddObjectButton(#GadGet_Gate2, #Sprite_Gate2, "Gate n/s Looked"+Chr(13)+"walkable: yes with key", -1, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_Gate2))
;   AddObjectButton(#GadGet_Gate3, #Sprite_Gate3, "Gate w/e"+Chr(13)+"walkable: yes", -1, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_Gate2_looked))
;   AddObjectButton(#GadGet_Gate4, #Sprite_Gate4, "Gate n/s"+Chr(13)+"walkable: yes", -1, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_wand))
;   AddObjectButton(#GadGet_Woodwall, #Sprite_Woodwall, "Wood wall w/e",#False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_wand))
;   AddObjectButton(#GadGet_Woodwall2, #Sprite_Woodwall2, "Wood wall n/s",#False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_wand))
;   AddObjectButton(#GadGet_Woodwall3, #Sprite_Woodwall3, "Wood pole",#False, 0, 0, "", "", "", "", CatchImage(#PB_Any, ?Pic2_wand))
;   
  AddGadgetItem(#GadGet_Panel, -1, "buildings"):ObjectButtonX=5:ObjectButtonY=5
  AddObjectButton(#GadGet_Wand, #Sprite_Wand, "wall", #False)
  AddObjectButton(#GadGet_Wand2, #Sprite_Wand2, "wall II", #False)
  AddObjectButton(#GadGet_Lamp, #Sprite_Lamp, "lamp", #False)
  AddObjectButton(#GadGet_Flare, #Sprite_Flare, "Flare", #False)
  AddObjectButton(#GadGet_Gate, #Sprite_Gate, "Gate Looked"+Chr(13)+"walkable: yes with key", -1)
  AddObjectButton(#GadGet_Gate2, #Sprite_Gate2, "Gate n/s Looked"+Chr(13)+"walkable: yes with key", -1)
  AddObjectButton(#GadGet_Gate3, #Sprite_Gate3, "Gate w/e"+Chr(13)+"walkable: yes", -1)
  AddObjectButton(#GadGet_Gate4, #Sprite_Gate4, "Gate n/s"+Chr(13)+"walkable: yes", -1)
  AddObjectButton(#GadGet_Woodwall, #Sprite_Woodwall, "Wood wall w/e",#False)
  AddObjectButton(#GadGet_Woodwall2, #Sprite_Woodwall2, "Wood wall n/s",#False)
  AddObjectButton(#GadGet_Woodwall3, #Sprite_Woodwall3, "Wood pole",#False)
  
  
  ;****Enemys****
  AddGadgetItem(#GadGet_Panel, -1, "enemys"):ObjectButtonX=5:ObjectButtonY=5
  AddObjectButton(#GadGet_Prick, #Sprite_Prick, "Prick", #True,30,0,"Attack","")  
  AddObjectButton(#GadGet_Bomb, #Sprite_Bomb, "Bomb", #True,20,0,"Attack","")
  AddObjectButton(#GadGet_Wolf, #Sprite_Wolf, "Wolf"+Chr(13)+"max: 500", -1,100,100,"Life","Attack")
  AddObjectButton(#GadGet_Ritter, #Sprite_Ritter, "Knight"+Chr(13)+"max: 500", -1,150,150,"Life","Attack")
  AddObjectButton(#GadGet_Ritter2, #Sprite_Ritter2, "Knight II"+Chr(13)+"max: 500", -1,200,200,"Life","Attack")

  ;****Other****
  AddGadgetItem(#GadGet_Panel, -1, "other"):ObjectButtonX=5:ObjectButtonY=5
  AddObjectButton(#GadGet_Start, #Sprite_Start, "start point", #True)
  AddObjectButton(#GadGet_End, #Sprite_End, "finish point", -1,0,0,"","")
  AddObjectButton(#GadGet_Life, #Sprite_Life, "lifepack", #True,50,0,"Add Life","")
  AddObjectButton(#GadGet_Beam, #Sprite_Beam, "Beamer", #True,0,0,"X","Y")
  AddObjectButton(#GadGet_Treasure, #Sprite_Treasure, "Treasure")
  AddObjectButton(#GadGet_MSG, #Sprite_MSG, "Message",-1,0,0,"","","","Message")
  AddObjectButton(#GadGet_Key, #Sprite_Key, "Key",-1)
  AddObjectButton(#GadGet_Woodbox, #Sprite_Woodbox, "Wood box",#True)
  AddObjectButton(#GadGet_Stonebox, #Sprite_Stonebox, "Stone box",#False)
  
EndProcedure

Procedure About()
  OpenWindow(#Window_About,0,0,512,256,#GameCreatorName, #PB_Window_ScreenCentered|#PB_Window_BorderLess)
  StickyWindow(#Window_About, #True)
  ImageGadget(#GadGet_About,0,0,512,256,ImageID(#Sprite_About))
  StartTime=ElapsedMilliseconds()
  Repeat
    Event=WaitWindowEvent()
  Until Event=#PB_Event_CloseWindow Or (EventType()=#PB_EventType_LeftClick And ElapsedMilliseconds()-StartTime>1000)
  CloseWindow(#Window_About)
EndProcedure
Procedure Options()
OpenWindow(#Window_Options,0,0,300,430,#GameCreatorName,#PB_Window_ScreenCentered|#PB_Window_SystemMenu)

ButtonGadget(#Options_Button_Save, 220, 405, 70, 20, "Save")
ButtonGadget(#Options_Button_Cancle, 10, 405, 70, 20, "Cancle")

PanelGadget(#Options_Panel,0,0,300,400)
AddGadgetItem(#Options_Panel,-1,"Settings")
  StringGadget(#Options_String_Title, 10, 30, 270, 20, "NoName")
  TextGadget(#Options_Text_Title, 10, 10, 270, 20, "Gametitle:")
  StringGadget(#Options_String_Ico, 10, 80, 230, 20, "")
  ButtonGadget(#Options_Button_Ico, 250, 80, 40, 20, "...")
  TextGadget(#Options_Text_Ico, 10, 60, 230, 20, "Ico:")
  CheckBoxGadget(#Options_CheckBox_Blood, 10, 150, 100, 20, "Blood")
  CheckBoxGadget(#Options_CheckBox_low, 10, 170, 100, 20, "use low polygon")
  ComboBoxGadget(#Options_Combo_Shader, 130, 190, 150, 20)
  AddGadgetItem(#Options_Combo_Shader, -1, "None")
  AddGadgetItem(#Options_Combo_Shader, -1, "Radialblur")
  AddGadgetItem(#Options_Combo_Shader, -1, "Extreme Blur")
  AddGadgetItem(#Options_Combo_Shader, -1, "Black and White")
  AddGadgetItem(#Options_Combo_Shader, -1, "Sharp")
  AddGadgetItem(#Options_Combo_Shader, -1, "Oldscool")
  AddGadgetItem(#Options_Combo_Shader, -1, "block waves")
  AddGadgetItem(#Options_Combo_Shader, -1, "Water effect ")
  TextGadget(#Options_Text_Shader, 130, 170, 150, 20, "Shader:")
  CheckBoxGadget(#Options_CheckBox_Cheats, 10, 190, 100, 20, "Cheats")
  CheckBoxGadget(#Options_CheckBox_ShowCredits, 130, 150, 150, 20, "Show 3DGW Credits")
  StringGadget(#Options_String_Music, 10, 120, 230, 20, "")
  TextGadget(#Options_Text_Music, 10, 100, 230, 20, "Music: (.ogg/.wav)")
  ButtonGadget(#Options_Button_Music, 250, 120, 40, 20, "...")
  CheckBoxGadget(#Options_CheckBox_UseSpWindow, 10, 210, 150, 20, "use special window")
  CheckBoxGadget(#Options_CheckBox_UseMenu, 10, 230, 100, 20, "use menu")

  StringGadget(#Options_String_Logo, 10, 270, 230, 20, "")
  ButtonGadget(#Options_Button_Logo, 250,270, 40, 20, "...")
  TextGadget(#Options_Text_Logo    , 10, 250, 230, 20, "Logo: (.bmp/.png/.jpg)")

AddGadgetItem(#Options_Panel,-1,"win options")
  ;Frame3DGadget(#Options_Frame3D_WinOptions, 10, 210, 280, 160, "win options")
  CheckBoxGadget(#Options_CheckBox_killall      , 20, 10, 130, 20, "kill all creatures")
  CheckBoxGadget(#Options_CheckBox_lifeSec      , 20, 100, 130, 20, "life ** sec")
  StringGadget(#Options_String_lifeSec          , 20, 120, 130, 20, "60", #PB_String_Numeric)
  CheckBoxGadget(#Options_CheckBox_killCreatures, 20, 40, 130, 20, "kill ** creatures")
  StringGadget(#Options_String_KillCreatures    , 20, 60, 130, 20, "30", #PB_String_Numeric)
  CheckBoxGadget(#Options_CheckBox_treasure     , 20, 160, 120, 20, "pick ** treasure chest")
  StringGadget(#Options_String_treasure         , 20, 180, 120, 20, "5", #PB_String_Numeric)
  CheckBoxGadget(#Options_CheckBox_Walk         , 20, 220, 120, 20, "walk to finish point")

AddGadgetItem(#Options_Panel,-1,"MSGs")
  TextGadget(#Options_Text_StartMSG, 10, 10, 270, 20, "Start mesage:")
  StringGadget(#Options_String_StartMSG, 10, 30, 270, 20, "")
  TextGadget(#Options_Text_LoseMSG, 10, 60, 270, 20, "Lose mesage:")
  StringGadget(#Options_String_LoseMSG, 10, 80, 270, 20, "You lost!")  
  TextGadget(#Options_Text_WinMSG, 10, 110, 270, 20, "Win mesage:")
  StringGadget(#Options_String_WinMSG, 10, 130, 270, 20, "You won!")  


SetGadgetText(#Options_String_Title,GameSettings\Title.s)
SetGadgetText(#Options_String_Ico,GameSettings\Ico.s)
SetGadgetText(#Options_String_Music,GameSettings\Music.s)
SetGadgetText(#Options_String_Logo,GameSettings\Logo.s)
SetGadgetText(#Options_String_LoseMSG,GameSettings\LoseMSG.s)
SetGadgetText(#Options_String_StartMSG,GameSettings\StartMSG.s)
SetGadgetText(#Options_String_WinMSG,GameSettings\WinMSG.s)

SetGadgetState(#Options_CheckBox_Blood,GameSettings\Blood.l)
SetGadgetState(#Options_CheckBox_low,GameSettings\low.l)
SetGadgetState(#Options_CheckBox_Cheats,GameSettings\Cheats)
SetGadgetState(#Options_Combo_Shader,GameSettings\Shader)
SetGadgetState(#Options_CheckBox_killall,GameSettings\killall)
SetGadgetState(#Options_CheckBox_Walk,GameSettings\walktoend)
SetGadgetState(#Options_CheckBox_ShowCredits,GameSettings\Credits)
SetGadgetState(#Options_CheckBox_UseMenu,GameSettings\UseMenu)
SetGadgetState(#Options_CheckBox_UseSpWindow,GameSettings\UseSpezialWindow)


If GameSettings\killCreatures=0
  SetGadgetState(#Options_CheckBox_KillCreatures,#False)
Else
  SetGadgetState(#Options_CheckBox_KillCreatures,#True)
  SetGadgetText(#Options_String_KillCreatures,Str(GameSettings\killCreatures))
EndIf
If GameSettings\lifeSec=0
  SetGadgetState(#Options_CheckBox_lifeSec,#False)
Else
  SetGadgetState(#Options_CheckBox_lifeSec,#True)
  SetGadgetText(#Options_String_lifeSec,Str(GameSettings\lifeSec))
EndIf
If GameSettings\picktreasure=0
  SetGadgetState(#Options_CheckBox_treasure,#False)
Else
  SetGadgetState(#Options_CheckBox_treasure,#True)
  SetGadgetText(#Options_String_treasure,Str(GameSettings\picktreasure))
EndIf



DisableGadget(#Options_String_lifeSec,~GetGadgetState(#Options_CheckBox_lifeSec)+2)
DisableGadget(#Options_String_KillCreatures,~GetGadgetState(#Options_CheckBox_killCreatures)+2)
DisableGadget(#Options_String_treasure,~GetGadgetState(#Options_CheckBox_treasure)+2)
Repeat
Event=WaitWindowEvent()
If Event=#PB_Event_Gadget
  Select EventGadget()
    Case #Options_Button_Save
      CloseWindow=2
      
    Case #Options_Button_Cancle
      CloseWindow=#True
      
    Case #Options_CheckBox_lifeSec
      DisableGadget(#Options_String_lifeSec,~GetGadgetState(#Options_CheckBox_lifeSec)+2)
      
    Case #Options_CheckBox_killCreatures
      DisableGadget(#Options_String_KillCreatures,~GetGadgetState(#Options_CheckBox_killCreatures)+2)
    
    Case #Options_CheckBox_treasure
      DisableGadget(#Options_String_treasure,~GetGadgetState(#Options_CheckBox_treasure)+2)
    
    Case #Options_Button_Ico
      T.s=OpenFileRequester("ICO","","ICO (*.ico)|*.ico|Alle Dateien (*.*)|*.*",0)
      If T
        SetGadgetText(#Options_String_Ico,T)
      EndIf
    
    Case #Options_Button_Music
      T.s=OpenFileRequester("Music","","WAV/OGG (*.wav;*.ogg)|*.wav;*.ogg|Alle Dateien (*.*)|*.*",0)
      If T
        SetGadgetText(#Options_String_Music,T)
      EndIf

    Case #Options_Button_Logo
      T.s=OpenFileRequester("Logo","","bmp/png/jpg |*.bmp;*.png;*.jpg;*jpeg|Alle Dateien (*.*)|*.*",0)
      If T
        SetGadgetText(#Options_String_Logo,T)
      EndIf
      
    Case #Options_Combo_Shader
      If ShowShaderWarining=#False
        ShowShaderWarining=#True
        MessageRequester("Warning", "Shaders does not work with all Graphic-Cards!")
      EndIf  
  EndSelect
EndIf

Until Event=#PB_Event_CloseWindow Or CloseWindow>0
If CloseWindow=2

GameSettings\Title.s=GetGadgetText(#Options_String_Title)
GameSettings\Ico.s=GetGadgetText(#Options_String_Ico)
GameSettings\Music.s=GetGadgetText(#Options_String_Music)
GameSettings\Logo.s=GetGadgetText(#Options_String_Logo)

GameSettings\LoseMSG.s=GetGadgetText(#Options_String_LoseMSG)
GameSettings\WinMSG.s=GetGadgetText(#Options_String_WinMSG)
GameSettings\StartMSG.s=GetGadgetText(#Options_String_StartMSG)

GameSettings\Blood.l=GetGadgetState(#Options_CheckBox_Blood)
GameSettings\low.l=GetGadgetState(#Options_CheckBox_low)
GameSettings\Cheats=GetGadgetState(#Options_CheckBox_Cheats)
GameSettings\Shader=GetGadgetState(#Options_Combo_Shader)
GameSettings\killall=GetGadgetState(#Options_CheckBox_killall)
GameSettings\walktoend=GetGadgetState(#Options_CheckBox_Walk)
GameSettings\Credits=GetGadgetState(#Options_CheckBox_ShowCredits)

GameSettings\UseSpezialWindow=GetGadgetState(#Options_CheckBox_UseSpWindow)
GameSettings\UseMenu=GetGadgetState(#Options_CheckBox_UseMenu)

If GetGadgetState(#Options_CheckBox_KillCreatures)=#False
  GameSettings\killCreatures=0
Else
  GameSettings\killCreatures=Val(GetGadgetText(#Options_String_KillCreatures))
EndIf
If GetGadgetState(#Options_CheckBox_lifeSec)=#False
  GameSettings\lifeSec=0
Else
  GameSettings\lifeSec=Val(GetGadgetText(#Options_String_lifeSec))
EndIf
If GetGadgetState(#Options_CheckBox_treasure)=#False
  GameSettings\picktreasure=0
Else
  GameSettings\picktreasure=Val(GetGadgetText(#Options_String_treasure))
EndIf




EndIf
CloseWindow(#Window_Options)
EndProcedure




;Events Main Window
Procedure EventMainMenu(Event)
  Select EventMenu()
  Case #Menu_Load
    Load()
    
  Case #Menu_SaveAs
    Save()
  
  Case #Menu_Export
    Export()
    
  Case #Menu_Quit
    QuitMain = #True
  
  Case #Menu_New
    SizeX=Val(InputRequester("The new size","The new with of the map. (max 2048/min 50)","100"))
    SizeY=Val(InputRequester("The new size","The new height size of the map. (max 2048/min 50)","100"))
    new(SizeX, SizeY)
  
  Case #Menu_Resize
    SizeX=Val(InputRequester("The new size","The new with of the map. (max 2048/min 50)","100"))
    SizeY=Val(InputRequester("The new size","The new height size of the map. (max 2048/min 50)","100"))
    Resize(SizeX, SizeY)
  
  Case #Menu_About
    About()
    
  Case #Menu_Homepage
    RunProgram("http://3DGW.RRSoftware.de")
    
  Case #Menu_RRSoftware  
    RunProgram("http://www.RRSoftware.de")
    
  Case #Menu_Donate
    RunProgram("https://www.paypal.com/us/cgi-bin/webscr?hosted_button_id=MLS8GVQ2FZMAE&cmd=_s-xclick")
    
  Case #Menu_Options
    Options()
    
  EndSelect
EndProcedure
Procedure EventMainGadGets(Event)
  ObjectButtonEvents(Event)
  Select EventGadget()
  
  
  EndSelect
EndProcedure
Procedure EventMain(Event)
  Select Event
  Case #PB_Event_Gadget
    EventMainGadGets(Event)
  
  Case #PB_Event_Menu
    EventMainMenu(Event)  
  
  EndSelect
EndProcedure


Procedure EventManager(Event, EventWindow)
  Select EventWindow
  Case #Window_Main
    EventMain(Event)
  
  
  EndSelect
EndProcedure

; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 109
; FirstLine = 60
; Folding = Sj
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant