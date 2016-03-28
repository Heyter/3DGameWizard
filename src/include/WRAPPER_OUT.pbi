;Global i3ddll.l=LoadLibrary_("Data\I3DEngine.dll")

CompilerIf #USE_EXE_ALONE
Global i3ddll.l=LoadLibrary_("Editor-Data\I3DEngine.dll")
CompilerElse
Global i3ddll.l=LoadLibrary_(GetTemporaryDirectory()+"3DGameWizard\I3DEngine.dll")
CompilerEndIf



;#DLLEXPORT extern __declspec(dllexport) public ;extern "C"
;#I3D_DYNAMIC_IB_BUFFERSIZE 0xFFFF
;#I3D_DYNAMIC_VB_BUFFERSIZE (4*0xFFFF)/6
#I3D_DYNAMIC_MODE_QUAD = 0
#I3D_DYNAMIC_MODE_QUAD_LIGHTED = 1
#I3D_DYNAMIC_MODE_TRI = 2
#I3D_DYNAMIC_MODE_TRI_LIGHTED = 3
;#bool32 int
;# =
#I3D_OBJ_UNKNOWN = 0
#I3D_OBJ_D3DXFONT = 1
#I3D_CTX_FULLSCREEN_16BIT  =  1
#I3D_CTX_FULLSCREEN_32BIT  =  2
#I3D_CTX_VSYNC  =  4
#I3D_CTX_STENCILBUFFER  =  8
#I3D_CTX_RESIZEABLE  =  16
#I3D_CTX_ANTIALIAS  =  32
#I3D_CTX_HIGHPRECISIONFPU  =  64
#I3D_CTX_ENABLEDEBUGINFO  =  128
#I3D_CTX_REDUCECPUUSAGE  =  256
#I3D_CTX_HIDECLOSEBUTTON  =  512
#I3D_CTX_HIDECURSOR  =  1024
#I3D_CTX_GDICOMPATIBLE  =  2048
#I3D_CTX_SOFTWAREPROCESSING  =  4096
#I3D_CTX_MULTITHREADEDRENDERING  =  4096*2
#I3D_SKIN_WINDOWS_CLASSIC  =  0
#I3D_SKIN_WINDOWS_METALLIC  =  1
#I3D_SKIN_BURNING_SKIN  =  2
#I3D_SKIN_UNKNOWN  =  3
#I3D_SKIN_ICECREAM  =  4
#I3D_SKIN_GLOOM  =  5
#I3D_FONTTYPE_DEFAULT  =  0
#I3D_FONTTYPE_BUTTON  =  1
#I3D_FONTTYPE_WINDOW  =  2
#I3D_FONTTYPE_MENU  =  3
#I3D_FONTTYPE_TOOLTIP  =  4
#I3D_TEXTUREDSKIN_WINDOWTEXTURE  =  0
#I3D_TEXTUREDSKIN_TITLEBARTEXTURE  =  1
#I3D_TEXTUREDSKIN_SUNKENTEXTURE  =  2
#I3D_TEXTUREDSKIN_CHECKBOXTEXTURE  =  3
#I3D_TEXTUREDSKIN_BUTTONTEXTURE  =  4
#I3D_SKINCOLOR_3D_DARK_SHADOW  =  0
#I3D_SKINCOLOR_3D_SHADOW  =  1
#I3D_SKINCOLOR_3D_FACE  =  2
#I3D_SKINCOLOR_3D_HIGH_LIGHT  =  3
#I3D_SKINCOLOR_3D_LIGHT  =  4
#I3D_SKINCOLOR_ACTIVE_BORDER  =  5
#I3D_SKINCOLOR_ACTIVE_CAPTION  =  6
#I3D_SKINCOLOR_APP_WORKSPACE  =  7
#I3D_SKINCOLOR_BUTTON_TEXT  =  8
#I3D_SKINCOLOR_GRAY_TEXT  =  9
#I3D_SKINCOLOR_HIGH_LIGHT  =  10
#I3D_SKINCOLOR_HIGH_LIGHT_TEXT  =  11
#I3D_SKINCOLOR_INACTIVE_BORDER  =  12
#I3D_SKINCOLOR_INACTIVE_CAPTION  =  13
#I3D_SKINCOLOR_TOOLTIP  =  14
#I3D_SKINCOLOR_TOOLTIP_BACKGROUND  =  15
#I3D_SKINCOLOR_SCROLLBAR  =  16
#I3D_SKINCOLOR_WINDOW  =  17
#I3D_SKINCOLOR_WINDOW_SYMBOL  =  18
#I3D_SKINCOLOR_ICON  =  19
#I3D_SKINCOLOR_ICON_HIGH_LIGHT  =  20
#I3D_SKINWIDTH_SCROLLBAR_SIZE  =  0
#I3D_SKINWIDTH_MENU_HEIGHT  =  1
#I3D_SKINWIDTH_WINDOW_BUTTON_WIDTH  =  2
#I3D_SKINWIDTH_CHECK_BOX_WIDTH  =  3
#I3D_SKINWIDTH_MESSAGE_BOX_WIDTH  =  4
#I3D_SKINWIDTH_MESSAGE_BOX_HEIGHT  =  5
#I3D_SKINWIDTH_BUTTON_WIDTH  =  6
#I3D_SKINWIDTH_BUTTON_HEIGHT  =  7
#I3D_SKINWIDTH_TEXT_DISTANCE_X  =  8
#I3D_SKINWIDTH_TEXT_DISTANCE_Y  =  9
#I3D_SKINTEXT_MSG_BOX_OK  =  0
#I3D_SKINTEXT_MSG_BOX_CANCEL  =  1
#I3D_SKINTEXT_MSG_BOX_YES  =  2
#I3D_SKINTEXT_MSG_BOX_NO  =  3
#I3D_SKINTEXT_WINDOW_CLOSE  =  4
#I3D_SKINTEXT_WINDOW_MAXIMIZE  =  5
#I3D_SKINTEXT_WINDOW_MINIMIZE  =  6
#I3D_SKINTEXT_WINDOW_RESTORE  =  7
#I3D_FEATURE_RENDER_TO_TARGET  =  0
#I3D_FEATURE_HARDWARE_TL  =  1
#I3D_FEATURE_MULTITEXTURE  =  2
#I3D_FEATURE_BILINEAR_FILTER  =  3
#I3D_FEATURE_MIP_MAP  =  4
#I3D_FEATURE_MIP_MAP_AUTO_UPDATE  =  5
#I3D_FEATURE_STENCIL_BUFFER  =  6
#I3D_FEATURE_VERTEX_SHADER_1_1  =  7
#I3D_FEATURE_VERTEX_SHADER_2_0  =  8
#I3D_FEATURE_VERTEX_SHADER_3_0  =  9
#I3D_FEATURE_PIXEL_SHADER_1_1  =  10
#I3D_FEATURE_PIXEL_SHADER_1_2  =  11
#I3D_FEATURE_PIXEL_SHADER_1_3  =  12
#I3D_FEATURE_PIXEL_SHADER_1_4  =  13
#I3D_FEATURE_PIXEL_SHADER_2_0  =  14
#I3D_FEATURE_PIXEL_SHADER_3_0  =  15
#I3D_FEATURE_HLSL  =  19
#I3D_FEATURE_TEXTURE_NPOT  =  20
#I3D_TEXTURE_DEFAULT  =  0
#I3D_TEXTURE_OPTIMIZESPEED  =  1
#I3D_TEXTURE_NOMIPMAPS  =  2
#I3D_TEXTURE_DONTSHARE  =  3
#I3D_TEXTURECOMPRESSION_DXT1  =  0
#I3D_TEXTURECOMPRESSION_DXT2  =  1
#I3D_TEXTURECOMPRESSION_DXT3  =  2
#I3D_TEXTURECOMPRESSION_DXT4  =  3
#I3D_TEXTURECOMPRESSION_DXT5  =  4
#I3D_SPRITE_DEFAULT  =  1
#I3D_SPRITE_GDICOMPATIBLE  =  2
#I3D_SPRITE_RENDERTARGET  =  3
#I3D_MSGBOX_OK  =  1
#I3D_MSGBOX_YESNO  =  2
#I3D_MSGBOX_OKCANCEL  =  4
#I3D_MSGBOX_YESNOCANCEL  =  8
#I3D_MSGBOX_NOSOUND  =  16
#I3D_MSGBOX_RESULT_NOTHING  =  0
#I3D_MSGBOX_RESULT_OK  =  1
#I3D_MSGBOX_RESULT_YES  =  2
#I3D_MSGBOX_RESULT_NO  =  3
#I3D_MSGBOX_RESULT_CANCEL  =  4
#I3D_EVENT_NOEVENT  =  0
#I3D_EVENT_ELEMENTFOCUSLOST  =  1
#I3D_EVENT_ELEMENTFOCUSED  =  2
#I3D_EVENT_ELEMENTHOVERED  =  3
#I3D_EVENT_ELEMENTLEFT  =  4
#I3D_EVENT_ELEMENTCLOSED  =  5 ;not available
#I3D_EVENT_BUTTONCLICK  =  6
#I3D_EVENT_SCROLLBARCHANGED  =  7
#I3D_EVENT_CHECKBOXCHANGED  =  8
#I3D_EVENT_LISTBOXCHANGED  =  9
#I3D_EVENT_LISTBOXSELECTEDAGAIN  =  10
#I3D_EVENT_EDITBOXENTER  =  11
#I3D_EVENT_TABCHANGED  =  12
#I3D_EVENT_MENUITEMSELECTED  =  13
#I3D_EVENT_COMBOBOXCHANGED  =  14
#I3D_EVENT_SCREENCLOSED  =  15
#I3D_EVENT_LMOUSEBUTTONDOWN  =  17
#I3D_EVENT_LMOUSEBUTTONUP  =  18
#I3D_EVENT_MMOUSEBUTTONDOWN  =  19
#I3D_EVENT_MMOUSEBUTTONUP  =  20
#I3D_EVENT_RMOUSEBUTTONDOWN  =  21
#I3D_EVENT_RMOUSEBUTTONUP  =  22
#I3D_EVENT_MOUSEMOVED  =  23
#I3D_EVENT_MOUSEWHEELDOWN  =  24
#I3D_EVENT_MOUSEWHEELUP  =  25
#I3D_EVENT_KEYDOWN  =  26
#I3D_EVENT_KEYUP  =  27
#I3D_MOUSE_LEFTBUTTON  =  1
#I3D_MOUSE_RIGHTBUTTON  =  2
#I3D_MOUSE_MIDDLEBUTTON  =  4
#I3D_KEY_RETURN  =  13
#I3D_KEY_ESCAPE  =  27
#I3D_KEY_SPACE  =  32
#I3D_KEY_LEFT  =  37
#I3D_KEY_UP  =  38
#I3D_KEY_RIGHT  =  39
#I3D_KEY_DOWN  =  40
#I3D_KEY_0  =  48
#I3D_KEY_1  =  49
#I3D_KEY_2  =  50
#I3D_KEY_3  =  51
#I3D_KEY_4  =  52
#I3D_KEY_5  =  53
#I3D_KEY_6  =  54
#I3D_KEY_7  =  55
#I3D_KEY_8  =  56
#I3D_KEY_9  =  57
#I3D_KEY_A  =  65
#I3D_KEY_B  =  66
#I3D_KEY_C  =  67
#I3D_KEY_D  =  68
#I3D_KEY_E  =  69
#I3D_KEY_F  =  70
#I3D_KEY_G  =  71
#I3D_KEY_H  =  72
#I3D_KEY_I  =  73
#I3D_KEY_J  =  74
#I3D_KEY_K  =  75
#I3D_KEY_L  =  76
#I3D_KEY_M  =  77
#I3D_KEY_N  =  78
#I3D_KEY_O  =  79
#I3D_KEY_P  =  80
#I3D_KEY_Q  =  81
#I3D_KEY_R  =  82
#I3D_KEY_S  =  83
#I3D_KEY_T  =  84
#I3D_KEY_U  =  85
#I3D_KEY_V  =  86
#I3D_KEY_W  =  87
#I3D_KEY_X  =  88
#I3D_KEY_Y  =  89
#I3D_KEY_Z  =  90
#I3D_KEY_F1  =  112
#I3D_KEY_F2  =  113
#I3D_KEY_F3  =  114
#I3D_KEY_F4  =  115
#I3D_KEY_F5  =  116
#I3D_KEY_F6  =  117
#I3D_KEY_F7  =  118
#I3D_KEY_F8  =  119
#I3D_KEY_F9  =  120
#I3D_KEY_F10  =  121
#I3D_KEY_F11  =  122
#I3D_KEY_F12  =  123
#I3D_TEXTUREFORMAT_UNKNOWN  =  0
#I3D_TEXTUREFORMAT_A1R5G5B5  =  1
#I3D_TEXTUREFORMAT_R5G6B5  =  2
#I3D_TEXTUREFORMAT_R8G8B8  =  3
#I3D_TEXTUREFORMAT_A8R8G8B8  =  4
#I3D_TEXTUREFORMAT_X8R8G8B8  =  5
#I3D_TEXTUREFORMAT_COMPRESSED  =  6
#I3D_SPRITEFORMAT_UNKNOWN  =  0
#I3D_SPRITEFORMAT_R5G6B5  =  1
#I3D_SPRITEFORMAT_A8R8G8B8  =  2
#I3D_SPRITEFORMAT_X8R8G8B8  =  3
#I3D_ENTITY_UNKNOWN  =  0
#I3D_ENTITY_DEFAULTMESH  =  1
#I3D_ENTITY_EDITABLEMESH  =  2
#I3D_ENTITY_PROGRESSIVEMESH  =  3
#I3D_ENTITY_ANIMMESH  =  4
#I3D_ENTITY_OCTREE_MESH  =  5
#I3D_ENTITY_WAVEMESH  =  6
#I3D_ENTITY_MESHWITHTANGENTS  =  7
#I3D_ENTITY_TERRAINMESH  =  8
#I3D_ENTITY_LIGHT  =  9
#I3D_ENTITY_CAMERA  =  10
#I3D_ENTITY_BILLBOARD  =  11
#I3D_ENTITY_TERRAIN  =  12
#I3D_ENTITY_EMPTY  =  13
#I3D_ENTITY_SKYBOX  =  14
#I3D_ENTITY_SKYDOME  =  15
#I3D_ENTITY_PARTICLESYSTEM  =  16
#I3D_MATERIAL_SOLID  =  0 ;Default solid material. supports only the first texture.
#I3D_MATERIAL_SOLID_2_LAYER  =  1 ; Solid material, but with two texture layers. The second texture is blended over the first by using the alpha value of the vertex colors.
#I3D_MATERIAL_LIGHTMAP  =  2 ;Default lightmap material. Needs two textures: The first texture is the color map, the second is the lightmap texture.
#I3D_MATERIAL_LIGHTMAP_ADD  =  3 ;Lightmapped material like I3D_MATERIAL_LIGHTMAP. But the two texture are added instead of modulated.
#I3D_MATERIAL_LIGHTMAP_M2  =  4 ;Lightmapped material like I3D_MATERIAL_LIGHTMAP. The texture colors are multiplied by two and therefore brighter.
#I3D_MATERIAL_LIGHTMAP_M4  =  5 ;Lightmapped material like I3D_MATERIAL_LIGHTMAP. The texture colors are multiplied by 4 and therefore brighter.
#I3D_MATERIAL_LIGHTMAP_LIGHTING  =  6 ; Like I3D_MATERIAL_LIGHTMAP, but also supports lighting by lights created with I3D_CreatePointLight(), I3D_CreateDirectionalLight() and I3D_CreateSpotLight().
#I3D_MATERIAL_LIGHTMAP_LIGHTING_M2  =  7 ; Like I3D_MATERIAL_LIGHTMAP_M2, but also supports lighting by lights created with I3D_CreatePointLight(), I3D_CreateDirectionalLight() and I3D_CreateSpotLight().
#I3D_MATERIAL_LIGHTMAP_LIGHTING_M4  =  8 ; Like I3D_MATERIAL_LIGHTMAP_M4, but also supports lighting by lights created with I3D_CreatePointLight(), I3D_CreateDirectionalLight() and I3D_CreateSpotLight().
#I3D_MATERIAL_DETAIL_MAP  =  9 ; Detail mapped material with two textures. The color values of the textures are added with sign. So the second texture can make it darker or brighter.
#I3D_MATERIAL_SPHERE_MAP  =  10 ; Reflection material. A spheremap texture is needed for this.
#I3D_MATERIAL_REFLECTION_2_LAYER  =  11 ; Reflection material with an optional non reflecting texture layer. The reflection texture should be set as first texture.
#I3D_MATERIAL_TRANSPARENT_ADD_COLOR  =  12 ;Transparent material. Only the first texture is used. The resulting color value is source + dest color.
#I3D_MATERIAL_TRANSPARENT_ALPHA_CHANNEL  =  13 ;Uses the alpah channel of the texture to render the entity transparent.
#I3D_MATERIAL_TRANSPARENT_ALPHA_CHANNEL_REF  =  14 ;Renders a pixel only if the alpah channel of the texture is greater than 127. The material does not use alpha blending and is therefore a lot faster than I3D_MATERIAL_TRANSPARENT_ALPHA_CHANNEL.
#I3D_MATERIAL_TRANSPARENT_VERTEX_ALPHA  =  15 ; The transpararency of an entity depends on the vertex alpha value.
#I3D_MATERIAL_TRANSPARENT_REFLECTION_2_LAYER  =  16 ; Transparent reflecting material with an optional non reflecting texture. The reflection map should be set as the first texture. The transpararency of an entity depends on the vertex alpha value.
#I3D_MATERIAL_NORMAL_MAP_SOLID  =  17 ; Solid normal map. The first texture is the color map. The second texture should be the normal map.
#I3D_MATERIAL_NORMAL_MAP_TRANSPARENT_ADD_COLOR  =  18 ; Solid normal map. The first texture is the color map. The second texture should be the normal map.
#I3D_MATERIAL_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA  =  19 ; Solid normal map. The first texture is the color map. The second texture should be the normal map.
#I3D_MATERIAL_PARALLAX_MAP_SOLID  =  20 ; Like I3D_MATERIAL_NORMAL_MAP_SOLID, but uses parallax mapping. This looks much better. Need hardware support for vertex shader 1.1 and pixel shader 1.4.
#I3D_MATERIAL_PARALLAX_MAP_TRANSPARENT_ADD_COLOR  =  21 ; Like I3D_MATERIAL_PARALLAX_MAP_SOLID, but transparent. Uses I3D_MATERIAL_TRANSPARENT_ADD_COLOR as base material.
#I3D_MATERIAL_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA  =  22 ; Like I3D_MATERIAL_PARALLAX_MAP_SOLID, but transparent. Uses I3D_MATERIAL_TRANSPARENT_VERTEX_ALPHA as base material.
#I3D_MATERIAL_ONETEXTURE_BLEND  =  23 ;Generic blending method. BlendFunc = source * sourceFactor + dest * destFactor
#I3D_PIXELSHADER_1_1  =  0
#I3D_PIXELSHADER_1_2  =  1
#I3D_PIXELSHADER_1_3  =  2
#I3D_PIXELSHADER_1_4  =  3
#I3D_PIXELSHADER_2_0  =  4
#I3D_PIXELSHADER_2_a  =  5
#I3D_PIXELSHADER_2_b  =  6
#I3D_PIXELSHADER_3_0  =  7
#I3D_VERTEXSHADER_1_1  =  0
#I3D_VERTEXSHADER_2_0  =  1
#I3D_VERTEXSHADER_2_a  =  2
#I3D_VERTEXSHADER_3_0  =  3
#I3D_MATFLAG_WIREFRAME  =  0 ; Draw wireframe or solid triangles. The default value is false.
#I3D_MATFLAG_POINTCLOUD  =  1 ; Draw as point cloud. The default value is false.
#I3D_MATFLAG_GOURAUD_SHADING  =  2 ; Flat or gouraud shading. The default is gouraud (true).
#I3D_MATFLAG_LIGHTING  =  3 ; Declares whether the matierial is lighted. The default value is true.
#I3D_MATFLAG_ZBUFFER  =  4 ; Declares whether the ZBuffer is enabled. The default value is true.
#I3D_MATFLAG_ZWRITE_ENABLE  =  5 ; Write to the ZBuffer. The default value is true.
#I3D_MATFLAG_BACK_FACE_CULLING  =  6 ; Declares whether backface culling is enabled. The default value is true.
#I3D_MATFLAG_FRONT_FACE_CULLING  =  7 ; Declares whether frontface culling is enabled. The default value is false.
#I3D_MATFLAG_BILINEAR_FILTER  =  8 ; Declares whether bilinear filtering is enabled. The default value is true.
#I3D_MATFLAG_TRILINEAR_FILTER  =  9 ; Declares whether trilinear filtering is enabled. The default value is false.
#I3D_MATFLAG_ANISOTROPIC_FILTER  =  10 ; Declares whether anisotropic filtering is enabled.This can be combined with bilinear or trilinear filter to get better quality. The default value is false.
#I3D_MATFLAG_FOG_ENABLE  =  11 ; Declares whether fog is enabled. The default value is false.
#I3D_MATFLAG_NORMALIZE_NORMALS  =  12 ;Normalizes normals. This is needed if a entity is lighted and scaled. The default value is false.
#I3D_MATFLAG_TEXTURE_WRAP  =  13
#I3D_MESH_DEFAULT  =  0
#I3D_MESH_EDITABLE  =  1
#I3D_MESH_PROGRESSIVE  =  2
#I3D_MESH_ANIMATED  =  3
#I3D_MESH_OCTREE  =  4
#I3D_MESH_TANGETS  =  5
#I3D_MD2_STAND  =  0
#I3D_MD2_RUN  =  1
#I3D_MD2_ATTACK  =  2
#I3D_MD2_PAIN_A  =  3
#I3D_MD2_PAIN_B  =  4
#I3D_MD2_PAIN_C  =  5
#I3D_MD2_JUMP  =  6
#I3D_MD2_FLIP  =  7
#I3D_MD2_SALUTE  =  8
#I3D_MD2_FALLBACK  =  9
#I3D_MD2_WAVE  =  10
#I3D_MD2_POINT  =  11
#I3D_MD2_CROUCH_STAND  =  12
#I3D_MD2_CROUCH_WALK  =  13
#I3D_MD2_CROUCH_ATTACK  =  14
#I3D_MD2_CROUCH_PAIN  =  15
#I3D_MD2_CROUCH_DEATH  =  16
#I3D_MD2_DEATH_FALLBACK  =  17
#I3D_MD2_DEATH_FALLFORWARD  =  18
#I3D_MD2_DEATH_FALLBACKSLOW  =  19
#I3D_MD2_BOOM  =  20
#I3D_CULLING_OFF  =  0
#I3D_CULLING_BOX  =  1
#I3D_CULLING_FRUSTUM_BOX  =  2
#I3D_CULLING_FRUSTUM_SPHERE  =  3
Prototype.l  __I3D_DrawLine2D( x1.l, y1.l, x2.l, y2.l, color.l)
Global __I3D_DrawLine2D.__I3D_DrawLine2D=GetProcAddress_(i3ddll,"I3D_DrawLine2D")

Prototype.l  __I3D_DrawBox2D( x.l, y.l, width.l, height.l, color.l)
Global __I3D_DrawBox2D.__I3D_DrawBox2D=GetProcAddress_(i3ddll,"I3D_DrawBox2D")

Prototype.l  __I3D_DrawBox2DEx( x.l, y.l, width.l, height.l, color1.l, color2.l, color3.l, color4.l)
Global __I3D_DrawBox2DEx.__I3D_DrawBox2DEx=GetProcAddress_(i3ddll,"I3D_DrawBox2DEx")

Prototype.l  __I3D_DrawOutlineCircle2D( x.l, y.l, radius.f, color.l)
Global __I3D_DrawOutlineCircle2D.__I3D_DrawOutlineCircle2D=GetProcAddress_(i3ddll,"I3D_DrawOutlineCircle2D")

Prototype.l  __I3D_DrawGUIText2D( font.l, text.p-unicode, x.l, y.l, color.l)
Global __I3D_DrawGUIText2D.__I3D_DrawGUIText2D=GetProcAddress_(i3ddll,"I3D_DrawGUIText2D")

Prototype.l  __I3D_LoadSprite( file.p-ascii, flags.l)
Global __I3D_LoadSprite.__I3D_LoadSprite=GetProcAddress_(i3ddll,"I3D_LoadSprite")

Prototype.l  __I3D_CreateSprite( width.l, height.l, flags.l)
Global __I3D_CreateSprite.__I3D_CreateSprite=GetProcAddress_(i3ddll,"I3D_CreateSprite")

Prototype.l  __I3D_LoadSpriteFromMem( memAddr.l, size.l, flags.l)
Global __I3D_LoadSpriteFromMem.__I3D_LoadSpriteFromMem=GetProcAddress_(i3ddll,"I3D_LoadSpriteFromMem")

Prototype.l  __I3D_FreeSprite( sprite.l)
Global __I3D_FreeSprite.__I3D_FreeSprite=GetProcAddress_(i3ddll,"I3D_FreeSprite")

Prototype.l  __I3D_MakeSpriteTransparent( Sprite.l, color.l)
Global __I3D_MakeSpriteTransparent.__I3D_MakeSpriteTransparent=GetProcAddress_(i3ddll,"I3D_MakeSpriteTransparent")

Prototype.l  __I3D_LockSprite( Sprite.l, readonly.l)
Global __I3D_LockSprite.__I3D_LockSprite=GetProcAddress_(i3ddll,"I3D_LockSprite")

Prototype.l  __I3D_UnLockSprite( Sprite.l)
Global __I3D_UnLockSprite.__I3D_UnLockSprite=GetProcAddress_(i3ddll,"I3D_UnLockSprite")

Prototype.l  __I3D_GetSpritePitch( Sprite.l)
Global __I3D_GetSpritePitch.__I3D_GetSpritePitch=GetProcAddress_(i3ddll,"I3D_GetSpritePitch")

Prototype.l  __I3D_GetSpriteDC( Sprite.l)
Global __I3D_GetSpriteDC.__I3D_GetSpriteDC=GetProcAddress_(i3ddll,"I3D_GetSpriteDC")

Prototype.l  __I3D_ReleaseSpriteDC( Sprite.l)
Global __I3D_ReleaseSpriteDC.__I3D_ReleaseSpriteDC=GetProcAddress_(i3ddll,"I3D_ReleaseSpriteDC")

Prototype.l  __I3D_GetSpriteWidth( Sprite.l)
Global __I3D_GetSpriteWidth.__I3D_GetSpriteWidth=GetProcAddress_(i3ddll,"I3D_GetSpriteWidth")

Prototype.l  __I3D_GetSpriteHeight( Sprite.l)
Global __I3D_GetSpriteHeight.__I3D_GetSpriteHeight=GetProcAddress_(i3ddll,"I3D_GetSpriteHeight")

Prototype.l  __I3D_SetSpriteColor( Sprite.l, color.l)
Global __I3D_SetSpriteColor.__I3D_SetSpriteColor=GetProcAddress_(i3ddll,"I3D_SetSpriteColor")

Prototype.l  __I3D_GetSpriteFromat( Sprite.l)
Global __I3D_GetSpriteFromat.__I3D_GetSpriteFromat=GetProcAddress_(i3ddll,"I3D_GetSpriteFromat")

Prototype.l  __I3D_SetSpriteCenter( Sprite.l, x.f, y.f)
Global __I3D_SetSpriteCenter.__I3D_SetSpriteCenter=GetProcAddress_(i3ddll,"I3D_SetSpriteCenter")

Prototype.l  __I3D_ClipSprite( sprite.l, clipX.l, clipY.l, clipWidth.l, clipHeight.l)
Global __I3D_ClipSprite.__I3D_ClipSprite=GetProcAddress_(i3ddll,"I3D_ClipSprite")

Prototype.l  __I3D_DrawSprite2D( sprite.l, x.f, y.f)
Global __I3D_DrawSprite2D.__I3D_DrawSprite2D=GetProcAddress_(i3ddll,"I3D_DrawSprite2D")

Prototype.l  __I3D_DrawSprite2DEx( sprite.l, x.f, y.f, width.f, height.f, angle.f)
Global __I3D_DrawSprite2DEx.__I3D_DrawSprite2DEx=GetProcAddress_(i3ddll,"I3D_DrawSprite2DEx")

Prototype.l  __I3D_CreateFont( fontname.p-ascii, size.l, bold.l, italic.l)
Global __I3D_CreateFont.__I3D_CreateFont=GetProcAddress_(i3ddll,"I3D_CreateFont")

Prototype.l  __I3D_DrawText2D( fnt.l, x.f, y.f, text.p-unicode, color.l)
Global __I3D_DrawText2D.__I3D_DrawText2D=GetProcAddress_(i3ddll,"I3D_DrawText2D")

Prototype.l  __I3D_DrawText2DEx( font.l, x.f, y.f, scale_x.f, scale_y.f, angle.f, text.p-unicode, color.l)
Global __I3D_DrawText2DEx.__I3D_DrawText2DEx=GetProcAddress_(i3ddll,"I3D_DrawText2DEx")

Prototype.l  __I3D_PreloadText2D( font.l, text.p-unicode)
Global __I3D_PreloadText2D.__I3D_PreloadText2D=GetProcAddress_(i3ddll,"I3D_PreloadText2D")

Prototype.l  __I3D_SpriteCollision( sprite1.l, x1.l, y1.l, sprite2.l, x2.l, y2.l)
Global __I3D_SpriteCollision.__I3D_SpriteCollision=GetProcAddress_(i3ddll,"I3D_SpriteCollision")

Prototype.l  __I3D_SpritePixelCollision( sprite1.l, x1.l, y1.l, sprite2.l, x2.l, y2.l)
Global __I3D_SpritePixelCollision.__I3D_SpritePixelCollision=GetProcAddress_(i3ddll,"I3D_SpritePixelCollision")

Prototype.l  __I3D_CreateAutoCollision( collisionEntity.l)
Global __I3D_CreateAutoCollision.__I3D_CreateAutoCollision=GetProcAddress_(i3ddll,"I3D_CreateAutoCollision")

Prototype.l  __I3D_AddAutoCollisionWorld( autoCollision.l, worldEntity.l)
Global __I3D_AddAutoCollisionWorld.__I3D_AddAutoCollisionWorld=GetProcAddress_(i3ddll,"I3D_AddAutoCollisionWorld")

Prototype.l  __I3D_RemoveAutoCollisionWorld( autoCollision.l, worldEntity.l)
Global __I3D_RemoveAutoCollisionWorld.__I3D_RemoveAutoCollisionWorld=GetProcAddress_(i3ddll,"I3D_RemoveAutoCollisionWorld")

Prototype.l  __I3D_SetAutoCollisionGravity( autoCollision.l, gravityX.f, gravityY.f, gravityZ.f)
Global __I3D_SetAutoCollisionGravity.__I3D_SetAutoCollisionGravity=GetProcAddress_(i3ddll,"I3D_SetAutoCollisionGravity")

Prototype.l  __I3D_SetAutoCollisionEllipsoidRadius( autoCollision.l, radX.f, radY.f, radZ.f)
Global __I3D_SetAutoCollisionEllipsoidRadius.__I3D_SetAutoCollisionEllipsoidRadius=GetProcAddress_(i3ddll,"I3D_SetAutoCollisionEllipsoidRadius")

Prototype.l  __I3D_SetAutoCollisionEllipsoidTranslation( autoCollision.l, X.f, Y.f, Z.f)
Global __I3D_SetAutoCollisionEllipsoidTranslation.__I3D_SetAutoCollisionEllipsoidTranslation=GetProcAddress_(i3ddll,"I3D_SetAutoCollisionEllipsoidTranslation")

Prototype.l  __I3D_FreeAutoCollision( autoCollision.l)
Global __I3D_FreeAutoCollision.__I3D_FreeAutoCollision=GetProcAddress_(i3ddll,"I3D_FreeAutoCollision")

Prototype.l  __I3D_AddEntityFlyRouteAnimator( entity.l, ptrpoints.l, numPoints.l, speed.f, tightness.f)
Global __I3D_AddEntityFlyRouteAnimator.__I3D_AddEntityFlyRouteAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityFlyRouteAnimator")

Prototype.l  __I3D_AddEntityFlyLineAnimator( entity.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, timeForWay.l, loop.l)
Global __I3D_AddEntityFlyLineAnimator.__I3D_AddEntityFlyLineAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityFlyLineAnimator")

Prototype.l  __I3D_AddEntityFlyCircleAnimator( entity.l, centerX.f, centerY.f, centerZ.f, dirX.f, dirY.f, dirZ.f, radius.f, speed.f)
Global __I3D_AddEntityFlyCircleAnimator.__I3D_AddEntityFlyCircleAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityFlyCircleAnimator")

Prototype.l  __I3D_AddEntityRotationAnimator( entity.l, x.f, y.f, z.f)
Global __I3D_AddEntityRotationAnimator.__I3D_AddEntityRotationAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityRotationAnimator")

Prototype.l  __I3D_RemoveEntityAnimator( entity.l, anim.l)
Global __I3D_RemoveEntityAnimator.__I3D_RemoveEntityAnimator=GetProcAddress_(i3ddll,"I3D_RemoveEntityAnimator")

Prototype.l  __I3D_AddEntityMoveAnimator( entity.l, x.f, y.f, z.f)
Global __I3D_AddEntityMoveAnimator.__I3D_AddEntityMoveAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityMoveAnimator")

Prototype.l  __I3D_AddEntityFollowEntityAnimator( entity.l, dest_entity.l, move_speed.f)
Global __I3D_AddEntityFollowEntityAnimator.__I3D_AddEntityFollowEntityAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityFollowEntityAnimator")

Prototype.l  __I3D_AddEntityScaleAnimator( entity.l, scaleX1.f, scaleY1.f, scaleZ1.f, scaleX2.f, scaleY2.f, scaleZ2.f, speed.f)
Global __I3D_AddEntityScaleAnimator.__I3D_AddEntityScaleAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityScaleAnimator")

Prototype.l  __I3D_AddEntityCBAnimator( entity.l, CBFunction.l, userData.l)
Global __I3D_AddEntityCBAnimator.__I3D_AddEntityCBAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityCBAnimator")

Prototype.l  __I3D_AddEntityTextureAnimator( entity.l, numTextures.l, textureArray.l, timePerFrame.l, loop.l)
Global __I3D_AddEntityTextureAnimator.__I3D_AddEntityTextureAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityTextureAnimator")

Prototype.l  __I3D_AddEntityDeleteAnimator( entity.l, lifeTime.l)
Global __I3D_AddEntityDeleteAnimator.__I3D_AddEntityDeleteAnimator=GetProcAddress_(i3ddll,"I3D_AddEntityDeleteAnimator")

Prototype.l  __I3D_CreateCamera()
Global __I3D_CreateCamera.__I3D_CreateCamera=GetProcAddress_(i3ddll,"I3D_CreateCamera")

Prototype.l  __I3D_CreateFPSCamera( rotateSpeed.f, moveSpeed.f, jumpSpeed.f)
Global __I3D_CreateFPSCamera.__I3D_CreateFPSCamera=GetProcAddress_(i3ddll,"I3D_CreateFPSCamera")

Prototype.l  __I3D_CreateFPSCameraEx( rotateSpeed.f, moveSpeed.f, jumpSpeed.f, horizontalMovement.l, WASDKeys.l)
Global __I3D_CreateFPSCameraEx.__I3D_CreateFPSCameraEx=GetProcAddress_(i3ddll,"I3D_CreateFPSCameraEx")

Prototype.l  __I3D_CreateMayaCamera( rotateSpeed.f, zoomSpeed.f, translationSpeed.f)
Global __I3D_CreateMayaCamera.__I3D_CreateMayaCamera=GetProcAddress_(i3ddll,"I3D_CreateMayaCamera")

Prototype.l  __I3D_SetCamera( camera.l)
Global __I3D_SetCamera.__I3D_SetCamera=GetProcAddress_(i3ddll,"I3D_SetCamera")

Prototype.l  __I3D_GetCamera()
Global __I3D_GetCamera.__I3D_GetCamera=GetProcAddress_(i3ddll,"I3D_GetCamera")

Prototype.f  __I3D_SetCameraNear( zn.f)
Global __I3D_SetCameraNear.__I3D_SetCameraNear=GetProcAddress_(i3ddll,"I3D_SetCameraNear")

Prototype.f  __I3D_SetCameraFar( zf.f)
Global __I3D_SetCameraFar.__I3D_SetCameraFar=GetProcAddress_(i3ddll,"I3D_SetCameraFar")

Prototype.f  __I3D_SetCameraFOV( fov.f)
Global __I3D_SetCameraFOV.__I3D_SetCameraFOV=GetProcAddress_(i3ddll,"I3D_SetCameraFOV")

Prototype.f  __I3D_SetCameraAspectRatio( aspect.f)
Global __I3D_SetCameraAspectRatio.__I3D_SetCameraAspectRatio=GetProcAddress_(i3ddll,"I3D_SetCameraAspectRatio")

Prototype.l  __I3D_CameraLookAt( posX.f, posY.f, posZ.f)
Global __I3D_CameraLookAt.__I3D_CameraLookAt=GetProcAddress_(i3ddll,"I3D_CameraLookAt")

Prototype.l  __I3D_StartDrawQuad3D()
Global __I3D_StartDrawQuad3D.__I3D_StartDrawQuad3D=GetProcAddress_(i3ddll,"I3D_StartDrawQuad3D")

Prototype.l  __I3D_StopDrawQuad3D()
Global __I3D_StopDrawQuad3D.__I3D_StopDrawQuad3D=GetProcAddress_(i3ddll,"I3D_StopDrawQuad3D")

Prototype.l  __I3D_SetDynamicMaterialFlag( matflag.l, enabled.l)
Global __I3D_SetDynamicMaterialFlag.__I3D_SetDynamicMaterialFlag=GetProcAddress_(i3ddll,"I3D_SetDynamicMaterialFlag")

Prototype.l  __I3D_SetDynamicMaterialType( matflag.l, enabled.l)
Global __I3D_SetDynamicMaterialType.__I3D_SetDynamicMaterialType=GetProcAddress_(i3ddll,"I3D_SetDynamicMaterialType")

Prototype.l  __I3D_SetDynamicQuadTextureCoords( tu1.f, tv1.f, tu2.f, tv2.f, tu3.f, tv3.f, tu4.f, tv4.f)
Global __I3D_SetDynamicQuadTextureCoords.__I3D_SetDynamicQuadTextureCoords=GetProcAddress_(i3ddll,"I3D_SetDynamicQuadTextureCoords")

Prototype.l  __I3D_SetDynamicTriTextureCoords( tu1.f, tv1.f, tu2.f, tv2.f, tu3.f, tv3.f)
Global __I3D_SetDynamicTriTextureCoords.__I3D_SetDynamicTriTextureCoords=GetProcAddress_(i3ddll,"I3D_SetDynamicTriTextureCoords")

Prototype.l  __I3D_SetDynamicTriColors( color1.l, color2.l, color3.l)
Global __I3D_SetDynamicTriColors.__I3D_SetDynamicTriColors=GetProcAddress_(i3ddll,"I3D_SetDynamicTriColors")

Prototype.l  __I3D_SetDynamicQuadColors( color1.l, color2.l, color3.l, color4.l)
Global __I3D_SetDynamicQuadColors.__I3D_SetDynamicQuadColors=GetProcAddress_(i3ddll,"I3D_SetDynamicQuadColors")

Prototype.l  __I3D_SetDynamicNormalsQuaity( quality.l)
Global __I3D_SetDynamicNormalsQuaity.__I3D_SetDynamicNormalsQuaity=GetProcAddress_(i3ddll,"I3D_SetDynamicNormalsQuaity")

Prototype.l  __I3D_DrawQuad3D( texture.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, x3.f, y3.f, z3.f, x4.f, y4.f, z4.f)
Global __I3D_DrawQuad3D.__I3D_DrawQuad3D=GetProcAddress_(i3ddll,"I3D_DrawQuad3D")

Prototype.l  __I3D_DrawTriangle3D( texture.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, x3.f, y3.f, z3.f)
Global __I3D_DrawTriangle3D.__I3D_DrawTriangle3D=GetProcAddress_(i3ddll,"I3D_DrawTriangle3D")

Prototype.l  __I3D_MoveEntity( entity.l, x.f, y.f, z.f)
Global __I3D_MoveEntity.__I3D_MoveEntity=GetProcAddress_(i3ddll,"I3D_MoveEntity")

Prototype.l  __I3D_RotateEntity( entity.l, pitch.f, yaw.f, roll.f)
Global __I3D_RotateEntity.__I3D_RotateEntity=GetProcAddress_(i3ddll,"I3D_RotateEntity")

Prototype.l  __I3D_ScaleEntity( entity.l, x.f, y.f, z.f)
Global __I3D_ScaleEntity.__I3D_ScaleEntity=GetProcAddress_(i3ddll,"I3D_ScaleEntity")

Prototype.l  __I3D_SetEntityScalation( entity.l, x.f, y.f, z.f)
Global __I3D_SetEntityScalation.__I3D_SetEntityScalation=GetProcAddress_(i3ddll,"I3D_SetEntityScalation")

Prototype.l  __I3D_SetEntityPosition( entity.l, x.f, y.f, z.f)
Global __I3D_SetEntityPosition.__I3D_SetEntityPosition=GetProcAddress_(i3ddll,"I3D_SetEntityPosition")

Prototype.l  __I3D_SetEntityRotation( entity.l, pitch.f, yaw.f, roll.f)
Global __I3D_SetEntityRotation.__I3D_SetEntityRotation=GetProcAddress_(i3ddll,"I3D_SetEntityRotation")

Prototype.l  __I3D_EnableEntity( entity.l, enabled.l)
Global __I3D_EnableEntity.__I3D_EnableEntity=GetProcAddress_(i3ddll,"I3D_EnableEntity")

Prototype.l  __I3D_IsEntityEnabled( entity.l)
Global __I3D_IsEntityEnabled.__I3D_IsEntityEnabled=GetProcAddress_(i3ddll,"I3D_IsEntityEnabled")

Prototype.f  __I3D_EntityX( entity.l)
Global __I3D_EntityX.__I3D_EntityX=GetProcAddress_(i3ddll,"I3D_EntityX")

Prototype.f  __I3D_EntityY( entity.l)
Global __I3D_EntityY.__I3D_EntityY=GetProcAddress_(i3ddll,"I3D_EntityY")

Prototype.f  __I3D_EntityZ( entity.l)
Global __I3D_EntityZ.__I3D_EntityZ=GetProcAddress_(i3ddll,"I3D_EntityZ")

Prototype.f  __I3D_EntityPitch( entity.l)
Global __I3D_EntityPitch.__I3D_EntityPitch=GetProcAddress_(i3ddll,"I3D_EntityPitch")

Prototype.f  __I3D_EntityYaw( entity.l)
Global __I3D_EntityYaw.__I3D_EntityYaw=GetProcAddress_(i3ddll,"I3D_EntityYaw")

Prototype.f  __I3D_EntityRoll( entity.l)
Global __I3D_EntityRoll.__I3D_EntityRoll=GetProcAddress_(i3ddll,"I3D_EntityRoll")

Prototype.f  __I3D_EntityScaleX( entity.l)
Global __I3D_EntityScaleX.__I3D_EntityScaleX=GetProcAddress_(i3ddll,"I3D_EntityScaleX")

Prototype.f  __I3D_EntityScaleY( entity.l)
Global __I3D_EntityScaleY.__I3D_EntityScaleY=GetProcAddress_(i3ddll,"I3D_EntityScaleY")

Prototype.f  __I3D_EntityScaleZ( entity.l)
Global __I3D_EntityScaleZ.__I3D_EntityScaleZ=GetProcAddress_(i3ddll,"I3D_EntityScaleZ")

Prototype.l  __I3D_GetEntityTransform( entity.l, retX.l, retY.l, retZ.l, retPitch.l, retYaw.l, retRoll.l, retSX.l, retSY.l, retSZ.l)
Global __I3D_GetEntityTransform.__I3D_GetEntityTransform=GetProcAddress_(i3ddll,"I3D_GetEntityTransform")

Prototype.l  __I3D_GetEntityAbsolutePosition( entity.l, retX.l, retY.l, retZ.l)
Global __I3D_GetEntityAbsolutePosition.__I3D_GetEntityAbsolutePosition=GetProcAddress_(i3ddll,"I3D_GetEntityAbsolutePosition")

Prototype.l  __I3D_SetEntityTransform( entity.l, x.f, y.f, z.f, pitch.f, yaw.f, roll.f, sx.f, sy.f, sz.f)
Global __I3D_SetEntityTransform.__I3D_SetEntityTransform=GetProcAddress_(i3ddll,"I3D_SetEntityTransform")

Prototype.l  __I3D_GetEntityTransformMatrix( entity.l, relative.l, matrix.l)
Global __I3D_GetEntityTransformMatrix.__I3D_GetEntityTransformMatrix=GetProcAddress_(i3ddll,"I3D_GetEntityTransformMatrix")

Prototype.l  __I3D_GetEntityTransformedBoundingBox( entity.l, retMinX.l, retMinY.l, retMinZ.l, retMaxX.l, retMaxY.l, retMaxZ.l)
Global __I3D_GetEntityTransformedBoundingBox.__I3D_GetEntityTransformedBoundingBox=GetProcAddress_(i3ddll,"I3D_GetEntityTransformedBoundingBox")

Prototype.l  __I3D_GetEntityBoundingBox( entity.l, retMinX.l, retMinY.l, retMinZ.l, retMaxX.l, retMaxY.l, retMaxZ.l)
Global __I3D_GetEntityBoundingBox.__I3D_GetEntityBoundingBox=GetProcAddress_(i3ddll,"I3D_GetEntityBoundingBox")

