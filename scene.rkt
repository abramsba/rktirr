#lang racket

(require
  ffi/unsafe
  "library.rkt"
  "structures.rkt"
  "pointers.rkt"
  "enums.rkt")

(define _getSceneManager (get-ffi-obj "getSceneManager" libirr
               (_fun _IrrlichtDevice -> _ISceneManager)))
(define (get-scene-manager device)
  (_getSceneManager device))

(define _drawScene
  (get-ffi-obj "drawScene" libirr
               (_fun _ISceneManager -> _void)))
(define (draw-scene manager)
  (_drawScene manager))

(define _getMesh
  (get-ffi-obj "getMesh" libirr
               (_fun _ISceneManager _string -> _IMesh)))
(define (get-mesh manager filepath)
  (_getMesh manager filepath))

(define _getAnimatedMesh
  (get-ffi-obj "getAnimatedMesh" libirr
               (_fun _ISceneManager _string -> _IAnimatedMesh)))
(define (get-animated-mesh manager filepath)
  (_getAnimatedMesh manager filepath))

(define _addMesh
  (get-ffi-obj "getMesh" libirr
               (_fun _ISceneManager _IMesh -> _ISceneNode)))
(define (add-mesh manager mesh)
  (_addMesh manager mesh))

(define _addAnimatedMesh
  (get-ffi-obj "addAnimatedMesh" libirr
               (_fun _ISceneManager _IAnimatedMesh -> _ISceneNode)))
(define (add-animated-mesh manager mesh)
  (_addAnimatedMesh manager mesh))

(define _addNull
  (get-ffi-obj "addNull" libirr
               (_fun _ISceneManager -> _ISceneNode)))
(define (add-null manager)
  (_addNull manager))

(define _addBillboard
  (get-ffi-obj "addBillboard" libirr
               (_fun _ISceneManager _Vec2 _Vec3 -> _ISceneNode)))
