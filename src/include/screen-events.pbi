Procedure IsObjectMax(Object)
If Object = #Sprite_Wolf Or Object = #Sprite_Ritter Or Object = #Sprite_Ritter2
  For X=0 To MapSizeX-1
  For Y=0 To MapSizeY-1
  If Map(X,Y)\Type=Object
  ObjectCount+1
  EndIf
  Next
  Next
  If ObjectCount>499
    ProcedureReturn #False
  EndIf
EndIf
ProcedureReturn #True
EndProcedure


Procedure ScreenEvents()
ExamineKeyboard()
MouseX = WindowMouseX(#Window_Main)
MouseY = WindowMouseY(#Window_Main)  
If SelMouseX<>-1:MouseX=SelMouseX:EndIf
If SelMouseY<>-1:MouseY=SelMouseY:EndIf
  
If IsWindowVisible_(WindowID(#Window_Main))
  
  If KeyboardPushed(#PB_Key_Up) Or (MouseY<30 And MouseY<>-1 And MouseScrolling)
    If ScrollPosY>0
      ScrollPosY-1
    EndIf
  EndIf
  If KeyboardPushed(#PB_Key_Down) Or (MouseY>450 And MouseY<>-1 And MouseScrolling)
    If ScrollPosY<MapSizeY-30
      ScrollPosY+1
    EndIf
  EndIf
  If KeyboardPushed(#PB_Key_Left) Or (MouseX<30 And MouseX<>-1 And MouseScrolling)
    If ScrollPosX>0
      ScrollPosX-1
    EndIf
  EndIf
  If KeyboardPushed(#PB_Key_Right) Or (MouseX>610 And MouseX<>-1 And MouseScrolling)
    If ScrollPosX<MapSizeX-40
      ScrollPosX+1
    EndIf
  EndIf
  
  
  If GetAsyncKeyState_(#VK_RBUTTON)=-32767
    If SelMouseX=-1
      SelMouseX=MouseX
      SelMouseY=MouseY
    ElseIf WindowMouseX(#Window_Main)<>SelMouseX And WindowMouseY(#Window_Main)<>SelMouseY
      SelMouseX=-1
      SelMouseY=-1        
    EndIf
  EndIf

  
  If GetAsyncKeyState_(#VK_LBUTTON)
    If WindowMouseX(#Window_Main)>-1 And WindowMouseY(#Window_Main)>-1
      If WindowMouseX(#Window_Main)<640 And WindowMouseY(#Window_Main)<480  
        oldSelMouseX=SelMouseX
        SelMouseX=-1
        SelMouseY=-1      
        If oldSelMouseX=-1
          If Map(MouseX/16+ScrollPosX,MouseY/16+ScrollPosY)\Type<>ObjectButtonPressed
            If ObjectButtonPressed=#Sprite_Start
              For X=0 To MapSizeX-1
              For Y=0 To MapSizeY-1
                If Map(X,Y)\Type=#Sprite_Start
                Map(X,Y)\Type=#Sprite_Gras
                EndIf
              Next
              Next
            EndIf
            If IsObjectMax(ObjectButtonPressed)
              Map(MouseX/16+ScrollPosX,MouseY/16+ScrollPosY)\Type=ObjectButtonPressed
              Map(MouseX/16+ScrollPosX,MouseY/16+ScrollPosY)\Long=ObjectButtonLong
              Map(MouseX/16+ScrollPosX,MouseY/16+ScrollPosY)\Long2=ObjectButtonLong2
            EndIf
          EndIf
        EndIf
      EndIf
    EndIf
  EndIf


EndIf
EndProcedure

; IDE Options = PureBasic 4.30 (Windows - x86)
; CursorPosition = 17
; Folding = 9
; EnableXP