Prototype.l  __I3D_SetEntityAutomaticCulling( entity.l, mode.l)
Global __I3D_SetEntityAutomaticCulling.__I3D_SetEntityAutomaticCulling=GetProcAddress_(i3ddll,"I3D_SetEntityAutomaticCulling")

Prototype.l  __I3D_CreateBillboard( x.f, y.f, z.f, width.f, height.f, texture.l)
Global __I3D_CreateBillboard.__I3D_CreateBillboard=GetProcAddress_(i3ddll,"I3D_CreateBillboard")

Prototype.l  __I3D_CreateBillboardText( guiFont.l, text.p-unicode, color.l)
Global __I3D_CreateBillboardText.__I3D_CreateBillboardText=GetProcAddress_(i3ddll,"I3D_CreateBillboardText")

Prototype.l  __I3D_CreateSkyBox( texture_top.l, texture_bottom.l, texture_left.l, texture_right.l, texture_front.l, texture_back.l)
Global __I3D_CreateSkyBox.__I3D_CreateSkyBox=GetProcAddress_(i3ddll,"I3D_CreateSkyBox")

Prototype.l  __I3D_CreateSkyDome( texture.l, horiRes.l, vertRes.l, texturePercentage.f, spherePercentage.f)
Global __I3D_CreateSkyDome.__I3D_CreateSkyDome=GetProcAddress_(i3ddll,"I3D_CreateSkyDome")

Prototype.l  __I3D_SetEntityMaterialType( entity.l, mattype.l)
Global __I3D_SetEntityMaterialType.__I3D_SetEntityMaterialType=GetProcAddress_(i3ddll,"I3D_SetEntityMaterialType")

Prototype.l  __I3D_SetEntityMaterialFlag( entity.l, matflag.l, enabled.l)
Global __I3D_SetEntityMaterialFlag.__I3D_SetEntityMaterialFlag=GetProcAddress_(i3ddll,"I3D_SetEntityMaterialFlag")

Prototype.l  __I3D_EnableEntityLighting( entity.l, enabled.l)
Global __I3D_EnableEntityLighting.__I3D_EnableEntityLighting=GetProcAddress_(i3ddll,"I3D_EnableEntityLighting")

Prototype.l  __I3D_EnableEntityFog( entity.l, enabled.l)
Global __I3D_EnableEntityFog.__I3D_EnableEntityFog=GetProcAddress_(i3ddll,"I3D_EnableEntityFog")

Prototype.l  __I3D_SetMaterialTexture( entity.l, materialindex.l, texture.l)
Global __I3D_SetMaterialTexture.__I3D_SetMaterialTexture=GetProcAddress_(i3ddll,"I3D_SetMaterialTexture")

Prototype.l  __I3D_SetMaterialSpecularColor( entity.l, materialindex.l, color.l)
Global __I3D_SetMaterialSpecularColor.__I3D_SetMaterialSpecularColor=GetProcAddress_(i3ddll,"I3D_SetMaterialSpecularColor")

Prototype.l  __I3D_SetMaterialEmissiveColor( entity.l, materialindex.l, color.l)
Global __I3D_SetMaterialEmissiveColor.__I3D_SetMaterialEmissiveColor=GetProcAddress_(i3ddll,"I3D_SetMaterialEmissiveColor")

Prototype.f  __I3D_SetMaterialSpecularForce( entity.l, materialindex.l, force.f)
Global __I3D_SetMaterialSpecularForce.__I3D_SetMaterialSpecularForce=GetProcAddress_(i3ddll,"I3D_SetMaterialSpecularForce")

Prototype.f  __I3D_SetEntityParallaxHeight( entity.l, height.f)
Global __I3D_SetEntityParallaxHeight.__I3D_SetEntityParallaxHeight=GetProcAddress_(i3ddll,"I3D_SetEntityParallaxHeight")

Prototype.f  __I3D_SetEntityAlphaRef( entity.l, ref.f)
Global __I3D_SetEntityAlphaRef.__I3D_SetEntityAlphaRef=GetProcAddress_(i3ddll,"I3D_SetEntityAlphaRef")

Prototype.l  __I3D_GetEntityMaterialCount( entity.l)
Global __I3D_GetEntityMaterialCount.__I3D_GetEntityMaterialCount=GetProcAddress_(i3ddll,"I3D_GetEntityMaterialCount")

Prototype.l  __I3D_GetEntityParent( entity.l)
Global __I3D_GetEntityParent.__I3D_GetEntityParent=GetProcAddress_(i3ddll,"I3D_GetEntityParent")

Prototype.l  __I3D_CreateTerrain( file.p-ascii, texture.l, x.f, y.f, z.f, scaleX.f, scaleY.f, scaleZ.f, maxLOD.l, detail_texture.l)
Global __I3D_CreateTerrain.__I3D_CreateTerrain=GetProcAddress_(i3ddll,"I3D_CreateTerrain")

Prototype.f  __I3D_TerrainHeight( terrain.l, x.f, y.f)
Global __I3D_TerrainHeight.__I3D_TerrainHeight=GetProcAddress_(i3ddll,"I3D_TerrainHeight")

Prototype.l  __I3D_PickEntity( x.l, y.l, exactpicking.l)
Global __I3D_PickEntity.__I3D_PickEntity=GetProcAddress_(i3ddll,"I3D_PickEntity")

Prototype.l  __I3D_PickEntityFromRay( x.f, y.f, z.f, x2.f, y2.f, z2.f, exactpicking.l)
Global __I3D_PickEntityFromRay.__I3D_PickEntityFromRay=GetProcAddress_(i3ddll,"I3D_PickEntityFromRay")

Prototype.f  __I3D_PickX()
Global __I3D_PickX.__I3D_PickX=GetProcAddress_(i3ddll,"I3D_PickX")

Prototype.f  __I3D_PickY()
Global __I3D_PickY.__I3D_PickY=GetProcAddress_(i3ddll,"I3D_PickY")

Prototype.f  __I3D_PickZ()
Global __I3D_PickZ.__I3D_PickZ=GetProcAddress_(i3ddll,"I3D_PickZ")

Prototype.l  __I3D_FindEntity( name.p-ascii, id.l)
Global __I3D_FindEntity.__I3D_FindEntity=GetProcAddress_(i3ddll,"I3D_FindEntity")

Prototype.l  __I3D_TestEntityBoxCollision( entity1.l, entity2.l)
Global __I3D_TestEntityBoxCollision.__I3D_TestEntityBoxCollision=GetProcAddress_(i3ddll,"I3D_TestEntityBoxCollision")

Prototype.l  __I3D_GetEntityType( entity.l)
Global __I3D_GetEntityType.__I3D_GetEntityType=GetProcAddress_(i3ddll,"I3D_GetEntityType")

Prototype.l  __I3D_TestEntityVisibility( entity.l)
Global __I3D_TestEntityVisibility.__I3D_TestEntityVisibility=GetProcAddress_(i3ddll,"I3D_TestEntityVisibility")

Prototype.l  __I3D_CreateEmptyEntity()
Global __I3D_CreateEmptyEntity.__I3D_CreateEmptyEntity=GetProcAddress_(i3ddll,"I3D_CreateEmptyEntity")

Prototype.l  __I3D_SetEntityParent( parent_entity.l, child_entity.l)
Global __I3D_SetEntityParent.__I3D_SetEntityParent=GetProcAddress_(i3ddll,"I3D_SetEntityParent")

Prototype.l  __I3D_FreeEntity( entity.l)
Global __I3D_FreeEntity.__I3D_FreeEntity=GetProcAddress_(i3ddll,"I3D_FreeEntity")

Prototype.l  __I3D_EntityLookAt( entity.l, x.f, y.f, z.f)
Global __I3D_EntityLookAt.__I3D_EntityLookAt=GetProcAddress_(i3ddll,"I3D_EntityLookAt")

Prototype.l  __I3D_GetChildEntityCount( parent.l)
Global __I3D_GetChildEntityCount.__I3D_GetChildEntityCount=GetProcAddress_(i3ddll,"I3D_GetChildEntityCount")

Prototype.l  __I3D_GetChildEntities( parent.l, ptr.l)
Global __I3D_GetChildEntities.__I3D_GetChildEntities=GetProcAddress_(i3ddll,"I3D_GetChildEntities")

Prototype.l  __I3D_FreeAllEntities()
Global __I3D_FreeAllEntities.__I3D_FreeAllEntities=GetProcAddress_(i3ddll,"I3D_FreeAllEntities")

Prototype.l  __I3D_GetRootEntity()
Global __I3D_GetRootEntity.__I3D_GetRootEntity=GetProcAddress_(i3ddll,"I3D_GetRootEntity")

Prototype.l  __I3D_SetEntityMaxDist( entity.l, distance.f)
Global __I3D_SetEntityMaxDist.__I3D_SetEntityMaxDist=GetProcAddress_(i3ddll,"I3D_SetEntityMaxDist")

Prototype.l  __I3D_RenderEntity( entity.l)
Global __I3D_RenderEntity.__I3D_RenderEntity=GetProcAddress_(i3ddll,"I3D_RenderEntity")

Prototype.l  __I3D_TextControl( x.l, y.l, width.l, height.l, border.l, parent.l, text.p-unicode, textColor.l)
Global __I3D_TextControl.__I3D_TextControl=GetProcAddress_(i3ddll,"I3D_TextControl")

Prototype.l  __I3D_ButtonControl( x.l, y.l, width.l, height.l, parent.l, text.p-unicode)
Global __I3D_ButtonControl.__I3D_ButtonControl=GetProcAddress_(i3ddll,"I3D_ButtonControl")

Prototype.l  __I3D_IsButtonPressed( button.l)
Global __I3D_IsButtonPressed.__I3D_IsButtonPressed=GetProcAddress_(i3ddll,"I3D_IsButtonPressed")

Prototype.l  __I3D_SetButtonImages( button.l, sprite.l, sprite_pressed.l)
Global __I3D_SetButtonImages.__I3D_SetButtonImages=GetProcAddress_(i3ddll,"I3D_SetButtonImages")

Prototype.l  __I3D_EditControl( x.l, y.l, width.l, height.l, borderless.l, parent.l, text.p-unicode)
Global __I3D_EditControl.__I3D_EditControl=GetProcAddress_(i3ddll,"I3D_EditControl")

Prototype.l  __I3D_PictureControl( x.l, y.l, parent.l, sprite.l)
Global __I3D_PictureControl.__I3D_PictureControl=GetProcAddress_(i3ddll,"I3D_PictureControl")

Prototype.l  __I3D_CheckBoxControl( x.l, y.l, width.l, height.l, parent.l, text.p-unicode)
Global __I3D_CheckBoxControl.__I3D_CheckBoxControl=GetProcAddress_(i3ddll,"I3D_CheckBoxControl")

Prototype.l  __I3D_ListBoxControl( x.l, y.l, width.l, height.l, parent.l)
Global __I3D_ListBoxControl.__I3D_ListBoxControl=GetProcAddress_(i3ddll,"I3D_ListBoxControl")

Prototype.l  __I3D_ComboBoxControl( x.l, y.l, width.l, height.l, parent.l)
Global __I3D_ComboBoxControl.__I3D_ComboBoxControl=GetProcAddress_(i3ddll,"I3D_ComboBoxControl")

Prototype.l  __I3D_WindowControl( x.l, y.l, width.l, height.l, modal.l, closeButton.l, parent.l, title.p-unicode)
Global __I3D_WindowControl.__I3D_WindowControl=GetProcAddress_(i3ddll,"I3D_WindowControl")

Prototype.l  __I3D_ToolbarControl( parent.l)
Global __I3D_ToolbarControl.__I3D_ToolbarControl=GetProcAddress_(i3ddll,"I3D_ToolbarControl")

Prototype.l  __I3D_AddToolbarButton( toolbar.l, tooltip.p-unicode, sprite.l, pressed_sprite.l, isPushButton.l)
Global __I3D_AddToolbarButton.__I3D_AddToolbarButton=GetProcAddress_(i3ddll,"I3D_AddToolbarButton")

Prototype.l  __I3D_PopupMenu( x.l, y.l, parent.l)
Global __I3D_PopupMenu.__I3D_PopupMenu=GetProcAddress_(i3ddll,"I3D_PopupMenu")

Prototype.l  __I3D_AddPopupMenuItem( popup.l, text.p-unicode)
Global __I3D_AddPopupMenuItem.__I3D_AddPopupMenuItem=GetProcAddress_(i3ddll,"I3D_AddPopupMenuItem")

Prototype.l  __I3D_AddPopupMenuSeperator( popup.l)
Global __I3D_AddPopupMenuSeperator.__I3D_AddPopupMenuSeperator=GetProcAddress_(i3ddll,"I3D_AddPopupMenuSeperator")

Prototype.l  __I3D_ScrollBarControl( x.l, y.l, width.l, height.l, horizontal.l, parent.l)
Global __I3D_ScrollBarControl.__I3D_ScrollBarControl=GetProcAddress_(i3ddll,"I3D_ScrollBarControl")

Prototype.l  __I3D_TabControl( x.l, y.l, width.l, height.l, parent.l, fillbackground.l, border.l)
Global __I3D_TabControl.__I3D_TabControl=GetProcAddress_(i3ddll,"I3D_TabControl")

Prototype.l  __I3D_AddTab( parent.l, caption.p-unicode)
Global __I3D_AddTab.__I3D_AddTab=GetProcAddress_(i3ddll,"I3D_AddTab")

Prototype.l  __I3D_GetActiveTab( tabcontrol.l)
Global __I3D_GetActiveTab.__I3D_GetActiveTab=GetProcAddress_(i3ddll,"I3D_GetActiveTab")

Prototype.l  __I3D_SetActiveTab( tabcontrol.l, tab.l)
Global __I3D_SetActiveTab.__I3D_SetActiveTab=GetProcAddress_(i3ddll,"I3D_SetActiveTab")

Prototype.l  __I3D_AddListBoxItem( listBox.l, text.p-unicode)
Global __I3D_AddListBoxItem.__I3D_AddListBoxItem=GetProcAddress_(i3ddll,"I3D_AddListBoxItem")

Prototype.l  __I3D_AddComboBoxItem( comboBox.l, text.p-unicode)
Global __I3D_AddComboBoxItem.__I3D_AddComboBoxItem=GetProcAddress_(i3ddll,"I3D_AddComboBoxItem")

Prototype.l  __I3D_SetSelectedListBoxItem( listBox.l, index.l)
Global __I3D_SetSelectedListBoxItem.__I3D_SetSelectedListBoxItem=GetProcAddress_(i3ddll,"I3D_SetSelectedListBoxItem")

Prototype.l  __I3D_GetSelectedListBoxItem( listBox.l)
Global __I3D_GetSelectedListBoxItem.__I3D_GetSelectedListBoxItem=GetProcAddress_(i3ddll,"I3D_GetSelectedListBoxItem")

Prototype.l  __I3D_SetSelectedComboBoxItem( comboBox.l, index.l)
Global __I3D_SetSelectedComboBoxItem.__I3D_SetSelectedComboBoxItem=GetProcAddress_(i3ddll,"I3D_SetSelectedComboBoxItem")

Prototype.l  __I3D_GetSelectedComboBoxItem( comboBox.l)
Global __I3D_GetSelectedComboBoxItem.__I3D_GetSelectedComboBoxItem=GetProcAddress_(i3ddll,"I3D_GetSelectedComboBoxItem")

Prototype.l  __I3D_ClearListBox( listBox.l)
Global __I3D_ClearListBox.__I3D_ClearListBox=GetProcAddress_(i3ddll,"I3D_ClearListBox")

Prototype.l  __I3D_ClearComboBox( comboBox.l)
Global __I3D_ClearComboBox.__I3D_ClearComboBox=GetProcAddress_(i3ddll,"I3D_ClearComboBox")

Prototype.l  __I3D_IsCheckBoxChecked( checkBox.l)
Global __I3D_IsCheckBoxChecked.__I3D_IsCheckBoxChecked=GetProcAddress_(i3ddll,"I3D_IsCheckBoxChecked")

Prototype.l  __I3D_SetCheckBoxState( checkBox.l, checked.l)
Global __I3D_SetCheckBoxState.__I3D_SetCheckBoxState=GetProcAddress_(i3ddll,"I3D_SetCheckBoxState")

Prototype.l  __I3D_SetControlOwnSkin( guiElement.l, skin.l)
Global __I3D_SetControlOwnSkin.__I3D_SetControlOwnSkin=GetProcAddress_(i3ddll,"I3D_SetControlOwnSkin")

Prototype.l  __I3D_SetTextControlColors( guiElement.l, color.l, bkColor.l)
Global __I3D_SetTextControlColors.__I3D_SetTextControlColors=GetProcAddress_(i3ddll,"I3D_SetTextControlColors")

Prototype.l  __I3D_SetControlText( guiElement.l, text.p-unicode)
Global __I3D_SetControlText.__I3D_SetControlText=GetProcAddress_(i3ddll,"I3D_SetControlText")

Prototype.l  __I3D_SetControlToolTipText( guiElement.l, text.p-unicode)
Global __I3D_SetControlToolTipText.__I3D_SetControlToolTipText=GetProcAddress_(i3ddll,"I3D_SetControlToolTipText")

Prototype.l  __I3D_EnableControl( guiElement.l, enabled.l)
Global __I3D_EnableControl.__I3D_EnableControl=GetProcAddress_(i3ddll,"I3D_EnableControl")

Prototype.l  __I3D_GetControlX( guiElement.l)
Global __I3D_GetControlX.__I3D_GetControlX=GetProcAddress_(i3ddll,"I3D_GetControlX")

Prototype.l  __I3D_GetControlY( guiElement.l)
Global __I3D_GetControlY.__I3D_GetControlY=GetProcAddress_(i3ddll,"I3D_GetControlY")

Prototype.l  __I3D_GetControlWidth( guiElement.l)
Global __I3D_GetControlWidth.__I3D_GetControlWidth=GetProcAddress_(i3ddll,"I3D_GetControlWidth")

Prototype.l  __I3D_GetControlHeight( guiElement.l)
Global __I3D_GetControlHeight.__I3D_GetControlHeight=GetProcAddress_(i3ddll,"I3D_GetControlHeight")

Prototype.l  __I3D_GetControlText( guiElement.l)
Global __I3D_GetControlText.__I3D_GetControlText=GetProcAddress_(i3ddll,"I3D_GetControlText")

Prototype.l  __I3D_FreeControl( guiElement.l)
Global __I3D_FreeControl.__I3D_FreeControl=GetProcAddress_(i3ddll,"I3D_FreeControl")

Prototype.l  __I3D_FreeAllControls()
Global __I3D_FreeAllControls.__I3D_FreeAllControls=GetProcAddress_(i3ddll,"I3D_FreeAllControls")

Prototype.l  __I3D_GetRootControl()
Global __I3D_GetRootControl.__I3D_GetRootControl=GetProcAddress_(i3ddll,"I3D_GetRootControl")

Prototype.l  __I3D_GetControlFromPos( x.l, y.l)
Global __I3D_GetControlFromPos.__I3D_GetControlFromPos=GetProcAddress_(i3ddll,"I3D_GetControlFromPos")

Prototype.l  __I3D_EventControl()
Global __I3D_EventControl.__I3D_EventControl=GetProcAddress_(i3ddll,"I3D_EventControl")

Prototype.l  __I3D_MsgBox( caption.p-unicode, text.p-unicode, style.l)
Global __I3D_MsgBox.__I3D_MsgBox=GetProcAddress_(i3ddll,"I3D_MsgBox")

Prototype.l  __I3D_InputBox( title.p-unicode, text.p-unicode, inputText.p-unicode)
Global __I3D_InputBox.__I3D_InputBox=GetProcAddress_(i3ddll,"I3D_InputBox")

Prototype.l  __I3D_SelectFileBox( title.p-unicode, ext.p-unicode)
Global __I3D_SelectFileBox.__I3D_SelectFileBox=GetProcAddress_(i3ddll,"I3D_SelectFileBox")

Prototype.l  __I3D_LoadGUIFont( file.p-ascii)
Global __I3D_LoadGUIFont.__I3D_LoadGUIFont=GetProcAddress_(i3ddll,"I3D_LoadGUIFont")

Prototype.l  __I3D_GetGUIFontTextHeight( guifont.l, text.p-unicode)
Global __I3D_GetGUIFontTextHeight.__I3D_GetGUIFontTextHeight=GetProcAddress_(i3ddll,"I3D_GetGUIFontTextHeight")

Prototype.l  __I3D_GetGUIFontTextWidth( guifont.l, text.p-unicode)
Global __I3D_GetGUIFontTextWidth.__I3D_GetGUIFontTextWidth=GetProcAddress_(i3ddll,"I3D_GetGUIFontTextWidth")

Prototype.l  __I3D_SetSkinFont( skin.l, guifont.l)
Global __I3D_SetSkinFont.__I3D_SetSkinFont=GetProcAddress_(i3ddll,"I3D_SetSkinFont")

Prototype.l  __I3D_SetSkinFontEx( skin.l, guifont.l, fonttype.l)
Global __I3D_SetSkinFontEx.__I3D_SetSkinFontEx=GetProcAddress_(i3ddll,"I3D_SetSkinFontEx")

Prototype.l  __I3D_FreeSkin( skin.l)
Global __I3D_FreeSkin.__I3D_FreeSkin=GetProcAddress_(i3ddll,"I3D_FreeSkin")

Prototype.l  __I3D_CreateSkin( model.l)
Global __I3D_CreateSkin.__I3D_CreateSkin=GetProcAddress_(i3ddll,"I3D_CreateSkin")

Prototype.l  __I3D_SetSkin( skin.l)
Global __I3D_SetSkin.__I3D_SetSkin=GetProcAddress_(i3ddll,"I3D_SetSkin")

Prototype.l  __I3D_GetSkin()
Global __I3D_GetSkin.__I3D_GetSkin=GetProcAddress_(i3ddll,"I3D_GetSkin")

Prototype.l  __I3D_GetFocusControl()
Global __I3D_GetFocusControl.__I3D_GetFocusControl=GetProcAddress_(i3ddll,"I3D_GetFocusControl")

Prototype.l  __I3D_SetFocusControl( control.l)
Global __I3D_SetFocusControl.__I3D_SetFocusControl=GetProcAddress_(i3ddll,"I3D_SetFocusControl")

Prototype.l  __I3D_SetControlPosition( control.l, x.l, y.l)
Global __I3D_SetControlPosition.__I3D_SetControlPosition=GetProcAddress_(i3ddll,"I3D_SetControlPosition")

Prototype.l  __I3D_SetControlSize( control.l, width.l, height.l)
Global __I3D_SetControlSize.__I3D_SetControlSize=GetProcAddress_(i3ddll,"I3D_SetControlSize")

Prototype.l  __I3D_SetMaxControlSize( control.l, width.l, height.l)
Global __I3D_SetMaxControlSize.__I3D_SetMaxControlSize=GetProcAddress_(i3ddll,"I3D_SetMaxControlSize")

Prototype.l  __I3D_SetMinControlSize( control.l, width.l, height.l)
Global __I3D_SetMinControlSize.__I3D_SetMinControlSize=GetProcAddress_(i3ddll,"I3D_SetMinControlSize")

Prototype.l  __I3D_DrawControl( control.l)
Global __I3D_DrawControl.__I3D_DrawControl=GetProcAddress_(i3ddll,"I3D_DrawControl")

Prototype.l  __I3D_SetSkinAlpha( skin.l, alpha.l)
Global __I3D_SetSkinAlpha.__I3D_SetSkinAlpha=GetProcAddress_(i3ddll,"I3D_SetSkinAlpha")

Prototype.l  __I3D_SetSkinColor( skin.l, typ.l, color.l)
Global __I3D_SetSkinColor.__I3D_SetSkinColor=GetProcAddress_(i3ddll,"I3D_SetSkinColor")

Prototype.l  __I3D_SetSkinText( skin.l, typ.l, text.p-unicode)
Global __I3D_SetSkinText.__I3D_SetSkinText=GetProcAddress_(i3ddll,"I3D_SetSkinText")

Prototype.l  __I3D_SetSkinSize( skin.l, typ.l, size.l)
Global __I3D_SetSkinSize.__I3D_SetSkinSize=GetProcAddress_(i3ddll,"I3D_SetSkinSize")

Prototype.l  __I3D_CreateGUIFader( parent.l)
Global __I3D_CreateGUIFader.__I3D_CreateGUIFader=GetProcAddress_(i3ddll,"I3D_CreateGUIFader")

Prototype.l  __I3D_SetGUIFaderColor( guiFader.l, color.l)
Global __I3D_SetGUIFaderColor.__I3D_SetGUIFaderColor=GetProcAddress_(i3ddll,"I3D_SetGUIFaderColor")

Prototype.l  __I3D_FadeGUIOut( guiFader.l, time.l)
Global __I3D_FadeGUIOut.__I3D_FadeGUIOut=GetProcAddress_(i3ddll,"I3D_FadeGUIOut")

Prototype.l  __I3D_FadeGUIIn( guiFader.l, time.l)
Global __I3D_FadeGUIIn.__I3D_FadeGUIIn=GetProcAddress_(i3ddll,"I3D_FadeGUIIn")

Prototype.l  __I3D_IsGUIFaderReady( guiFader.l)
Global __I3D_IsGUIFaderReady.__I3D_IsGUIFaderReady=GetProcAddress_(i3ddll,"I3D_IsGUIFaderReady")

Prototype.l  __I3D_FreeGUIFader( guiFader.l)
Global __I3D_FreeGUIFader.__I3D_FreeGUIFader=GetProcAddress_(i3ddll,"I3D_FreeGUIFader")

Prototype.l  __I3D_ProgressBarControl( x.l, y.l, width.l, height.l, parent.l)
Global __I3D_ProgressBarControl.__I3D_ProgressBarControl=GetProcAddress_(i3ddll,"I3D_ProgressBarControl")

Prototype.l  __I3D_SetProgressBarColor( control.l, frontcolor.l)
Global __I3D_SetProgressBarColor.__I3D_SetProgressBarColor=GetProcAddress_(i3ddll,"I3D_SetProgressBarColor")

Prototype.l  __I3D_SetBarControlMaximum( control.l, maximum.l)
Global __I3D_SetBarControlMaximum.__I3D_SetBarControlMaximum=GetProcAddress_(i3ddll,"I3D_SetBarControlMaximum")

Prototype.l  __I3D_SetBarControlPosition( control.l, position.l)
Global __I3D_SetBarControlPosition.__I3D_SetBarControlPosition=GetProcAddress_(i3ddll,"I3D_SetBarControlPosition")

Prototype.l  __I3D_GetBarControlPosition( control.l)
Global __I3D_GetBarControlPosition.__I3D_GetBarControlPosition=GetProcAddress_(i3ddll,"I3D_GetBarControlPosition")

Prototype.l  __I3D_TrackBarControl( x.l, y.l, width.l, height.l, parent.l)
Global __I3D_TrackBarControl.__I3D_TrackBarControl=GetProcAddress_(i3ddll,"I3D_TrackBarControl")

Prototype.l  __I3D_SpinControl( x.l, y.l, width.l, height.l, parent.l)
Global __I3D_SpinControl.__I3D_SpinControl=GetProcAddress_(i3ddll,"I3D_SpinControl")

Prototype.l  __I3D_SetSpinControlValue( control.l, value.f)
Global __I3D_SetSpinControlValue.__I3D_SetSpinControlValue=GetProcAddress_(i3ddll,"I3D_SetSpinControlValue")

Prototype.f  __I3D_GetSpinControlValue( control.l)
Global __I3D_GetSpinControlValue.__I3D_GetSpinControlValue=GetProcAddress_(i3ddll,"I3D_GetSpinControlValue")

Prototype.l  __I3D_SetSpinControlRange( control.l, min.f, max.f)
Global __I3D_SetSpinControlRange.__I3D_SetSpinControlRange=GetProcAddress_(i3ddll,"I3D_SetSpinControlRange")

Prototype.l  __I3D_SetSpinControlStep( control.l, Stepf.f)
Global __I3D_SetSpinControlStep.__I3D_SetSpinControlStep=GetProcAddress_(i3ddll,"I3D_SetSpinControlStep")

Prototype.l  __I3D_SetSpinControlDecimalPlaces( control.l, decimalplaces.l)
Global __I3D_SetSpinControlDecimalPlaces.__I3D_SetSpinControlDecimalPlaces=GetProcAddress_(i3ddll,"I3D_SetSpinControlDecimalPlaces")

Prototype.l  __I3D_CreateTexturedSkin()
Global __I3D_CreateTexturedSkin.__I3D_CreateTexturedSkin=GetProcAddress_(i3ddll,"I3D_CreateTexturedSkin")

Prototype.l  __I3D_SetTexturedSkinTexture( skin.l, type.l, tex.l)
Global __I3D_SetTexturedSkinTexture.__I3D_SetTexturedSkinTexture=GetProcAddress_(i3ddll,"I3D_SetTexturedSkinTexture")

Prototype.l  __I3D_SetTexturedSkinFrameSize( skin.l, size.l)
Global __I3D_SetTexturedSkinFrameSize.__I3D_SetTexturedSkinFrameSize=GetProcAddress_(i3ddll,"I3D_SetTexturedSkinFrameSize")

Prototype.l  __I3D_CreatePointLight( x.f, y.f, z.f, radius.f, color.l)
Global __I3D_CreatePointLight.__I3D_CreatePointLight=GetProcAddress_(i3ddll,"I3D_CreatePointLight")

Prototype.l  __I3D_CreateSpotLight( x.f, y.f, z.f, radius.f, color.l)
Global __I3D_CreateSpotLight.__I3D_CreateSpotLight=GetProcAddress_(i3ddll,"I3D_CreateSpotLight")

Prototype.l  __I3D_CreateDirectionalLight( dirx.f, diry.f, dirz.f, color.l)
Global __I3D_CreateDirectionalLight.__I3D_CreateDirectionalLight=GetProcAddress_(i3ddll,"I3D_CreateDirectionalLight")

Prototype.l  __I3D_SetLightAmbientColor( light.l, color.l)
Global __I3D_SetLightAmbientColor.__I3D_SetLightAmbientColor=GetProcAddress_(i3ddll,"I3D_SetLightAmbientColor")

Prototype.l  __I3D_SetLightDiffuseColor( light.l, color.l)
Global __I3D_SetLightDiffuseColor.__I3D_SetLightDiffuseColor=GetProcAddress_(i3ddll,"I3D_SetLightDiffuseColor")

Prototype.l  __I3D_SetLightSpecularColor( light.l, color.l)
Global __I3D_SetLightSpecularColor.__I3D_SetLightSpecularColor=GetProcAddress_(i3ddll,"I3D_SetLightSpecularColor")

Prototype.f  __I3D_SetLightRadius( light.l, radius.f)
Global __I3D_SetLightRadius.__I3D_SetLightRadius=GetProcAddress_(i3ddll,"I3D_SetLightRadius")

Prototype.f  __I3D_SetLightInnerCone( light.l, radius.f)
Global __I3D_SetLightInnerCone.__I3D_SetLightInnerCone=GetProcAddress_(i3ddll,"I3D_SetLightInnerCone")

Prototype.f  __I3D_SetLightOuterCone( light.l, radius.f)
Global __I3D_SetLightOuterCone.__I3D_SetLightOuterCone=GetProcAddress_(i3ddll,"I3D_SetLightOuterCone")

Prototype.f  __I3D_SetLightFalloff( light.l, newFalloff.f)
Global __I3D_SetLightFalloff.__I3D_SetLightFalloff=GetProcAddress_(i3ddll,"I3D_SetLightFalloff")

Prototype.l  __I3D_CreateVolumeLight( x.f, y.f, z.f)
Global __I3D_CreateVolumeLight.__I3D_CreateVolumeLight=GetProcAddress_(i3ddll,"I3D_CreateVolumeLight")

Prototype.l  __I3D_SetVolumeLightQuality( volumeLight.l, quality.l)
Global __I3D_SetVolumeLightQuality.__I3D_SetVolumeLightQuality=GetProcAddress_(i3ddll,"I3D_SetVolumeLightQuality")

Prototype.l  __I3D_SetVolumeLightTailColor( volumeLight.l, color.l)
Global __I3D_SetVolumeLightTailColor.__I3D_SetVolumeLightTailColor=GetProcAddress_(i3ddll,"I3D_SetVolumeLightTailColor")

Prototype.l  __I3D_SetVolumeLightFootColor( volumeLight.l, color.l)
Global __I3D_SetVolumeLightFootColor.__I3D_SetVolumeLightFootColor=GetProcAddress_(i3ddll,"I3D_SetVolumeLightFootColor")

Prototype.l  __I3D_CreateContextEx( windowID.l, width.l, height.l, flags.l, title.p-unicode)
Global __I3D_CreateContextEx.__I3D_CreateContextEx=GetProcAddress_(i3ddll,"I3D_CreateContextEx")

Prototype.l  __I3D_CreateContext( width.l, height.l, flags.l, title.p-unicode)
Global __I3D_CreateContext.__I3D_CreateContext=GetProcAddress_(i3ddll,"I3D_CreateContext")

Prototype.l  __I3D_GetUserData( obj.l)
Global __I3D_GetUserData.__I3D_GetUserData=GetProcAddress_(i3ddll,"I3D_GetUserData")

Prototype.l  __I3D_SetUserData( obj.l, userData.l)
Global __I3D_SetUserData.__I3D_SetUserData=GetProcAddress_(i3ddll,"I3D_SetUserData")

Prototype.l  __I3D_GetObjectRefCount( obj.l)
Global __I3D_GetObjectRefCount.__I3D_GetObjectRefCount=GetProcAddress_(i3ddll,"I3D_GetObjectRefCount")

Prototype.l  __I3D_ReleaseObject( obj.l)
Global __I3D_ReleaseObject.__I3D_ReleaseObject=GetProcAddress_(i3ddll,"I3D_ReleaseObject")

Prototype.l  __I3D_FlushBatches()
Global __I3D_FlushBatches.__I3D_FlushBatches=GetProcAddress_(i3ddll,"I3D_FlushBatches")

Prototype.l  __I3D_GetD3DDevice9()
Global __I3D_GetD3DDevice9.__I3D_GetD3DDevice9=GetProcAddress_(i3ddll,"I3D_GetD3DDevice9")

Prototype.l  __I3D_SetPresentParameters( windowId.l, x.l, y.l, width.l, height.l)
Global __I3D_SetPresentParameters.__I3D_SetPresentParameters=GetProcAddress_(i3ddll,"I3D_SetPresentParameters")

Prototype.l  __I3D_BeginSceneEx( clearBackBuffer.l, clearZBuffer.l, Color.l)
Global __I3D_BeginSceneEx.__I3D_BeginSceneEx=GetProcAddress_(i3ddll,"I3D_BeginSceneEx")

Prototype.l  __I3D_BeginScene( Color.l)
Global __I3D_BeginScene.__I3D_BeginScene=GetProcAddress_(i3ddll,"I3D_BeginScene")

Prototype.l  __I3D_WindowEvent()
Global __I3D_WindowEvent.__I3D_WindowEvent=GetProcAddress_(i3ddll,"I3D_WindowEvent")

Prototype.l  __I3D_EventData()
Global __I3D_EventData.__I3D_EventData=GetProcAddress_(i3ddll,"I3D_EventData")

Prototype.l  __I3D_RenderScene()
Global __I3D_RenderScene.__I3D_RenderScene=GetProcAddress_(i3ddll,"I3D_RenderScene")

Prototype.l  __I3D_DrawGUI()
Global __I3D_DrawGUI.__I3D_DrawGUI=GetProcAddress_(i3ddll,"I3D_DrawGUI")

Prototype.l  __I3D_IsScreenActive()
Global __I3D_IsScreenActive.__I3D_IsScreenActive=GetProcAddress_(i3ddll,"I3D_IsScreenActive")

Prototype.l  __I3D_SetFrameLimit( limit.l)
Global __I3D_SetFrameLimit.__I3D_SetFrameLimit=GetProcAddress_(i3ddll,"I3D_SetFrameLimit")

Prototype.l  __I3D_EndScene()
Global __I3D_EndScene.__I3D_EndScene=GetProcAddress_(i3ddll,"I3D_EndScene")

Prototype.l  __I3D_ScreenWidth()
Global __I3D_ScreenWidth.__I3D_ScreenWidth=GetProcAddress_(i3ddll,"I3D_ScreenWidth")

Prototype.l  __I3D_ScreenHeight()
Global __I3D_ScreenHeight.__I3D_ScreenHeight=GetProcAddress_(i3ddll,"I3D_ScreenHeight")

Prototype.l  __I3D_SetScreenTitle( caption.p-unicode)
Global __I3D_SetScreenTitle.__I3D_SetScreenTitle=GetProcAddress_(i3ddll,"I3D_SetScreenTitle")

Prototype.l  __I3D_GetFPS()
Global __I3D_GetFPS.__I3D_GetFPS=GetProcAddress_(i3ddll,"I3D_GetFPS")

Prototype.l  __I3D_LoadScene( file.p-ascii)
Global __I3D_LoadScene.__I3D_LoadScene=GetProcAddress_(i3ddll,"I3D_LoadScene")

Prototype.l  __I3D_SaveScene( file.p-ascii)
Global __I3D_SaveScene.__I3D_SaveScene=GetProcAddress_(i3ddll,"I3D_SaveScene")

Prototype.l  __I3D_AddZipArchive( file.p-ascii)
Global __I3D_AddZipArchive.__I3D_AddZipArchive=GetProcAddress_(i3ddll,"I3D_AddZipArchive")

Prototype.l  __I3D_SetViewPort( x.l, y.l, width.l, height.l)
Global __I3D_SetViewPort.__I3D_SetViewPort=GetProcAddress_(i3ddll,"I3D_SetViewPort")

Prototype.l  __I3D_IsFeaturePresent( queryfeature.l)
Global __I3D_IsFeaturePresent.__I3D_IsFeaturePresent=GetProcAddress_(i3ddll,"I3D_IsFeaturePresent")

Prototype.l  __I3D_GetHWND()
Global __I3D_GetHWND.__I3D_GetHWND=GetProcAddress_(i3ddll,"I3D_GetHWND")

Prototype.l  __I3D_GetPrimitiveCountDrawn()
Global __I3D_GetPrimitiveCountDrawn.__I3D_GetPrimitiveCountDrawn=GetProcAddress_(i3ddll,"I3D_GetPrimitiveCountDrawn")

Prototype.l  __I3D_SaveScreenShot( file.p-ascii)
Global __I3D_SaveScreenShot.__I3D_SaveScreenShot=GetProcAddress_(i3ddll,"I3D_SaveScreenShot")

Prototype.l  __I3D_IsKeyPressed( key.l)
Global __I3D_IsKeyPressed.__I3D_IsKeyPressed=GetProcAddress_(i3ddll,"I3D_IsKeyPressed")

Prototype.l  __I3D_GetTimer()
Global __I3D_GetTimer.__I3D_GetTimer=GetProcAddress_(i3ddll,"I3D_GetTimer")

Prototype.l  __I3D_GetMouseX()
Global __I3D_GetMouseX.__I3D_GetMouseX=GetProcAddress_(i3ddll,"I3D_GetMouseX")

Prototype.l  __I3D_GetMouseY()
Global __I3D_GetMouseY.__I3D_GetMouseY=GetProcAddress_(i3ddll,"I3D_GetMouseY")

Prototype.l  __I3D_GetRelativeMouseX()
Global __I3D_GetRelativeMouseX.__I3D_GetRelativeMouseX=GetProcAddress_(i3ddll,"I3D_GetRelativeMouseX")

Prototype.l  __I3D_GetRelativeMouseY()
Global __I3D_GetRelativeMouseY.__I3D_GetRelativeMouseY=GetProcAddress_(i3ddll,"I3D_GetRelativeMouseY")

Prototype.l  __I3D_WasDeviceLost()
Global __I3D_WasDeviceLost.__I3D_WasDeviceLost=GetProcAddress_(i3ddll,"I3D_WasDeviceLost")

Prototype.l  __I3D_FreeContext()
Global __I3D_FreeContext.__I3D_FreeContext=GetProcAddress_(i3ddll,"I3D_FreeContext")

Prototype.l  __I3D_ShowCursor( show.l)
Global __I3D_ShowCursor.__I3D_ShowCursor=GetProcAddress_(i3ddll,"I3D_ShowCursor")

Prototype.l  __I3D_IsCursorVisible()
Global __I3D_IsCursorVisible.__I3D_IsCursorVisible=GetProcAddress_(i3ddll,"I3D_IsCursorVisible")

Prototype.l  __I3D_SetCursorSprite( sprite.l)
Global __I3D_SetCursorSprite.__I3D_SetCursorSprite=GetProcAddress_(i3ddll,"I3D_SetCursorSprite")

Prototype.l  __I3D_ReadFileToMem( filename.p-ascii)
Global __I3D_ReadFileToMem.__I3D_ReadFileToMem=GetProcAddress_(i3ddll,"I3D_ReadFileToMem")

Prototype.l  __I3D_GetMemFileSize( memArea.l)
Global __I3D_GetMemFileSize.__I3D_GetMemFileSize=GetProcAddress_(i3ddll,"I3D_GetMemFileSize")

Prototype.l  __I3D_FreeMemFile( memArea.l)
Global __I3D_FreeMemFile.__I3D_FreeMemFile=GetProcAddress_(i3ddll,"I3D_FreeMemFile")

Prototype.l  __I3D_GetProcessorMHz()
Global __I3D_GetProcessorMHz.__I3D_GetProcessorMHz=GetProcAddress_(i3ddll,"I3D_GetProcessorMHz")

Prototype.l  __I3D_SetRenderTargetEx( RTSprite.l, clearBackBuffer.l, clearZBuffer.l, color.l)
Global __I3D_SetRenderTargetEx.__I3D_SetRenderTargetEx=GetProcAddress_(i3ddll,"I3D_SetRenderTargetEx")

Prototype.l  __I3D_SetRenderTarget( RTSprite.l, color.l)
Global __I3D_SetRenderTarget.__I3D_SetRenderTarget=GetProcAddress_(i3ddll,"I3D_SetRenderTarget")

Prototype.l  __I3D_ResetRenderTarget()
Global __I3D_ResetRenderTarget.__I3D_ResetRenderTarget=GetProcAddress_(i3ddll,"I3D_ResetRenderTarget")

Prototype.l  __I3D_ClearZBuffer()
Global __I3D_ClearZBuffer.__I3D_ClearZBuffer=GetProcAddress_(i3ddll,"I3D_ClearZBuffer")

Prototype.l  __I3D_SetLogCBFunction( logCBFunc.l)
Global __I3D_SetLogCBFunction.__I3D_SetLogCBFunction=GetProcAddress_(i3ddll,"I3D_SetLogCBFunction")

Prototype.l  __I3D_Log( logText.p-ascii, loglevel.l)
Global __I3D_Log.__I3D_Log=GetProcAddress_(i3ddll,"I3D_Log")

Prototype.l  __I3D_GetScreenDC()
Global __I3D_GetScreenDC.__I3D_GetScreenDC=GetProcAddress_(i3ddll,"I3D_GetScreenDC")

Prototype.l  __I3D_ReleaseScreenDC()
Global __I3D_ReleaseScreenDC.__I3D_ReleaseScreenDC=GetProcAddress_(i3ddll,"I3D_ReleaseScreenDC")

Prototype.l  __I3D_LoadMesh( file.p-ascii, flag.l)
Global __I3D_LoadMesh.__I3D_LoadMesh=GetProcAddress_(i3ddll,"I3D_LoadMesh")

Prototype.l  __I3D_CreateWaveMesh( file.p-ascii, waveHeight.f, waveSpeed.f, waveLength.f)
Global __I3D_CreateWaveMesh.__I3D_CreateWaveMesh=GetProcAddress_(i3ddll,"I3D_CreateWaveMesh")

Prototype.l  __I3D_CreateTerrainMesh( file.p-ascii, texFile.p-ascii, vertexBlockSize.l)
Global __I3D_CreateTerrainMesh.__I3D_CreateTerrainMesh=GetProcAddress_(i3ddll,"I3D_CreateTerrainMesh")

Prototype.l  __I3D_AddAnimatedMeshShadow( mesh.l)
Global __I3D_AddAnimatedMeshShadow.__I3D_AddAnimatedMeshShadow=GetProcAddress_(i3ddll,"I3D_AddAnimatedMeshShadow")

Prototype.f  __I3D_GetAnimatedMeshEndFrame( mesh.l)
Global __I3D_GetAnimatedMeshEndFrame.__I3D_GetAnimatedMeshEndFrame=GetProcAddress_(i3ddll,"I3D_GetAnimatedMeshEndFrame")

Prototype.f  __I3D_GetAnimatedMeshStartFrame( mesh.l)
Global __I3D_GetAnimatedMeshStartFrame.__I3D_GetAnimatedMeshStartFrame=GetProcAddress_(i3ddll,"I3D_GetAnimatedMeshStartFrame")

Prototype.f  __I3D_GetAnimatedMeshFrameNr( mesh.l)
Global __I3D_GetAnimatedMeshFrameNr.__I3D_GetAnimatedMeshFrameNr=GetProcAddress_(i3ddll,"I3D_GetAnimatedMeshFrameNr")

Prototype.l  __I3D_SetAnimatedMeshCurrentFrame( mesh.l, framenumber.f)
Global __I3D_SetAnimatedMeshCurrentFrame.__I3D_SetAnimatedMeshCurrentFrame=GetProcAddress_(i3ddll,"I3D_SetAnimatedMeshCurrentFrame")

Prototype.l  __I3D_SetAnimatedMeshSpeed( mesh.l, framesPerSecond.f)
Global __I3D_SetAnimatedMeshSpeed.__I3D_SetAnimatedMeshSpeed=GetProcAddress_(i3ddll,"I3D_SetAnimatedMeshSpeed")

Prototype.l  __I3D_SetAnimatedMeshFrameLoop( mesh.l, startframe.l, endframe.l)
Global __I3D_SetAnimatedMeshFrameLoop.__I3D_SetAnimatedMeshFrameLoop=GetProcAddress_(i3ddll,"I3D_SetAnimatedMeshFrameLoop")

Prototype.l  __I3D_SetAnimatedMeshLoopMode( mesh.l, enabled.l)
Global __I3D_SetAnimatedMeshLoopMode.__I3D_SetAnimatedMeshLoopMode=GetProcAddress_(i3ddll,"I3D_SetAnimatedMeshLoopMode")

Prototype.l  __I3D_SetAnimatedMeshMD2Anim( mesh.l, md2animation.l)
Global __I3D_SetAnimatedMeshMD2Anim.__I3D_SetAnimatedMeshMD2Anim=GetProcAddress_(i3ddll,"I3D_SetAnimatedMeshMD2Anim")

Prototype.l  __I3D_SetAnimatedMeshMD2AnimStr( mesh.l, animationname.p-ascii)
Global __I3D_SetAnimatedMeshMD2AnimStr.__I3D_SetAnimatedMeshMD2AnimStr=GetProcAddress_(i3ddll,"I3D_SetAnimatedMeshMD2AnimStr")

Prototype.l  __I3D_GetAnimatedMeshJointNode( mesh.l, name.p-ascii)
Global __I3D_GetAnimatedMeshJointNode.__I3D_GetAnimatedMeshJointNode=GetProcAddress_(i3ddll,"I3D_GetAnimatedMeshJointNode")

Prototype.l  __I3D_CloneMesh( srcMesh.l)
Global __I3D_CloneMesh.__I3D_CloneMesh=GetProcAddress_(i3ddll,"I3D_CloneMesh")

Prototype.l  __I3D_CreateParticleSystem( x.f, y.f, z.f, tex.l)
Global __I3D_CreateParticleSystem.__I3D_CreateParticleSystem=GetProcAddress_(i3ddll,"I3D_CreateParticleSystem")

Prototype.l  __I3D_CreateMeshParticleSystem( x.f, y.f, z.f, texture.l, animatedmesh.l, useNormalDirection.l, normalDirectionModifier.f)
Global __I3D_CreateMeshParticleSystem.__I3D_CreateMeshParticleSystem=GetProcAddress_(i3ddll,"I3D_CreateMeshParticleSystem")

Prototype.l  __I3D_SetParticleSystemParticleSize( particlesystem.l, width.f, height.f)
Global __I3D_SetParticleSystemParticleSize.__I3D_SetParticleSystemParticleSize=GetProcAddress_(i3ddll,"I3D_SetParticleSystemParticleSize")

Prototype.l  __I3D_SetParticleSystemDirection( particlesystem.l, dir_x.f, dir_y.f, dir_z.f)
Global __I3D_SetParticleSystemDirection.__I3D_SetParticleSystemDirection=GetProcAddress_(i3ddll,"I3D_SetParticleSystemDirection")

Prototype.l  __I3D_SetParticleMaxAngleDegree( particlesystem.l, maxAngleDegrees.l)
Global __I3D_SetParticleMaxAngleDegree.__I3D_SetParticleMaxAngleDegree=GetProcAddress_(i3ddll,"I3D_SetParticleMaxAngleDegree")

Prototype.l  __I3D_SetParticleSystemBox( particlesystem.l, min_x.f, min_y.f, min_z.f, max_x.f, max_y.f, max_z.f)
Global __I3D_SetParticleSystemBox.__I3D_SetParticleSystemBox=GetProcAddress_(i3ddll,"I3D_SetParticleSystemBox")

Prototype.l  __I3D_SetParticleSystemLifeTime( particlesystem.l, minlifetime.l, maxlifetime.l)
Global __I3D_SetParticleSystemLifeTime.__I3D_SetParticleSystemLifeTime=GetProcAddress_(i3ddll,"I3D_SetParticleSystemLifeTime")

Prototype.l  __I3D_SetParticleSystemEmission( particlesystem.l, min_particles.l, max_particles.l)
Global __I3D_SetParticleSystemEmission.__I3D_SetParticleSystemEmission=GetProcAddress_(i3ddll,"I3D_SetParticleSystemEmission")

Prototype.l  __I3D_SetParticleSystemColors( particlesystem.l, min_color.l, max_color.l)
Global __I3D_SetParticleSystemColors.__I3D_SetParticleSystemColors=GetProcAddress_(i3ddll,"I3D_SetParticleSystemColors")

Prototype.l  __I3D_AddParticleSystemAttractionPoint( particlesystem.l, posX.f, posY.f, posZ.f, speed.f, affectX.l, affectY.l, affectZ.l)
Global __I3D_AddParticleSystemAttractionPoint.__I3D_AddParticleSystemAttractionPoint=GetProcAddress_(i3ddll,"I3D_AddParticleSystemAttractionPoint")

Prototype.l  __I3D_AddParticleSystemRotation( particlesystem.l, posX.f, posY.f, posZ.f, speedX.f, speedY.f, speedZ.f)
Global __I3D_AddParticleSystemRotation.__I3D_AddParticleSystemRotation=GetProcAddress_(i3ddll,"I3D_AddParticleSystemRotation")

Prototype.l  __I3D_AddParticleSystemGravity( particlesystem.l, gravityX.f, gravityY.f, gravityZ.f, timeForceLost.l)
Global __I3D_AddParticleSystemGravity.__I3D_AddParticleSystemGravity=GetProcAddress_(i3ddll,"I3D_AddParticleSystemGravity")

Prototype.l  __I3D_AddParticleSystemFadeOut( particlesystem.l, targetColor.l, timeToFadeOut.l)
Global __I3D_AddParticleSystemFadeOut.__I3D_AddParticleSystemFadeOut=GetProcAddress_(i3ddll,"I3D_AddParticleSystemFadeOut")

Prototype.l  __I3D_RemoveAllParticleSystemAffectors( particlesystem.l)
Global __I3D_RemoveAllParticleSystemAffectors.__I3D_RemoveAllParticleSystemAffectors=GetProcAddress_(i3ddll,"I3D_RemoveAllParticleSystemAffectors")

Prototype.l  __I3D_EnableParticleSystemAffector( particleaffector.l, enabled.l)
Global __I3D_EnableParticleSystemAffector.__I3D_EnableParticleSystemAffector=GetProcAddress_(i3ddll,"I3D_EnableParticleSystemAffector")

Prototype.l  __I3D_StopParticleSystem( particlesystem.l, time.l)
Global __I3D_StopParticleSystem.__I3D_StopParticleSystem=GetProcAddress_(i3ddll,"I3D_StopParticleSystem")

Prototype.l  __I3D_PhysicsInit( multithreaded.l)
Global __I3D_PhysicsInit.__I3D_PhysicsInit=GetProcAddress_(i3ddll,"I3D_PhysicsInit")

Prototype.l  __I3D_ResetEntityPhysicForce( entity.l)
Global __I3D_ResetEntityPhysicForce.__I3D_ResetEntityPhysicForce=GetProcAddress_(i3ddll,"I3D_ResetEntityPhysicForce")

Prototype.l  __I3D_SetEntityPhysicState( entity.l, activate.l)
Global __I3D_SetEntityPhysicState.__I3D_SetEntityPhysicState=GetProcAddress_(i3ddll,"I3D_SetEntityPhysicState")

Prototype.l  __I3D_ActivateEntityPhysic( entity.l, activate.l)
Global __I3D_ActivateEntityPhysic.__I3D_ActivateEntityPhysic=GetProcAddress_(i3ddll,"I3D_ActivateEntityPhysic")

Prototype.l  __I3D_ApplyEntityPhysicForce( entity.l, force_x.f, force_y.f, force_z.f, rel_x.f, rel_y.f, rel_z.f)
Global __I3D_ApplyEntityPhysicForce.__I3D_ApplyEntityPhysicForce=GetProcAddress_(i3ddll,"I3D_ApplyEntityPhysicForce")

Prototype.l  __I3D_ApplyEntityPhysicImpulse( entity.l, impulse_x.f, impulse_y.f, impulse_z.f, rel_x.f, rel_y.f, rel_z.f)
Global __I3D_ApplyEntityPhysicImpulse.__I3D_ApplyEntityPhysicImpulse=GetProcAddress_(i3ddll,"I3D_ApplyEntityPhysicImpulse")

Prototype.l  __I3D_PhysicsRun()
Global __I3D_PhysicsRun.__I3D_PhysicsRun=GetProcAddress_(i3ddll,"I3D_PhysicsRun")

Prototype.l  __I3D_AddEntityPhysicSphere__( radius.f, mass.f, px.f, py.f, pz.f)
Global __I3D_AddEntityPhysicSphere__.__I3D_AddEntityPhysicSphere__=GetProcAddress_(i3ddll,"I3D_AddEntityPhysicSphere__")

Prototype.l  __I3D_AddEntityPhysicSphere( entity.l, radius.f, mass.f, px.f, py.f, pz.f)
Global __I3D_AddEntityPhysicSphere.__I3D_AddEntityPhysicSphere=GetProcAddress_(i3ddll,"I3D_AddEntityPhysicSphere")

Prototype.l  __I3D_AddEntityPhysicBox( entity.l, width.f, height.f, depth.f, mass.f, px.f, py.f, pz.f)
Global __I3D_AddEntityPhysicBox.__I3D_AddEntityPhysicBox=GetProcAddress_(i3ddll,"I3D_AddEntityPhysicBox")

Prototype.l  __I3D_AddEntityPhysicBox__( width.f, height.f, depth.f, mass.f, px.f, py.f, pz.f)
Global __I3D_AddEntityPhysicBox__.__I3D_AddEntityPhysicBox__=GetProcAddress_(i3ddll,"I3D_AddEntityPhysicBox__")

Prototype.l  __I3D_SetFog( color.l, fogstart.f, fogend.f)
Global __I3D_SetFog.__I3D_SetFog=GetProcAddress_(i3ddll,"I3D_SetFog")

Prototype.l  __I3D_SetFogEx( color.l, linear.l, fogstart.f, fogend.f, density.f, pixelFog.l, rangeFog.l)
Global __I3D_SetFogEx.__I3D_SetFogEx=GetProcAddress_(i3ddll,"I3D_SetFogEx")

Prototype.l  __I3D_SetShadowColor( color.l)
Global __I3D_SetShadowColor.__I3D_SetShadowColor=GetProcAddress_(i3ddll,"I3D_SetShadowColor")

Prototype.l  __I3D_CreateMaterialShaderFromFileCB( VSFile.p-ascii, VSModel.l, VSMainFunction.p-ascii, PSFile.p-ascii, PSModel.l, PSMainFunction.p-ascii, materialType.l, autoSetConsts.l, CBFunc.l, userData.l)
Global __I3D_CreateMaterialShaderFromFileCB.__I3D_CreateMaterialShaderFromFileCB=GetProcAddress_(i3ddll,"I3D_CreateMaterialShaderFromFileCB")

Prototype.l  __I3D_CreateMaterialShaderCB( VSFile.p-ascii, VSModel.l, VSMainFunction.p-ascii, PSFile.p-ascii, PSModel.l, PSMainFunction.p-ascii, materialType.l, autoSetConsts.l, CBFunc.l, userData.l)
Global __I3D_CreateMaterialShaderCB.__I3D_CreateMaterialShaderCB=GetProcAddress_(i3ddll,"I3D_CreateMaterialShaderCB")

Prototype.l  __I3D_CreateMaterialShaderFromFile( VSFile.p-ascii, VSModel.l, VSMainFunction.p-ascii, PSFile.p-ascii, PSModel.l, PSMainFunction.p-ascii, materialType.l)
Global __I3D_CreateMaterialShaderFromFile.__I3D_CreateMaterialShaderFromFile=GetProcAddress_(i3ddll,"I3D_CreateMaterialShaderFromFile")

Prototype.l  __I3D_CreateMaterialShader( VSFile.p-ascii, VSModel.l, VSMainFunction.p-ascii, PSFile.p-ascii, PSModel.l, PSMainFunction.p-ascii, materialType.l)
Global __I3D_CreateMaterialShader.__I3D_CreateMaterialShader=GetProcAddress_(i3ddll,"I3D_CreateMaterialShader")

Prototype.l  __I3D_SetPixelShaderConstantArray( services.l, constName.p-ascii, floatdata.l, count.l)
Global __I3D_SetPixelShaderConstantArray.__I3D_SetPixelShaderConstantArray=GetProcAddress_(i3ddll,"I3D_SetPixelShaderConstantArray")

Prototype.l  __I3D_SetVertexShaderConstantArray( services.l, constName.p-ascii, floatdata.l, count.l)
Global __I3D_SetVertexShaderConstantArray.__I3D_SetVertexShaderConstantArray=GetProcAddress_(i3ddll,"I3D_SetVertexShaderConstantArray")

Prototype.l  __I3D_SetPixelShaderConstantF( services.l, constName.p-ascii, value.f)
Global __I3D_SetPixelShaderConstantF.__I3D_SetPixelShaderConstantF=GetProcAddress_(i3ddll,"I3D_SetPixelShaderConstantF")

Prototype.l  __I3D_SetVertexShaderConstantF( services.l, constName.p-ascii, value.f)
Global __I3D_SetVertexShaderConstantF.__I3D_SetVertexShaderConstantF=GetProcAddress_(i3ddll,"I3D_SetVertexShaderConstantF")

Prototype.l  __I3D_CreatePostProcessFromFile( PSFile.p-ascii, PSVersion.l, PSMainFunction.p-ascii, NumRTs.l)
Global __I3D_CreatePostProcessFromFile.__I3D_CreatePostProcessFromFile=GetProcAddress_(i3ddll,"I3D_CreatePostProcessFromFile")

Prototype.l  __I3D_CreatePostProcess( PSString.p-ascii, PSVersion.l, PSMainFunction.p-ascii, NumRTs.l)
Global __I3D_CreatePostProcess.__I3D_CreatePostProcess=GetProcAddress_(i3ddll,"I3D_CreatePostProcess")

Prototype.l  __I3D_FreePostProcess( pEffect.l)
Global __I3D_FreePostProcess.__I3D_FreePostProcess=GetProcAddress_(i3ddll,"I3D_FreePostProcess")

Prototype.l  __I3D_BeginPostProcess( pEffect.l, clearBackBuffer.l, clearZBuffer.l, backColor.l)
Global __I3D_BeginPostProcess.__I3D_BeginPostProcess=GetProcAddress_(i3ddll,"I3D_BeginPostProcess")

Prototype.l  __I3D_SetPostProcessTexture( pEffect.l, index.l, tex.l)
Global __I3D_SetPostProcessTexture.__I3D_SetPostProcessTexture=GetProcAddress_(i3ddll,"I3D_SetPostProcessTexture")

Prototype.l  __I3D_SetPostProcessConstF( pEffect.l, constName.p-ascii, value.f)
Global __I3D_SetPostProcessConstF.__I3D_SetPostProcessConstF=GetProcAddress_(i3ddll,"I3D_SetPostProcessConstF")

Prototype.l  __I3D_SetPostProcessConstArray( pEffect.l, constName.p-ascii, floatArray.l, count.l)
Global __I3D_SetPostProcessConstArray.__I3D_SetPostProcessConstArray=GetProcAddress_(i3ddll,"I3D_SetPostProcessConstArray")

Prototype.l  __I3D_EndPostProcess( pEffect.l)
Global __I3D_EndPostProcess.__I3D_EndPostProcess=GetProcAddress_(i3ddll,"I3D_EndPostProcess")

Prototype.l  __I3D_GetPostProcessRTSprite( pEffect.l, index.l)
Global __I3D_GetPostProcessRTSprite.__I3D_GetPostProcessRTSprite=GetProcAddress_(i3ddll,"I3D_GetPostProcessRTSprite")

Prototype.l  __I3D_GetTextureWidth( tex.l)
Global __I3D_GetTextureWidth.__I3D_GetTextureWidth=GetProcAddress_(i3ddll,"I3D_GetTextureWidth")

Prototype.l  __I3D_GetTextureHeight( tex.l)
Global __I3D_GetTextureHeight.__I3D_GetTextureHeight=GetProcAddress_(i3ddll,"I3D_GetTextureHeight")

Prototype.l  __I3D_GetOrgTextureWidth( tex.l)
Global __I3D_GetOrgTextureWidth.__I3D_GetOrgTextureWidth=GetProcAddress_(i3ddll,"I3D_GetOrgTextureWidth")

Prototype.l  __I3D_GetOrgTextureHeight( tex.l)
Global __I3D_GetOrgTextureHeight.__I3D_GetOrgTextureHeight=GetProcAddress_(i3ddll,"I3D_GetOrgTextureHeight")

Prototype.l  __I3D_GetTextureFormat( tex.l)
Global __I3D_GetTextureFormat.__I3D_GetTextureFormat=GetProcAddress_(i3ddll,"I3D_GetTextureFormat")

Prototype.l  __I3D_LoadTexture( file.p-ascii, flags.l)
Global __I3D_LoadTexture.__I3D_LoadTexture=GetProcAddress_(i3ddll,"I3D_LoadTexture")

Prototype.l  __I3D_LoadNormalMap( file.p-ascii, amplitude.f)
Global __I3D_LoadNormalMap.__I3D_LoadNormalMap=GetProcAddress_(i3ddll,"I3D_LoadNormalMap")

Prototype.l  __I3D_MakeNormalMapTexture( texture.l, amplitude.f)
Global __I3D_MakeNormalMapTexture.__I3D_MakeNormalMapTexture=GetProcAddress_(i3ddll,"I3D_MakeNormalMapTexture")

Prototype.l  __I3D_MakeTextureTransparent( tex.l, color.l)
Global __I3D_MakeTextureTransparent.__I3D_MakeTextureTransparent=GetProcAddress_(i3ddll,"I3D_MakeTextureTransparent")

Prototype.l  __I3D_FreeTexture( tex.l)
Global __I3D_FreeTexture.__I3D_FreeTexture=GetProcAddress_(i3ddll,"I3D_FreeTexture")

Prototype.l  __I3D_CompressTexture( tex.l, mode.l)
Global __I3D_CompressTexture.__I3D_CompressTexture=GetProcAddress_(i3ddll,"I3D_CompressTexture")

Prototype.l  __I3D_LoadXMLFromFile( file.p-ascii)
Global __I3D_LoadXMLFromFile.__I3D_LoadXMLFromFile=GetProcAddress_(i3ddll,"I3D_LoadXMLFromFile")

Prototype.l  __I3D_FileExists( file.p-ascii)
Global __I3D_FileExists.__I3D_FileExists=GetProcAddress_(i3ddll,"I3D_FileExists")

Prototype.l  __I3D_ReadXML( xml.l)
Global __I3D_ReadXML.__I3D_ReadXML=GetProcAddress_(i3ddll,"I3D_ReadXML")

Prototype.l  __I3D_GetXMLNodeData( xml.l)
Global __I3D_GetXMLNodeData.__I3D_GetXMLNodeData=GetProcAddress_(i3ddll,"I3D_GetXMLNodeData")

Prototype.l  __I3D_GetXMLAttribCount( xml.l)
Global __I3D_GetXMLAttribCount.__I3D_GetXMLAttribCount=GetProcAddress_(i3ddll,"I3D_GetXMLAttribCount")

Prototype.l  __I3D_GetXMLAttribName( xml.l, index.l)
Global __I3D_GetXMLAttribName.__I3D_GetXMLAttribName=GetProcAddress_(i3ddll,"I3D_GetXMLAttribName")

Prototype.l  __I3D_GetXMLAttribValue( xml.l, index.l)
Global __I3D_GetXMLAttribValue.__I3D_GetXMLAttribValue=GetProcAddress_(i3ddll,"I3D_GetXMLAttribValue")

Prototype.l  __I3D_GetXMLAttribValueFromName( xml.l, name.p-unicode)
Global __I3D_GetXMLAttribValueFromName.__I3D_GetXMLAttribValueFromName=GetProcAddress_(i3ddll,"I3D_GetXMLAttribValueFromName")

Prototype.l  __I3D_GetXMLNodeName( xml.l)
Global __I3D_GetXMLNodeName.__I3D_GetXMLNodeName=GetProcAddress_(i3ddll,"I3D_GetXMLNodeName")

Prototype.l  __I3D_FreeXML( xml.l)
Global __I3D_FreeXML.__I3D_FreeXML=GetProcAddress_(i3ddll,"I3D_FreeXML")


ProcedureDLL.l I3D_DrawLine2D( x1.l, y1.l, x2.l, y2.l, color.l)
ProcedureReturn __I3D_DrawLine2D( x1.l, y1.l, x2.l, y2.l, color.l)
EndProcedure

ProcedureDLL.l I3D_DrawBox2D( x.l, y.l, width.l, height.l, color.l)
ProcedureReturn __I3D_DrawBox2D( x.l, y.l, width.l, height.l, color.l)
EndProcedure

ProcedureDLL.l I3D_DrawBox2DEx( x.l, y.l, width.l, height.l, color1.l, color2.l, color3.l, color4.l)
ProcedureReturn __I3D_DrawBox2DEx( x.l, y.l, width.l, height.l, color1.l, color2.l, color3.l, color4.l)
EndProcedure

ProcedureDLL.l I3D_DrawOutlineCircle2D( x.l, y.l, radius.f, color.l)
ProcedureReturn __I3D_DrawOutlineCircle2D( x.l, y.l, radius.f, color.l)
EndProcedure

ProcedureDLL.l I3D_DrawGUIText2D( font.l, text.s, x.l, y.l, color.l)
ProcedureReturn __I3D_DrawGUIText2D( font.l, text.s, x.l, y.l, color.l)
EndProcedure

ProcedureDLL.l I3D_LoadSprite( file.s, flags.l)
ProcedureReturn __I3D_LoadSprite( file.s, flags.l)
EndProcedure

ProcedureDLL.l I3D_CreateSprite( width.l, height.l, flags.l)
ProcedureReturn __I3D_CreateSprite( width.l, height.l, flags.l)
EndProcedure

ProcedureDLL.l I3D_LoadSpriteFromMem( memAddr.l, size.l, flags.l)
ProcedureReturn __I3D_LoadSpriteFromMem( memAddr.l, size.l, flags.l)
EndProcedure

ProcedureDLL.l I3D_FreeSprite( sprite.l)
ProcedureReturn __I3D_FreeSprite( sprite.l)
EndProcedure

ProcedureDLL.l I3D_MakeSpriteTransparent( Sprite.l, color.l)
ProcedureReturn __I3D_MakeSpriteTransparent( Sprite.l, color.l)
EndProcedure

ProcedureDLL.l I3D_LockSprite( Sprite.l, readonly.l)
ProcedureReturn __I3D_LockSprite( Sprite.l, readonly.l)
EndProcedure

ProcedureDLL.l I3D_UnLockSprite( Sprite.l)
ProcedureReturn __I3D_UnLockSprite( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_GetSpritePitch( Sprite.l)
ProcedureReturn __I3D_GetSpritePitch( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_GetSpriteDC( Sprite.l)
ProcedureReturn __I3D_GetSpriteDC( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_ReleaseSpriteDC( Sprite.l)
ProcedureReturn __I3D_ReleaseSpriteDC( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_GetSpriteWidth( Sprite.l)
ProcedureReturn __I3D_GetSpriteWidth( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_GetSpriteHeight( Sprite.l)
ProcedureReturn __I3D_GetSpriteHeight( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_SetSpriteColor( Sprite.l, color.l)
ProcedureReturn __I3D_SetSpriteColor( Sprite.l, color.l)
EndProcedure

ProcedureDLL.l I3D_GetSpriteFromat( Sprite.l)
ProcedureReturn __I3D_GetSpriteFromat( Sprite.l)
EndProcedure

ProcedureDLL.l I3D_SetSpriteCenter( Sprite.l, x.f, y.f)
ProcedureReturn __I3D_SetSpriteCenter( Sprite.l, x.f, y.f)
EndProcedure

ProcedureDLL.l I3D_ClipSprite( sprite.l, clipX.l, clipY.l, clipWidth.l, clipHeight.l)
ProcedureReturn __I3D_ClipSprite( sprite.l, clipX.l, clipY.l, clipWidth.l, clipHeight.l)
EndProcedure

ProcedureDLL.l I3D_DrawSprite2D( sprite.l, x.f, y.f)
ProcedureReturn __I3D_DrawSprite2D( sprite.l, x.f, y.f)
EndProcedure

ProcedureDLL.l I3D_DrawSprite2DEx( sprite.l, x.f, y.f, width.f, height.f, angle.f)
ProcedureReturn __I3D_DrawSprite2DEx( sprite.l, x.f, y.f, width.f, height.f, angle.f)
EndProcedure

ProcedureDLL.l I3D_CreateFont( fontname.s, size.l, bold.l, italic.l)
ProcedureReturn __I3D_CreateFont( fontname.s, size.l, bold.l, italic.l)
EndProcedure

ProcedureDLL.l I3D_DrawText2D( fnt.l, x.f, y.f, text.s, color.l)
ProcedureReturn __I3D_DrawText2D( fnt.l, x.f, y.f, text.s, color.l)
EndProcedure

ProcedureDLL.l I3D_DrawText2DEx( font.l, x.f, y.f, scale_x.f, scale_y.f, angle.f, text.s, color.l)
ProcedureReturn __I3D_DrawText2DEx( font.l, x.f, y.f, scale_x.f, scale_y.f, angle.f, text.s, color.l)
EndProcedure

ProcedureDLL.l I3D_PreloadText2D( font.l, text.s)
ProcedureReturn __I3D_PreloadText2D( font.l, text.s)
EndProcedure

ProcedureDLL.l I3D_SpriteCollision( sprite1.l, x1.l, y1.l, sprite2.l, x2.l, y2.l)
ProcedureReturn __I3D_SpriteCollision( sprite1.l, x1.l, y1.l, sprite2.l, x2.l, y2.l)
EndProcedure

ProcedureDLL.l I3D_SpritePixelCollision( sprite1.l, x1.l, y1.l, sprite2.l, x2.l, y2.l)
ProcedureReturn __I3D_SpritePixelCollision( sprite1.l, x1.l, y1.l, sprite2.l, x2.l, y2.l)
EndProcedure

ProcedureDLL.l I3D_CreateAutoCollision( collisionEntity.l)
ProcedureReturn __I3D_CreateAutoCollision( collisionEntity.l)
EndProcedure

ProcedureDLL.l I3D_AddAutoCollisionWorld( autoCollision.l, worldEntity.l)
ProcedureReturn __I3D_AddAutoCollisionWorld( autoCollision.l, worldEntity.l)
EndProcedure

ProcedureDLL.l I3D_RemoveAutoCollisionWorld( autoCollision.l, worldEntity.l)
ProcedureReturn __I3D_RemoveAutoCollisionWorld( autoCollision.l, worldEntity.l)
EndProcedure

ProcedureDLL.l I3D_SetAutoCollisionGravity( autoCollision.l, gravityX.f, gravityY.f, gravityZ.f)
ProcedureReturn __I3D_SetAutoCollisionGravity( autoCollision.l, gravityX.f, gravityY.f, gravityZ.f)
EndProcedure

ProcedureDLL.l I3D_SetAutoCollisionEllipsoidRadius( autoCollision.l, radX.f, radY.f, radZ.f)
ProcedureReturn __I3D_SetAutoCollisionEllipsoidRadius( autoCollision.l, radX.f, radY.f, radZ.f)
EndProcedure

ProcedureDLL.l I3D_SetAutoCollisionEllipsoidTranslation( autoCollision.l, X.f, Y.f, Z.f)
ProcedureReturn __I3D_SetAutoCollisionEllipsoidTranslation( autoCollision.l, X.f, Y.f, Z.f)
EndProcedure

ProcedureDLL.l I3D_FreeAutoCollision( autoCollision.l)
ProcedureReturn __I3D_FreeAutoCollision( autoCollision.l)
EndProcedure

ProcedureDLL.l I3D_AddEntityFlyRouteAnimator( entity.l, ptrpoints.l, numPoints.l, speed.f, tightness.f)
ProcedureReturn __I3D_AddEntityFlyRouteAnimator( entity.l, ptrpoints.l, numPoints.l, speed.f, tightness.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityFlyLineAnimator( entity.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, timeForWay.l, loop.l)
ProcedureReturn __I3D_AddEntityFlyLineAnimator( entity.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, timeForWay.l, loop.l)
EndProcedure

ProcedureDLL.l I3D_AddEntityFlyCircleAnimator( entity.l, centerX.f, centerY.f, centerZ.f, dirX.f, dirY.f, dirZ.f, radius.f, speed.f)
ProcedureReturn __I3D_AddEntityFlyCircleAnimator( entity.l, centerX.f, centerY.f, centerZ.f, dirX.f, dirY.f, dirZ.f, radius.f, speed.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityRotationAnimator( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_AddEntityRotationAnimator( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_RemoveEntityAnimator( entity.l, anim.l)
ProcedureReturn __I3D_RemoveEntityAnimator( entity.l, anim.l)
EndProcedure

ProcedureDLL.l I3D_AddEntityMoveAnimator( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_AddEntityMoveAnimator( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityFollowEntityAnimator( entity.l, dest_entity.l, move_speed.f)
ProcedureReturn __I3D_AddEntityFollowEntityAnimator( entity.l, dest_entity.l, move_speed.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityScaleAnimator( entity.l, scaleX1.f, scaleY1.f, scaleZ1.f, scaleX2.f, scaleY2.f, scaleZ2.f, speed.f)
ProcedureReturn __I3D_AddEntityScaleAnimator( entity.l, scaleX1.f, scaleY1.f, scaleZ1.f, scaleX2.f, scaleY2.f, scaleZ2.f, speed.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityCBAnimator( entity.l, CBFunction.l, userData.l)
ProcedureReturn __I3D_AddEntityCBAnimator( entity.l, CBFunction.l, userData.l)
EndProcedure

ProcedureDLL.l I3D_AddEntityTextureAnimator( entity.l, numTextures.l, textureArray.l, timePerFrame.l, loop.l)
ProcedureReturn __I3D_AddEntityTextureAnimator( entity.l, numTextures.l, textureArray.l, timePerFrame.l, loop.l)
EndProcedure

ProcedureDLL.l I3D_AddEntityDeleteAnimator( entity.l, lifeTime.l)
ProcedureReturn __I3D_AddEntityDeleteAnimator( entity.l, lifeTime.l)
EndProcedure

ProcedureDLL.l I3D_CreateCamera()
ProcedureReturn __I3D_CreateCamera()
EndProcedure

ProcedureDLL.l I3D_CreateFPSCamera( rotateSpeed.f, moveSpeed.f, jumpSpeed.f)
ProcedureReturn __I3D_CreateFPSCamera( rotateSpeed.f, moveSpeed.f, jumpSpeed.f)
EndProcedure

ProcedureDLL.l I3D_CreateFPSCameraEx( rotateSpeed.f, moveSpeed.f, jumpSpeed.f, horizontalMovement.l, WASDKeys.l)
ProcedureReturn __I3D_CreateFPSCameraEx( rotateSpeed.f, moveSpeed.f, jumpSpeed.f, horizontalMovement.l, WASDKeys.l)
EndProcedure

ProcedureDLL.l I3D_CreateMayaCamera( rotateSpeed.f, zoomSpeed.f, translationSpeed.f)
ProcedureReturn __I3D_CreateMayaCamera( rotateSpeed.f, zoomSpeed.f, translationSpeed.f)
EndProcedure

ProcedureDLL.l I3D_SetCamera( camera.l)
ProcedureReturn __I3D_SetCamera( camera.l)
EndProcedure

ProcedureDLL.l I3D_GetCamera()
ProcedureReturn __I3D_GetCamera()
EndProcedure

ProcedureDLL.f I3D_SetCameraNear( zn.f)
ProcedureReturn __I3D_SetCameraNear( zn.f)
EndProcedure

ProcedureDLL.f I3D_SetCameraFar( zf.f)
ProcedureReturn __I3D_SetCameraFar( zf.f)
EndProcedure

ProcedureDLL.f I3D_SetCameraFOV( fov.f)
ProcedureReturn __I3D_SetCameraFOV( fov.f)
EndProcedure

ProcedureDLL.f I3D_SetCameraAspectRatio( aspect.f)
ProcedureReturn __I3D_SetCameraAspectRatio( aspect.f)
EndProcedure

ProcedureDLL.l I3D_CameraLookAt( posX.f, posY.f, posZ.f)
ProcedureReturn __I3D_CameraLookAt( posX.f, posY.f, posZ.f)
EndProcedure

ProcedureDLL.l I3D_StartDrawQuad3D()
ProcedureReturn __I3D_StartDrawQuad3D()
EndProcedure

ProcedureDLL.l I3D_StopDrawQuad3D()
ProcedureReturn __I3D_StopDrawQuad3D()
EndProcedure

ProcedureDLL.l I3D_SetDynamicMaterialFlag( matflag.l, enabled.l)
ProcedureReturn __I3D_SetDynamicMaterialFlag( matflag.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_SetDynamicMaterialType( matflag.l, enabled.l)
ProcedureReturn __I3D_SetDynamicMaterialType( matflag.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_SetDynamicQuadTextureCoords( tu1.f, tv1.f, tu2.f, tv2.f, tu3.f, tv3.f, tu4.f, tv4.f)
ProcedureReturn __I3D_SetDynamicQuadTextureCoords( tu1.f, tv1.f, tu2.f, tv2.f, tu3.f, tv3.f, tu4.f, tv4.f)
EndProcedure

ProcedureDLL.l I3D_SetDynamicTriTextureCoords( tu1.f, tv1.f, tu2.f, tv2.f, tu3.f, tv3.f)
ProcedureReturn __I3D_SetDynamicTriTextureCoords( tu1.f, tv1.f, tu2.f, tv2.f, tu3.f, tv3.f)
EndProcedure

ProcedureDLL.l I3D_SetDynamicTriColors( color1.l, color2.l, color3.l)
ProcedureReturn __I3D_SetDynamicTriColors( color1.l, color2.l, color3.l)
EndProcedure

ProcedureDLL.l I3D_SetDynamicQuadColors( color1.l, color2.l, color3.l, color4.l)
ProcedureReturn __I3D_SetDynamicQuadColors( color1.l, color2.l, color3.l, color4.l)
EndProcedure

ProcedureDLL.l I3D_SetDynamicNormalsQuaity( quality.l)
ProcedureReturn __I3D_SetDynamicNormalsQuaity( quality.l)
EndProcedure

ProcedureDLL.l I3D_DrawQuad3D( texture.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, x3.f, y3.f, z3.f, x4.f, y4.f, z4.f)
ProcedureReturn __I3D_DrawQuad3D( texture.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, x3.f, y3.f, z3.f, x4.f, y4.f, z4.f)
EndProcedure

ProcedureDLL.l I3D_DrawTriangle3D( texture.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, x3.f, y3.f, z3.f)
ProcedureReturn __I3D_DrawTriangle3D( texture.l, x1.f, y1.f, z1.f, x2.f, y2.f, z2.f, x3.f, y3.f, z3.f)
EndProcedure

ProcedureDLL.l I3D_MoveEntity( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_MoveEntity( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_RotateEntity( entity.l, pitch.f, yaw.f, roll.f)
ProcedureReturn __I3D_RotateEntity( entity.l, pitch.f, yaw.f, roll.f)
EndProcedure

ProcedureDLL.l I3D_ScaleEntity( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_ScaleEntity( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_SetEntityScalation( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_SetEntityScalation( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_SetEntityPosition( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_SetEntityPosition( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_SetEntityRotation( entity.l, pitch.f, yaw.f, roll.f)
ProcedureReturn __I3D_SetEntityRotation( entity.l, pitch.f, yaw.f, roll.f)
EndProcedure

ProcedureDLL.l I3D_EnableEntity( entity.l, enabled.l)
ProcedureReturn __I3D_EnableEntity( entity.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_IsEntityEnabled( entity.l)
ProcedureReturn __I3D_IsEntityEnabled( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityX( entity.l)
ProcedureReturn __I3D_EntityX( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityY( entity.l)
ProcedureReturn __I3D_EntityY( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityZ( entity.l)
ProcedureReturn __I3D_EntityZ( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityPitch( entity.l)
ProcedureReturn __I3D_EntityPitch( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityYaw( entity.l)
ProcedureReturn __I3D_EntityYaw( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityRoll( entity.l)
ProcedureReturn __I3D_EntityRoll( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityScaleX( entity.l)
ProcedureReturn __I3D_EntityScaleX( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityScaleY( entity.l)
ProcedureReturn __I3D_EntityScaleY( entity.l)
EndProcedure

ProcedureDLL.f I3D_EntityScaleZ( entity.l)
ProcedureReturn __I3D_EntityScaleZ( entity.l)
EndProcedure

ProcedureDLL.l I3D_GetEntityTransform( entity.l, retX.l, retY.l, retZ.l, retPitch.l, retYaw.l, retRoll.l, retSX.l, retSY.l, retSZ.l)
ProcedureReturn __I3D_GetEntityTransform( entity.l, retX.l, retY.l, retZ.l, retPitch.l, retYaw.l, retRoll.l, retSX.l, retSY.l, retSZ.l)
EndProcedure

ProcedureDLL.l I3D_GetEntityAbsolutePosition( entity.l, retX.l, retY.l, retZ.l)
ProcedureReturn __I3D_GetEntityAbsolutePosition( entity.l, retX.l, retY.l, retZ.l)
EndProcedure

ProcedureDLL.l I3D_SetEntityTransform( entity.l, x.f, y.f, z.f, pitch.f, yaw.f, roll.f, sx.f, sy.f, sz.f)
ProcedureReturn __I3D_SetEntityTransform( entity.l, x.f, y.f, z.f, pitch.f, yaw.f, roll.f, sx.f, sy.f, sz.f)
EndProcedure

ProcedureDLL.l I3D_GetEntityTransformMatrix( entity.l, relative.l, matrix.l)
ProcedureReturn __I3D_GetEntityTransformMatrix( entity.l, relative.l, matrix.l)
EndProcedure

ProcedureDLL.l I3D_GetEntityTransformedBoundingBox( entity.l, retMinX.l, retMinY.l, retMinZ.l, retMaxX.l, retMaxY.l, retMaxZ.l)
ProcedureReturn __I3D_GetEntityTransformedBoundingBox( entity.l, retMinX.l, retMinY.l, retMinZ.l, retMaxX.l, retMaxY.l, retMaxZ.l)
EndProcedure

ProcedureDLL.l I3D_GetEntityBoundingBox( entity.l, retMinX.l, retMinY.l, retMinZ.l, retMaxX.l, retMaxY.l, retMaxZ.l)
ProcedureReturn __I3D_GetEntityBoundingBox( entity.l, retMinX.l, retMinY.l, retMinZ.l, retMaxX.l, retMaxY.l, retMaxZ.l)
EndProcedure

ProcedureDLL.l I3D_SetEntityAutomaticCulling( entity.l, mode.l)
ProcedureReturn __I3D_SetEntityAutomaticCulling( entity.l, mode.l)
EndProcedure

ProcedureDLL.l I3D_CreateBillboard( x.f, y.f, z.f, width.f, height.f, texture.l)
ProcedureReturn __I3D_CreateBillboard( x.f, y.f, z.f, width.f, height.f, texture.l)
EndProcedure

ProcedureDLL.l I3D_CreateBillboardText( guiFont.l, text.s, color.l)
ProcedureReturn __I3D_CreateBillboardText( guiFont.l, text.s, color.l)
EndProcedure

ProcedureDLL.l I3D_CreateSkyBox( texture_top.l, texture_bottom.l, texture_left.l, texture_right.l, texture_front.l, texture_back.l)
ProcedureReturn __I3D_CreateSkyBox( texture_top.l, texture_bottom.l, texture_left.l, texture_right.l, texture_front.l, texture_back.l)
EndProcedure

ProcedureDLL.l I3D_CreateSkyDome( texture.l, horiRes.l, vertRes.l, texturePercentage.f, spherePercentage.f)
ProcedureReturn __I3D_CreateSkyDome( texture.l, horiRes.l, vertRes.l, texturePercentage.f, spherePercentage.f)
EndProcedure

ProcedureDLL.l I3D_SetEntityMaterialType( entity.l, mattype.l)
ProcedureReturn __I3D_SetEntityMaterialType( entity.l, mattype.l)
EndProcedure

ProcedureDLL.l I3D_SetEntityMaterialFlag( entity.l, matflag.l, enabled.l)
ProcedureReturn __I3D_SetEntityMaterialFlag( entity.l, matflag.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_EnableEntityLighting( entity.l, enabled.l)
ProcedureReturn __I3D_EnableEntityLighting( entity.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_EnableEntityFog( entity.l, enabled.l)
ProcedureReturn __I3D_EnableEntityFog( entity.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_SetMaterialTexture( entity.l, materialindex.l, texture.l)
ProcedureReturn __I3D_SetMaterialTexture( entity.l, materialindex.l, texture.l)
EndProcedure

ProcedureDLL.l I3D_SetMaterialSpecularColor( entity.l, materialindex.l, color.l)
ProcedureReturn __I3D_SetMaterialSpecularColor( entity.l, materialindex.l, color.l)
EndProcedure

ProcedureDLL.l I3D_SetMaterialEmissiveColor( entity.l, materialindex.l, color.l)
ProcedureReturn __I3D_SetMaterialEmissiveColor( entity.l, materialindex.l, color.l)
EndProcedure

ProcedureDLL.f I3D_SetMaterialSpecularForce( entity.l, materialindex.l, force.f)
ProcedureReturn __I3D_SetMaterialSpecularForce( entity.l, materialindex.l, force.f)
EndProcedure

ProcedureDLL.f I3D_SetEntityParallaxHeight( entity.l, height.f)
ProcedureReturn __I3D_SetEntityParallaxHeight( entity.l, height.f)
EndProcedure

ProcedureDLL.f I3D_SetEntityAlphaRef( entity.l, ref.f)
ProcedureReturn __I3D_SetEntityAlphaRef( entity.l, ref.f)
EndProcedure

ProcedureDLL.l I3D_GetEntityMaterialCount( entity.l)
ProcedureReturn __I3D_GetEntityMaterialCount( entity.l)
EndProcedure

ProcedureDLL.l I3D_GetEntityParent( entity.l)
ProcedureReturn __I3D_GetEntityParent( entity.l)
EndProcedure

ProcedureDLL.l I3D_CreateTerrain( file.s, texture.l, x.f, y.f, z.f, scaleX.f, scaleY.f, scaleZ.f, maxLOD.l, detail_texture.l)
ProcedureReturn __I3D_CreateTerrain( file.s, texture.l, x.f, y.f, z.f, scaleX.f, scaleY.f, scaleZ.f, maxLOD.l, detail_texture.l)
EndProcedure

ProcedureDLL.f I3D_TerrainHeight( terrain.l, x.f, y.f)
ProcedureReturn __I3D_TerrainHeight( terrain.l, x.f, y.f)
EndProcedure

ProcedureDLL.l I3D_PickEntity( x.l, y.l, exactpicking.l)
ProcedureReturn __I3D_PickEntity( x.l, y.l, exactpicking.l)
EndProcedure

ProcedureDLL.l I3D_PickEntityFromRay( x.f, y.f, z.f, x2.f, y2.f, z2.f, exactpicking.l)
ProcedureReturn __I3D_PickEntityFromRay( x.f, y.f, z.f, x2.f, y2.f, z2.f, exactpicking.l)
EndProcedure

ProcedureDLL.f I3D_PickX()
ProcedureReturn __I3D_PickX()
EndProcedure

ProcedureDLL.f I3D_PickY()
ProcedureReturn __I3D_PickY()
EndProcedure

ProcedureDLL.f I3D_PickZ()
ProcedureReturn __I3D_PickZ()
EndProcedure

ProcedureDLL.l I3D_FindEntity( name.s, id.l)
ProcedureReturn __I3D_FindEntity( name.s, id.l)
EndProcedure

ProcedureDLL.l I3D_TestEntityBoxCollision( entity1.l, entity2.l)
ProcedureReturn __I3D_TestEntityBoxCollision( entity1.l, entity2.l)
EndProcedure

ProcedureDLL.l I3D_GetEntityType( entity.l)
ProcedureReturn __I3D_GetEntityType( entity.l)
EndProcedure

ProcedureDLL.l I3D_TestEntityVisibility( entity.l)
ProcedureReturn __I3D_TestEntityVisibility( entity.l)
EndProcedure

ProcedureDLL.l I3D_CreateEmptyEntity()
ProcedureReturn __I3D_CreateEmptyEntity()
EndProcedure

ProcedureDLL.l I3D_SetEntityParent( parent_entity.l, child_entity.l)
ProcedureReturn __I3D_SetEntityParent( parent_entity.l, child_entity.l)
EndProcedure

ProcedureDLL.l I3D_FreeEntity( entity.l)
ProcedureReturn __I3D_FreeEntity( entity.l)
EndProcedure

ProcedureDLL.l I3D_EntityLookAt( entity.l, x.f, y.f, z.f)
ProcedureReturn __I3D_EntityLookAt( entity.l, x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_GetChildEntityCount( parent.l)
ProcedureReturn __I3D_GetChildEntityCount( parent.l)
EndProcedure

ProcedureDLL.l I3D_GetChildEntities( parent.l, ptr.l)
ProcedureReturn __I3D_GetChildEntities( parent.l, ptr.l)
EndProcedure

ProcedureDLL.l I3D_FreeAllEntities()
ProcedureReturn __I3D_FreeAllEntities()
EndProcedure

ProcedureDLL.l I3D_GetRootEntity()
ProcedureReturn __I3D_GetRootEntity()
EndProcedure

ProcedureDLL.l I3D_SetEntityMaxDist( entity.l, distance.f)
ProcedureReturn __I3D_SetEntityMaxDist( entity.l, distance.f)
EndProcedure

ProcedureDLL.l I3D_RenderEntity( entity.l)
ProcedureReturn __I3D_RenderEntity( entity.l)
EndProcedure

ProcedureDLL.l I3D_TextControl( x.l, y.l, width.l, height.l, border.l, parent.l, text.s, textColor.l)
ProcedureReturn __I3D_TextControl( x.l, y.l, width.l, height.l, border.l, parent.l, text.s, textColor.l)
EndProcedure

ProcedureDLL.l I3D_ButtonControl( x.l, y.l, width.l, height.l, parent.l, text.s)
ProcedureReturn __I3D_ButtonControl( x.l, y.l, width.l, height.l, parent.l, text.s)
EndProcedure

ProcedureDLL.l I3D_IsButtonPressed( button.l)
ProcedureReturn __I3D_IsButtonPressed( button.l)
EndProcedure

ProcedureDLL.l I3D_SetButtonImages( button.l, sprite.l, sprite_pressed.l)
ProcedureReturn __I3D_SetButtonImages( button.l, sprite.l, sprite_pressed.l)
EndProcedure

ProcedureDLL.l I3D_EditControl( x.l, y.l, width.l, height.l, borderless.l, parent.l, text.s)
ProcedureReturn __I3D_EditControl( x.l, y.l, width.l, height.l, borderless.l, parent.l, text.s)
EndProcedure

ProcedureDLL.l I3D_PictureControl( x.l, y.l, parent.l, sprite.l)
ProcedureReturn __I3D_PictureControl( x.l, y.l, parent.l, sprite.l)
EndProcedure

ProcedureDLL.l I3D_CheckBoxControl( x.l, y.l, width.l, height.l, parent.l, text.s)
ProcedureReturn __I3D_CheckBoxControl( x.l, y.l, width.l, height.l, parent.l, text.s)
EndProcedure

ProcedureDLL.l I3D_ListBoxControl( x.l, y.l, width.l, height.l, parent.l)
ProcedureReturn __I3D_ListBoxControl( x.l, y.l, width.l, height.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_ComboBoxControl( x.l, y.l, width.l, height.l, parent.l)
ProcedureReturn __I3D_ComboBoxControl( x.l, y.l, width.l, height.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_WindowControl( x.l, y.l, width.l, height.l, modal.l, closeButton.l, parent.l, title.s)
ProcedureReturn __I3D_WindowControl( x.l, y.l, width.l, height.l, modal.l, closeButton.l, parent.l, title.s)
EndProcedure

ProcedureDLL.l I3D_ToolbarControl( parent.l)
ProcedureReturn __I3D_ToolbarControl( parent.l)
EndProcedure

ProcedureDLL.l I3D_AddToolbarButton( toolbar.l, tooltip.s, sprite.l, pressed_sprite.l, isPushButton.l)
ProcedureReturn __I3D_AddToolbarButton( toolbar.l, tooltip.s, sprite.l, pressed_sprite.l, isPushButton.l)
EndProcedure

ProcedureDLL.l I3D_PopupMenu( x.l, y.l, parent.l)
ProcedureReturn __I3D_PopupMenu( x.l, y.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_AddPopupMenuItem( popup.l, text.s)
ProcedureReturn __I3D_AddPopupMenuItem( popup.l, text.s)
EndProcedure

ProcedureDLL.l I3D_AddPopupMenuSeperator( popup.l)
ProcedureReturn __I3D_AddPopupMenuSeperator( popup.l)
EndProcedure

ProcedureDLL.l I3D_ScrollBarControl( x.l, y.l, width.l, height.l, horizontal.l, parent.l)
ProcedureReturn __I3D_ScrollBarControl( x.l, y.l, width.l, height.l, horizontal.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_TabControl( x.l, y.l, width.l, height.l, parent.l, fillbackground.l, border.l)
ProcedureReturn __I3D_TabControl( x.l, y.l, width.l, height.l, parent.l, fillbackground.l, border.l)
EndProcedure

ProcedureDLL.l I3D_AddTab( parent.l, caption.s)
ProcedureReturn __I3D_AddTab( parent.l, caption.s)
EndProcedure

ProcedureDLL.l I3D_GetActiveTab( tabcontrol.l)
ProcedureReturn __I3D_GetActiveTab( tabcontrol.l)
EndProcedure

ProcedureDLL.l I3D_SetActiveTab( tabcontrol.l, tab.l)
ProcedureReturn __I3D_SetActiveTab( tabcontrol.l, tab.l)
EndProcedure

ProcedureDLL.l I3D_AddListBoxItem( listBox.l, text.s)
ProcedureReturn __I3D_AddListBoxItem( listBox.l, text.s)
EndProcedure

ProcedureDLL.l I3D_AddComboBoxItem( comboBox.l, text.s)
ProcedureReturn __I3D_AddComboBoxItem( comboBox.l, text.s)
EndProcedure

ProcedureDLL.l I3D_SetSelectedListBoxItem( listBox.l, index.l)
ProcedureReturn __I3D_SetSelectedListBoxItem( listBox.l, index.l)
EndProcedure

ProcedureDLL.l I3D_GetSelectedListBoxItem( listBox.l)
ProcedureReturn __I3D_GetSelectedListBoxItem( listBox.l)
EndProcedure

ProcedureDLL.l I3D_SetSelectedComboBoxItem( comboBox.l, index.l)
ProcedureReturn __I3D_SetSelectedComboBoxItem( comboBox.l, index.l)
EndProcedure

ProcedureDLL.l I3D_GetSelectedComboBoxItem( comboBox.l)
ProcedureReturn __I3D_GetSelectedComboBoxItem( comboBox.l)
EndProcedure

ProcedureDLL.l I3D_ClearListBox( listBox.l)
ProcedureReturn __I3D_ClearListBox( listBox.l)
EndProcedure

ProcedureDLL.l I3D_ClearComboBox( comboBox.l)
ProcedureReturn __I3D_ClearComboBox( comboBox.l)
EndProcedure

ProcedureDLL.l I3D_IsCheckBoxChecked( checkBox.l)
ProcedureReturn __I3D_IsCheckBoxChecked( checkBox.l)
EndProcedure

ProcedureDLL.l I3D_SetCheckBoxState( checkBox.l, checked.l)
ProcedureReturn __I3D_SetCheckBoxState( checkBox.l, checked.l)
EndProcedure

ProcedureDLL.l I3D_SetControlOwnSkin( guiElement.l, skin.l)
ProcedureReturn __I3D_SetControlOwnSkin( guiElement.l, skin.l)
EndProcedure

ProcedureDLL.l I3D_SetTextControlColors( guiElement.l, color.l, bkColor.l)
ProcedureReturn __I3D_SetTextControlColors( guiElement.l, color.l, bkColor.l)
EndProcedure

ProcedureDLL.l I3D_SetControlText( guiElement.l, text.s)
ProcedureReturn __I3D_SetControlText( guiElement.l, text.s)
EndProcedure

ProcedureDLL.l I3D_SetControlToolTipText( guiElement.l, text.s)
ProcedureReturn __I3D_SetControlToolTipText( guiElement.l, text.s)
EndProcedure

ProcedureDLL.l I3D_EnableControl( guiElement.l, enabled.l)
ProcedureReturn __I3D_EnableControl( guiElement.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_GetControlX( guiElement.l)
ProcedureReturn __I3D_GetControlX( guiElement.l)
EndProcedure

ProcedureDLL.l I3D_GetControlY( guiElement.l)
ProcedureReturn __I3D_GetControlY( guiElement.l)
EndProcedure

ProcedureDLL.l I3D_GetControlWidth( guiElement.l)
ProcedureReturn __I3D_GetControlWidth( guiElement.l)
EndProcedure

ProcedureDLL.l I3D_GetControlHeight( guiElement.l)
ProcedureReturn __I3D_GetControlHeight( guiElement.l)
EndProcedure

ProcedureDLL.s I3D_GetControlText( guiElement.l)
ProcedureReturn PeekS(__I3D_GetControlText( guiElement.l),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.l I3D_FreeControl( guiElement.l)
ProcedureReturn __I3D_FreeControl( guiElement.l)
EndProcedure

ProcedureDLL.l I3D_FreeAllControls()
ProcedureReturn __I3D_FreeAllControls()
EndProcedure

ProcedureDLL.l I3D_GetRootControl()
ProcedureReturn __I3D_GetRootControl()
EndProcedure

ProcedureDLL.l I3D_GetControlFromPos( x.l, y.l)
ProcedureReturn __I3D_GetControlFromPos( x.l, y.l)
EndProcedure

ProcedureDLL.l I3D_EventControl()
ProcedureReturn __I3D_EventControl()
EndProcedure

ProcedureDLL.l I3D_MsgBox( caption.s, text.s, style.l)
ProcedureReturn __I3D_MsgBox( caption.s, text.s, style.l)
EndProcedure

ProcedureDLL.s I3D_InputBox( title.s, text.s, inputText.s)
ProcedureReturn PeekS(__I3D_InputBox( title.s, text.s, inputText.s),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.s I3D_SelectFileBox( title.s, ext.s)
ProcedureReturn ReplaceString(PeekS(__I3D_SelectFileBox( title.s, ext.s),-1,#PB_Unicode),"/","\")
EndProcedure

ProcedureDLL.l I3D_LoadGUIFont( file.s)
ProcedureReturn __I3D_LoadGUIFont( file.s)
EndProcedure

ProcedureDLL.l I3D_GetGUIFontTextHeight( guifont.l, text.s)
ProcedureReturn __I3D_GetGUIFontTextHeight( guifont.l, text.s)
EndProcedure

ProcedureDLL.l I3D_GetGUIFontTextWidth( guifont.l, text.s)
ProcedureReturn __I3D_GetGUIFontTextWidth( guifont.l, text.s)
EndProcedure

ProcedureDLL.l I3D_SetSkinFont( skin.l, guifont.l)
ProcedureReturn __I3D_SetSkinFont( skin.l, guifont.l)
EndProcedure

ProcedureDLL.l I3D_SetSkinFontEx( skin.l, guifont.l, fonttype.l)
ProcedureReturn __I3D_SetSkinFontEx( skin.l, guifont.l, fonttype.l)
EndProcedure

ProcedureDLL.l I3D_FreeSkin( skin.l)
ProcedureReturn __I3D_FreeSkin( skin.l)
EndProcedure

ProcedureDLL.l I3D_CreateSkin( model.l)
ProcedureReturn __I3D_CreateSkin( model.l)
EndProcedure

ProcedureDLL.l I3D_SetSkin( skin.l)
ProcedureReturn __I3D_SetSkin( skin.l)
EndProcedure

ProcedureDLL.l I3D_GetSkin()
ProcedureReturn __I3D_GetSkin()
EndProcedure

ProcedureDLL.l I3D_GetFocusControl()
ProcedureReturn __I3D_GetFocusControl()
EndProcedure

ProcedureDLL.l I3D_SetFocusControl( control.l)
ProcedureReturn __I3D_SetFocusControl( control.l)
EndProcedure

ProcedureDLL.l I3D_SetControlPosition( control.l, x.l, y.l)
ProcedureReturn __I3D_SetControlPosition( control.l, x.l, y.l)
EndProcedure

ProcedureDLL.l I3D_SetControlSize( control.l, width.l, height.l)
ProcedureReturn __I3D_SetControlSize( control.l, width.l, height.l)
EndProcedure

ProcedureDLL.l I3D_SetMaxControlSize( control.l, width.l, height.l)
ProcedureReturn __I3D_SetMaxControlSize( control.l, width.l, height.l)
EndProcedure

ProcedureDLL.l I3D_SetMinControlSize( control.l, width.l, height.l)
ProcedureReturn __I3D_SetMinControlSize( control.l, width.l, height.l)
EndProcedure

ProcedureDLL.l I3D_DrawControl( control.l)
ProcedureReturn __I3D_DrawControl( control.l)
EndProcedure

ProcedureDLL.l I3D_SetSkinAlpha( skin.l, alpha.l)
ProcedureReturn __I3D_SetSkinAlpha( skin.l, alpha.l)
EndProcedure

ProcedureDLL.l I3D_SetSkinColor( skin.l, typ.l, color.l)
ProcedureReturn __I3D_SetSkinColor( skin.l, typ.l, color.l)
EndProcedure

ProcedureDLL.l I3D_SetSkinText( skin.l, typ.l, text.s)
ProcedureReturn __I3D_SetSkinText( skin.l, typ.l, text.s)
EndProcedure

ProcedureDLL.l I3D_SetSkinSize( skin.l, typ.l, size.l)
ProcedureReturn __I3D_SetSkinSize( skin.l, typ.l, size.l)
EndProcedure

ProcedureDLL.l I3D_CreateGUIFader( parent.l)
ProcedureReturn __I3D_CreateGUIFader( parent.l)
EndProcedure

ProcedureDLL.l I3D_SetGUIFaderColor( guiFader.l, color.l)
ProcedureReturn __I3D_SetGUIFaderColor( guiFader.l, color.l)
EndProcedure

ProcedureDLL.l I3D_FadeGUIOut( guiFader.l, time.l)
ProcedureReturn __I3D_FadeGUIOut( guiFader.l, time.l)
EndProcedure

ProcedureDLL.l I3D_FadeGUIIn( guiFader.l, time.l)
ProcedureReturn __I3D_FadeGUIIn( guiFader.l, time.l)
EndProcedure

ProcedureDLL.l I3D_IsGUIFaderReady( guiFader.l)
ProcedureReturn __I3D_IsGUIFaderReady( guiFader.l)
EndProcedure

ProcedureDLL.l I3D_FreeGUIFader( guiFader.l)
ProcedureReturn __I3D_FreeGUIFader( guiFader.l)
EndProcedure

ProcedureDLL.l I3D_ProgressBarControl( x.l, y.l, width.l, height.l, parent.l)
ProcedureReturn __I3D_ProgressBarControl( x.l, y.l, width.l, height.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_SetProgressBarColor( control.l, frontcolor.l)
ProcedureReturn __I3D_SetProgressBarColor( control.l, frontcolor.l)
EndProcedure

ProcedureDLL.l I3D_SetBarControlMaximum( control.l, maximum.l)
ProcedureReturn __I3D_SetBarControlMaximum( control.l, maximum.l)
EndProcedure

ProcedureDLL.l I3D_SetBarControlPosition( control.l, position.l)
ProcedureReturn __I3D_SetBarControlPosition( control.l, position.l)
EndProcedure

ProcedureDLL.l I3D_GetBarControlPosition( control.l)
ProcedureReturn __I3D_GetBarControlPosition( control.l)
EndProcedure

ProcedureDLL.l I3D_TrackBarControl( x.l, y.l, width.l, height.l, parent.l)
ProcedureReturn __I3D_TrackBarControl( x.l, y.l, width.l, height.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_SpinControl( x.l, y.l, width.l, height.l, parent.l)
ProcedureReturn __I3D_SpinControl( x.l, y.l, width.l, height.l, parent.l)
EndProcedure

ProcedureDLL.l I3D_SetSpinControlValue( control.l, value.f)
ProcedureReturn __I3D_SetSpinControlValue( control.l, value.f)
EndProcedure

ProcedureDLL.f I3D_GetSpinControlValue( control.l)
ProcedureReturn __I3D_GetSpinControlValue( control.l)
EndProcedure

ProcedureDLL.l I3D_SetSpinControlRange( control.l, min.f, max.f)
ProcedureReturn __I3D_SetSpinControlRange( control.l, min.f, max.f)
EndProcedure

ProcedureDLL.l I3D_SetSpinControlStep( control.l, Stepf.f)
ProcedureReturn __I3D_SetSpinControlStep( control.l, Stepf.f)
EndProcedure

ProcedureDLL.l I3D_SetSpinControlDecimalPlaces( control.l, decimalplaces.l)
ProcedureReturn __I3D_SetSpinControlDecimalPlaces( control.l, decimalplaces.l)
EndProcedure

ProcedureDLL.l I3D_CreateTexturedSkin()
ProcedureReturn __I3D_CreateTexturedSkin()
EndProcedure

ProcedureDLL.l I3D_SetTexturedSkinTexture( skin.l, type.l, tex.l)
ProcedureReturn __I3D_SetTexturedSkinTexture( skin.l, type.l, tex.l)
EndProcedure

ProcedureDLL.l I3D_SetTexturedSkinFrameSize( skin.l, size.l)
ProcedureReturn __I3D_SetTexturedSkinFrameSize( skin.l, size.l)
EndProcedure

ProcedureDLL.l I3D_CreatePointLight( x.f, y.f, z.f, radius.f, color.l)
ProcedureReturn __I3D_CreatePointLight( x.f, y.f, z.f, radius.f, color.l)
EndProcedure

ProcedureDLL.l I3D_CreateSpotLight( x.f, y.f, z.f, radius.f, color.l)
ProcedureReturn __I3D_CreateSpotLight( x.f, y.f, z.f, radius.f, color.l)
EndProcedure

ProcedureDLL.l I3D_CreateDirectionalLight( dirx.f, diry.f, dirz.f, color.l)
ProcedureReturn __I3D_CreateDirectionalLight( dirx.f, diry.f, dirz.f, color.l)
EndProcedure

ProcedureDLL.l I3D_SetLightAmbientColor( light.l, color.l)
ProcedureReturn __I3D_SetLightAmbientColor( light.l, color.l)
EndProcedure

ProcedureDLL.l I3D_SetLightDiffuseColor( light.l, color.l)
ProcedureReturn __I3D_SetLightDiffuseColor( light.l, color.l)
EndProcedure

ProcedureDLL.l I3D_SetLightSpecularColor( light.l, color.l)
ProcedureReturn __I3D_SetLightSpecularColor( light.l, color.l)
EndProcedure

ProcedureDLL.f I3D_SetLightRadius( light.l, radius.f)
ProcedureReturn __I3D_SetLightRadius( light.l, radius.f)
EndProcedure

ProcedureDLL.f I3D_SetLightInnerCone( light.l, radius.f)
ProcedureReturn __I3D_SetLightInnerCone( light.l, radius.f)
EndProcedure

ProcedureDLL.f I3D_SetLightOuterCone( light.l, radius.f)
ProcedureReturn __I3D_SetLightOuterCone( light.l, radius.f)
EndProcedure

ProcedureDLL.f I3D_SetLightFalloff( light.l, newFalloff.f)
ProcedureReturn __I3D_SetLightFalloff( light.l, newFalloff.f)
EndProcedure

ProcedureDLL.l I3D_CreateVolumeLight( x.f, y.f, z.f)
ProcedureReturn __I3D_CreateVolumeLight( x.f, y.f, z.f)
EndProcedure

ProcedureDLL.l I3D_SetVolumeLightQuality( volumeLight.l, quality.l)
ProcedureReturn __I3D_SetVolumeLightQuality( volumeLight.l, quality.l)
EndProcedure

ProcedureDLL.l I3D_SetVolumeLightTailColor( volumeLight.l, color.l)
ProcedureReturn __I3D_SetVolumeLightTailColor( volumeLight.l, color.l)
EndProcedure

ProcedureDLL.l I3D_SetVolumeLightFootColor( volumeLight.l, color.l)
ProcedureReturn __I3D_SetVolumeLightFootColor( volumeLight.l, color.l)
EndProcedure

ProcedureDLL.l I3D_CreateContextEx( windowID.l, width.l, height.l, flags.l, title.s)
ProcedureReturn __I3D_CreateContextEx( windowID.l, width.l, height.l, flags.l, title.s)
EndProcedure

ProcedureDLL.l I3D_CreateContext( width.l, height.l, flags.l, title.s)
ProcedureReturn __I3D_CreateContext( width.l, height.l, flags.l, title.s)
EndProcedure

ProcedureDLL.l I3D_GetUserData( obj.l)
ProcedureReturn __I3D_GetUserData( obj.l)
EndProcedure

ProcedureDLL.l I3D_SetUserData( obj.l, userData.l)
ProcedureReturn __I3D_SetUserData( obj.l, userData.l)
EndProcedure

ProcedureDLL.l I3D_GetObjectRefCount( obj.l)
ProcedureReturn __I3D_GetObjectRefCount( obj.l)
EndProcedure

ProcedureDLL.l I3D_ReleaseObject( obj.l)
ProcedureReturn __I3D_ReleaseObject( obj.l)
EndProcedure

ProcedureDLL.l I3D_FlushBatches()
ProcedureReturn __I3D_FlushBatches()
EndProcedure

ProcedureDLL.l I3D_GetD3DDevice9()
ProcedureReturn __I3D_GetD3DDevice9()
EndProcedure

ProcedureDLL.l I3D_SetPresentParameters( windowId.l, x.l, y.l, width.l, height.l)
ProcedureReturn __I3D_SetPresentParameters( windowId.l, x.l, y.l, width.l, height.l)
EndProcedure

ProcedureDLL.l I3D_BeginSceneEx( clearBackBuffer.l, clearZBuffer.l, Color.l)
ProcedureReturn __I3D_BeginSceneEx( clearBackBuffer.l, clearZBuffer.l, Color.l)
EndProcedure

ProcedureDLL.l I3D_BeginScene( Color.l)
ProcedureReturn __I3D_BeginScene( Color.l)
EndProcedure

ProcedureDLL.l I3D_WindowEvent()
ProcedureReturn __I3D_WindowEvent()
EndProcedure

ProcedureDLL.l I3D_EventData()
ProcedureReturn __I3D_EventData()
EndProcedure

ProcedureDLL.l I3D_RenderScene()
ProcedureReturn __I3D_RenderScene()
EndProcedure

ProcedureDLL.l I3D_DrawGUI()
ProcedureReturn __I3D_DrawGUI()
EndProcedure

ProcedureDLL.l I3D_IsScreenActive()
ProcedureReturn __I3D_IsScreenActive()
EndProcedure

ProcedureDLL.l I3D_SetFrameLimit( limit.l)
ProcedureReturn __I3D_SetFrameLimit( limit.l)
EndProcedure

ProcedureDLL.l I3D_EndScene()
ProcedureReturn __I3D_EndScene()
EndProcedure

ProcedureDLL.l I3D_ScreenWidth()
ProcedureReturn __I3D_ScreenWidth()
EndProcedure

ProcedureDLL.l I3D_ScreenHeight()
ProcedureReturn __I3D_ScreenHeight()
EndProcedure

ProcedureDLL.l I3D_SetScreenTitle( caption.s)
ProcedureReturn __I3D_SetScreenTitle( caption.s)
EndProcedure

ProcedureDLL.l I3D_GetFPS()
ProcedureReturn __I3D_GetFPS()
EndProcedure

ProcedureDLL.l I3D_LoadScene( file.s)
ProcedureReturn __I3D_LoadScene( file.s)
EndProcedure

ProcedureDLL.l I3D_SaveScene( file.s)
ProcedureReturn __I3D_SaveScene( file.s)
EndProcedure

ProcedureDLL.l I3D_AddZipArchive( file.s)
ProcedureReturn __I3D_AddZipArchive( file.s)
EndProcedure

ProcedureDLL.l I3D_SetViewPort( x.l, y.l, width.l, height.l)
ProcedureReturn __I3D_SetViewPort( x.l, y.l, width.l, height.l)
EndProcedure

ProcedureDLL.l I3D_IsFeaturePresent( queryfeature.l)
ProcedureReturn __I3D_IsFeaturePresent( queryfeature.l)
EndProcedure

ProcedureDLL.l I3D_GetHWND()
ProcedureReturn __I3D_GetHWND()
EndProcedure

ProcedureDLL.l I3D_GetPrimitiveCountDrawn()
ProcedureReturn __I3D_GetPrimitiveCountDrawn()
EndProcedure

ProcedureDLL.l I3D_SaveScreenShot( file.s)
ProcedureReturn __I3D_SaveScreenShot( file.s)
EndProcedure

ProcedureDLL.l I3D_IsKeyPressed( key.l)
ProcedureReturn __I3D_IsKeyPressed( key.l)
EndProcedure

ProcedureDLL.l I3D_GetTimer()
ProcedureReturn __I3D_GetTimer()
EndProcedure

ProcedureDLL.l I3D_GetMouseX()
ProcedureReturn __I3D_GetMouseX()
EndProcedure

ProcedureDLL.l I3D_GetMouseY()
ProcedureReturn __I3D_GetMouseY()
EndProcedure

ProcedureDLL.l I3D_GetRelativeMouseX()
ProcedureReturn __I3D_GetRelativeMouseX()
EndProcedure

ProcedureDLL.l I3D_GetRelativeMouseY()
ProcedureReturn __I3D_GetRelativeMouseY()
EndProcedure

ProcedureDLL.l I3D_WasDeviceLost()
ProcedureReturn __I3D_WasDeviceLost()
EndProcedure

ProcedureDLL.l I3D_FreeContext()
ProcedureReturn __I3D_FreeContext()
EndProcedure

ProcedureDLL.l I3D_ShowCursor( show.l)
ProcedureReturn __I3D_ShowCursor( show.l)
EndProcedure

ProcedureDLL.l I3D_IsCursorVisible()
ProcedureReturn __I3D_IsCursorVisible()
EndProcedure

ProcedureDLL.l I3D_SetCursorSprite( sprite.l)
ProcedureReturn __I3D_SetCursorSprite( sprite.l)
EndProcedure

ProcedureDLL.l I3D_ReadFileToMem( filename.s)
ProcedureReturn __I3D_ReadFileToMem( filename.s)
EndProcedure

ProcedureDLL.l I3D_GetMemFileSize( memArea.l)
ProcedureReturn __I3D_GetMemFileSize( memArea.l)
EndProcedure

ProcedureDLL.l I3D_FreeMemFile( memArea.l)
ProcedureReturn __I3D_FreeMemFile( memArea.l)
EndProcedure

ProcedureDLL.l I3D_GetProcessorMHz()
ProcedureReturn __I3D_GetProcessorMHz()
EndProcedure

ProcedureDLL.l I3D_SetRenderTargetEx( RTSprite.l, clearBackBuffer.l, clearZBuffer.l, color.l)
ProcedureReturn __I3D_SetRenderTargetEx( RTSprite.l, clearBackBuffer.l, clearZBuffer.l, color.l)
EndProcedure

ProcedureDLL.l I3D_SetRenderTarget( RTSprite.l, color.l)
ProcedureReturn __I3D_SetRenderTarget( RTSprite.l, color.l)
EndProcedure

ProcedureDLL.l I3D_ResetRenderTarget()
ProcedureReturn __I3D_ResetRenderTarget()
EndProcedure

ProcedureDLL.l I3D_ClearZBuffer()
ProcedureReturn __I3D_ClearZBuffer()
EndProcedure

ProcedureDLL.l I3D_SetLogCBFunction( logCBFunc.l)
ProcedureReturn __I3D_SetLogCBFunction( logCBFunc.l)
EndProcedure

ProcedureDLL.l I3D_Log( logText.s, loglevel.l)
ProcedureReturn __I3D_Log( logText.s, loglevel.l)
EndProcedure

ProcedureDLL.l I3D_GetScreenDC()
ProcedureReturn __I3D_GetScreenDC()
EndProcedure

ProcedureDLL.l I3D_ReleaseScreenDC()
ProcedureReturn __I3D_ReleaseScreenDC()
EndProcedure

ProcedureDLL.l I3D_LoadMesh( file.s, flag.l)
LastMesh=file
ProcedureReturn __I3D_LoadMesh( file.s, flag.l)
EndProcedure

ProcedureDLL.l I3D_CreateWaveMesh( file.s, waveHeight.f, waveSpeed.f, waveLength.f)
ProcedureReturn __I3D_CreateWaveMesh( file.s, waveHeight.f, waveSpeed.f, waveLength.f)
EndProcedure

ProcedureDLL.l I3D_CreateTerrainMesh( file.s, texFile.s, vertexBlockSize.l)
ProcedureReturn __I3D_CreateTerrainMesh( file.s, texFile.s, vertexBlockSize.l)
EndProcedure

ProcedureDLL.l I3D_AddAnimatedMeshShadow( mesh.l)
ProcedureReturn __I3D_AddAnimatedMeshShadow( mesh.l)
EndProcedure

ProcedureDLL.f I3D_GetAnimatedMeshEndFrame( mesh.l)
ProcedureReturn __I3D_GetAnimatedMeshEndFrame( mesh.l)
EndProcedure

ProcedureDLL.f I3D_GetAnimatedMeshStartFrame( mesh.l)
ProcedureReturn __I3D_GetAnimatedMeshStartFrame( mesh.l)
EndProcedure

ProcedureDLL.f I3D_GetAnimatedMeshFrameNr( mesh.l)
ProcedureReturn __I3D_GetAnimatedMeshFrameNr( mesh.l)
EndProcedure

ProcedureDLL.l I3D_SetAnimatedMeshCurrentFrame( mesh.l, framenumber.f)
ProcedureReturn __I3D_SetAnimatedMeshCurrentFrame( mesh.l, framenumber.f)
EndProcedure

ProcedureDLL.l I3D_SetAnimatedMeshSpeed( mesh.l, framesPerSecond.f)
ProcedureReturn __I3D_SetAnimatedMeshSpeed( mesh.l, framesPerSecond.f)
EndProcedure

ProcedureDLL.l I3D_SetAnimatedMeshFrameLoop( mesh.l, startframe.l, endframe.l)
ProcedureReturn __I3D_SetAnimatedMeshFrameLoop( mesh.l, startframe.l, endframe.l)
EndProcedure

ProcedureDLL.l I3D_SetAnimatedMeshLoopMode( mesh.l, enabled.l)
ProcedureReturn __I3D_SetAnimatedMeshLoopMode( mesh.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_SetAnimatedMeshMD2Anim( mesh.l, md2animation.l)
ProcedureReturn __I3D_SetAnimatedMeshMD2Anim( mesh.l, md2animation.l)
EndProcedure

ProcedureDLL.l I3D_SetAnimatedMeshMD2AnimStr( mesh.l, animationname.s)
ProcedureReturn __I3D_SetAnimatedMeshMD2AnimStr( mesh.l, animationname.s)
EndProcedure

ProcedureDLL.l I3D_GetAnimatedMeshJointNode( mesh.l, name.s)
ProcedureReturn __I3D_GetAnimatedMeshJointNode( mesh.l, name.s)
EndProcedure

ProcedureDLL.l I3D_CloneMesh( srcMesh.l)
ProcedureReturn __I3D_CloneMesh( srcMesh.l)
EndProcedure

ProcedureDLL.l I3D_CreateParticleSystem( x.f, y.f, z.f, tex.l)
ProcedureReturn __I3D_CreateParticleSystem( x.f, y.f, z.f, tex.l)
EndProcedure

ProcedureDLL.l I3D_CreateMeshParticleSystem( x.f, y.f, z.f, texture.l, animatedmesh.l, useNormalDirection.l, normalDirectionModifier.f)
ProcedureReturn __I3D_CreateMeshParticleSystem( x.f, y.f, z.f, texture.l, animatedmesh.l, useNormalDirection.l, normalDirectionModifier.f)
EndProcedure

ProcedureDLL.l I3D_SetParticleSystemParticleSize( particlesystem.l, width.f, height.f)
ProcedureReturn __I3D_SetParticleSystemParticleSize( particlesystem.l, width.f, height.f)
EndProcedure

ProcedureDLL.l I3D_SetParticleSystemDirection( particlesystem.l, dir_x.f, dir_y.f, dir_z.f)
ProcedureReturn __I3D_SetParticleSystemDirection( particlesystem.l, dir_x.f, dir_y.f, dir_z.f)
EndProcedure

ProcedureDLL.l I3D_SetParticleMaxAngleDegree( particlesystem.l, maxAngleDegrees.l)
ProcedureReturn __I3D_SetParticleMaxAngleDegree( particlesystem.l, maxAngleDegrees.l)
EndProcedure

ProcedureDLL.l I3D_SetParticleSystemBox( particlesystem.l, min_x.f, min_y.f, min_z.f, max_x.f, max_y.f, max_z.f)
ProcedureReturn __I3D_SetParticleSystemBox( particlesystem.l, min_x.f, min_y.f, min_z.f, max_x.f, max_y.f, max_z.f)
EndProcedure

ProcedureDLL.l I3D_SetParticleSystemLifeTime( particlesystem.l, minlifetime.l, maxlifetime.l)
ProcedureReturn __I3D_SetParticleSystemLifeTime( particlesystem.l, minlifetime.l, maxlifetime.l)
EndProcedure

ProcedureDLL.l I3D_SetParticleSystemEmission( particlesystem.l, min_particles.l, max_particles.l)
ProcedureReturn __I3D_SetParticleSystemEmission( particlesystem.l, min_particles.l, max_particles.l)
EndProcedure

ProcedureDLL.l I3D_SetParticleSystemColors( particlesystem.l, min_color.l, max_color.l)
ProcedureReturn __I3D_SetParticleSystemColors( particlesystem.l, min_color.l, max_color.l)
EndProcedure

ProcedureDLL.l I3D_AddParticleSystemAttractionPoint( particlesystem.l, posX.f, posY.f, posZ.f, speed.f, affectX.l, affectY.l, affectZ.l)
ProcedureReturn __I3D_AddParticleSystemAttractionPoint( particlesystem.l, posX.f, posY.f, posZ.f, speed.f, affectX.l, affectY.l, affectZ.l)
EndProcedure

ProcedureDLL.l I3D_AddParticleSystemRotation( particlesystem.l, posX.f, posY.f, posZ.f, speedX.f, speedY.f, speedZ.f)
ProcedureReturn __I3D_AddParticleSystemRotation( particlesystem.l, posX.f, posY.f, posZ.f, speedX.f, speedY.f, speedZ.f)
EndProcedure

ProcedureDLL.l I3D_AddParticleSystemGravity( particlesystem.l, gravityX.f, gravityY.f, gravityZ.f, timeForceLost.l)
ProcedureReturn __I3D_AddParticleSystemGravity( particlesystem.l, gravityX.f, gravityY.f, gravityZ.f, timeForceLost.l)
EndProcedure

ProcedureDLL.l I3D_AddParticleSystemFadeOut( particlesystem.l, targetColor.l, timeToFadeOut.l)
ProcedureReturn __I3D_AddParticleSystemFadeOut( particlesystem.l, targetColor.l, timeToFadeOut.l)
EndProcedure

ProcedureDLL.l I3D_RemoveAllParticleSystemAffectors( particlesystem.l)
ProcedureReturn __I3D_RemoveAllParticleSystemAffectors( particlesystem.l)
EndProcedure

ProcedureDLL.l I3D_EnableParticleSystemAffector( particleaffector.l, enabled.l)
ProcedureReturn __I3D_EnableParticleSystemAffector( particleaffector.l, enabled.l)
EndProcedure

ProcedureDLL.l I3D_StopParticleSystem( particlesystem.l, time.l)
ProcedureReturn __I3D_StopParticleSystem( particlesystem.l, time.l)
EndProcedure

ProcedureDLL.l I3D_PhysicsInit( multithreaded.l)
ProcedureReturn __I3D_PhysicsInit( multithreaded.l)
EndProcedure

ProcedureDLL.l I3D_ResetEntityPhysicForce( entity.l)
ProcedureReturn __I3D_ResetEntityPhysicForce( entity.l)
EndProcedure

ProcedureDLL.l I3D_SetEntityPhysicState( entity.l, activate.l)
ProcedureReturn __I3D_SetEntityPhysicState( entity.l, activate.l)
EndProcedure

ProcedureDLL.l I3D_ActivateEntityPhysic( entity.l, activate.l)
ProcedureReturn __I3D_ActivateEntityPhysic( entity.l, activate.l)
EndProcedure

ProcedureDLL.l I3D_ApplyEntityPhysicForce( entity.l, force_x.f, force_y.f, force_z.f, rel_x.f, rel_y.f, rel_z.f)
ProcedureReturn __I3D_ApplyEntityPhysicForce( entity.l, force_x.f, force_y.f, force_z.f, rel_x.f, rel_y.f, rel_z.f)
EndProcedure

ProcedureDLL.l I3D_ApplyEntityPhysicImpulse( entity.l, impulse_x.f, impulse_y.f, impulse_z.f, rel_x.f, rel_y.f, rel_z.f)
ProcedureReturn __I3D_ApplyEntityPhysicImpulse( entity.l, impulse_x.f, impulse_y.f, impulse_z.f, rel_x.f, rel_y.f, rel_z.f)
EndProcedure

ProcedureDLL.l I3D_PhysicsRun()
ProcedureReturn __I3D_PhysicsRun()
EndProcedure

ProcedureDLL.l I3D_AddEntityPhysicSphere__( radius.f, mass.f, px.f, py.f, pz.f)
ProcedureReturn __I3D_AddEntityPhysicSphere__( radius.f, mass.f, px.f, py.f, pz.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityPhysicSphere( entity.l, radius.f, mass.f, px.f, py.f, pz.f)
ProcedureReturn __I3D_AddEntityPhysicSphere( entity.l, radius.f, mass.f, px.f, py.f, pz.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityPhysicBox( entity.l, width.f, height.f, depth.f, mass.f, px.f, py.f, pz.f)
ProcedureReturn __I3D_AddEntityPhysicBox( entity.l, width.f, height.f, depth.f, mass.f, px.f, py.f, pz.f)
EndProcedure

ProcedureDLL.l I3D_AddEntityPhysicBox__( width.f, height.f, depth.f, mass.f, px.f, py.f, pz.f)
ProcedureReturn __I3D_AddEntityPhysicBox__( width.f, height.f, depth.f, mass.f, px.f, py.f, pz.f)
EndProcedure

ProcedureDLL.l I3D_SetFog( color.l, fogstart.f, fogend.f)
ProcedureReturn __I3D_SetFog( color.l, fogstart.f, fogend.f)
EndProcedure

ProcedureDLL.l I3D_SetFogEx( color.l, linear.l, fogstart.f, fogend.f, density.f, pixelFog.l, rangeFog.l)
ProcedureReturn __I3D_SetFogEx( color.l, linear.l, fogstart.f, fogend.f, density.f, pixelFog.l, rangeFog.l)
EndProcedure

ProcedureDLL.l I3D_SetShadowColor( color.l)
ProcedureReturn __I3D_SetShadowColor( color.l)
EndProcedure

ProcedureDLL.l I3D_CreateMaterialShaderFromFileCB( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l, autoSetConsts.l, CBFunc.l, userData.l)
ProcedureReturn __I3D_CreateMaterialShaderFromFileCB( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l, autoSetConsts.l, CBFunc.l, userData.l)
EndProcedure

ProcedureDLL.l I3D_CreateMaterialShaderCB( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l, autoSetConsts.l, CBFunc.l, userData.l)
ProcedureReturn __I3D_CreateMaterialShaderCB( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l, autoSetConsts.l, CBFunc.l, userData.l)
EndProcedure

ProcedureDLL.l I3D_CreateMaterialShaderFromFile( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l)
ProcedureReturn __I3D_CreateMaterialShaderFromFile( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l)
EndProcedure

ProcedureDLL.l I3D_CreateMaterialShader( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l)
ProcedureReturn __I3D_CreateMaterialShader( VSFile.s, VSModel.l, VSMainFunction.s, PSFile.s, PSModel.l, PSMainFunction.s, materialType.l)
EndProcedure

ProcedureDLL.l I3D_SetPixelShaderConstantArray( services.l, constName.s, floatdata.l, count.l)
ProcedureReturn __I3D_SetPixelShaderConstantArray( services.l, constName.s, floatdata.l, count.l)
EndProcedure

ProcedureDLL.l I3D_SetVertexShaderConstantArray( services.l, constName.s, floatdata.l, count.l)
ProcedureReturn __I3D_SetVertexShaderConstantArray( services.l, constName.s, floatdata.l, count.l)
EndProcedure

ProcedureDLL.l I3D_SetPixelShaderConstantF( services.l, constName.s, value.f)
ProcedureReturn __I3D_SetPixelShaderConstantF( services.l, constName.s, value.f)
EndProcedure

ProcedureDLL.l I3D_SetVertexShaderConstantF( services.l, constName.s, value.f)
ProcedureReturn __I3D_SetVertexShaderConstantF( services.l, constName.s, value.f)
EndProcedure

ProcedureDLL.l I3D_CreatePostProcessFromFile( PSFile.s, PSVersion.l, PSMainFunction.s, NumRTs.l)
ProcedureReturn __I3D_CreatePostProcessFromFile( PSFile.s, PSVersion.l, PSMainFunction.s, NumRTs.l)
EndProcedure

ProcedureDLL.l I3D_CreatePostProcess( PSString.s, PSVersion.l, PSMainFunction.s, NumRTs.l)
ProcedureReturn __I3D_CreatePostProcess( PSString.s, PSVersion.l, PSMainFunction.s, NumRTs.l)
EndProcedure

ProcedureDLL.l I3D_FreePostProcess( pEffect.l)
ProcedureReturn __I3D_FreePostProcess( pEffect.l)
EndProcedure

ProcedureDLL.l I3D_BeginPostProcess( pEffect.l, clearBackBuffer.l, clearZBuffer.l, backColor.l)
ProcedureReturn __I3D_BeginPostProcess( pEffect.l, clearBackBuffer.l, clearZBuffer.l, backColor.l)
EndProcedure

ProcedureDLL.l I3D_SetPostProcessTexture( pEffect.l, index.l, tex.l)
ProcedureReturn __I3D_SetPostProcessTexture( pEffect.l, index.l, tex.l)
EndProcedure

ProcedureDLL.l I3D_SetPostProcessConstF( pEffect.l, constName.s, value.f)
ProcedureReturn __I3D_SetPostProcessConstF( pEffect.l, constName.s, value.f)
EndProcedure

ProcedureDLL.l I3D_SetPostProcessConstArray( pEffect.l, constName.s, floatArray.l, count.l)
ProcedureReturn __I3D_SetPostProcessConstArray( pEffect.l, constName.s, floatArray.l, count.l)
EndProcedure

ProcedureDLL.l I3D_EndPostProcess( pEffect.l)
ProcedureReturn __I3D_EndPostProcess( pEffect.l)
EndProcedure

ProcedureDLL.l I3D_GetPostProcessRTSprite( pEffect.l, index.l)
ProcedureReturn __I3D_GetPostProcessRTSprite( pEffect.l, index.l)
EndProcedure

ProcedureDLL.l I3D_GetTextureWidth( tex.l)
ProcedureReturn __I3D_GetTextureWidth( tex.l)
EndProcedure

ProcedureDLL.l I3D_GetTextureHeight( tex.l)
ProcedureReturn __I3D_GetTextureHeight( tex.l)
EndProcedure

ProcedureDLL.l I3D_GetOrgTextureWidth( tex.l)
ProcedureReturn __I3D_GetOrgTextureWidth( tex.l)
EndProcedure

ProcedureDLL.l I3D_GetOrgTextureHeight( tex.l)
ProcedureReturn __I3D_GetOrgTextureHeight( tex.l)
EndProcedure

ProcedureDLL.l I3D_GetTextureFormat( tex.l)
ProcedureReturn __I3D_GetTextureFormat( tex.l)
EndProcedure

ProcedureDLL.l I3D_LoadTexture( file.s, flags.l)
ProcedureReturn __I3D_LoadTexture( file.s, flags.l)
EndProcedure

ProcedureDLL.l I3D_LoadNormalMap( file.s, amplitude.f)
ProcedureReturn __I3D_LoadNormalMap( file.s, amplitude.f)
EndProcedure

ProcedureDLL.l I3D_MakeNormalMapTexture( texture.l, amplitude.f)
ProcedureReturn __I3D_MakeNormalMapTexture( texture.l, amplitude.f)
EndProcedure

ProcedureDLL.l I3D_MakeTextureTransparent( tex.l, color.l)
ProcedureReturn __I3D_MakeTextureTransparent( tex.l, color.l)
EndProcedure

ProcedureDLL.l I3D_FreeTexture( tex.l)
ProcedureReturn __I3D_FreeTexture( tex.l)
EndProcedure

ProcedureDLL.l I3D_CompressTexture( tex.l, mode.l)
ProcedureReturn __I3D_CompressTexture( tex.l, mode.l)
EndProcedure

ProcedureDLL.l I3D_LoadXMLFromFile( file.s)
ProcedureReturn __I3D_LoadXMLFromFile( file.s)
EndProcedure

ProcedureDLL.l I3D_FileExists( file.s)
ProcedureReturn __I3D_FileExists( file.s)
EndProcedure

ProcedureDLL.l I3D_ReadXML( xml.l)
ProcedureReturn __I3D_ReadXML( xml.l)
EndProcedure

ProcedureDLL.s I3D_GetXMLNodeData( xml.l)
ProcedureReturn PeekS(__I3D_GetXMLNodeData( xml.l),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.l I3D_GetXMLAttribCount( xml.l)
ProcedureReturn __I3D_GetXMLAttribCount( xml.l)
EndProcedure

ProcedureDLL.s I3D_GetXMLAttribName( xml.l, index.l)
ProcedureReturn PeekS(__I3D_GetXMLAttribName( xml.l, index.l),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.s I3D_GetXMLAttribValue( xml.l, index.l)
ProcedureReturn PeekS(__I3D_GetXMLAttribValue( xml.l, index.l),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.s I3D_GetXMLAttribValueFromName( xml.l, name.s)
ProcedureReturn PeekS(__I3D_GetXMLAttribValueFromName( xml.l, name.s),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.s I3D_GetXMLNodeName( xml.l)
ProcedureReturn PeekS(__I3D_GetXMLNodeName( xml.l),-1,#PB_Unicode)
EndProcedure

ProcedureDLL.l I3D_FreeXML( xml.l)
ProcedureReturn __I3D_FreeXML( xml.l)
EndProcedure



ProcedureDLL.l I3D_RGBA(r.l,g.l,b.l,a.l)
ProcedureReturn b + g<<8 + r<<16 + a<<24
EndProcedure


; IDE Options = PureBasic 4.50 (Windows - x86)
; CursorPosition = 2908
; FirstLine = 2868
; Folding = --------------------------------------------------------------
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0
; EnableExeConstant