(define (add-billboard manager 
                       #:size [size (vec2 10 10)] 
                       #:position [position (vec3 0 0 0)])
  (_addBillboard manager size position))

(define _addBillboardText
  (get-ffi-obj "addBillboardText" libirr
               (_fun _ISceneManager _IGUIFont _string _Vec2 _Vec3 -> _ISceneNode)))
(define (add-billboard-text manager font text
                            #:size [size (vec2 10 10)]
                            #:position [position (vec3 0 0 0)])
  (_addBillboardText manager font text size position))

(define _addLight
  (get-ffi-obj "addLight" libirr
               (_fun _ISceneManager _Vec3 _Color _float -> _ISceneNode)))
(define (add-light manager
                   #:radius [radius 100]
                   #:color [clr (color 255 255 255)]
                   #:position [position (vec3 0 0 0)])
  (_addLight manager position clr radius))

(define _addCube
  (get-ffi-obj "addCube" libirr
               (_fun _ISceneManager _float _Vec3 _Vec3 _Vec3 -> _ISceneNode)))
(define (add-cube manager 
                  #:size [size 1.0] 
                  #:position [position (vec3 0 0 0)]
                  #:rotation [rotation (vec3 0 0 0)]
                  #:scale [scale (vec3 1 1 1)])
  (_addCube manager (exact->inexact size) position rotation scale))

(define _addOctree
  (get-ffi-obj "addOctree" libirr
               (_fun _ISceneManager _IAnimatedMesh -> _ISceneNode)))
(define (add-octree manager mesh)
  (_addOctree manager mesh))

(define _addCamera
  (get-ffi-obj "addCamera" libirr
               (_fun _ISceneManager _Vec3 _Vec3 _int -> _ISceneNode)))
(define (add-camera manager #:position [position (vec3 0 0 0)] #:target [target (vec3 0 0 0)] #:active? [active? #t])
  (_addCamera manager position target (if active? 1 0)))

(define _setTarget
  (get-ffi-obj "setTarget" libirr
               (_fun _ISceneNode _Vec3 -> _void)))
(define (set-target node target)
  (_setTarget node target)
  node)

(define _setPosition
  (get-ffi-obj "setPosition" libirr
               (_fun _ISceneNode _Vec3 -> _void)))
(define (set-position node position)
  (_setPosition node position)
  node)

(define _setRotation
  (get-ffi-obj "setRotation" libirr
               (_fun _ISceneNode _Vec3 -> _void)))
(define (set-rotation node rotation)
  (_setRotation node rotation)
  node)

(define _setScale
  (get-ffi-obj "setScale" libirr
               (_fun _ISceneNode _Vec3 -> _void)))
(define (set-scale node scale)
  (_setScale node scale)
  node)

(define _setMaterialFlag
  (get-ffi-obj "setMaterialFlag" libirr
               (_fun _ISceneNode material-flag _int -> _void)))
(define (set-material-flag node flag on?)
  (_setMaterialFlag node flag (if on? 1 0))
  node)

(define _setMaterialTexture
  (get-ffi-obj "setMaterialTexture" libirr
               (_fun _ISceneNode _int _ITexture -> _void)))
(define (set-material-texture node layer texture)
  (_setMaterialTexture node layer texture)
  node)

(define _createOctreeSelector
  (get-ffi-obj "createOctreeSelector" libirr
               (_fun _ISceneManager _IMesh _ISceneNode _int -> _ITriangleSelector)))
(define (create-octree-selector manager mesh node)
  (_createOctreeSelector manager mesh node))

(define _createMetaSelector
  (get-ffi-obj "createMetaSelector" libirr
               (_fun _ISceneManager -> _ITriangleSelector)))
(define (create-meta-selector manager)
  (_createMetaSelector manager))

(define _createStraightAnimator
  (get-ffi-obj "createStraightAnimator" libirr
               (_fun _ISceneManager _Vec3 _Vec3 _int _int _int -> _ISceneNodeAnimator)))
(define (create-straight-animator manager start end ms loop? pingpong?)
  (_createStraightAnimator manager start end ms (if loop? 1 0) (if pingpong? 1 0)))

(define _createCircleAnimator
  (get-ffi-obj "createCircleAnimator" libirr
               (_fun _ISceneManager _Vec3 _float _float _Vec3 _float _float -> _ISceneNodeAnimator)))
(define (create-circle-animator manager center radius speed direction start radiusEllipsoid)
  (_createCircleAnimator manager center radius speed direction start radiusEllipsoid))

(define _addAnimator
  (get-ffi-obj "addAnimator" libirr
               (_fun _ISceneNode _ISceneNodeAnimator -> _void)))
(define (add-animator node animator)
  (_addAnimator node animator))

(define _dropAnimator
  (get-ffi-obj "dropAnimator" libirr
               (_fun _ISceneNodeAnimator -> _void)))
(define (drop-animator animator)
  (_dropAnimator))

(define _getActiveCamera
  (get-ffi-obj "getActiveCamera" libirr
               (_fun _ISceneManager -> _ISceneNode)))
(define (get-active-camera manager)
  (_getActiveCamera manager))

(define _setActiveCamera
  (get-ffi-obj "setActiveCamera" libirr
               (_fun _ISceneManager _ISceneNode -> _void)))
(define (set-active-camera manager camera)
  (_setActiveCamera manager camera))

(define _setParent
  (get-ffi-obj "setParent" libirr
               (_fun _ISceneNode _ISceneNode -> _void)))
(define (set-parent node child)
  (_setParent node child))

(define _addChild
  (get-ffi-obj "addChild" libirr
               (_fun _ISceneNode _ISceneNode -> _void)))
(define (add-child node child)
  (_addChild node child))

(define _getParent
  (get-ffi-obj "getParent" libirr
               (_fun _ISceneNode -> _ISceneNode)))
(define (get-parent node)
  (_getParent node))

(define _getID
  (get-ffi-obj "getID" libirr
               (_fun _ISceneNode -> _int)))
(define (get-id node)
  (_getID node))

(define _setID
  (get-ffi-obj "setID" libirr
               (_fun _ISceneNode _int -> _void)))
(define (set-id node id)
  (_setID node id))

(provide
  get-scene-manager
  draw-scene
  get-mesh
  get-animated-mesh
  add-mesh
  add-animated-mesh
  add-null
  add-billboard
  add-billboard-text
  add-light
  add-cube
  add-octree
  add-camera
  set-target
  set-position
  set-rotation
  set-scale
  set-material-flag
  set-material-texture
  create-octree-selector
  create-meta-selector
  create-straight-animator
  create-circle-animator
  add-animator
  drop-animator
  get-active-camera
  set-active-camera
  set-parent
  add-child
  get-parent
  get-id
  set-id)

