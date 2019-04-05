#lang racket

(require ffi/unsafe)

(define material-flag
  (_enum
    '(Wireframe          = #x1
      Pointcloud         = #x2
      Gouraud_Shading    = #x4
      Lighting           = #x8
      Zbuffer            = #x10
      Zwrite_Enable      = #x20
      Back_Face_Culling  = #x40
      Front_Face_Culling = #x80
      Bilinear_Filter    = #x100
      Trilinear_Filter   = #x200
      Anisotropic_Filter = #x400
      Fog_Enable         = #x800
      Normalize_Normals  = #x1000
      Texture_Wrap       = #x2000
      Anti_Aliasing      = #x4000
      Color_Mask         = #x8000
      Color_Material     = #x10000
      Use_Mip_Maps       = #x20000
      Blend_Operation    = #x40000
      Polygon_Offset     = #x80000)))

(define material-type
  (_enum
    '(Solid = 0
      Solid_2_Layer
      Lightmap
      Lightmap_Add
      Lightmap_M2
      Lightmap_M4
      Lightmap_Lighting
      Lightmap_Lighting_M2
      Lightmap_Lighting_M4
      Detail_Map
      Sphere_Map
      Reflection_2_Layer
      Transparent_Add_Color
      Transparent_Alpha_Channel
      Transparent_Alpha_Channel_Ref
      Transparent_Vertex_Alpha
      Transparent_Reflection_2_Layer
      Normal_Map_Solid
      Normal_Map_Transparent_Add_Color
      Normal_Map_Transparent_Vertex_Alpha
      Parallax_Map_Solid
      Parallax_Map_Transparent_Add_Color
      Parallax_Map_Transparent_Vertex_Alpha
      Onetexture_Blender
      Force_32bit = #x7fffffff)))

(provide
  material-flag
  material-type)
