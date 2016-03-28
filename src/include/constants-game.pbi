Declare Animation(Animation)

Structure POINT3D
x.f
y.f
z.f
EndStructure
Global Dim WolfAnimator.POINT3D(10)
Global Fogcount


;Entitys:
Global Cam, Burg, Monster, Wappen, FireStones, Tree1, Tree2, Tree3, Tree4, Tree5, Tree6, Tree7, Tree8, Tree9, Tree10, Tree11, Tree12, box, Wolf, PointLight, Fire, Smoke, Spot
;Textures:
Global boxTex, FireTex, SmokeTex, GroundTex, GroundTex2, WallTex, Wall2Tex, LifeTex, WolfTex, Bush2Tex, WoodboxTex, StoneboxTex
;Sprites:
Global FogSprite, RRSprite, BarSprite, Bar2Sprite, BloodSprite, GameWizardSprite, GameLogoSprite, InfoSprite
;Animators:
Global CamAnimator

Enumeration 
#TypeFile_Gras
#TypeFile_Baum
#TypeFile_Wand
#TypeFile_Wand2
#TypeFile_Start
#TypeFile_Life
#TypeFile_Prick
#TypeFile_Bomb
#TypeFile_Wolf
#TypeFile_Bush
#TypeFile_Ritter
#TypeFile_Ritter2
#TypeFile_Palm
#TypeFile_End
#TypeFile_Beam
#TypeFile_Treasure
#TypeFile_MSG
#TypeFile_Lamp
#TypeFile_Flare
#TypeFile_Key
#TypeFile_Gate
#TypeFile_Gate2
#TypeFile_Gate3
#TypeFile_Gate4
#TypeFile_Woodwall
#TypeFile_Woodwall2
#TypeFile_Woodwall3
#TypeFile_Woodbox
#TypeFile_Stonebox
EndEnumeration

Enumeration 
#Type_Gras_1
#Type_Gras_2
#Type_Baum_1
#Type_Baum_2
#Type_Baum_3
#Type_Baum_4
#Type_Baum_5
#Type_Wand
#Type_Wand2
#Type_Life
#Type_Prick
#Type_Bomb
#Type_Bush_1
#Type_Bush_2
#Type_Palm
#Type_End
#Type_Beam
#Type_Treasure
#Type_MSG
#Type_Lamp
#Type_Flare
#Type_Key
#Type_Gate
#Type_Woodwall
#Type_Woodwall_big
#Type_Woodbox
#Type_Stonebox

;*********
#Type_Last
EndEnumeration


Enumeration 
#ManAni_Fight
#ManAni_Die
#ManAni_Hands
#ManAni_Hit
EndEnumeration



Enumeration 
#Enemy_Wolf
#Enemy_Ritter
#Enemy_Ritter2

;*********
#Enemy_Last
EndEnumeration
Structure EnemyStructure
Used.i
Entity.i
Life.i
Speed.f
Attack.f
Ani_Die.i
Ani_Attack.i
EndStructure
Global Dim Enemy.EnemyStructure(#Enemy_Last,500)
Global Dim LastEnemy(#Enemy_Last)


Enumeration 
  #Sound_Col
  #Sound_Bomb
  #Sound_Music
  #Sound_Schlag_1
  #Sound_Schlag_2
  #Sound_Schlag_3
  #Sound_Schlag_4
  #Sound_Wolf_Angriff
  #Sound_Wolf
EndEnumeration

Global effect
Global Shader

Global OptionsFile.s = GetTemporaryDirectory()+"3DGW_Optionsfile.dat";"Data\Options.dat"


#MaxDist=100

Structure ObjectPoolStructure
  Used.i
  Entity.i
  Tree.i
EndStructure

Global Dim ObjectPool.ObjectPoolStructure(#Type_Last,500)

Structure Map3D
  ;Visible.l
  Type.l
  ;Entity.l
  Col.l
  StructureUnion
    Rotation.l
    Attack.l
    Life.l
    X.l
  EndStructureUnion
  StructureUnion
    Y.l
    Locked.l
  EndStructureUnion
  StructureUnion
    Z.l
    Position.l
  EndStructureUnion
  StructureUnion
    A.l
    Speed.l
  EndStructureUnion
  String.s
EndStructure

Structure Map
  Type.l
  Long.l
  Long2.l
EndStructure


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


Global MapSizeX,MapSizeY
Global StartPosX, StartPosY
Global Game_Swordman,Game_Swordman_Hit,Game_Swordman_Die,Game_Swordman_Fight,Game_Swordman_Fight2,Game_Swordman_Hands
Global LifePoints.f
Global LoadingCount
Global ColSound
Global Frame, SwordmanAnimationType, SwordmanAnimation.f, SwordmanAnimationSpeed.f
Global PickedKeys.i

Global ProgramMap.s
Global killedCreatures
Global StartGameTime
Global pickedtreasures
Global TempDir.s=GetTemporaryDirectory()+"3DGameWizard\"


DataSection
  Snd_1:           IncludeBinary "sound\1.wav"
  Snd_2:           IncludeBinary "sound\2.wav"
  Snd_Schlag_1:    IncludeBinary "sound\Schlag_1.wav"
  Snd_Schlag_2:    IncludeBinary "sound\Schlag_2.wav"
  Snd_Schlag_3:    IncludeBinary "sound\Schlag_3.wav"
  Snd_Schlag_4:    IncludeBinary "sound\Schlag_4.wav"
  Snd_Wolf_Angriff:IncludeBinary "sound\Wolf-Angriff.wav"
  Snd_Wolf:        IncludeBinary "sound\Wolf.wav"
EndDataSection

; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 180
; FirstLine = 163
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant