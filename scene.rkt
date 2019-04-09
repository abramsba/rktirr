#lang racket

(require
  ffi/unsafe
  "library.rkt"
  "structures.rkt"
  "pointers.rkt"
  "enums.rkt")

(define _getSceneManager
  (get-ffi-obj "getSceneManager" libirr
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
               (_fun _ISceneManager -> _ISceneNode)))
(define (add-billboard manager)
  (_addBillboard manager))

(define _addLight
  (get-ffi-obj "addLight" libirr
               (_fun _ISceneManager -> _ISceneNode)))
(define (add-light manager)
  (_addLight manager))

(define _addCube
  (get-ffi-obj "addCube" libirr
               (_fun _ISceneManager -> _ISceneNode)))
(define (add-cube manager)
  (_addCube manager))

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
               (_fun _ISceneManager _IMesh _ISceneNode -> _ITriangleSelector)))
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

(provide
  get-scene-manager
  draw-scene
  get-mesh
  get-animated-mesh
  add-mesh
  add-animated-mesh
  add-null
  add-billboard
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
  get-parent)





