

Procedure CreateflameFire()
par=I3D_CreateParticleSystem(0,0,0,FireTex)

I3D_SetEntityMaterialType(par, #I3D_MATERIAL_TRANSPARENT_ADD_COLOR)
I3D_SetParticleMaxAngleDegree(par,30)
I3D_AddParticleSystemGravity(par, 0,-0.01, 0, 1500)
I3D_SetParticleSystemLifeTime(par,300,600)
I3D_AddParticleSystemFadeOut(par,I3D_RGBA(0,0,0,0),200)
I3D_SetParticleSystemEmission(par,30,150)
I3D_SetParticleSystemParticleSize(par,4,4)
I3D_SetParticleSystemColors(par,I3D_RGBA(10,10,0,10),I3D_RGBA(210,150,50,200))
;I3D_EnableEntityFog(par,1)


ProcedureReturn par
EndProcedure


Procedure DrawLoad(Prozent)
  ;i3d_beginsceneex(1,1,I3D_RGBA(128,128,128,0))
  i3d_beginscene(I3D_RGBA(128,128,128,0))
  I3D__DrawGUI()
  Draw2DFont(ScreenWidth/2-160,Screenheight/2,"Please wait "+Str(Prozent)+"%",1,1,200)
  I3D__DrawSprite2D(BarSprite,200,550)
  I3D__DrawSprite2D(Bar2Sprite,150+LoadingCount,550)
  I3D__DrawSprite2D(Bar3Sprite,150,550)
  LoadingCount+5
  If LoadingCount>450:LoadingCount=0:EndIf
  i3d_endscene()
EndProcedure
Procedure DrawLoad2()
  ;i3d_beginsceneex(1,1,I3D_RGBA(128,128,128,0))
  i3d_beginsceneex(0,0,I3D_RGBA(0,0,0,0))
  I3D__DrawGUI()
  I3D__DrawSprite2Dex(FogSprite,-Sin(Fogcount/300)*200-200,0,800+Sin(Fogcount/300)*400+400,600,0)
  Draw2DFont(ScreenWidth/2-140,Screenheight/2,"Please wait",1,1,200)
  ;I3D__DrawSprite2D(BarSprite,200,550)
  ;I3D__DrawSprite2D(Bar2Sprite,150+LoadingCount,550)
  ;I3D__DrawSprite2D(Bar3Sprite,150,550)
  ;LoadingCount+5
  ;If LoadingCount>450:LoadingCount=0:EndIf
  i3d_endscene()
EndProcedure
Procedure DrawLifeBar(X,Y,Prozent.f);0,540
If Prozent>100:Prozent=100:EndIf
If Prozent<0:Prozent=0:EndIf
I3D_SetSpriteColor(BarSprite,I3D_RGBA(255-Prozent*2,Prozent*2,0,150))
I3D__DrawSprite2Dex(Bar2Sprite,X,Y,256,32,0)
I3D__DrawSprite2Dex(BarSprite,X+12,Y,2.435*Prozent,16,0)
EndProcedure

Procedure LoadEnemy(Type,X,Z,Life=-1,Attack=-1,Speed=-1)
Select Type
Case #Enemy_Wolf
  Enemy(Type,LastEnemy(Type))\Life=100+Random(10)-Random(10)
  Enemy(Type,LastEnemy(Type))\Attack=100+Random(10)-Random(10)
  Enemy(Type,LastEnemy(Type))\Speed=1.5+Random(100)/100-Random(100)/100
  Enemy(Type,LastEnemy(Type))\Entity=I3D_LoadMesh("data\anim_wolf_1.x",#I3D_MESH_ANIMATED)
  I3D_SetAnimatedMeshSpeed(Enemy(Type,LastEnemy(Type))\Entity,0.01)
  I3D_MoveEntity(Enemy(Type,LastEnemy(Type))\Entity,X,1.5,Z)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Entity,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Entity,100)
  I3D_ScaleEntity(Enemy(Type,LastEnemy(Type))\Entity,1.5,1.8,1.5)
  I3D_SetMaterialTexture(Enemy(Type,LastEnemy(Type))\Entity,0,WolfTex)

Case #Enemy_Ritter
  Enemy(Type,LastEnemy(Type))\Life=150+Random(10)-Random(10)
  Enemy(Type,LastEnemy(Type))\Attack=150+Random(10)-Random(10)
  Enemy(Type,LastEnemy(Type))\Speed=1.1+Random(80)/100-Random(100)/100
  Enemy(Type,LastEnemy(Type))\Entity=I3D_LoadMesh("data\evil-swordman-Optimized.x",#I3D_MESH_ANIMATED)
  Enemy(Type,LastEnemy(Type))\Ani_Die=I3D_LoadMesh("data\evil-swordman-die-Optimized.x",#I3D_MESH_ANIMATED)
  Enemy(Type,LastEnemy(Type))\Ani_Attack=I3D_LoadMesh("data\evil-swordman-attack-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_SetAnimatedMeshSpeed(Enemy(Type,LastEnemy(Type))\Ani_Attack,0.01)
  I3D_SetAnimatedMeshSpeed(Enemy(Type,LastEnemy(Type))\Entity,0.01)
  I3D_EnableEntity(Enemy(Type,LastEnemy(Type))\Ani_Attack,#False)
  I3D_EnableEntity(Enemy(Type,LastEnemy(Type))\Ani_Die,#False)
  I3D_MoveEntity(Enemy(Type,LastEnemy(Type))\Entity,X,2.5,Z)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Entity,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Entity,100)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Ani_Die,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Ani_Die,100)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Ani_Attack,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Ani_Attack,100)

Case #Enemy_Ritter2
  Enemy(Type,LastEnemy(Type))\Life=200+Random(10)-Random(10)
  Enemy(Type,LastEnemy(Type))\Attack=200+Random(10)-Random(10)
  Enemy(Type,LastEnemy(Type))\Speed=1.1+Random(100)/100-Random(100)/100
  Enemy(Type,LastEnemy(Type))\Entity=I3D_LoadMesh("data\swordman-Optimized.x",#I3D_MESH_ANIMATED)
  Enemy(Type,LastEnemy(Type))\Ani_Die=I3D_LoadMesh("data\swordman-die-Optimized.x",#I3D_MESH_ANIMATED)
  Enemy(Type,LastEnemy(Type))\Ani_Attack=I3D_LoadMesh("data\swordman-fight-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_SetAnimatedMeshSpeed(Enemy(Type,LastEnemy(Type))\Ani_Attack,0.01)
  I3D_SetAnimatedMeshSpeed(Enemy(Type,LastEnemy(Type))\Entity,0.01)
  I3D_EnableEntity(Enemy(Type,LastEnemy(Type))\Ani_Attack,#False)
  I3D_EnableEntity(Enemy(Type,LastEnemy(Type))\Ani_Die,#False)
  I3D_MoveEntity(Enemy(Type,LastEnemy(Type))\Entity,X,2.5,Z)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Entity,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Entity,100)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Ani_Die,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Ani_Die,100)
  I3D_EnableEntityFog(Enemy(Type,LastEnemy(Type))\Ani_Attack,#True)
  I3D_SetEntityMaxDist(Enemy(Type,LastEnemy(Type))\Ani_Attack,100)


EndSelect
If Life<>-1
If Life<1:Life=1:EndIf
Enemy(Type,LastEnemy(Type))\Life=Life
EndIf
If Attack<>-1
Enemy(Type,LastEnemy(Type))\Attack=Attack
EndIf
If Speed<>-1
If Speed>5:Speed=5:EndIf
If Speed<0:Speed=1:EndIf
Enemy(Type,LastEnemy(Type))\Speed=Speed
EndIf


Enemy(Type,LastEnemy(Type))\Used=#True
LastEnemy(Type)+1




EndProcedure
Procedure LoadMap(File.s="")

For Type=0 To #Type_Last-1
For i=0 To 499
  ObjectPool(Type,i)\Used=-1
Next
Next

For Type=0 To #Enemy_Last-1
For i=0 To 499
  Enemy(Type,i)\Used=-1
Next
Next


  If File.s=""
  File.s=Trim(I3D_SelectFileBox("Open",".3DGW"))
  EndIf
  If File
    If ZPAC_ReadPack(File)
    MapSizeX=Val(PeekS(ZPAC_NextPackFile()))
    MapSizeY=Val(PeekS(ZPAC_NextPackFile()))
    *Pointer=ZPAC_NextPackFile()
    Size=ZPAC_NextPackFileSize() 
    Dim Map.Map(2049,2049) 
    Global Dim Map3D.Map3D(MapSizeX,MapSizeY)
    CopyMemory(*Pointer, @Map(), Size)
    StartPosX=-1
    StartPosY=-1
    
    ZPAC_NextPackFile()
    *Pointer=ZPAC_NextPackFile()
    Size=ZPAC_NextPackFileSize() 
    CopyMemory(*Pointer, @Strings(), Size) 
    
    For x=0 To MapSizeX-1
    For y=0 To MapSizeY-1
      Map3D(x,y)\Rotation = 0
      If Map(x,y)\Type = #TypeFile_Baum
        Map3D(x,y)\Rotation = Random(3600)/10
        Select Int(Random(499)/100)
          Case 0
            Map3D(x,y)\Type = #Type_Baum_1
          Case 1
            Map3D(x,y)\Type = #Type_Baum_2
          Case 2
            If Random(1)
              Map3D(x,y)\Type = #Type_Baum_3
            Else
              Map3D(x,y)\Type = #Type_Baum_2
            EndIf
          Case 3
            Map3D(x,y)\Type = #Type_Baum_4
          Case 4
            Map3D(x,y)\Type = #Type_Baum_5
        EndSelect
        ;Map3D(x,y)\Type = #Type_Lamp
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Bush
        Map3D(x,y)\Rotation = Random(3600)/10
        Select Int(Random(199)/100)
          Case 0
            Map3D(x,y)\Type = #Type_Bush_1
          Case 1
            Map3D(x,y)\Type = #Type_Bush_2
        EndSelect
      EndIf
      
      If Map(x,y)\Type = #TypeFile_End
        Map3D(x,y)\Type = #Type_End
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Beam
        Map3D(x,y)\Type = #Type_Beam
        Map3D(x,y)\X = Map(x,y)\Long
        Map3D(x,y)\Y = Map(x,y)\Long2
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Life
        Map3D(x,y)\Life = Map(x,y)\Long
        Map3D(x,y)\Type = #Type_Life
      EndIf
      
      If Map(x,y)\Type = #TypeFile_bomb
        Map3D(x,y)\Attack = Map(x,y)\Long
        Map3D(x,y)\Type = #Type_bomb
      EndIf
            
      If Map(x,y)\Type = #TypeFile_Wand
        Map3D(x,y)\Type = #Type_Wand
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Gate
        Map3D(x,y)\Position = 0
        Map3D(x,y)\Locked = #True
        Map3D(x,y)\Rotation = 0
        Map3D(x,y)\Type = #Type_Gate
      EndIf

      If Map(x,y)\Type = #TypeFile_Gate2
        Map3D(x,y)\Position = 0
        Map3D(x,y)\Locked = #True
        Map3D(x,y)\Rotation = 90
        Map3D(x,y)\Type = #Type_Gate
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Gate3
        Map3D(x,y)\Position = 0
        Map3D(x,y)\Locked = #False
        Map3D(x,y)\Rotation = 0
        Map3D(x,y)\Type = #Type_Gate
      EndIf

      If Map(x,y)\Type = #TypeFile_Gate4
        Map3D(x,y)\Position = 0
        Map3D(x,y)\Locked = #False
        Map3D(x,y)\Rotation = 90
        Map3D(x,y)\Type = #Type_Gate
      EndIf
      

      If Map(x,y)\Type = #TypeFile_Woodwall
        Map3D(x,y)\Type = #Type_Woodwall
      EndIf      

      If Map(x,y)\Type = #TypeFile_Woodwall2
        Map3D(x,y)\Rotation = 90
        Map3D(x,y)\Type = #Type_Woodwall
      EndIf   

      If Map(x,y)\Type = #TypeFile_Woodwall3
        Map3D(x,y)\Type = #Type_Woodwall_big
      EndIf   
      
      If Map(x,y)\Type = #TypeFile_Key
        Map3D(x,y)\Type = #Type_Key
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Woodbox
        Map3D(x,y)\Type = #Type_Woodbox
      EndIf

      If Map(x,y)\Type = #TypeFile_Stonebox
        Map3D(x,y)\Type = #Type_Stonebox
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Lamp
        Map3D(x,y)\Type = #Type_Lamp
      EndIf

      If Map(x,y)\Type = #TypeFile_Flare
        Map3D(x,y)\Type = #Type_Flare
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Palm
        Map3D(x,y)\Type = #Type_Palm
        Map3D(x,y)\Rotation = Random(3600)/10
      EndIf

      If Map(x,y)\Type = #TypeFile_Wand2
        Map3D(x,y)\Type = #Type_Wand2
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Treasure
        Map3D(x,y)\Type = #Type_treasure
      EndIf 
      
      If Map(x,y)\Type = #TypeFile_MSG
        Map3D(x,y)\Type = #Type_MSG
        Map3D(x,y)\Rotation = Random(3600)/10
        
        For i=0 To 999
        If Strings(i)\X=X
        If Strings(i)\Y=Y
          Map3D(x,y)\String=Strings(i)\String
          Break
        EndIf
        EndIf
        Next
        
        
      EndIf 
      
     If Map(x,y)\Type = #TypeFile_Prick
        Map3D(x,y)\Attack = Map(x,y)\Long
        Map3D(x,y)\Type = #Type_Prick
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Wolf
        LoadEnemy(#Enemy_Wolf,X*8,y*8,Map(x,y)\Long,Map(x,y)\Long2)
        Map3D(x,y)\Type = #Type_Gras_2
      EndIf
      
      If Map(x,y)\Type = #TypeFile_Ritter
        LoadEnemy(#Enemy_Ritter,X*8,y*8,Map(x,y)\Long,Map(x,y)\Long2)
        Map3D(x,y)\Type = #Type_Gras_2
      EndIf

      If Map(x,y)\Type = #TypeFile_Ritter2
        LoadEnemy(#Enemy_Ritter2,X*8,y*8,Map(x,y)\Long,Map(x,y)\Long2)
        Map3D(x,y)\Type = #Type_Gras_2
      EndIf
      
      
      If Map(x,y)\Type = #TypeFile_Start
        StartPosX=x*8
        StartPosY=y*8
        Map3D(x,y)\Type = #Type_Gras_1
      EndIf
      
      
      If Map(x,y)\Type = #TypeFile_Gras
        Select Int(Random(199)/100)
          Case 0
           Map3D(x,y)\Type = #Type_Gras_1
          Case 1
           Map3D(x,y)\Type = #Type_Gras_2
        EndSelect  
        If StartPosX=-1 And StartPosY=-1      
          StartPosX=x*8
          StartPosY=y*8
        EndIf
      EndIf
      
      Map3D(x,y)\Col=#False
      If Map(x,y)\Type = #TypeFile_Baum:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Bush:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Wand:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Wand2:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Palm:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Lamp:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Flare:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Woodwall:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Woodwall2:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Woodwall3:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Woodbox:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Stonebox:Map3D(x,y)\Col=#True:EndIf
      If Map(x,y)\Type = #TypeFile_Life:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Prick:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_bomb:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_End:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Beam:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Treasure:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_MSG:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Key:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Gate:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Gate2:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Gate3:Map3D(x,y)\Col=2:EndIf
      If Map(x,y)\Type = #TypeFile_Gate4:Map3D(x,y)\Col=2:EndIf
    Next
    Next
    
    


    ZPAC_CloseReadPack()
    Dim Map.Map(0,0) 
    Else
    Ende=1
    I3D_MsgBox("Error","File cought not loaded.",#I3D_MSGBOX_OK)
  EndIf
  Else
  Ende=1
  EndIf  
EndProcedure
Procedure LoadObjectPool(Type,Count)
;Debug Str(Type)+","+Str(Count)
Select Type
Case #Type_Gras_1
  ObjectPool(Type,Count)\Entity = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(ObjectPool(Type,Count)\Entity,90,0,0)
  I3D_SetMaterialTexture(ObjectPool(Type,Count)\Entity,0,GroundTex)
  I3D_ScaleEntity(ObjectPool(Type,Count)\Entity,4,4,4)
  I3D_EnableEntityFog(ObjectPool(Type,Count)\Entity,#True)
  
Case #Type_Gras_2
  ObjectPool(Type,Count)\Entity = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(ObjectPool(Type,Count)\Entity,90,0,0)
  I3D_SetMaterialTexture(ObjectPool(Type,Count)\Entity,0,GroundTex2)
  I3D_ScaleEntity(ObjectPool(Type,Count)\Entity,4,4,4)
  I3D_EnableEntityFog(ObjectPool(Type,Count)\Entity,#True)
  
Case #Type_Baum_1
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\tree02.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(Tree,0,Tree02Tex)
  I3D_EnableEntityFog(Tree,#True)
  
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree
  
Case #Type_Baum_2
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Tree-Complex-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Tree,#True)
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree  
  
Case #Type_Baum_3
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)
  
  Tree = I3D_LoadMesh("Data\Tree-Complex-Bird-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_SetAnimatedMeshSpeed(Tree,20+Random(5)-Random(5))   
  I3D_SetAnimatedMeshCurrentFrame(Tree,Random(I3D_GetAnimatedMeshEndFrame(Tree)))        
  I3D_EnableEntityFog(Tree,#True)
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree

Case #Type_Baum_4
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Tree-Complex-Dead-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_MoveEntity(Tree,0,4,0)
  I3D_EnableEntityFog(Tree,#True)
  
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree



Case #Type_Baum_5
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)
  
  Tree = I3D_LoadMesh("Data\tree51.x",#I3D_MESH_ANIMATED) 
  I3D_RotateEntity(Tree,180,0,0)
  I3D_ScaleEntity(Tree,0.6,0.7,0.6)
  I3D_MoveEntity(Tree,0,-5,0)          
  I3D_EnableEntityFog(Tree,#True)
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree
  
Case #Type_Wand
  ObjectPool(Type,Count)\Entity = I3D_LoadMesh("Data\box.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(ObjectPool(Type,Count)\Entity,0,WallTex)
  I3D_ScaleEntity(ObjectPool(Type,Count)\Entity,8,20,8)    
  I3D_MoveEntity(ObjectPool(Type,Count)\Entity,0,10,0)

Case #Type_Wand2
  ObjectPool(Type,Count)\Entity = I3D_LoadMesh("Data\box.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(ObjectPool(Type,Count)\Entity,0,Wall2Tex)
  I3D_ScaleEntity(ObjectPool(Type,Count)\Entity,8,26,8)    
  I3D_MoveEntity(ObjectPool(Type,Count)\Entity,0,13,0)

Case #Type_Life
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Life = I3D_LoadMesh("Data\box.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(Life,0,LifeTex)
  I3D_ScaleEntity(Life,6,6,6)    
  I3D_MoveEntity(Life,0,3,0)
  I3D_EnableEntityFog(Life,#True)

  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Life)

Case #Type_Prick
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)
  
  Prick = I3D_LoadMesh("Data\Spikes.x",#I3D_MESH_ANIMATED)      
  I3D_EnableEntityFog(Prick,#True)
  I3D_ScaleEntity(Prick,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Prick)

Case #Type_bomb
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)
  
  Bomb = I3D_LoadMesh("Data\bomb.x",#I3D_MESH_ANIMATED)      
  I3D_EnableEntityFog(Bomb,#True)
  ;I3D_ScaleEntity(Bomb,2,2,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Bomb)

Case #Type_Bush_1
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Bush = I3D_LoadMesh("Data\bush.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Bush,#True)
  I3D_MoveEntity(Bush,0,2,0)
  
  I3D_ScaleEntity(Bush,4,4,4)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Bush)
  ObjectPool(Type,Count)\Tree = Bush

Case #Type_Bush_2
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Bush = I3D_LoadMesh("Data\bush.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(Bush,0,Bush2Tex)
  I3D_EnableEntityFog(Bush,#True)
  I3D_MoveEntity(Bush,0,2,0)
  
  I3D_ScaleEntity(Bush,4,4,4)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Bush)
  ObjectPool(Type,Count)\Tree = Bush

Case #Type_Palm
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)
  
  Tree = I3D_LoadMesh("Data\palm.x",#I3D_MESH_ANIMATED) 
  ;I3D_RotateEntity(Tree,180,0,0)
  ;I3D_ScaleEntity(Tree,0.6,0.7,0.6)
  ;I3D_MoveEntity(Tree,0,-5,0)          
  I3D_EnableEntityFog(Tree,#True)
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,1,2,1)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree
  
Case #Type_End
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  light = I3D_CreateVolumeLight(0,0,0)
  I3D_SetVolumeLightQuality(light,16)
  I3D_ScaleEntity(light,10,10,10)
  ;I3D_EnableEntityFog(light,#True)
  I3D_SetVolumeLightFootColor(light,I3D_RGBA(200,0,0,128))
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,light)


Case #Type_Beam
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  light = I3D_CreateVolumeLight(0,0,0)
  I3D_SetVolumeLightQuality(light,16)
  I3D_ScaleEntity(light,10,10,10)
  ;I3D_EnableEntityFog(light,#True)
  I3D_SetVolumeLightFootColor(light,I3D_RGBA(0,0,250,100))
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,light)


Case #Type_treasure
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Treasure = I3D_LoadMesh("Data\Schatztrue-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Treasure,#True)
  I3D_MoveEntity(Treasure,0,0,0)
  
  ;I3D_ScaleEntity(Bush,4,4,4)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Treasure)
  ObjectPool(Type,Count)\Tree = Treasure

Case #Type_MSG
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Shield = I3D_LoadMesh("Data\Shield.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Shield,#True)
  I3D_MoveEntity(Shield,0,8,0)
  
  I3D_ScaleEntity(Shield,2,3,2)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Shield)
  ObjectPool(Type,Count)\Tree = Shield

Case #Type_Lamp
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Lamp.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Tree,90,0,0)
  I3D_EnableEntityFog(Tree,#True)
  
  Tree2 = I3D_CreateVolumeLight(0,12.5,0)
  Tree3 = I3D_CreateVolumeLight(0,12.5,0)
  I3D_SetVolumeLightQuality(Tree2,6)
  I3D_SetVolumeLightQuality(Tree3,6)
  
  I3D_RotateEntity(Tree3,180,0,0)
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,2,2)
  I3D_ScaleEntity(Tree2,5,5,5)
  I3D_ScaleEntity(Tree3,5,5,5)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree2)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree3)
  ;ObjectPool(Type,Count)\Tree = Tree

Case #Type_Flare
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\flare.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Tree,#True)
  par=CreateflameFire()
  I3D_MoveEntity(par,0,15,0)
  
  ;I3D_RotateEntity(Map3D(x,y)\Entity,0,Random(3600)/10,#I3D_MESH_ANIMATED)
  I3D_ScaleEntity(Tree,2,3,2)
  I3D_MoveEntity(Tree,0,1.5,0)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,par)
  ;ObjectPool(Type,Count)\Tree = Tree


Case #Type_Key
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Key.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Tree,#True)

  I3D_ScaleEntity(Tree,1.5,1.5,1.5)
  I3D_MoveEntity(Tree,0,3,0)
  ;I3D_RotateEntity(Tree,180,0,0)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)


Case #Type_Gate
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Tor.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Tree,#True)

  I3D_ScaleEntity(Tree,2,2.5,2)
  I3D_MoveEntity(Tree,0,6,0)
  ;I3D_RotateEntity(Tree,180,0,0)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree

Case #Type_Woodwall
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Woodwall2.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Tree,#True)

  I3D_ScaleEntity(Tree,2,1.3,2)
  I3D_MoveEntity(Tree,0,6,0)
  ;I3D_RotateEntity(Tree,180,0,0)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ObjectPool(Type,Count)\Tree = Tree


Case #Type_Woodwall_big
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Tree = I3D_LoadMesh("Data\Woodwall.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Tree,#True)

  I3D_ScaleEntity(Tree,2,1.3,2)
  I3D_MoveEntity(Tree,0,6,0)
  ;I3D_RotateEntity(Tree,180,0,0)
  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Tree)
  ;ObjectPool(Type,Count)\Tree = Tree

Case #Type_Woodbox
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Life = I3D_LoadMesh("Data\box.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(Life,0,WoodboxTex)
  I3D_ScaleEntity(Life,8,8,8)    
  I3D_MoveEntity(Life,0,4,0)
  I3D_EnableEntityFog(Life,#True)

  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Life)

Case #Type_Stonebox
  Gras = I3D_LoadMesh("Data\plane.x",#I3D_MESH_ANIMATED)
  I3D_RotateEntity(Gras,90,0,0)
  I3D_SetMaterialTexture(Gras,0,GroundTex)
  I3D_ScaleEntity(Gras,4,4,4)
  I3D_EnableEntityFog(Gras,#True)

  Life = I3D_LoadMesh("Data\box.x",#I3D_MESH_ANIMATED)
  I3D_SetMaterialTexture(Life,0,stoneboxTex)
  I3D_ScaleEntity(Life,8,8,8)    
  I3D_MoveEntity(Life,0,4,0)
  I3D_EnableEntityFog(Life,#True)

  ObjectPool(Type,Count)\Entity = I3D_CreateEmptyEntity()
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Gras)
  I3D_SetEntityParent(ObjectPool(Type,Count)\Entity,Life)

EndSelect
I3D_EnableEntityFog(ObjectPool(Type,Count)\Entity,#True)
;I3D_SetEntityMaxDist(Map3D(x,y)\Entity,#MaxDist)



EndProcedure


Procedure EnemyCollision(sx,sz)
StartPosX=Int(SX/8)-2
If StartPosX<0:StartPosX=0:EndIf
If StartPosX>MapSizeX-1:StartPosX=MapSizeX-1:EndIf
StartPosY=Int(SZ/8)-2
If StartPosY<0:StartPosY=0:EndIf
If StartPosY>MapSizeY-1:StartPosY=MapSizeY-1:EndIf
StartPosX2=Int(SX/8)+2
If StartPosX2<0:StartPosX2=0:EndIf
If StartPosX2>MapSizeX-1:StartPosX2=MapSizeX-1:EndIf
StartPosY2=Int(SZ/8)+2
If StartPosY2<0:StartPosY2=0:EndIf
If StartPosY2>MapSizeY-1:StartPosY2=MapSizeY-1:EndIf

For x=StartPosX To StartPosX2
For y=StartPosY To StartPosY2
If x*8+6>SX And x*8-6<SX 
If y*8+6>SZ And y*8-6<SZ 
If Map3D(x,y)\Col>0
ProcedureReturn #True
EndIf
EndIf
EndIf
    
Next
Next

If SX<0 Or SZ<0
ProcedureReturn #True
EndIf
If SX>(MapSizeX-1)*8 Or SZ>(MapSizeY-1)*8
ProcedureReturn #True
EndIf
ProcedureReturn #False
EndProcedure
Procedure MoveWolfEnemy(Entity,Speed.f)
Rnd.f = (I3D_EntityYaw(Entity) / 180 * #PI); + #PI
I3D_SetEntityPosition(Entity,I3D_EntityX(Entity),I3D_EntityY(Entity),I3D_EntityZ(Entity)+Sin(Rnd)*Speed)
If EnemyCollision(I3D_EntityX(Entity),I3D_EntityZ(Entity))
 I3D_SetEntityPosition(Entity,I3D_EntityX(Entity),I3D_EntityY(Entity),I3D_EntityZ(Entity)-Sin(Rnd)*Speed)
EndIf
I3D_SetEntityPosition(Entity,I3D_EntityX(Entity)-Cos(Rnd)*Speed,I3D_EntityY(Entity),I3D_EntityZ(Entity))
If EnemyCollision(I3D_EntityX(Entity),I3D_EntityZ(Entity))
 I3D_SetEntityPosition(Entity,I3D_EntityX(Entity)+Cos(Rnd)*Speed,I3D_EntityY(Entity),I3D_EntityZ(Entity))
EndIf
EndProcedure

Procedure MoveRitterEnemy(Entity,Speed.f)
Rnd.f = (I3D_EntityYaw(Entity) / 180 * #PI) - #PI/2
I3D_SetEntityPosition(Entity,I3D_EntityX(Entity),I3D_EntityY(Entity),I3D_EntityZ(Entity)+Sin(Rnd)*Speed)
If EnemyCollision(I3D_EntityX(Entity),I3D_EntityZ(Entity))
 I3D_SetEntityPosition(Entity,I3D_EntityX(Entity),I3D_EntityY(Entity),I3D_EntityZ(Entity)-Sin(Rnd)*Speed)
EndIf
I3D_SetEntityPosition(Entity,I3D_EntityX(Entity)-Cos(Rnd)*Speed,I3D_EntityY(Entity),I3D_EntityZ(Entity))
If EnemyCollision(I3D_EntityX(Entity),I3D_EntityZ(Entity))
 I3D_SetEntityPosition(Entity,I3D_EntityX(Entity)+Cos(Rnd)*Speed,I3D_EntityY(Entity),I3D_EntityZ(Entity))
EndIf
EndProcedure


Procedure Win(IsEnd=#False)
Win=-1

If GameSettings\walktoend And Win<>0:Win=IsEnd:EndIf

If GameSettings\killall And Win<>0
For Type=0 To #Enemy_Last-1
For i=0 To LastEnemy(Type)-1
If Enemy(Type,i)\Used
Win=#False
EndIf
Next
Next
EndIf

If GameSettings\killCreatures And Win<>0
If killedCreatures>=GameSettings\killCreatures:Win=#True:Else:Win=#False:EndIf
EndIf

If GameSettings\lifeSec And Win<>0
If ElapsedMilliseconds()-StartGameTime>=GameSettings\lifeSec*1000:Win=#True:Else:Win=#False:EndIf
EndIf

If GameSettings\picktreasure And Win<>0
If pickedtreasures>=GameSettings\picktreasure:Win=#True:Else:Win=#False:EndIf
EndIf



If Win
  i3d_beginsceneex(0,0,I3D_RGBA(0,0,0,0))
  Draw2DFont(10,100,GameSettings\WinMSG,1,1,200)
  I3D_EndScene()
  Delay(3000)
  Ende=1
EndIf
EndProcedure


Structure Blood
X.f
Y.f
W.i
H.i
;A.i
Alpha.f
EndStructure
Global NewList Blood.Blood()
Procedure AddBlood(Num=1)
If GameSettings\Blood
  Num*4
  For i=1 To num
  AddElement(Blood())
    Blood()\X = Random(800)
    Blood()\Y = Random(600)
    Blood()\W = 16+Random(32)
    Blood()\H = 32+Random(32)
    ;Blood()\A = Random(360)
    Blood()\Alpha = 255-Random(20)
  Next
EndIf
EndProcedure
Procedure DrawBlood()
If GameSettings\Blood
  ForEach Blood()
    I3D_SetSpriteColor(BloodSprite,I3D_RGBA(255,255,255,Blood()\Alpha))
    I3D__DrawSprite2DEX(BloodSprite,Blood()\X,Blood()\Y,Blood()\W,Blood()\H,0)
    Blood()\Alpha-2
    Blood()\H+2
    Blood()\W-0.1
    Blood()\Y+0.1
    If Blood()\Alpha<1:DeleteElement(Blood()):EndIf
  Next
EndIf
EndProcedure

Structure MSGText
Count.f
Color.l
Text.s
EndStructure
Global NewList MSGText.MSGText()
Procedure AddMSGText(Text.s,Alpha=255)
AddElement(MSGText())
  MSGText()\Count = 0
  MSGText()\Color = Alpha
  MSGText()\Text = Text
EndProcedure
Procedure DrawMSGText()
ForEach MSGText()
;MSGText()\Count
Draw2DFont(10,600-MSGText()\Count,MSGText()\Text,1,1,MSGText()\Color)
MSGText()\Count+3
If MSGText()\Count>700:DeleteElement(MSGText()):EndIf
Next
EndProcedure

Procedure DrawInfo(X.f,Y.f)
I3D_SetSpriteColor(InfoSprite,I3D_RGBA(255,255,255,180))
I3D__DrawSprite2D(InfoSprite,X,Y)
w.f=I3D_GetSpriteWidth(sprite.l)*ScreenWidth/800
h.f=I3D_GetSpriteHeight(sprite.l)*Screenheight/600

x2.f=(x+100)*ScreenWidth/800
y2.f=(y+50)*Screenheight/600
Draw2DFont(X2,Y2,Str(pickedtreasures),0.8,0.8,200)

x2.f=(x+100)*ScreenWidth/800
y2.f=(y+150)*Screenheight/600
Draw2DFont(X2,Y2,Str(PickedKeys),0.8,0.8,200)


EndProcedure


Procedure EnemyWalk()
SX=I3D_EntityX(Game_Swordman)
SZ=I3D_EntityZ(Game_Swordman)

For Type=0 To #Enemy_Last-1
For i=0 To LastEnemy(Type)-1
  If Enemy(Type,i)\Used
    Entity=Enemy(Type,i)\Entity
    EX=I3D_EntityX(Entity)
    EZ=I3D_EntityZ(Entity)
    ABS=abstand(SX,SZ,EX,EZ)
    If ABS<100
      I3D_EntityLookAt(Entity,SX,1.5,SZ)
      If Type=#Enemy_Wolf
        I3D_RotateEntity(Entity,0,90,0)
      EndIf
      If Type=#Enemy_Ritter
        I3D_RotateEntity(Entity,90,180,0)
      EndIf
      If Type=#Enemy_Ritter2
        I3D_RotateEntity(Entity,90,180,0)
      EndIf
      
      If I3D_IsEntityEnabled(Enemy(Type,i)\Ani_Attack)
        I3D_SetAnimatedMeshCurrentFrame(Enemy(Type,i)\Ani_Attack,I3D_GetAnimatedMeshFrameNr(Enemy(Type,i)\Ani_Attack)+1)
        If I3D_GetAnimatedMeshFrameNr(Enemy(Type,i)\Ani_Attack)>=I3D_GetAnimatedMeshEndFrame(Enemy(Type,i)\Ani_Attack)
          I3D_SetAnimatedMeshCurrentFrame(Enemy(Type,i)\Ani_Attack,0)
          I3D_EnableEntity(Enemy(Type,i)\Ani_Attack,#False)
          I3D_EnableEntity(Enemy(Type,i)\Entity,#True)
        EndIf
      EndIf
      
      If I3D_IsEntityEnabled(Enemy(Type,i)\Entity)
        If ABS>10
          If Type=#Enemy_Wolf
            MoveWolfEnemy(Entity, Enemy(Type,i)\Speed)
          EndIf
          If Type=#Enemy_Ritter
            MoveRitterEnemy(Entity, Enemy(Type,i)\Speed)
          EndIf
          If Type=#Enemy_Ritter2
            MoveRitterEnemy(Entity, Enemy(Type,i)\Speed)
          EndIf          
          
          I3D_SetAnimatedMeshCurrentFrame(Entity,I3D_GetAnimatedMeshFrameNr(Entity)+1)
          If I3D_GetAnimatedMeshFrameNr(Entity)>I3D_GetAnimatedMeshEndFrame(Entity)
            I3D_SetAnimatedMeshCurrentFrame(Entity,0)
          EndIf
        Else
          If Random(50)=5
            If Enemy(Type,i)\Ani_Attack
              I3D_EnableEntity(Enemy(Type,i)\Ani_Attack,#True)
              I3D_EnableEntity(Enemy(Type,i)\Entity,#False)
              I3D_SetEntityPosition(Enemy(Type,i)\Ani_Attack, I3D_EntityX(Enemy(Type,i)\Entity), I3D_EntityY(Enemy(Type,i)\Entity), I3D_EntityZ(Enemy(Type,i)\Entity))
              I3D_SetEntityRotation(Enemy(Type,i)\Ani_Attack, I3D_EntityPitch(Enemy(Type,i)\Entity), I3D_EntityYaw(Enemy(Type,i)\Entity), I3D_EntityRoll(Enemy(Type,i)\Entity))
            EndIf
            
            LifePoints-2-Random(Enemy(Type,i)\Attack)/10
            AddBlood(5+Random(5))
            ;I3D_MoveEntity(Entity,3,0,0)
            If Type=#Enemy_Wolf
              _playsound(#Sound_Wolf_Angriff)
              MoveWolfEnemy(Entity, -3)
            EndIf
            If Type=#Enemy_Ritter
              MoveRitterEnemy(Entity, -3)
            EndIf
            If Type=#Enemy_Ritter2
              MoveRitterEnemy(Entity, -3)
            EndIf
                        
            Animation(#ManAni_Hit)
            
          EndIf
        EndIf
        If ABS<8
          ;I3D_MoveEntity(Entity,1,0,0)
          If Type=#Enemy_Wolf
            MoveWolfEnemy(Entity, -Enemy(Type,i)\Speed)
          EndIf
          If Type=#Enemy_Ritter
            MoveRitterEnemy(Entity, -Enemy(Type,i)\Speed)
          EndIf
          If Type=#Enemy_Ritter2
            MoveRitterEnemy(Entity, -Enemy(Type,i)\Speed)
          EndIf          
          
          I3D_SetAnimatedMeshCurrentFrame(Entity,I3D_GetAnimatedMeshFrameNr(Entity)-1)
          If I3D_GetAnimatedMeshFrameNr(Entity)<1
            I3D_SetAnimatedMeshCurrentFrame(Entity,I3D_GetAnimatedMeshEndFrame(Entity))
          EndIf
        EndIf
      EndIf
      
      
    EndIf
  EndIf
Next
Next

EndProcedure
Procedure HitEnemy()
SX=I3D_EntityX(Game_Swordman)
SZ=I3D_EntityZ(Game_Swordman)

For Type=0 To #Enemy_Last-1
For i=0 To LastEnemy(Type)-1
  If Enemy(Type,i)\Used
    EX=I3D_EntityX(Enemy(Type,i)\Entity)
    EZ=I3D_EntityZ(Enemy(Type,i)\Entity)
    If abstand(SX,SZ,EX,EZ)<10
      Enemy(Type,i)\Life-20-Random(20)
      AddBlood(Random(5))
      ;I3D_MoveEntity(Enemy(Type,i)\Entity,5,0,0)
      If Type=#Enemy_Wolf
      MoveWolfEnemy(Enemy(Type,i)\Entity,-5)
      EndIf
      If Type=#Enemy_Ritter
      MoveRitterEnemy(Enemy(Type,i)\Entity,-5)
      EndIf
      If Type=#Enemy_Ritter2
      MoveRitterEnemy(Enemy(Type,i)\Entity,-5)
      EndIf
      
      If Enemy(Type,i)\Life<=0
        AddBlood(5+Random(2))
        killedCreatures+1
        If Type=#Enemy_Wolf
          _playsound(#Sound_Wolf)
          I3D_MoveEntity(Enemy(Type,i)\Entity,0,1,0)
          I3D_RotateEntity(Enemy(Type,i)\Entity,0,0,180)
        EndIf
        
        If Enemy(Type,i)\Ani_Attack<>0:I3D_FreeEntity(Enemy(Type,i)\Ani_Attack):Enemy(Type,i)\Ani_Attack=0:EndIf
        If Enemy(Type,i)\Ani_Die<>0
          I3D_SetEntityPosition(Enemy(Type,i)\Ani_Die, I3D_EntityX(Enemy(Type,i)\Entity), I3D_EntityY(Enemy(Type,i)\Entity), I3D_EntityZ(Enemy(Type,i)\Entity))
          I3D_SetEntityRotation(Enemy(Type,i)\Ani_Die, I3D_EntityPitch(Enemy(Type,i)\Entity), I3D_EntityYaw(Enemy(Type,i)\Entity), I3D_EntityRoll(Enemy(Type,i)\Entity))
          I3D_EnableEntity(Enemy(Type,i)\Ani_Die,#True)
          I3D_FreeEntity(Enemy(Type,i)\Entity)
          Enemy(Type,i)\Entity=Enemy(Type,i)\Ani_Die
          Enemy(Type,i)\Ani_Die=0
        EndIf
        
        I3D_SetAnimatedMeshLoopMode(Enemy(Type,i)\Entity,#False)
        I3D_SetAnimatedMeshSpeed(Enemy(Type,i)\Entity,20)
        I3D_SetAnimatedMeshCurrentFrame(Enemy(Type,i)\Entity,1)
        
        If Type=#Enemy_Ritter Or Type=#Enemy_Ritter2
          I3D_AddEntityMoveAnimator(Enemy(Type,i)\Entity,0,0,0.005)
        Else
          I3D_AddEntityMoveAnimator(Enemy(Type,i)\Entity,0,0.005,0)
        EndIf
        I3D_AddEntityDeleteAnimator(Enemy(Type,i)\Entity,30000)

        Enemy(Type,i)\Used=#False
        Enemy(Type,i)\Entity = #False
      EndIf
    EndIf
  EndIf
Next
Next



StartPosX=Int(SX/8)-4
If StartPosX<0:StartPosX=0:EndIf
If StartPosX>MapSizeX-1:StartPosX=MapSizeX-1:EndIf
StartPosY=Int(SZ/8)-4
If StartPosY<0:StartPosY=0:EndIf
If StartPosY>MapSizeY-1:StartPosY=MapSizeY-1:EndIf
StartPosX2=Int(SX/8)+4
If StartPosX2<0:StartPosX2=0:EndIf
If StartPosX2>MapSizeX-1:StartPosX2=MapSizeX-1:EndIf
StartPosY2=Int(SZ/8)+4
If StartPosY2<0:StartPosY2=0:EndIf
If StartPosY2>MapSizeY-1:StartPosY2=MapSizeY-1:EndIf
For x=StartPosX To StartPosX2
For y=StartPosY To StartPosY2
Select Map3D(x,y)\Type
Case #Type_Woodbox
  If abstand(SX,SZ,X*8,y*8)<10
    Map3D(x,y)\Type=#Type_Gras_1
    Map3D(x,y)\Col=#False
    
    
    Life = I3D_LoadMesh("Data\box.x",#I3D_MESH_ANIMATED)
    I3D_SetMaterialTexture(Life,0,WoodboxTex)
    I3D_ScaleEntity(Life,8,8,8)    
    I3D_MoveEntity(Life,X*8,4,Y*8)
    I3D_EnableEntityFog(Life,#True)
    I3D_AddEntityDeleteAnimator(Life,100)
    
    Fire=I3D_CreateParticleSystem(X*8,4,y*8,SmokeTex)
    I3D_SetEntityMaterialType(Fire, #I3D_MATERIAL_TRANSPARENT_ADD_COLOR)
    I3D_SetParticleMaxAngleDegree(Fire,180)
    I3D_AddParticleSystemGravity(Fire, 0,-0.01, 0, 2000)
    I3D_SetParticleSystemLifeTime(Fire,300,500)
    I3D_AddParticleSystemFadeOut(Fire,I3D_RGBA(0,0,0,0),200)
    I3D_SetParticleSystemEmission(Fire,3000,5000)
    I3D_SetParticleSystemParticleSize(Fire,8,8)
    I3D_SetParticleSystemColors(Fire,I3D_RGBA(100,100,100,100),I3D_RGBA(255,255,255,255))
    I3D_SetParticleSystemDirection(Fire,0,0.04,0)
    I3D_StopParticleSystem( Fire,200+Random(100)-Random(50))
    
    ProcedureReturn #False
  EndIf
EndSelect
Next
Next



EndProcedure
Procedure DrawMap()

SX=I3D_EntityX(Game_Swordman)
SZ=I3D_EntityZ(Game_Swordman)

StartPosX=Int(SX/8)-10
If StartPosX<0:StartPosX=0:EndIf
If StartPosX>MapSizeX-1:StartPosX=MapSizeX-1:EndIf
StartPosY=Int(SZ/8)-10
If StartPosY<0:StartPosY=0:EndIf
If StartPosY>MapSizeY-1:StartPosY=MapSizeY-1:EndIf
StartPosX2=Int(SX/8)+10
If StartPosX2<0:StartPosX2=0:EndIf
If StartPosX2>MapSizeX-1:StartPosX2=MapSizeX-1:EndIf
StartPosY2=Int(SZ/8)+10
If StartPosY2<0:StartPosY2=0:EndIf
If StartPosY2>MapSizeY-1:StartPosY2=MapSizeY-1:EndIf

For Type=0 To #Type_Last-1
For i=0 To 499
  If ObjectPool(Type,i)\Used<>#True
    ;Debug Str(Type)+"-"+Str(i-1)
    Break
  EndIf
  If ObjectPool(Type,i)\Used=#True
    ObjectPool(Type,i)\Used=#False
    I3D_EnableEntity(ObjectPool(Type,i)\Entity,#False)
  EndIf
Next
Next


For x=StartPosX To StartPosX2;MapSizeX-1
For y=StartPosY To StartPosY2;MapSizeY-1
  Entity=#False
  
  For i=0 To 499
    If ObjectPool(Map3D(x,y)\Type,i)\Used=#False
      Entity=ObjectPool(Map3D(x,y)\Type,i)\Entity
      ObjectPool(Map3D(x,y)\Type,i)\Used=#True
      Break
    EndIf
    If ObjectPool(Map3D(x,y)\Type,i)\Used=-1
      LoadObjectPool(Map3D(x,y)\Type,i)
      Entity=ObjectPool(Map3D(x,y)\Type,i)\Entity
      ObjectPool(Map3D(x,y)\Type,i)\Used=#True
      Break
    EndIf
    
  Next
  
  If Entity
    
    I3D_SetEntityPosition(Entity,x*8,I3D_EntityY(Entity),y*8)
    
    Tree=ObjectPool(Map3D(x,y)\Type,i)\Tree
    If Map3D(x,y)\Type=#Type_Gate
      PosY.f=Map3D(x,y)\Position/20
      PosY+6
      I3D_SetEntityPosition(Tree,0,PosY,0)
    EndIf
    
    I3D_SetEntityRotation(Tree,I3D_EntityPitch(Tree),Map3D(x,y)\Rotation,I3D_EntityRoll(Tree))
    I3D_EnableEntity(Entity,#True)
  EndIf
  
  
  
      
Next
Next


EndProcedure
Procedure Animation(Animation)

  If SwordmanAnimation<>#False
    ProcedureReturn 0
  EndIf


  SwordmanX.f=I3D_EntityX(Game_Swordman)
  SwordmanY.f=I3D_EntityY(Game_Swordman)
  SwordmanZ.f=I3D_EntityZ(Game_Swordman)
  SwordmanPitch.f=I3D_EntityPitch(Game_Swordman)
  SwordmanYaw.f=I3D_EntityYaw(Game_Swordman)
  SwordmanRoll.f=I3D_EntityRoll(Game_Swordman) 
  
  I3D_EnableEntity(Game_Swordman,#False)
  If Animation=#ManAni_Fight
    HitEnemy()
    If Random(1)
    SwordmanAnimationType=Game_Swordman_Fight2
    Else
    SwordmanAnimationType=Game_Swordman_Fight
    EndIf
    SwordmanAnimationSpeed=4
  EndIf
  If Animation=#ManAni_Die
    SwordmanAnimationType=Game_Swordman_Die
    SwordmanAnimationSpeed=1
  EndIf
  If Animation=#ManAni_Hands
    SwordmanAnimationType=Game_Swordman_Hands
    SwordmanAnimationSpeed=2
  EndIf
  
  If Animation=#ManAni_Hit
    SwordmanAnimationType=Game_Swordman_Hit
    SwordmanAnimationSpeed=2
  EndIf

  I3D_EnableEntity(SwordmanAnimationType,#True)
  I3D_SetEntityPosition(SwordmanAnimationType,SwordmanX,SwordmanY,SwordmanZ)
  I3D_SetEntityRotation(SwordmanAnimationType,SwordmanPitch,SwordmanYaw,SwordmanRoll)
  SwordmanAnimation=#True
  Frame=5
  I3D_SetAnimatedMeshCurrentFrame(Game_Swordman,Frame)

EndProcedure
Procedure PerFrameCol()
SX=I3D_EntityX(Game_Swordman)
SZ=I3D_EntityZ(Game_Swordman)
StartPosX=Int(SX/8)-8
If StartPosX<0:StartPosX=0:EndIf
If StartPosX>MapSizeX-1:StartPosX=MapSizeX-1:EndIf
StartPosY=Int(SZ/8)-8
If StartPosY<0:StartPosY=0:EndIf
If StartPosY>MapSizeY-1:StartPosY=MapSizeY-1:EndIf
StartPosX2=Int(SX/8)+8
If StartPosX2<0:StartPosX2=0:EndIf
If StartPosX2>MapSizeX-1:StartPosX2=MapSizeX-1:EndIf
StartPosY2=Int(SZ/8)+8
If StartPosY2<0:StartPosY2=0:EndIf
If StartPosY2>MapSizeY-1:StartPosY2=MapSizeY-1:EndIf
For x=StartPosX To StartPosX2
For y=StartPosY To StartPosY2
If x*8+6>SX And x*8-6<SX 
If y*8+6>SZ And y*8-6<SZ 
If Map3D(x,y)\Col=2

Select Map3D(x,y)\Type
Case #Type_Prick
  LifePoints-(Map3D(x,y)\Attack/100)
  If LifePoints<0:LifePoints=0:EndIf
  AddBlood(1+Random(1))
  
Case #Type_Gate  
  If Map3D(x,y)\Locked=#False And Map3D(x,y)\Position<250
    Map3D(x,y)\Speed=5
  EndIf
  
EndSelect

EndIf
EndIf
EndIf

If Map3D(x,y)\Speed<>0 And Map3D(x,y)\Type=#Type_Gate
Map3D(x,y)\Position+Map3D(x,y)\Speed
If Map3D(x,y)\Position>250:Map3D(x,y)\Speed=-4:EndIf
If Map3D(x,y)\Position<1:Map3D(x,y)\Speed=0:Map3D(x,y)\Position=0:EndIf
EndIf

Next
Next



EndProcedure
Procedure Explosion(X,Y,Z)

Fire=I3D_CreateParticleSystem(X,Y,Z,FireTex)
I3D_SetEntityMaterialType(Fire, #I3D_MATERIAL_TRANSPARENT_ADD_COLOR)
I3D_SetParticleMaxAngleDegree(Fire,20)
I3D_AddParticleSystemGravity(Fire, 0,-0.01, 0, 2000)
I3D_SetParticleSystemLifeTime(Fire,200,500)
I3D_AddParticleSystemFadeOut(Fire,I3D_RGBA(0,0,0,0),200)
I3D_SetParticleSystemEmission(Fire,3000,5000)
I3D_SetParticleSystemParticleSize(Fire,5,5)
I3D_SetParticleSystemColors(Fire,I3D_RGBA(10,10,0,10),I3D_RGBA(210,150,50,200))
I3D_SetParticleSystemDirection(Fire,0,0.04,0)
;I3D_EnableEntityFog(Fire,1)
I3D_StopParticleSystem( Fire,200+Random(100)-Random(50))

_PlaySound(#Sound_Bomb,#PB_Sound_MultiChannel)

EndProcedure
Procedure SpecialObjectCol(x,y)
Select Map3D(x,y)\Type
Case #Type_Life
  Map3D(x,y)\Type=#Type_Gras_1
  Map3D(x,y)\Col=#False
  LifePoints+Map3D(x,y)\Life
  AddMSGText("+"+Str(Map3D(x,y)\Life),100)
  If LifePoints>100:LifePoints=100:EndIf
  Animation(#ManAni_Hands)
  ForEach Blood()
    Blood()\Alpha-50
    If Blood()\Alpha<1:DeleteElement(Blood()):EndIf
  Next

Case #Type_bomb
  LifePoints-Map3D(x,y)\Attack
  If LifePoints>100:LifePoints=100:EndIf
  Map3D(x,y)\Type=#Type_Gras_1
  Map3D(x,y)\Col=#False
  Explosion(X*8,0,y*8)
  AddBlood(10+Random(15))
  
Case #Type_treasure
  pickedtreasures+1
  Map3D(x,y)\Type=#Type_Gras_1
  Map3D(x,y)\Col=#False
  Treasure = I3D_LoadMesh("Data\Schatztrue-Anim-Optimized.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Treasure,#True)
  I3D_MoveEntity(Treasure,x*8,0,y*8)
  I3D_SetAnimatedMeshFrameLoop(Treasure,0,10)
  I3D_SetAnimatedMeshLoopMode(Treasure,0)
  I3D_SetAnimatedMeshSpeed(Treasure,5)
  I3D_AddEntityDeleteAnimator(Treasure,10000)
  I3D_AddEntityMoveAnimator(Treasure,0,-0.01,0)
  AddMSGText("Treasure",128)
  Animation(#ManAni_Hands)
  
Case #Type_MSG
  Map3D(x,y)\Type=#Type_Gras_1
  Map3D(x,y)\Col=#False
  AddMSGText(Map3D(x,y)\String,128)
  Mesh = I3D_LoadMesh("Data\Shield.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Mesh,#True)
  I3D_MoveEntity(Mesh,x*8,8,y*8)
  i3d_scaleEntity(Mesh,2,3,2)
  i3d_rotateentity(Mesh,0,Map3D(x,y)\Rotation,0)
  I3D_AddEntityDeleteAnimator(Mesh,10000)
  I3D_AddEntityMoveAnimator(Mesh,0,-0.02,0)
  Animation(#ManAni_Hands)

Case #Type_end
  Win(#True)
  ;Ende=1

Case #Type_Beam
  I3D_SetEntityPosition(Game_Swordman,Map3D(x,y)\X*8,I3D_EntityY(Game_Swordman),Map3D(x,y)\Y*8)

Case #Type_Key
  Map3D(x,y)\Type=#Type_Gras_2
  Map3D(x,y)\Col=#False
  AddMSGText("Key",150)
  Mesh = I3D_LoadMesh("Data\Key.x",#I3D_MESH_ANIMATED)
  I3D_EnableEntityFog(Mesh,#True)
  i3d_scaleEntity(Mesh,1.5,1.5,1.5)
  I3D_MoveEntity(Mesh,x*8,3,y*8)
  ;i3d_rotateentity(Mesh,180,0,0)
  I3D_AddEntityDeleteAnimator(Mesh,10000)
  I3D_AddEntityMoveAnimator(Mesh,0,-0.02,0)
  Animation(#ManAni_Hands)
  PickedKeys+1

Case #Type_Gate
  If PickedKeys>0 And Map3D(x,y)\Locked
    Map3D(x,y)\Locked=#False
    PickedKeys-1
    AddMSGText("Key used",100)
  EndIf
  
  If Map3D(x,y)\Locked=#False And Map3D(x,y)\Position<250
    ;Map3D(x,y)\Position+1
    Map3D(x,y)\Speed=5
  EndIf
  
  
  If Map3D(x,y)\Position<245 Or Map3D(x,y)\Locked
    ProcedureReturn #True
  EndIf  


EndSelect
ProcedureReturn #False
EndProcedure
Procedure EntityCollision()

SX=I3D_EntityX(Game_Swordman)
SZ=I3D_EntityZ(Game_Swordman)

StartPosX=Int(SX/8)-2
If StartPosX<0:StartPosX=0:EndIf
If StartPosX>MapSizeX-1:StartPosX=MapSizeX-1:EndIf
StartPosY=Int(SZ/8)-2
If StartPosY<0:StartPosY=0:EndIf
If StartPosY>MapSizeY-1:StartPosY=MapSizeY-1:EndIf
StartPosX2=Int(SX/8)+2
If StartPosX2<0:StartPosX2=0:EndIf
If StartPosX2>MapSizeX-1:StartPosX2=MapSizeX-1:EndIf
StartPosY2=Int(SZ/8)+2
If StartPosY2<0:StartPosY2=0:EndIf
If StartPosY2>MapSizeY-1:StartPosY2=MapSizeY-1:EndIf

For x=StartPosX To StartPosX2;MapSizeX-1
For y=StartPosY To StartPosY2;MapSizeY-1
If x*8+6>SX And x*8-6<SX 
If y*8+6>SZ And y*8-6<SZ 
If Map3D(x,y)\Col=2:If SpecialObjectCol(x,y)=#True:ProcedureReturn #True::EndIf:EndIf
If Map3D(x,y)\Col=#True

If ElapsedMilliseconds()-ColSound>100:_PlaySound(#Sound_Col,#PB_Sound_MultiChannel):EndIf
ColSound=ElapsedMilliseconds()

ProcedureReturn #True
EndIf
EndIf
EndIf
    
Next
Next

If SX<0 Or SZ<0
ProcedureReturn #True
EndIf

If SX>(MapSizeX-1)*8 Or SZ>(MapSizeY-1)*8
ProcedureReturn #True
EndIf



ProcedureReturn #False
EndProcedure
Procedure LoadGameFiles()
Game_Swordman=I3D_LoadMesh("data\swordman-Optimized.x",#I3D_MESH_ANIMATED)
I3D_EnableEntityFog(Game_Swordman,1)
Game_Swordman_Hit=I3D_LoadMesh("data\swordman-hit-Optimized.x",#I3D_MESH_ANIMATED)
I3D_EnableEntityFog(Game_Swordman_Hit,1)
Game_Swordman_Die=I3D_LoadMesh("data\swordman-die-Optimized.x",#I3D_MESH_ANIMATED)
I3D_EnableEntityFog(Game_Swordman_Die,1)
Game_Swordman_Fight=I3D_LoadMesh("data\swordman-fight-Optimized.x",#I3D_MESH_ANIMATED)
I3D_EnableEntityFog(Game_Swordman_Fight,1)
Game_Swordman_Fight2=I3D_LoadMesh("data\swordman-fight2-Optimized.x",#I3D_MESH_ANIMATED)
I3D_EnableEntityFog(Game_Swordman_Fight2,1)
Game_Swordman_Hands=I3D_LoadMesh("data\swordman-hands-up-Optimized.x",#I3D_MESH_ANIMATED)
I3D_EnableEntityFog(Game_Swordman_Hands,1)
I3D_EnableEntity(Game_Swordman_Hit,#False)
I3D_EnableEntity(Game_Swordman_Die,#False)
I3D_EnableEntity(Game_Swordman_Fight,#False)
I3D_EnableEntity(Game_Swordman_Fight2,#False)
I3D_EnableEntity(Game_Swordman_Hands,#False)
; I3D_SetEntityParent(Game_Swordman,Game_Swordman_Hit)
; I3D_SetEntityParent(Game_Swordman,Game_Swordman_Die)
; I3D_SetEntityParent(Game_Swordman,Game_Swordman_Fight)
; I3D_SetEntityParent(Game_Swordman,Game_Swordman_Fight2)
; I3D_SetEntityParent(Game_Swordman,Game_Swordman_Hands)
I3D_RotateEntity(Game_Swordman,90,0,0)
I3D_SetAnimatedMeshSpeed(Game_Swordman,0.01)

EndProcedure


Global Dim Cheat(100)
Procedure Cheats()
If GameSettings\Cheats
  If GetAsyncKeyState_(#VK_BACK)
    Cheat.s=Trim(LCase(I3D_InputBox("Cheats","Cheats","")))
    If Cheat="maxlife":SetCheat=#True:Cheat(0)=#True:EndIf
    If Cheat="upsidedown":SetCheat=#True:Cheat(1)=#True:I3D_SetCameraFOV(10):EndIf
    If Cheat="extremefisheye":SetCheat=#True:Cheat(2)=#True:I3D_SetCameraFOV(3):EndIf
    If Cheat="fisheye":SetCheat=#True:Cheat(3)=#True:I3D_SetCameraFOV(2.4):EndIf
    
    
    
    If SetCheat=#True:AddMSGText("Cheat activated",255):EndIf
  EndIf
  
  
  
  If Cheat(0):LifePoints=200:EndIf
EndIf
EndProcedure



Procedure Game()
;MessageRequester("1","1")
killedCreatures=0
pickedtreasures=0
PickedKeys=0
StartGameTime=ElapsedMilliseconds()
DrawLoad2()
I3D_FreeAllEntities()
For Type=0 To #Enemy_Last-1
For i=0 To LastEnemy(Type)-1
  Enemy(Type,i)\Used=#False
  Enemy(Type,i)\Entity=#False
  Enemy(Type,i)\Ani_Die=#False
  Enemy(Type,i)\Ani_Attack=#False
Next
Next
ClearList(Blood())
ClearList(MSGText())
;MessageRequester("2","2")

;I3D_SetCamera(I3D_CreateCamera())
;LoadMap("Map.3DGW")
LoadMap(ProgramMap)

LoadGameFiles()

;cam=I3D_CreateFPSCamera(0,0,0)
cam=I3D_CreateCamera()
I3D_SetCamera(cam)
WindowInfo.WINDOWINFO
GetWindowInfo_(I3D_GetHWND(), @WindowInfo)
SetMX=WindowInfo\rcWindow\left+ScreenWidth/2
SetMY=WindowInfo\rcWindow\top+Screenheight/2
;MessageRequester("3","3")

;I3D_SetEntityParent(cam,Game_Swordman)
I3D_MoveEntity(Game_Swordman,StartPosX,StartPosY,-3)


PointLight=I3D_CreatePointLight(0,0,0,70,I3D_RGBA(100,100,100,0))
I3D_SetEntityParent(cam,PointLight)
I3D_SetCameraFar(100+CammeraFar*CammeraFarMuli)

I3D_SetLightSpecularColor(PointLight,I3D_RGBA(10,10,10,0))
I3D_SetLightAmbientColor(PointLight,I3D_RGBA(100,100,100,0))
I3D_SetLightDiffuseColor(PointLight,I3D_RGBA(100,100,100,0))

I3D_SetFog(I3D_RGBA(100,100,100,0),1,70)

I3D_SetSpriteColor(FogSprite,I3D_RGBA(100,100,100,100))
OldX=I3D_EntityX(cam)
OldY=I3D_EntityY(cam)
OldZ=I3D_EntityZ(cam)
;MessageRequester("4","4")

Horizontal=10
I3D_ShowCursor(#False)
SwordmanAnimation.f=0
SwordmanAnimationType=0
LifePoints.f=100

InfoBoxXAdd=200
InfoBoxMove=0

AddMSGText(GameSettings\StartMSG,200)

;MessageRequester("5","5")
Repeat
;LifePoints.f=100
;LifePoints.f-0.1
  Win()
  Cheats()
  OldMX=MX
  OldMY=MY
  Event=I3D__WindowEvent()
  Walk=#False
  SwordmanPitch.f=I3D_EntityPitch(Game_Swordman)
  SwordmanYaw.f=I3D_EntityYaw(Game_Swordman)
  SwordmanRoll.f=I3D_EntityRoll(Game_Swordman) 
   
  If SwordmanAnimation=#False
    If I3D_IsKeyPressed(#I3D_KEY_Up) Or I3D_IsKeyPressed(#I3D_KEY_W)
      Speed.f=1
      Walk=1
      If I3D_IsKeyPressed(#VK_SHIFT):Speed=1.5:Walk=2:EndIf
      Rnd.f = (SwordmanYaw / 180 * #PI)-#PI
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman)+Sin(Rnd)*Speed,I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman))
      If EntityCollision()
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman)-Sin(Rnd)*Speed,I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman))
      EndIf
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman),I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman)+Cos(Rnd)*Speed)
      If EntityCollision()
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman),I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman)-Cos(Rnd)*Speed)
      EndIf
    EndIf
  
    If (I3D_IsKeyPressed(#I3D_KEY_DOWN) Or I3D_IsKeyPressed(#I3D_KEY_S)) And Walk=#False
      Rnd.f = (SwordmanYaw / 180 * #PI)-#PI
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman)-Sin(Rnd),I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman))
      If EntityCollision()
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman)+Sin(Rnd),I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman))
      EndIf
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman),I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman)-Cos(Rnd))
      If EntityCollision()
      I3D_SetEntityPosition(Game_Swordman,I3D_EntityX(Game_Swordman),I3D_EntityY(Game_Swordman),I3D_EntityZ(Game_Swordman)+Cos(Rnd))
      EndIf
      Walk=-1
    EndIf
   EndIf 
      
    If I3D_IsKeyPressed(#I3D_KEY_RIGHT) Or I3D_IsKeyPressed(#I3D_KEY_D):I3D_RotateEntity(Game_Swordman,0,5,0):Walk=#True:EndIf  
    If I3D_IsKeyPressed(#I3D_KEY_LEFT) Or I3D_IsKeyPressed(#I3D_KEY_A):I3D_RotateEntity(Game_Swordman,0,-5,0):Walk=#True:EndIf    
    I3D_RotateEntity(Game_Swordman,0,(MX-OldMX)/2,0)
    If (MX-OldMX)/2>1 Or (MX-OldMX)/2<-1:Walk=#True:EndIf
    Horizontal+(MY-OldMY)/3
    If Horizontal<-5:Horizontal=-5:EndIf
    If Horizontal>60:Horizontal=60:EndIf
    SetCursorPos_(SetMX,SetMY)
    MX=I3D_GetMouseX()
    MY=I3D_GetMouseY()  
    If Walk<>0
      I3D_SetAnimatedMeshCurrentFrame(Game_Swordman,Frame)
      Frame+Walk
      If Frame>I3D_GetAnimatedMeshEndFrame(Game_Swordman):Frame=0:EndIf
      If Frame<0:Frame=I3D_GetAnimatedMeshEndFrame(Game_Swordman):EndIf
    EndIf
    

  
  SwordmanX.f=I3D_EntityX(Game_Swordman)
  SwordmanY.f=I3D_EntityY(Game_Swordman)
  SwordmanZ.f=I3D_EntityZ(Game_Swordman)

  I3D_SetEntityPosition(Cam,SwordmanX,SwordmanY,SwordmanZ)
  I3D_SetEntityRotation(Cam,Horizontal,SwordmanYaw+180,SwordmanRoll)
  I3D_MoveEntity(Cam,0,10,-20)

  If (I3D_IsKeyPressed(#I3D_MOUSE_LEFTBUTTON) Or I3D_IsKeyPressed(#VK_SPACE))And SwordmanAnimation=#False
    snd=#Sound_Schlag_1+Random(3)
    _SoundVolume(Snd,50+Random(50))
    ;_SoundFrequency(snd,605+Random(200))
    _playsound(snd)
    Animation(#ManAni_Fight)
  EndIf
  If SwordmanAnimation>0
    If SwordmanAnimationType=Game_Swordman_Die
      SwordmanAnimation+0.5
      I3D_SetAnimatedMeshCurrentFrame(SwordmanAnimationType,SwordmanAnimation)
      If SwordmanAnimation>I3D_GetAnimatedMeshEndFrame(SwordmanAnimationType)-1
      I3D_SetSpriteColor(FogSprite,I3D_RGBA(255,0,0,8))
      For i=0 To 200
        Delay(20)
        i3d_beginsceneex(0,0,I3D_RGBA(0,0,0,0))
        Draw2DFont(10,100,GameSettings\LoseMSG,1,1,200)
        I3D__DrawSprite2Dex(FogSprite,0,i*2,800,600,0)
        I3D_EndScene()
      Next
        Ende=1
      EndIf
    Else
      
      
      SwordmanAnimation+SwordmanAnimationSpeed
      I3D_SetAnimatedMeshCurrentFrame(SwordmanAnimationType,SwordmanAnimation)
      If SwordmanAnimation>I3D_GetAnimatedMeshEndFrame(SwordmanAnimationType)
      SwordmanAnimation=#False
      I3D_EnableEntity(Game_Swordman,#True)
      I3D_EnableEntity(SwordmanAnimationType,#False)
      EndIf
      
    EndIf
    
    
  EndIf
  
  
  
  DrawMapCount+1
  If DrawMapCount>1
  DrawMap()
  DrawMapCount=0
  EndIf
  ;i3d_beginsceneex(1,1,I3D_RGBA(100,100,100,0))
  PerFrameCol()
  EnemyWalk()
  If LifePoints<=0 And SwordmanAnimationType<>Game_Swordman_Die:Animation(#ManAni_Die):EndIf
  i3d_beginscene(I3D_RGBA(100,100,100,0))
  If Shader=1 And effect>0
    I3D_BeginPostProcess(effect,1,1,I3D_RGBA(100,100,100,0))
  EndIf
  ;EntityVisibility()
  I3D_RenderScene()
  DrawBlood()
  DrawMSGText()
  
  If GameSettings\lifeSec
    If GameSettings\lifeSec-(ElapsedMilliseconds()-StartGameTime)/1000>0
      Draw2DFont(620,550,Str(GameSettings\lifeSec-(ElapsedMilliseconds()-StartGameTime)/1000)+" Sec",1,1,200)
    EndIf
  EndIf
  
  If Shader=1 And effect>0
  I3D_EndPostProcess(effect)
  EndIf
  Fogcount+1
  
  DrawLifeBar(0,570,LifePoints)
  I3D__DrawSprite2Dex(FogSprite,-Sin(Fogcount/300)*200-200,0,800+Sin(Fogcount/300)*400+400,600,0)
  ;I3D_DrawText2D(Arial,100,100,Str(I3D_GetFPS())+" FPS",I3D_RGBA(255,255,255,255))
  
  DrawInfo(610+InfoBoxXAdd,300)
  InfoBoxXAdd+InfoBoxMove
  If InfoBoxXAdd=200:InfoBoxMove=0:EndIf
  If InfoBoxXAdd<0:InfoBoxMove=2:EndIf
  
  If pickedtreasures<>Oldpickedtreasures:InfoBoxMove=-2:EndIf
  Oldpickedtreasures=pickedtreasures
  If PickedKeys<>OldPickedKeys:InfoBoxMove=-2:EndIf
  OldPickedKeys=PickedKeys
  If I3D_IsKeyPressed(#VK_F1) And InfoBoxXAdd>0:InfoBoxMove=-2:EndIf
  
  
  
  I3D__DrawGUI()
  i3d_endscene()
  
  If I3D_IsKeyPressed(#I3D_KEY_ESCAPE):Ende=1:EndIf
Until Ende=1 

I3D_ShowCursor(#True)
Ende=0
I3D_FreeAllEntities()
LoadMenuEntitys()
EndProcedure











; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 1016
; FirstLine = 577
; Folding = PRpY9
; EnableThread
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant