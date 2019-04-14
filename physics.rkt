#lang racket

(require 
  ffi/unsafe
  "library.rkt"
  "pointers.rkt"
  "structures.rkt")

(define _newCollisionConfiguration
  (get-ffi-obj "newCollisionConfiguration" libirr
               (_fun -> _btDefaultCollisionConfiguration)))
(define (new-collision-configuration)
  (_newCollisionConfiguration))

(define _newAxisSweep
  (get-ffi-obj "newAxisSweep" libirr
               (_fun _Vec3 _Vec3 -> _btBroadphaseInterface)))
(define (new-axis-sweep vmin vmax)
  (_newAxisSweep vmin vmax))

(define _newCollisionDispatcher
  (get-ffi-obj "newCollisionDispatcher" libirr
               (_fun _btDefaultCollisionConfiguration -> _btCollisionDispatcher)))
(define (new-collision-dispatcher config)
  (_newCollisionDispatcher config))

(define _newSequentialConstraintSolver
  (get-ffi-obj "newSequentialConstraintSolver" libirr
               (_fun -> _btSequentialImpulseConstraintSolver)))
(define (new-sequential-constraint-solver)
  (_newSequentialConstraintSolver))

(define _newDynamicsWorld
  (get-ffi-obj "newDynamicsWorld" libirr
               (_fun _btCollisionDispatcher _btBroadphaseInterface _btSequentialImpulseConstraintSolver _btDefaultCollisionConfiguration -> _btDiscreteDynamicsWorld)))
(define (new-dynamics-world dispatcher broadphase solver config)
  (_newDynamicsWorld dispatcher broadphase solver config))

(define _stepSimulation
  (get-ffi-obj "stepSimulation" libirr
               (_fun _btDiscreteDynamicsWorld _float -> _void)))
(define (step-simulation world delta)
  (_stepSimulation world delta))

(define _addRigidBody
  (get-ffi-obj "addRigidBody" libirr
               (_fun _btDiscreteDynamicsWorld _btRigidBody -> _void)))
(define (add-rigid-body world body)
  (_addRigidBody world body))

(define _meshToRigidBody
  (get-ffi-obj "meshToRigidBody" libirr
               (_fun _ISceneNode -> _btRigidBody)))
(define (mesh->rigid-body node)
  (_meshToRigidBody node))

(define _cubeToRigidBody
  (get-ffi-obj "cubeToRigidBody" libirr
               (_fun _ISceneNode _float -> _btRigidBody)))
(define (cube->rigid-body node [mass 0.0])
  (_cubeToRigidBody node mass))

(define _updateRigidBody
  (get-ffi-obj "updateRigidBody" libirr
               (_fun _btRigidBody -> _void)))
(define (update-rigid-body body)
  (_updateRigidBody body))

(provide
  new-collision-configuration
  new-axis-sweep
  new-collision-dispatcher
  new-sequential-constraint-solver
  new-dynamics-world
  step-simulation
  add-rigid-body
  mesh->rigid-body
  cube->rigid-body
  update-rigid-body)
