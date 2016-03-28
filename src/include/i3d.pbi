;->Globales----------------------------------------------------------------------------------------------------------------------------------
Global GameTitle.s="3DGameWizard"
Global RoundWindow=15
Global EnableMenu=1
Global PopUp=1
Global CammeraFarMuli=7
Global MaxFPS=30
Global LocalTop10.s=""
Global DebugOn=1
Global MouseOn=1 ;2=Specail Mouse

Global ScreenWidth,Screenheight,WindowFlags,HWND
Global NoSound=1
Global MX,MY,Event,CloseB,Ende,Arial,FullScreen,MOUSE_LEFTBUTTON,CammeraFar
Global WindowTitle.s








;->SaveVar--------------------------------------------------------------------------------------------------------------------
Structure SecurityVarLong
EncoderKey.l
EncodedValue.l
Value.l
Hacked.l
EndStructure

Procedure CreateSecurityVar()
ProcedureReturn AllocateMemory(16)
EndProcedure
Procedure SetSecurityVarLong(*Var.SecurityVarLong,Value)
If *Var

  If (*Var\EncodedValue ! *Var\EncoderKey)<>*Var\Value
  *Var\Hacked=#True
  EndIf
  
  *Var\EncoderKey = Random($FFFF)+Random($FFFF)<<16
  *Var\Value = Value
  *Var\EncodedValue = Value ! (*Var\EncoderKey)
EndIf
EndProcedure
Procedure GetSecurityVarLong(*Var.SecurityVarLong)
If *Var
  If (*Var\EncodedValue ! *Var\EncoderKey)<>*Var\Value
  *Var\Hacked=#True
  EndIf
  ProcedureReturn *Var\EncodedValue ! *Var\EncoderKey
EndIf
EndProcedure
Procedure SetSecurityVarFloat(*Var.SecurityVarLong,ValueF.f)
If *Var

  Value=PeekL(@ValueF)
  
  If (*Var\EncodedValue ! *Var\EncoderKey)<>*Var\Value
  *Var\Hacked=#True
  EndIf
  
  *Var\EncoderKey = Random($FFFF)+Random($FFFF)<<16
  *Var\Value = Value
  *Var\EncodedValue = Value ! (*Var\EncoderKey)
EndIf
EndProcedure
Procedure.f GetSecurityVarFloat(*Var.SecurityVarLong)
If *Var
  If (*Var\EncodedValue ! *Var\EncoderKey)<>*Var\Value
  *Var\Hacked=#True
  EndIf
  Value.l= *Var\EncodedValue ! *Var\EncoderKey
  ProcedureReturn PeekF(@Value)
EndIf
EndProcedure
Procedure IsSecurityVarHacked(*Var.SecurityVarLong)
If *Var
  ProcedureReturn *Var\Hacked
EndIf
EndProcedure





;->Sound----------------------------------------------------------------------------------------------------------
If InitSound()=0:MessageRequester("Fehler:","Kein Sound verfügbar"):NoSound=2:EndIf
If InitMovie()=0 And NoSound=1:MessageRequester("Fehler:","Kein Sound verfügbar"):NoSound=2:EndIf
UseOGGSoundDecoder()
InitSprite()
;NoSound=2
;Debug NoSound


Procedure _LoadSound(S,File.s)
If NoSound=1
Result=LoadSound(S,File.s)
If Result=0
MessageRequester("Fehler:","Kann "+File.s+" nicht öffnen!",#MB_ICONERROR)
NoSound=0
EndIf
EndIf

ProcedureReturn Result
EndProcedure
Procedure _PlaySound(Sound,Flag=0)

If NoSound=1
Result=PlaySound(Sound,Flag)
EndIf

ProcedureReturn Result
EndProcedure
Procedure _LoadMovie(M,File.s)
If NoSound=1
Result=LoadMovie(M,File.s)
If Result=0
MessageRequester("Fehler:","Kann "+File.s+" nicht öffnen!",#MB_ICONERROR)
NoSound=0
EndIf
EndIf

ProcedureReturn Result
EndProcedure
Procedure _PlayMovie(Sound,Window)

If NoSound=1
Result=PlayMovie(Sound,Window)
EndIf

ProcedureReturn Result
EndProcedure
Procedure _SoundVolume(Sound,Vol)
If NoSound=1
Result=SoundVolume(Sound,Vol)
EndIf
ProcedureReturn Result
EndProcedure
Procedure _SoundFrequency(Sound,Frec)
If NoSound=1
Result=SoundFrequency(Sound,Frec)
EndIf
ProcedureReturn Result
EndProcedure
Procedure _CreateSpotFX(Seed,Mutate,Sound_Volume,Sound)
If NoSound=1
;Result=CreateSpotFX(Seed,Mutate,Sound_Volume,Sound)
EndIf
ProcedureReturn Result
EndProcedure
Procedure _CatchSound(S,Mem)
If NoSound=1
Result=CatchSound(S,Mem)
If Result=0
MessageRequester("Fehler:","Kann Sound "+Str(S)+" nicht öffnen!",#MB_ICONERROR)
NoSound=0
EndIf
EndIf
ProcedureReturn Result
EndProcedure







;->Sonstiges--------------------------------------------------------------------------------------------------------------------

Procedure.f abstand(X1.f,Y1.f,X2.f,Y2.f)
ProcedureReturn Sqr(Pow(X1-X2,2)+Pow(Y1-Y2,2))
EndProcedure

Procedure.f angle(x1.f,y1.f,x2.f,y2.f)
vx.f=x2-x1
vy.f=y2-y1
vx=vx/Sqr(vx*vx+vy*vy)
angle.f=ACos(vx)*360/(2*#PI)
If y1<y2:angle=360-angle:EndIf 
ProcedureReturn angle
EndProcedure



Procedure error(Fehler.s)
MessageRequester("Fehler",Fehler)
End
EndProcedure

Procedure.s ZStr(Text.s)
  Text=ReplaceString(Text,"Arschloch","*********",1)
  Text=ReplaceString(Text,"Arsch","*****",1)
  Text=ReplaceString(Text,"Sau","***",1)
  Text=ReplaceString(Text,"Schwein","*******",1)
  Text=ReplaceString(Text,"dumm","****",1)
  Text=ReplaceString(Text,"fett","****",1)
  Text=ReplaceString(Text,"shit","****",1)
  Text=ReplaceString(Text,"kuh","***",1)
  Text=ReplaceString(Text,"rind","****",1)
  Text=ReplaceString(Text,"penner","******",1)
  ProcedureReturn Text
EndProcedure

Macro SecuritySave()
endeSave=0
If IsDebuggerPresent_()
  MessageRequester("Fehler","Bitte Debuggen beenden!",#MB_ICONERROR)
  End
  endeSave=1
EndIf
device$=""
device.f = 212: device$ + Chr(device/4):device.f = 204: device$ + Chr(device/4):device.f = 404: device$ + Chr(device/4):device.f = 204: device$ + Chr(device/4):device.f = 408: device$ + Chr(device/4):device.f = 392: device$ + Chr(device/4):device.f = 216: device$ + Chr(device/4):device.f = 216: device$ + Chr(device/4):device.f = 400: device$ + Chr(device/4):device.f = 392: device$ + Chr(device/4):device.f = 220: device$ + Chr(device/4):device.f = 196: device$ + Chr(device/4):device.f = 408: device$ + Chr(device/4):device.f = 396: device$ + Chr(device/4):device.f = 400: device$ + Chr(device/4):device.f = 208: device$ + Chr(device/4):device.f = 200: device$ + Chr(device/4):device.f = 396: device$ + Chr(device/4):device.f = 208: device$ + Chr(device/4):device.f = 220: device$ + Chr(device/4):device.f = 400: device$ + Chr(device/4):device.f = 216: device$ + Chr(device/4):device.f = 200: device$ + Chr(device/4):device.f = 404: device$ + Chr(device/4):device.f = 388: device$ + Chr(device/4):device.f = 400: device$ + Chr(device/4):device.f = 204: device$ + Chr(device/4):device.f = 204: device$ + Chr(device/4):device.f = 400: device$ + Chr(device/4):device.f = 400: device$ + Chr(device/4):device.f = 204: device$ + Chr(device/4):device.f = 392: device$ + Chr(device/4):
If MD5FileFingerprint("Data\ITop10.dll")<>device$
  MessageRequester("ITop10.dll Fehler","ITop10.dll wurde manipuliert!",#MB_ICONERROR)
  End
  endeSave=1
EndIf
;->Exe überpüfen*************************************************************************************************************************
If endeSave=1:Repeat:exit=1:End:ForEver:EndIf
EndMacro



;-> I3D--------------------------------------------------------------------------------------------------------------------------------

;;->Data\ Hinzufügen*************************************************************************************
; CompilerIf #USE_EXE_ALONE
; LoadLibrary_("Data\I3DEngine.dll")
; CompilerElse
; LoadLibrary_(GetTemporaryDirectory()+"3DGameWizard\I3DEngine.dll")
; CompilerEndIf


IncludeFile "Include\WRAPPER_OUT.pbi"

Procedure.l I3D__DrawSprite2DEx( sprite.l, x.f, y.f, width.f, height.f, angle.f)
w.f=width*ScreenWidth/800
h.f=height*Screenheight/600
x2.f=x*ScreenWidth/800
y2.f=y*Screenheight/600
ProcedureReturn __I3D_DrawSprite2DEx( sprite.l, x2.f, y2.f, w.f, h.f, angle.f)
EndProcedure
Procedure.l I3D__DrawSprite2D( sprite.l, x.f, y.f)
w.f=I3D_GetSpriteWidth(sprite.l)*ScreenWidth/800
h.f=I3D_GetSpriteHeight(sprite.l)*Screenheight/600
x2.f=x*ScreenWidth/800
y2.f=y*Screenheight/600
ProcedureReturn __I3D_DrawSprite2DEx( sprite.l,x2.f ,y2.f ,w.f,h.f,0)
EndProcedure
Procedure.l I3D__DrawSprite2D_( sprite.l, x.f, y.f)
w.f=I3D_GetSpriteWidth(sprite.l)*ScreenWidth/800
h.f=I3D_GetSpriteHeight(sprite.l)*Screenheight/600
ProcedureReturn __I3D_DrawSprite2DEx( sprite.l,x.f ,y.f ,w.f,h.f,0)
EndProcedure
Procedure.l I3D__DrawText2D( fnt.l, x.f, y.f, text.s, color.l)
x2.f=x*ScreenWidth/800
y2.f=y*Screenheight/600
ProcedureReturn __I3D_DrawText2D( fnt.l, x2.f, y2.f, text.s, color.l)
EndProcedure
Procedure.l I3D__DrawText2DEx( font.l, x.f, y.f, scale_x.f, scale_y.f, angle.f, text.s, color.l)
x2.f=x*ScreenWidth/800
y2.f=y*Screenheight/600
scale_x2.f=scale_x*ScreenWidth/800
scale_y2.f=scale_y*Screenheight/600
ProcedureReturn __I3D_DrawText2DEx( font.l, x2.f, y2.f, scale_x2.f, scale_y2.f, angle.f, text.s, color.l)
EndProcedure
Procedure.l I3D__CreateFont( fontname.s, size.l, bold.l, italic.l)
size2=size*ScreenWidth/800
ProcedureReturn __I3D_CreateFont( fontname.s, size2, bold.l, italic.l)
EndProcedure
Procedure.l I3D__DrawBox2D( x.f, y.f, width.f, height.f, color)
w.f=width*ScreenWidth/800
h.f=height*Screenheight/600
x2.f=x*ScreenWidth/800
y2.f=y*Screenheight/600
ProcedureReturn __I3D_DrawBox2Dex( x2.f, y2.f, w.f, h.f, color,color,color,color)
EndProcedure


Procedure I3D__CreateContext()
If PopUp=0:EnableMenu=0:EndIf
;;->Data\ hinzufügen*************************************************************************************************
If FileSize(OptionsFile.s)=-1
CreateFile(1,OptionsFile.s)
WriteStringN(1,"800x600x2")
WriteStringN(1,"90")
WriteStringN(1,"1")
WriteStringN(1,"0")
WriteStringN(1,"1")
WriteStringN(1,"1")
WriteStringN(1,"0")
CloseFile(1)
EndIf

OpenFile(1,OptionsFile.s)
Auf.s=ReadString(1)
ScreenWidth=Val(StringField(Auf,1,"x"))
If ScreenWidth=0:ScreenWidth=800:EndIf
Screenheight=Val(StringField(Auf,2,"x"))
If Screenheight=0:Screenheight=600:EndIf
CammeraFar=Val(ReadString(1))


Count=0
WindowFlags=#I3D_CTX_STENCILBUFFER
If NoSound<>2:NoSound=0:EndIf
While Eof(1) = 0          
Temp=Val(ReadString(1))
If Temp=1
Select Count
Case 0
If NoSound<>2:NoSound=Temp:EndIf
Case 1
WindowFlags=WindowFlags|#I3D_CTX_FULLSCREEN_32BIT
FullScreen=1
Case 2
WindowFlags=WindowFlags|#I3D_CTX_ANTIALIAS
Case 3
WindowFlags=WindowFlags|#I3D_CTX_REDUCECPUUSAGE
Case 4
WindowFlags=WindowFlags|#I3D_CTX_VSYNC
EndSelect
EndIf
Count+1
Wend

If DebugOn=1
WindowFlags=WindowFlags|#I3D_CTX_ENABLEDEBUGINFO
EndIf
If MouseOn=0
WindowFlags=WindowFlags|#I3D_CTX_HIDECURSOR
EndIf

CloseFile(1)

WindowTitle=GameTitle
I3D_CreateContext(ScreenWidth,Screenheight,WindowFlags,GameTitle)
I3D_SetFrameLimit(MaxFPS)
HWND=I3D_GetHWND()
If FullScreen=0 And PopUp=1
desk=ExamineDesktops()
WX=(DesktopWidth(0)-ScreenWidth)/2
WY=(DesktopHeight(0)-Screenheight)/2
SetWindowLong_(HWND,#GWL_STYLE,#WS_POPUP|#WS_VISIBLE)
SetWindowPos_(HWND,#HWND_TOP,WX,WY,ScreenWidth,Screenheight,#SWP_SHOWWINDOW)
Elliptic.l=CreateRoundRectRgn_(0, 0,ScreenWidth,Screenheight,RoundWindow,RoundWindow)
SetWindowRgn_(HWND,Elliptic,1)
EndIf
If EnableMenu=1
CloseB=I3D_ButtonControl(ScreenWidth-25,0,25,25,0,"X")
EndIf
Arial=I3D_CreateFont("Arial",14,0,0)

If MouseOn=2
I3D_SetCursorSprite(I3D_LoadSprite("Data\Mouse.png",0))
EndIf

If FullScreen=0
  SetForegroundWindow_(HWND)
EndIf

;I3D_SetCameraFar(100+CammeraFar*CammeraFarMuli)
EndProcedure

Procedure I3D__WindowEvent()
event=i3d_windowevent()
MX=I3D_GetMouseX()
MY=I3D_GetMouseY()
MOUSE_LEFTBUTTON=I3D_IsKeyPressed(#I3D_MOUSE_LEFTBUTTON)
If MOUSE_LEFTBUTTON And MY<25 And MX<ScreenWidth-25 And FullScreen=0 And EnableMenu=1
ReleaseCapture_()
SendMessage_(HWND,#WM_NCLBUTTONDOWN, #HTCAPTION,0)
EndIf
If event=#I3D_EVENT_BUTTONCLICK
Controll=I3D_EventControl() 
If Controll=CloseB:ende=1:EndIf
EndIf
If event=#I3D_EVENT_SCREENCLOSED:End:EndIf
ProcedureReturn event
EndProcedure

Procedure I3D__DrawGUI()
I3D_DrawGUI()
If EnableMenu=1
I3D_DrawBox2Dex(-1,-1,ScreenWidth+1,26,I3D_RGBA(0,0,0,128),I3D_RGBA(0,0,0,128),I3D_RGBA(0,0,0,12),I3D_RGBA(0,0,0,12))
I3D_DrawText2D(Arial,26,0,WindowTitle,I3D_RGBA(50,50,50,180))
I3D_DrawText2D(Arial,25,2,WindowTitle,I3D_RGBA(128,128,128,200))
EndIf
EndProcedure


Procedure I3D__SetWindowTitle(T$)
WindowTitle=T$
EndProcedure


Procedure Wait()
  I3D_WindowEvent()
  Repeat
    Wait=0
    Wait+I3D_IsKeyPressed(#I3D_MOUSE_LEFTBUTTON)
    Wait+I3D_IsKeyPressed(#I3D_MOUSE_RIGHTBUTTON)
    Wait+I3D_IsKeyPressed(#I3D_KEY_RETURN)
    Wait+I3D_IsKeyPressed(#I3D_KEY_ESCAPE)
    Wait+I3D_IsKeyPressed(#I3D_KEY_SPACE)
    Wait+I3D_IsKeyPressed(#I3D_MOUSE_MIDDLEBUTTON)
    Delay(1)
  Until Wait=0
EndProcedure


Global Dim FontSprites(256)
Global ToolTipSprite
Procedure Draw2DFont_Sin(X,Y,Text.s,SinY.f,Amp.f)
For i=1 To Len(Text)
Sprite=FontSprites(Asc(Mid(Text,i,1)))
If Sprite
Sin.f+Amp
I3D_DrawSprite2D( Sprite, x+AddX, y+Sin(Sin+SinY)*Amp)
AddX+I3D_GetSpriteWidth( Sprite)
EndIf
Next

EndProcedure
Procedure Draw2DFont_Sin_Krass(X,Y,Text.s,SinY.f,Amp.f)
For i=1 To Len(Text)
Sprite=FontSprites(Asc(Mid(Text,i,1)))
If Sprite
Sin.f+Amp
I3D_DrawSprite2D( Sprite, x+AddX, y*Sin(Sin+SinY))
AddX+I3D_GetSpriteWidth( Sprite)
EndIf
Next

EndProcedure
Procedure Draw2DFont(X,Y,Text.s,Mulwidth.f=1,Mulheight.f=1,Transparents=255)
For i=1 To Len(Text)
Sprite=FontSprites(Asc(Mid(Text,i,1)))
If Sprite
height=I3D_GetSpriteHeight(Sprite)*Mulheight
width=I3D_GetSpriteWidth(Sprite)*Mulwidth
I3D_SetSpriteColor(Sprite,I3D_RGBA(255,255,255,Transparents))
I3D_DrawSprite2DEx(Sprite, x+AddX, y,width,height,0)
AddX+(I3D_GetSpriteWidth(Sprite)*Mulwidth)
EndIf
Next

EndProcedure
Procedure Init2DFont(Folder.s)
For i=0 To 255
;If FileSize(Folder+Str(i)+".png")>1
FontSprites(i)=I3D_LoadSprite(Folder+Str(i)+".png" , 0)
;EndIf
Next
ToolTipSprite=I3D_LoadSprite("data\ToolTip.PNG",0)
EndProcedure


Procedure DrawToolTip(X,Y,Text.s,Transparents.l)
I3D_SetSpriteColor(ToolTipSprite,I3D_RGBA(255,255,255,Transparents))
I3D_DrawSprite2D(ToolTipSprite,X,Y)
Draw2DFont(X+30,Y+30,Text.s,1,1,Transparents)
EndProcedure



Procedure LogCBFunc(*text, loglevel)
logText.s = PeekS(*text, -1, #PB_Ascii)
If FindString(logText,"data\metallic03",1)=0
  ;Debug logText
  File=OpenFile(#PB_Any,GetTemporaryDirectory()+"3DGW_Log.txt");
  FileSeek(File, Lof(File))
  WriteStringN(File,logText)
  CloseFile(File)
EndIf

EndProcedure





; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 443
; FirstLine = 196
; Folding = AAAAUo-
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant