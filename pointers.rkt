#lang racket

(require ffi/unsafe)

(define _IrrlichtDevice (_cpointer 'IrrlichtDevice))
(define _ITimer (_cpointer 'ITimer))
(define _keyboardEvent (_fun _int _int _int _int _int -> _void))
(define _mouseEvent (_fun _int _int _float _int _int _int _int _int -> _void))

(define _IVideoDriver (_cpointer 'IVideoDriver))
(define _ITexture (_cpointer 'ITexture))

(define _ISceneManager (_cpointer 'ISceneManager))
(define _ISceneNode (_cpointer 'ISceneNode))
(define _IMesh (_cpointer 'IMesh))
(define _IAnimatedMesh (_cpointer 'IAnimatedMesh))
(define _ITriangleSelector (_cpointer 'ITriangleSelector))
(define _ISceneNodeAnimator (_cpointer 'ISceneNodeAnimator))

(define _IGUIEnvironment (_cpointer 'IGUIEnvironment))
(define _IGUIFont (_cpointer 'IGUIFont))

(define _btDefaultCollisionConfiguration (_cpointer 'btDefaultCollisionConfiguration))
(define _btBroadphaseInterface (_cpointer 'btBroadphaseInterface))
(define _btCollisionDispatcher (_cpointer 'btCollisionDispatcher))
(define _btSequentialImpulseConstraintSolver (_cpointer 'btSequentialImpulseConstraintSolver))
(define _btDiscreteDynamicsWorld (_cpointer 'btDiscreteDynamicsWorld))
(define _btRigidBody (_cpointer 'btRigidBody))

(provide
  _IrrlichtDevice
  _ITimer
  _keyboardEvent
  _mouseEvent

  _IVideoDriver
  _ITexture

  _ISceneManager
  _ISceneNode
  _IMesh
  _IAnimatedMesh
  _ITriangleSelector
  _ISceneNodeAnimator

  _IGUIEnvironment
  _IGUIFont
  
  _btDefaultCollisionConfiguration
  _btBroadphaseInterface
  _btCollisionDispatcher
  _btSequentialImpulseConstraintSolver
  _btDiscreteDynamicsWorld
  _btRigidBody)
