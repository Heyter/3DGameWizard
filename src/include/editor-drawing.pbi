Procedure CatchSprite_(Sprite, mem)
  img=CatchImage(#PB_Any, mem)
  ResizeImage(img, 16, 16)
  CreateSprite(Sprite, 16, 16)
  StartDrawing(SpriteOutput(sprite))
  Box(0,0,16,16,RGB(157, 187, 97))
  DrawAlphaImage(ImageID(img),0,0)
  StopDrawing()
  
  FreeImage(img)
EndProcedure  


Procedure LoadSprites()
  CatchSprite_(#Sprite_Gras, ?Pic_gras)
  CatchSprite_(#Sprite_Baum, ?Pic_baum)
  CatchSprite_(#Sprite_wand, ?Pic_wand)
  CatchSprite_(#Sprite_wand2, ?Pic_wand2)
  CatchSprite_(#Sprite_Start, ?Pic_start)
  CatchSprite_(#Sprite_Life, ?Pic_life)
  CatchSprite_(#Sprite_Prick, ?Pic_Spikes)
  CatchSprite_(#Sprite_Bomb, ?Pic_Bomb)
  CatchSprite_(#Sprite_Wolf, ?Pic_Wolf)
  CatchSprite_(#Sprite_Bush, ?Pic_Bush)
  CatchSprite_(#Sprite_Ritter, ?Pic_Ritter)
  CatchSprite_(#Sprite_Ritter2, ?Pic_Ritter2)
  CatchSprite_(#Sprite_Palm, ?Pic_palm)
  CatchSprite_(#Sprite_End, ?Pic_end)
  CatchSprite_(#Sprite_Beam, ?Pic_beam)
  CatchSprite_(#Sprite_Treasure, ?Pic_Treasure)
  CatchSprite_(#Sprite_MSG, ?Pic_MSG)
  CatchSprite_(#Sprite_Lamp, ?Pic_Lamp)
  CatchSprite_(#Sprite_Flare, ?Pic_Flare)
  CatchSprite_(#Sprite_Key, ?Pic_Key)
  CatchSprite_(#Sprite_Gate, ?Pic_Gate_looked)
  CatchSprite_(#Sprite_Gate2, ?Pic_Gate2_looked)
  CatchSprite_(#Sprite_Gate3, ?Pic_Gate)
  CatchSprite_(#Sprite_Gate4, ?Pic_Gate2)
  CatchSprite_(#Sprite_Woodwall, ?Pic_Woodwall)
  CatchSprite_(#Sprite_Woodwall2, ?Pic_Woodwall2)
  CatchSprite_(#Sprite_Woodwall3, ?Pic_Woodwall3)
  CatchSprite_(#Sprite_Woodbox, ?Pic_Woodbox)
  CatchSprite_(#Sprite_Stonebox, ?Pic_Stonebox)
EndProcedure
Procedure LoadImages()
  CatchImage(#Sprite_Gras, ?Pic_gras)
  CatchImage(#Sprite_Baum, ?Pic_baum)
  CatchImage(#Sprite_wand, ?Pic_wand)
  CatchImage(#Sprite_wand2, ?Pic_wand2)
  CatchImage(#Sprite_Start, ?Pic_start)
  CatchImage(#Sprite_Life, ?Pic_life)
  CatchImage(#Sprite_Prick, ?Pic_Spikes)
  CatchImage(#Sprite_Bomb, ?Pic_Bomb)
  CatchImage(#Sprite_Wolf, ?Pic_Wolf)
  CatchImage(#Sprite_Bush, ?Pic_Bush)
  CatchImage(#Sprite_Ritter, ?Pic_Ritter)
  CatchImage(#Sprite_Ritter2, ?Pic_Ritter2)
  CatchImage(#Sprite_Palm, ?Pic_palm)
  CatchImage(#Sprite_End, ?Pic_end)
  CatchImage(#Sprite_Beam, ?Pic_beam)
  CatchImage(#Sprite_Treasure, ?Pic_Treasure)
  CatchImage(#Sprite_MSG, ?Pic_MSG)
  CatchImage(#Sprite_Lamp, ?Pic_Lamp)
  CatchImage(#Sprite_Flare, ?Pic_Flare)
  CatchImage(#Sprite_Key, ?Pic_Key)
  CatchImage(#Sprite_Gate, ?Pic_Gate_looked)
  CatchImage(#Sprite_Gate2, ?Pic_Gate2_looked)
  CatchImage(#Sprite_Gate3, ?Pic_Gate)
  CatchImage(#Sprite_Gate4, ?Pic_Gate2)
  CatchImage(#Sprite_Woodwall, ?Pic_Woodwall)
  CatchImage(#Sprite_Woodwall2, ?Pic_Woodwall2)
  CatchImage(#Sprite_Woodwall3, ?Pic_Woodwall3)
  CatchImage(#Sprite_Woodbox, ?Pic_Woodbox)
  CatchImage(#Sprite_Stonebox, ?Pic_Stonebox)
  
  CatchImage(#Sprite_About, ?Pic_About)
EndProcedure

Procedure DrawMap()
  For x=0 To 39
  For y=0 To 29
    If X+ScrollPosX>-1 And Y+ScrollPosY>-1
      DisplaySprite(Map(X+ScrollPosX, Y+ScrollPosY)\Type, X*16, Y*16)
    EndIf
  Next
  Next
EndProcedure
Procedure Drawing()
  ClearScreen(#Green)
  DrawMap()
  
  For i=0 To 999
    If Strings(i)\String<>""
    If Map(Strings(i)\X,Strings(i)\Y)\Type<>#Sprite_MSG
      Strings(i)\String=""
      Strings(i)\X = 0
      Strings(i)\Y = 0
    EndIf
    EndIf
  Next  
  
  
  StartDrawing(ScreenOutput())
  X=Int(MouseX/16)*16
  Y=Int(MouseY/16)*16
  SetGadgetText(#GadGet_XPosition,"X: "+Str(MouseX/16+ScrollPosX))
  SetGadgetText(#GadGet_YPosition,"Y: "+Str(MouseY/16+ScrollPosY))
  
  Type=Map(X/16+ScrollPosX,Y/16+ScrollPosY)\Type
  ;If Type<0:Type=0:EndIf
  If SelMouseX=-1
    Text.s=ObjectButtons(Type)\TextLong
    SetGadgetText(#GadGet_Properties_Long1_text,Text+":")
    If Text=""
    HideGadget(#GadGet_Properties_Long1,#True)
    HideGadget(#GadGet_Properties_Long1_Text,#True)
    Else
    HideGadget(#GadGet_Properties_Long1,#False)
    HideGadget(#GadGet_Properties_Long1_Text,#False)
    SetGadgetText(#GadGet_Properties_Long1,Str(Map(X/16+ScrollPosX,Y/16+ScrollPosY)\Long))
    EndIf
  
    Text.s=ObjectButtons(Type)\TextLong2
    SetGadgetText(#GadGet_Properties_Long2_text,Text+":")
    If Text=""
    HideGadget(#GadGet_Properties_Long2,#True)
    HideGadget(#GadGet_Properties_Long2_Text,#True)
    Else
    HideGadget(#GadGet_Properties_Long2,#False)
    HideGadget(#GadGet_Properties_Long2_Text,#False)
    SetGadgetText(#GadGet_Properties_Long2,Str(Map(X/16+ScrollPosX,Y/16+ScrollPosY)\Long2))
    EndIf  
    
    Text.s=ObjectButtons(Type)\TextString
    SetGadgetText(#GadGet_Properties_String_text,Text+":")
    If Text=""
    HideGadget(#GadGet_Properties_String,#True)
    HideGadget(#GadGet_Properties_String_Text,#True)
    Else
    HideGadget(#GadGet_Properties_String,#False)
    HideGadget(#GadGet_Properties_String_Text,#False)
    
    String.s=""
    For i=0 To 999
    If Strings(i)\X = X/16+ScrollPosX And Strings(i)\Y = Y/16+ScrollPosY
    String.s=Strings(i)\String
    Break
    EndIf
    Next
    
    
    SetGadgetText(#GadGet_Properties_String,String.s)
    EndIf 
    
  Else
    If ObjectButtons(Type)\TextLong
      Map(X/16+ScrollPosX,Y/16+ScrollPosY)\Long=Val(GetGadgetText(#GadGet_Properties_Long1))
    EndIf
    If ObjectButtons(Type)\TextLong2
      Map(X/16+ScrollPosX,Y/16+ScrollPosY)\Long2=Val(GetGadgetText(#GadGet_Properties_Long2))
    EndIf
    
    If ObjectButtons(Type)\TextString
      Find=#False
      For i=0 To 999
      If Strings(i)\X = X/16+ScrollPosX And Strings(i)\Y = Y/16+ScrollPosY
        Strings(i)\String=GetGadgetText(#GadGet_Properties_String)
        Find=#True
      Break
      EndIf
      Next
      If Find=#False
      For i=0 To 999
      If Strings(i)\String=""
        Strings(i)\X = X/16+ScrollPosX
        Strings(i)\Y = Y/16+ScrollPosY
        Strings(i)\String=GetGadgetText(#GadGet_Properties_String)
      Break
      EndIf
      Next      
      
      
      EndIf
      
      
      
    EndIf    
    
      
  EndIf
  
  LineXY(X,Y,X+16,Y,#Blue)
  LineXY(X,Y,X,Y+16,#Blue)
  LineXY(X,Y+16,X+16,Y+16,#Blue)
  LineXY(X+16,Y,X+16,Y+16,#Blue)
  StopDrawing()
  
  FlipBuffers()
EndProcedure

; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 55
; FirstLine = 34
; Folding = -
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant