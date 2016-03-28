Structure Check
Text.s
Pos.l
Handle.l
EndStructure
Global NewList CBox.Check()

AddElement(CBox())
CBox()\Text="Sound On"
CBox()\Pos=CPos:CPos+1
AddElement(CBox())
CBox()\Text="FullScreen"
CBox()\Pos=CPos:CPos+1 
AddElement(CBox())
CBox()\Text="AntiAlias"
CBox()\Pos=CPos:CPos+1 
AddElement(CBox())
CBox()\Text="Reduce cpu usage"
CBox()\Pos=CPos:CPos+1 
AddElement(CBox())
CBox()\Text="Vsync"
CBox()\Pos=CPos:CPos+1 

Global Combo
Procedure SetScreenMode()
SelectElement(CBox(), 1)
FullScreen=I3D_IsCheckBoxChecked(CBox()\Handle)
I3D_ClearComboBox(Combo)
If FullScreen
  If ExamineScreenModes()
    While NextScreenMode()
      Str.s=Str(ScreenModeWidth())+"x"+Str(ScreenModeHeight())
      If FindString(OldStr.s,Str,1)=0
        I3D_AddComboBoxItem(Combo,Str)
      EndIf
      OldStr.s+"|"+Str.s+"|"
    Wend
  EndIf
Else
  I3D_AddComboBoxItem(Combo,"400x300")
  I3D_AddComboBoxItem(Combo,"640x480")
  I3D_AddComboBoxItem(Combo,"800x480")
  I3D_AddComboBoxItem(Combo,"800x600")
  I3D_AddComboBoxItem(Combo,"900x680")
  I3D_AddComboBoxItem(Combo,"1024x600")
  I3D_AddComboBoxItem(Combo,"1024x768")
  I3D_AddComboBoxItem(Combo,"1248x720")
  I3D_AddComboBoxItem(Combo,"1248x1024")
  I3D_AddComboBoxItem(Combo,"1400x1050")
  I3D_AddComboBoxItem(Combo,"1600x1024")
  I3D_AddComboBoxItem(Combo,"1600x1200")
  I3D_AddComboBoxItem(Combo,"1680x1050")
  I3D_AddComboBoxItem(Combo,"1920x1080")
  I3D_AddComboBoxItem(Combo,"1900x1200")
  I3D_AddComboBoxItem(Combo,"1920x1200")
  I3D_AddComboBoxItem(Combo,"2048x1152")
  I3D_AddComboBoxItem(Combo,"2048x1536")
EndIf
EndProcedure

Procedure Options()
;I3D_FreeAllEntities()
;I3D_SetSpriteColor(FogSprite,I3D_RGBA(255,255,255,100))

OptionsWindow=I3D_WindowControl(ScreenWidth/2-200,Screenheight/2-140,400,260,0,0,0,"Options")
I3D_SetSkinAlpha(I3D_GetSkin(), 200)
; OrgSkin=I3D_GetSkin()
; Skin=I3D_CreateSkin(#I3D_SKIN_ICECREAM)
; I3D_SetControlOwnSkin(OptionsWindow,Skin)
; I3D_SetControlOwnSkin(CancleButton,OrgSkin)


ForEach CBox()
  CBox()\Handle=I3D_CheckBoxControl(10,25+CBox()\Pos*20,150,20,OptionsWindow,CBox()\Text)
Next

Combo=I3D_ComboBoxControl(170,30,200,20,OptionsWindow)



I3D_TextControl(10,170,200,20,0,OptionsWindow,"visibility:",I3D_RGBA(0,0,0,200))
;Scroll=I3D_ScrollBarControl(10,190,200,15,1,OptionsWindow)
Scroll=I3D_TrackBarControl(-10,190,200,15,OptionsWindow)
I3D_SetBarControlMaximum(Scroll,100)

ReadFile(1,OptionsFile.s)
Auf.s=ReadString(1)
ComboItem=Val(StringField(Auf,3,"x"))
If Auf="":ComboItem=2:EndIf
I3D_SetSelectedComboBoxItem(Combo,ComboItem)


I3D_SetBarControlPosition(Scroll,Val(ReadString(1)))
While Eof(1) = 0          
  SelectElement(CBox(), Count)
  I3D_SetCheckBoxState(CBox()\Handle,Val(ReadString(1)))
  Count+1
Wend
CloseFile(1)

SaveButton=I3D_ButtonControl(290,230,100,22,OptionsWindow,"Save")
CancleButton=I3D_ButtonControl(10,230,100,22,OptionsWindow,"Cancle")

CheckBoxFullScreen=-1
Repeat
  Event=I3D__WindowEvent()
  MX=I3D_GetMouseX()
  MY=I3D_GetMouseY()
  Delay(1)
  
  If event=#I3D_EVENT_BUTTONCLICK
    Controll=I3D_EventControl() 
    If Controll=CancleButton:ende=1:EndIf
    If Controll=SaveButton:ende=1:save=1:EndIf
  EndIf
  
  SelectElement(CBox(), 1)
  If I3D_IsCheckBoxChecked(CBox()\Handle)<>CheckBoxFullScreen
    SetScreenMode()
    CheckBoxFullScreen=I3D_IsCheckBoxChecked(CBox()\Handle)
  EndIf
  
  ;i3d_beginsceneex(1,1,I3D_RGBA(0,0,0,0))
  i3d_beginscene(I3D_RGBA(0,0,0,0))
  If Shader=1 And effect>0
    I3D_BeginPostProcess(effect,1,1,I3D_RGBA(0,0,0,0))
  EndIf
  I3D_RenderScene()
    If Shader=1 And effect>0
  I3D_EndPostProcess(effect)
  EndIf
  Fogcount+1
  I3D__DrawSprite2Dex(FogSprite,-Sin(Fogcount/300)*200-200,0,800+Sin(Fogcount/300)*400+400,600,0)
  I3D__DrawSprite2D(RRSprite,525,470)
  I3D__DrawGUI()
  i3d_endscene()
  
  
  

Until Ende=1 
If save=1
CreateFile(1,OptionsFile.s)
WriteStringN(1,I3D_GetControlText(Combo)+"x"+Str(I3D_GetSelectedComboBoxItem(Combo)))
WriteStringN(1,Str(I3D_GetBarControlPosition(Scroll)))
ForEach CBox()
WriteStringN(1,Str(I3D_IsCheckBoxChecked(CBox()\Handle)))
Next
CloseFile(1)
I3D_FreeContext()
RunProgram(ProgramFilename())
End
EndIf
Ende=0
I3D_FreeAllControls()
;I3D_FreeAllEntities()
CloseB=I3D_ButtonControl(ScreenWidth-25,0,25,25,0,"X")
;I3D_SetSpriteColor(FogSprite,I3D_RGBA(255,255,255,255))
;LoadMenuEntitys()
EndProcedure



Procedure Credits()

Repeat
  Event=I3D__WindowEvent()
  MX=I3D_GetMouseX()
  MY=I3D_GetMouseY()
  Delay(1)

  i3d_beginscene(I3D_RGBA(0,0,0,0))
  If Shader=1 And effect>0
    I3D_BeginPostProcess(effect,1,1,I3D_RGBA(0,0,0,0))
  EndIf
  I3D_RenderScene()
    If Shader=1 And effect>0
  I3D_EndPostProcess(effect)
  EndIf
  
  
  
  Y=200
  Draw2DFont(100,Y,"Development:"):Y+30
  Draw2DFont(100,Y,"-RocketRider",0.7,0.7,200):Y+50

  Draw2DFont(100,Y,"Music/Sound:"):Y+30
  Draw2DFont(100,Y,"-RocketRider",0.7,0.7,200):Y+50

  Draw2DFont(100,Y,"Graphics:"):Y+30
  Draw2DFont(100,Y,"-RocketRider",0.7,0.7,200):Y+20
  Draw2DFont(100,Y,"-Mr.X",0.7,0.7,200):Y+50

  Draw2DFont(100,Y,"Modelling:"):Y+30
  Draw2DFont(100,Y,"-RocketRider",0.7,0.7,200):Y+20
  Draw2DFont(100,Y,"-Mr.X",0.7,0.7,200):Y+50  
  
  Fogcount+1
  I3D__DrawSprite2Dex(FogSprite,-Sin(Fogcount/300)*200-200,0,800+Sin(Fogcount/300)*400+400,600,0)
  I3D__DrawSprite2D(RRSprite,525,470)
  I3D_SetSpriteColor(GameWizardSprite,I3D_RGBA(255,255,255,200-(Sin(Fogcount/10)*50)))
  I3D__DrawSprite2D(GameWizardSprite,50,50)

  
  I3D__DrawGUI()
  i3d_endscene()
  If I3D_IsKeyPressed(#I3D_KEY_ESCAPE):Ende=1:EndIf
  
  

Until Ende=1 
Ende=0
EndProcedure



; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 200
; FirstLine = 153
; Folding = -
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant