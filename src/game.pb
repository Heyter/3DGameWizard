Global LastMesh.s=""
Procedure ErrorHandler()
 
  ErrorMessage$ = "A program error was detected:" + Chr(13) 
  ErrorMessage$ + Chr(13)
  ErrorMessage$ + "Error Message:   " + ErrorMessage()      + Chr(13)
  ErrorMessage$ + "Error Code:      " + Str(ErrorCode())    + Chr(13)  
  ErrorMessage$ + "Code Address:    " + Str(ErrorAddress()) + Chr(13)
 
  If ErrorCode() = #PB_OnError_InvalidMemory   
    ErrorMessage$ + "Target Address:  " + Str(ErrorTargetAddress()) + Chr(13)
  EndIf
 
  If ErrorLine() = -1
    ErrorMessage$ + "Sourcecode line: Enable OnError lines support to get code line information." + Chr(13)
  Else
    ErrorMessage$ + "Sourcecode line: " + Str(ErrorLine()) + Chr(13)
    ErrorMessage$ + "Sourcecode file: " + ErrorFile() + Chr(13)
  EndIf
 
 
 ErrorMessage$ + Chr(13) + "Last loaded mesh: " + LastMesh + Chr(13)
  ErrorMessage$ + Chr(13)
  ErrorMessage$ + "Register content:" + Chr(13)
 
  CompilerSelect #PB_Compiler_Processor 
    CompilerCase #PB_Processor_x86
      ErrorMessage$ + "EAX = " + Str(ErrorRegister(#PB_OnError_EAX)) + Chr(13)
      ErrorMessage$ + "EBX = " + Str(ErrorRegister(#PB_OnError_EBX)) + Chr(13)
      ErrorMessage$ + "ECX = " + Str(ErrorRegister(#PB_OnError_ECX)) + Chr(13)
      ErrorMessage$ + "EDX = " + Str(ErrorRegister(#PB_OnError_EDX)) + Chr(13)
      ErrorMessage$ + "EBP = " + Str(ErrorRegister(#PB_OnError_EBP)) + Chr(13)
      ErrorMessage$ + "ESI = " + Str(ErrorRegister(#PB_OnError_ESI)) + Chr(13)
      ErrorMessage$ + "EDI = " + Str(ErrorRegister(#PB_OnError_EDI)) + Chr(13)
      ErrorMessage$ + "ESP = " + Str(ErrorRegister(#PB_OnError_ESP)) + Chr(13)
 
    CompilerCase #PB_Processor_x64
      ErrorMessage$ + "RAX = " + Str(ErrorRegister(#PB_OnError_RAX)) + Chr(13)
      ErrorMessage$ + "RBX = " + Str(ErrorRegister(#PB_OnError_RBX)) + Chr(13)
      ErrorMessage$ + "RCX = " + Str(ErrorRegister(#PB_OnError_RCX)) + Chr(13)
      ErrorMessage$ + "RDX = " + Str(ErrorRegister(#PB_OnError_RDX)) + Chr(13)
      ErrorMessage$ + "RBP = " + Str(ErrorRegister(#PB_OnError_RBP)) + Chr(13)
      ErrorMessage$ + "RSI = " + Str(ErrorRegister(#PB_OnError_RSI)) + Chr(13)
      ErrorMessage$ + "RDI = " + Str(ErrorRegister(#PB_OnError_RDI)) + Chr(13)
      ErrorMessage$ + "RSP = " + Str(ErrorRegister(#PB_OnError_RSP)) + Chr(13)
      ErrorMessage$ + "Display of registers R8-R15 skipped."         + Chr(13)
 
    CompilerCase #PB_Processor_PowerPC
      ErrorMessage$ + "r0 = " + Str(ErrorRegister(#PB_OnError_r0)) + Chr(13)
      ErrorMessage$ + "r1 = " + Str(ErrorRegister(#PB_OnError_r1)) + Chr(13)
      ErrorMessage$ + "r2 = " + Str(ErrorRegister(#PB_OnError_r2)) + Chr(13)
      ErrorMessage$ + "r3 = " + Str(ErrorRegister(#PB_OnError_r3)) + Chr(13)
      ErrorMessage$ + "r4 = " + Str(ErrorRegister(#PB_OnError_r4)) + Chr(13)
      ErrorMessage$ + "r5 = " + Str(ErrorRegister(#PB_OnError_r5)) + Chr(13)
      ErrorMessage$ + "r6 = " + Str(ErrorRegister(#PB_OnError_r6)) + Chr(13)
      ErrorMessage$ + "r7 = " + Str(ErrorRegister(#PB_OnError_r7)) + Chr(13)
      ErrorMessage$ + "Display of registers r8-R31 skipped."       + Chr(13)
 
  CompilerEndSelect
 
  MessageRequester("OnError example", ErrorMessage$)
  End
 
EndProcedure
;OnErrorCall(@ErrorHandler())









#USE_EXE_ALONE=#False;#True;#True;

Declare LoadMenuEntitys()
IncludeFile "include\EXE_Includer.pbi"
Procedure DeleteExtractedFile()
TempDir.s=GetTemporaryDirectory()+"3DGameWizard\"
;DeleteFile(TempDir)
DeleteDirectory(TempDir,"",#PB_FileSystem_Recursive|#PB_FileSystem_Force)
EndProcedure
DeleteExtractedFile()
ExtractTemporaryFiles("3DGameWizard")

IncludeFile "include\constants-game.pbi"
IncludeFile "include\zpac.pbi"
IncludeFile "include\i3d.pbi"
IncludeFile "include\Options.pbi"
IncludeFile "include\game.pbi"

CompilerIf #USE_EXE_ALONE
;   ProgramMap=ProgramParameter()
;   If ProgramMap=""
;     Pattern.s = "3DGameWizard (*.3DGW)|*.3DGW|Alle Dateien (*.*)|*.*"
;     ProgramMap=Trim(OpenFileRequester("Open","",Pattern,0))
;   EndIf
;   ProgramMap=ReplaceString(ProgramMap,Chr(34),"")
;   If ProgramMap="":End:EndIf
  ProgramMap="Map.3DGW"
CompilerElse
  ProgramMap=TempDir+"Map.3DGW"
CompilerEndIf


If ZPAC_ReadPack(ProgramMap)
  ZPAC_NextPackFile()
  ZPAC_NextPackFile()
  ZPAC_NextPackFile()
  
  *Pointer=ZPAC_NextPackFile()
  Size=ZPAC_NextPackFileSize() 
  CopyMemory(*Pointer, @GameSettings, Size)  
  ZPAC_CloseReadPack()
Else
  MessageRequester("Error","Map loading faild!")
  End
EndIf
GameTitle=GameSettings\Title
PopUp=GameSettings\UseSpezialWindow


WolfAnimator(0)\x=20
WolfAnimator(0)\y=-3.5
WolfAnimator(0)\Z=-8.5
WolfAnimator(1)\x=30
WolfAnimator(1)\y=-3.5
WolfAnimator(1)\Z=-8.5
WolfAnimator(2)\x=2
WolfAnimator(2)\y=-3.5
WolfAnimator(2)\Z=-9
WolfAnimator(3)\x=7
WolfAnimator(3)\y=-3.5
WolfAnimator(3)\Z=-25
WolfAnimator(4)\x=0
WolfAnimator(4)\y=-3.5
WolfAnimator(4)\Z=-34
WolfAnimator(5)\x=-13
WolfAnimator(5)\y=-3.5
WolfAnimator(5)\Z=-27
WolfAnimator(6)\x=-2
WolfAnimator(6)\y=-3.5
WolfAnimator(6)\Z=-9
WolfAnimator(7)\x=-50
WolfAnimator(7)\y=-3.5
WolfAnimator(7)\Z=-8.5
Procedure LoadMenuEntitys()
cam=I3D_CreateCamera()
;cam=I3D_CreateFPSCamera(100,100,100)
I3D_SetCamera(cam)

PointLight=I3D_CreatePointLight(0,-2,-23,40,I3D_RGBA(180,120,50,200))
Spot=I3D_CreatespotLight(I3D_EntityX(cam),I3D_EntityY(cam)+15,I3D_EntityZ(cam),500,I3D_RGBA(10,10,10,0))
I3D_SetLightSpecularColor(Spot,I3D_RGBA(12,12,12,200))

DirectionalLight=I3D_CreateDirectionalLight(0.5,0.5,0,I3D_RGBA(12,12,12,0))
I3D_SetLightSpecularColor(DirectionalLight,I3D_RGBA(20,20,20,0))
I3D_SetLightAmbientColor(DirectionalLight,I3D_RGBA(10,10,10,0))
I3D_SetLightDiffuseColor(DirectionalLight,I3D_RGBA(15,15,15,0))

I3D_SetEntityPosition(cam,0,0,0)
I3D_SetEntityRotation(cam,30,180,0)
I3D_MoveEntity(cam,0,15,-13)




Burg=I3D_LoadMesh("data\burg.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Burg,0,-10,-10)
I3D_EnableEntityFog(Burg,1)
;I3D_AddAnimatedMeshShadow(Burg)
;swordman-Optimized.x
; I3D_SetMaterialTexture(Burg,1,I3D_LoadTexture("1.png",0))
; I3D_SetMaterialTexture(Burg,2,I3D_LoadTexture("2.png",0))
; I3D_SetEntityMaterialType(Burg, #I3D_MATERIAL_LIGHTMAP)


Monster=I3D_LoadMesh("data\evil-swordman-attack-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Monster,-6,-2.0,-25)
I3D_EnableEntityFog(Monster,1)
I3D_ScaleEntity(Monster,0.7,0.7,0.7)
I3D_RotateEntity(Monster,90,220,0)
I3D_SetAnimatedMeshSpeed(Monster,5)
;I3D_AddAnimatedMeshShadow(Monster)




Wappen=I3D_LoadMesh("data\Wappen.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Wappen,0,3.5,-36.5)
I3D_EnableEntityFog(Wappen,1)
I3D_ScaleEntity(Wappen,2,1.9,2)
;I3D_EnableEntityLighting(Wappen,#False)
; I3D_SetMaterialSpecularColor(Wappen,0,I3D_RGBA(0,100,100,0))
; I3D_SetMaterialSpecularForce(Wappen,0,0.1)
; I3D_SetMaterialAmbientColor(Wappen,0,I3D_RGBA(0,100,100,0))


FireStones=I3D_LoadMesh("data\FireStones.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(FireStones,0,-4,-23)
I3D_RotateEntity(FireStones,90,0,0)
I3D_EnableEntityFog(FireStones,1)
;I3D_AddAnimatedMeshShadow(FireStones)


Tree1=I3D_LoadMesh("data\tree02.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree1,21,-4,-25)
I3D_EnableEntityFog(Tree1,1)
I3D_SetEntityRotation(Tree1,0,Random(360),0)
;I3D_EnableEntityLighting(Tree1,0)
I3D_ScaleEntity(Tree1, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree2=I3D_LoadMesh("data\tree02.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree2,30,-4,-35)
I3D_EnableEntityFog(Tree2,1)
I3D_SetEntityRotation(Tree2,0,Random(360),0)
;I3D_EnableEntityLighting(Tree2,0)
I3D_ScaleEntity(Tree2, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree3=I3D_LoadMesh("data\tree02.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree3,30,-4,-28)
I3D_EnableEntityFog(Tree3,1)
I3D_SetEntityRotation(Tree3,0,Random(360),0)
;I3D_EnableEntityLighting(Tree3,0)
I3D_ScaleEntity(Tree3, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree4=I3D_LoadMesh("data\tree02.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree4,-21,-4,-25)
I3D_EnableEntityFog(Tree4,1)
I3D_SetEntityRotation(Tree4,0,Random(360),0)
;I3D_EnableEntityLighting(Tree4,0)
I3D_ScaleEntity(Tree4, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree5=I3D_LoadMesh("data\tree02.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree5,-30,-4,-45)
I3D_EnableEntityFog(Tree5,1)
I3D_SetEntityRotation(Tree5,0,Random(360),0)
;I3D_EnableEntityLighting(Tree5,0)
I3D_ScaleEntity(Tree5, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree6=I3D_LoadMesh("data\tree02.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree6,-35,-4,-30)
I3D_EnableEntityFog(Tree6,1)
I3D_SetEntityRotation(Tree6,0,Random(360),0)
;I3D_EnableEntityLighting(Tree6,0)
I3D_ScaleEntity(Tree6, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree7=I3D_LoadMesh("data\Tree-Complex-Bird-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree7,2,-4,-60)
I3D_EnableEntityFog(Tree7,1)
I3D_SetEntityRotation(Tree7,0,Random(360),0)
I3D_ScaleEntity(Tree7, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)
I3D_SetAnimatedMeshSpeed(Tree7,20)


Tree8=I3D_LoadMesh("data\Tree-Complex-Dead-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree8,-15,-4,-50)
I3D_EnableEntityFog(Tree8,1)
I3D_SetEntityRotation(Tree8,0,Random(360),0)
I3D_ScaleEntity(Tree8, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree9=I3D_LoadMesh("data\Tree-Complex-Dead-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree9,-30,-4,-30)
I3D_EnableEntityFog(Tree9,1)
I3D_SetEntityRotation(Tree9,0,Random(360),0)
I3D_ScaleEntity(Tree9, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree10=I3D_LoadMesh("data\Tree-Complex-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree10,-26,-4,-15)
I3D_EnableEntityFog(Tree10,1)
I3D_SetEntityRotation(Tree10,0,Random(360),0)
I3D_ScaleEntity(Tree10, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree11=I3D_LoadMesh("data\Tree-Complex-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree11,23,-4,-18)
I3D_EnableEntityFog(Tree11,1)
I3D_SetEntityRotation(Tree11,0,Random(360),0)
I3D_ScaleEntity(Tree11, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)

Tree12=I3D_LoadMesh("data\Tree-Complex-Optimized.x",#I3D_MESH_ANIMATED)
i3d_MoveEntity(Tree12,19,-4,-48)
I3D_EnableEntityFog(Tree12,1)
I3D_SetEntityRotation(Tree12,0,Random(360),0)
I3D_ScaleEntity(Tree12, 1.5+Random(100)/200, 1.5+Random(100)/200, 1.5+Random(100)/200)



box=I3D_LoadMesh("data\rr.x",#I3D_MESH_ANIMATED)
I3D_SetMaterialTexture(box,0,boxTex)
I3D_ScaleEntity(box,140,1,140)
I3D_MoveEntity(box,0,-5,-80)
I3D_EnableEntityFog(Box,1)
;I3D_AddAnimatedMeshShadow(box)

Wolf=I3D_LoadMesh("data\anim_wolf_1.x",#I3D_MESH_ANIMATED)
I3D_MoveEntity(Wolf,0,-3.5,-10)
I3D_EnableEntityFog(Wolf,1)
I3D_RotateEntity(WOlf,0,90,0)
I3D_AddEntityFlyRouteAnimator(Wolf,@WolfAnimator(),8,0.2,1)
;I3D_AddAnimatedMeshShadow(Wolf)
I3D_SetAnimatedMeshSpeed(Wolf,20)

Fire=I3D_CreateParticleSystem(0,-3,-22,FireTex)
I3D_SetEntityMaterialType(Fire, #I3D_MATERIAL_TRANSPARENT_ADD_COLOR)
I3D_SetParticleMaxAngleDegree(Fire,30)
I3D_AddParticleSystemGravity(Fire, 0,-0.01, 0, 2000)
I3D_SetParticleSystemLifeTime(Fire,400,800)
I3D_AddParticleSystemFadeOut(Fire,I3D_RGBA(0,0,0,0),200)
I3D_SetParticleSystemEmission(Fire,15,100)
I3D_SetParticleSystemParticleSize(Fire,5,5)
I3D_SetParticleSystemColors(Fire,I3D_RGBA(10,10,0,10),I3D_RGBA(210,150,50,200))
I3D_EnableEntityFog(Fire,1)

;I3D_CreatePointLight(0,-2,-23,30,I3D_RGBA(150,100,30,0))
Smoke=I3D_CreateParticleSystem(0,-3,-22,SmokeTex)
I3D_SetEntityMaterialType(Smoke, #I3D_MATERIAL_TRANSPARENT_ADD_COLOR)
I3D_SetParticleMaxAngleDegree(Smoke,20)
I3D_AddParticleSystemGravity(Smoke, 0,0.01, 0, 2000)
I3D_SetParticleSystemLifeTime(Smoke,600,1400)
I3D_AddParticleSystemFadeOut(Smoke,I3D_RGBA(0,0,0,0),200)
I3D_SetParticleSystemEmission(Smoke,10,100)
I3D_SetParticleSystemParticleSize(Smoke,5,5)
I3D_SetParticleSystemColors(Smoke,I3D_RGBA(0,0,0,0),I3D_RGBA(100,100,100,100))
I3D_EnableEntityFog(Smoke,1)

I3D_SetSpriteColor(FogSprite,I3D_RGBA(255,255,255,255))
I3D_SetFog(I3D_RGBA(0,0,0,0),0,220)
EndProcedure

Procedure LoadSprites()
FogSprite=I3D_LoadSprite("data\fog.png",0)
RRSprite=I3D_LoadSprite("data\RRSoftware.png",0)
BarSprite=I3D_LoadSprite("data\LifeBar.png",0)
Bar2Sprite=I3D_LoadSprite("data\LifeBar2.png",0)
BloodSprite=I3D_LoadSprite("data\Blood.png",0)
InfoSprite=I3D_LoadSprite("data\Info2.png",0)

GameWizardSprite=I3D_LoadSprite("data\3DGameWizard.png",0)
If FileSize(TempDir+"Logo.png")
  GameLogoSprite=I3D_LoadSprite(TempDir+"Logo.png",0)
EndIf
I3D_SetSpriteColor(RRSprite,I3D_RGBA(255,255,255,200))
Init2DFont("data\metallic03\")
EndProcedure
Procedure LoadTextures()
boxTex=I3D_LoadTexture("data\Burg.jpg",0)
FireTex=I3D_LoadTexture("data\Burn.jpg",0)
SmokeTex=I3D_LoadTexture("data\Fire0.jpg",0)
Tree02Tex=I3D_LoadTexture("data\TreeTexture2.jpg",0)
GroundTex=I3D_LoadTexture("data\ground-tex.jpg",0)
GroundTex2=I3D_LoadTexture("data\ground-tex2.jpg",0)
WallTex=I3D_LoadTexture("data\Wall2.jpg",0)
Wall2Tex=I3D_LoadTexture("data\Lager.jpg",0)
LifeTex=I3D_LoadTexture("data\life.png",0)
WolfTex=I3D_LoadTexture("data\TEX_wolf2.jpg",0)
Bush2Tex=I3D_LoadTexture("data\Bush2.jpg",0)
WoodboxTex=I3D_LoadTexture("data\woodbox.jpg",0)
StoneboxTex=I3D_LoadTexture("data\Stonebox.jpg",0)
EndProcedure
Procedure LoadSounds()
; _LoadSound(#Sound_Col,"sound\3.wav")
; _LoadSound(#Sound_Bomb,"sound\1.wav")

_CatchSound(#Sound_Bomb,?Snd_1)
_CatchSound(#Sound_Col,?Snd_2)
_CatchSound(#Sound_Schlag_1,?Snd_Schlag_1)
_CatchSound(#Sound_Schlag_2,?Snd_Schlag_2)
_CatchSound(#Sound_Schlag_3,?Snd_Schlag_3)
_CatchSound(#Sound_Schlag_4,?Snd_Schlag_4)
_CatchSound(#Sound_Wolf_Angriff,?Snd_Wolf_Angriff)
_CatchSound(#Sound_Wolf,?Snd_Wolf)


If FileSize(TempDir+"Music.ogg")>0
_LoadSound(#Sound_Music,TempDir+"Music.ogg")
_playsound(#Sound_Music,1)
EndIf

EndProcedure

I3D__CreateContext()
I3D_SetLogCBFunction(@LogCBFunc())

I3D_Log(Chr(13)+Chr(13)+"Program start", 0) 
CompilerIf #USE_EXE_ALONE
  I3D_AddZipArchive("data.dat")
CompilerElse
  If I3D_AddZipArchive(TempDir+"data.dat")=#False
  MessageRequester("Error","Data loading faild!")
  End
  EndIf
CompilerEndIf

;cam=I3D_CreateFPSCamera(100,100,100)
;I3D_SetCamera(cam)





cam=I3D_GetCamera()


LoadSprites()
LoadTextures()
LoadSounds()
LoadMenuEntitys()

Shader=1
If I3D_IsFeaturePresent( #I3D_FEATURE_PIXEL_SHADER_2_0)<>1
;MessageRequester("Error","Es ist kein Pixel Shader 2.0 verfügbar!")
Shader=0
EndIf

If Shader=1

Select GameSettings\Shader
Case 1
effect=I3D_CreatePostProcessFromFile("Data\Post_RadialBlur.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Case 2
effect=I3D_CreatePostProcessFromFile("Data\Blur.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Case 3
effect=I3D_CreatePostProcessFromFile("Data\BW.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Case 4
effect=I3D_CreatePostProcessFromFile("Data\PSPs_sharp.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Case 5
effect=I3D_CreatePostProcessFromFile("Data\PSPs_oldscool.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Case 6
effect=I3D_CreatePostProcessFromFile("Data\PS_block_waves.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Case 7
effect=I3D_CreatePostProcessFromFile("Data\POST_WATER_EFFECT.hlsl",#I3D_PIXELSHADER_2_0,"main",2)
Default
effect=0
EndSelect
EndIf

;I3D_SaveScene("Test.irr")




;I3D_CreateVolumeLight(0,0,-30)

If GameSettings\UseMenu=#False
Game()
End
EndIf

Repeat
  I3D__WindowEvent()
  Delay(1)

  MX=I3D_GetMouseX()
  MY=I3D_GetMouseY()

  entity = I3D_PickEntity(MX,MY,1)
  px.f = I3D_PickX()
  py.f = I3D_PickY()
  pz.f = I3D_PickZ()
  
  ;Debug "MX="+Str(MX)+" MY="+Str(MY)+" e="+Str(entity)+" X="+Str(px)+" Y="+Str(py)+" Z="+Str(pz)
  I3D_SetLightDiffuseColor(PointLight,I3D_RGBA(Random(70)+30,Random(50)+20,Random(5),0))
  I3D_SetLightSpecularColor(PointLight,I3D_RGBA(10,10,10,0))
  
  If GameSettings\Credits
  If MX>ScreenWidth-(280*ScreenWidth/800)
  If MY>Screenheight-(80*Screenheight/600)
    entity=0
    ToolTipX=MX-45
    ToolTipY=MY-150
    ToolTipTrans+50
    If ToolTipTrans>255:ToolTipTrans=255:EndIf
    ToolTipText.s="Credits"
    If GetAsyncKeyState_(#VK_LBUTTON) And I3D_IsScreenActive():_playsound(#Sound_Wolf):Credits():EndIf
  EndIf    
  EndIf
  EndIf
  
  If entity=Monster Or entity=FireStones Or entity=Wolf
    ToolTipX=MX-45
    ToolTipY=MY-150
    ToolTipTrans+50
    If ToolTipTrans>255:ToolTipTrans=255:EndIf
    ToolTipText.s="Play"
    If GetAsyncKeyState_(#VK_LBUTTON) And I3D_IsScreenActive():I3D_Log("Start Game", 0) :_playsound(#Sound_Wolf):Game():EndIf
  EndIf  
  
  If entity=Wappen
    ToolTipX=MX-45
    ToolTipY=MY-150
    ToolTipTrans+50
    If ToolTipTrans>255:ToolTipTrans=255:EndIf
    ToolTipText.s="Options"
    If GetAsyncKeyState_(#VK_LBUTTON) And I3D_IsScreenActive():_playsound(#Sound_Wolf):Options():EndIf
  EndIf    
  
  
  If entity=Tree1 Or entity=Tree2 Or entity=Tree3 Or entity=Tree4 Or entity=Tree5 Or entity=Tree6 Or entity=Tree7 Or entity=Tree8 Or entity=Tree9 Or entity=Tree10 Or entity=Tree11 Or entity=Tree12
    ToolTipX=MX-45
    ToolTipY=MY-150
    ToolTipTrans+50
    If ToolTipTrans>255:ToolTipTrans=255:EndIf
    ToolTipText.s="End"
    If GetAsyncKeyState_(#VK_LBUTTON) And I3D_IsScreenActive():End:EndIf
  EndIf   
  

  
  If px>spotX:SpotX+4:EndIf
  If px<spotX:SpotX-4:EndIf
  If py>spoty:Spoty+4:EndIf
  If py<spoty:Spoty-4:EndIf
  If pz>spotz:Spotz+4:EndIf
  If pz<spotz:Spotz-4:EndIf
  
  I3D_EntityLookAt(Spot,Spotx,Spoty,Spotz)
  
  I3D_EntityLookAt(cam,0,0,-20)
  CamAngle.f+0.015
  If CamAngle<2*#PI
    I3D_SetEntityPosition(cam,Sin(CamAngle)*50,30,Cos(CamAngle)*50-20)
  Else
    If CamAngle<7.2
      I3D_SetEntityPosition(cam,0,30-((CamAngle-2*#PI)*4),30-((CamAngle-2*#PI)*30))
    EndIf
  EndIf
  
  
  i3d_beginscene(I3D_RGBA(0,0,0,0))
  If Shader=1 And effect>0
    I3D_BeginPostProcess(effect,1,1,I3D_RGBA(0,0,0,0))
  EndIf
  I3D_RenderScene()

;;-> ***Correct***
;;   I3D_StartDrawQuad3D()
;;   I3D_DrawQuad3D( SmokeTex, 0, 0, 0, 40, 0, 0, 0, 40, 0, 40, 40, 0) 
;;   I3D_StopDrawQuad3D()

  
  
  If Shader=1 And effect>0
    I3D_EndPostProcess(effect)
  EndIf
  
  Fogcount+1
  If ToolTipTrans>0
    DrawToolTip(ToolTipX,ToolTipY,ToolTipText.s,ToolTipTrans)
    ToolTipTrans-10
  EndIf
  I3D__DrawSprite2Dex(FogSprite,-Sin(Fogcount/300)*200-200,0,800+Sin(Fogcount/300)*400+400,600,0)
  If GameSettings\Credits
    I3D__DrawSprite2D(RRSprite,525,470)
  EndIf
  If GameLogoSprite
    I3D__DrawSprite2D(GameLogoSprite,800-I3D_GetSpriteWidth(GameLogoSprite),600-I3D_GetSpriteHeight(GameLogoSprite))
  EndIf
  I3D__DrawGUI()
  ;I3D_DrawText2D(Arial,0,0,Str(px)+","+Str(py)+","+Str(pz),I3D_RGBA(255,255,255,255))


;;-> ***Hier incorrect***
;;     I3D_StartDrawQuad3D()
;;     I3D_DrawQuad3D( SmokeTex, 0, 0, 0, 40, 0, 0, 0, 40, 0, 40, 40, 0) 
;;     I3D_StopDrawQuad3D()
  
  i3d_endscene()
  

Until Ende=1 
ZPAC_Free()
I3D_FreeContext()

DeleteExtractedFile()




; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 128
; FirstLine = 432
; Folding = M-
; EnableThread
; EnableXP
; EnableOnError
; UseIcon = Editor-Data\Ritter2.ico
; Executable = 3DGameWizard_game.exe
; EnableCompileCount = 1311
; EnableBuildCount = 149
; EnableExeConstant
; IncludeVersionInfo
; VersionField0 = 1,2,0,0
; VersionField1 = 1,2,0,0
; VersionField4 = 1.20
; VersionField5 = 1.20
; VersionField6 = Created with 3DGameWizard
; VersionField18 = Created with
; VersionField19 = 3DGameWizard HP
; VersionField20 = RRSoftware
; VersionField21 = 3DGameWizard
; VersionField22 = http://3DGW.RRSoftware.de
; VersionField23 = http://www.RRSoftware.de