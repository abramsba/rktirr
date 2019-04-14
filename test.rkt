#lang racket

(require 
  "device.rkt"
  "scene.rkt"
  "video.rkt"
  "structures.rkt"
  "gui.rkt"
  "physics.rkt"
  "loop.rkt")

(define (test)
  (let*
    ([res (vec2 900 600)]
     [device (new-device #:size res)]
     [video (get-video-driver device)]
     [scene (get-scene-manager device)]
     [camera (add-camera scene
                         #:position (vec3 3 3 3)
                         #:target (vec3 0 0 0))]
     [bt-config (new-collision-configuration)]
     [bt-phase (new-axis-sweep (vec3 -1000 -1000 -1000) (vec3 1000 1000 1000))]
     [bt-dispatch (new-collision-dispatcher bt-config)]
     [bt-solver (new-sequential-constraint-solver)]
     [bt-world (new-dynamics-world bt-dispatch bt-phase bt-solver bt-config)]
     [irr-cube1 (add-cube scene)]
     [irr-cube2 (add-cube scene #:position (vec3 0 -3 0))]
     [irr-cube3 (add-cube scene #:position (vec3 0.5 2 0.5))]
     [irr-cube4 (add-cube scene #:position (vec3 -0.5 2 -0.5))]
     [tex (get-texture video (format "~aimages/crate.jpg" (current-directory)))]
     [bt-cube1 (cube->rigid-body irr-cube1 10.0)]
     [bt-cube2 (cube->rigid-body irr-cube2)]
     [bt-cube3 (cube->rigid-body irr-cube3 10.0)]
     [bt-cube4 (cube->rigid-body irr-cube4 10.0)]
     [irr-cubes (list irr-cube1 irr-cube2 irr-cube3 irr-cube4)]
     [rigid-bodies (list bt-cube1 bt-cube2 bt-cube3 bt-cube4)]
     [bg-color (color 50 50 50)]
     [running? (lambda () (device-running? device))]
     [game-loop (lambda (update delta)
                  (set-window-caption device (format "FPS: ~a, Delta: ~a, Update: ~a" (get-fps video) delta update))
                  (step-simulation bt-world (exact-round delta))
                  (for ([b rigid-bodies]) (update-rigid-body b))
                  (begin-scene video #t #t bg-color)
                  (draw-scene scene)
                  (end-scene video))])
    (for ([b rigid-bodies]) (add-rigid-body bt-world b))
    (for ([c irr-cubes]) 
         (set-material-texture c 0 tex)
         (set-material-flag c 'Bilinear_Filter #f)
         (set-material-flag c 'Lighting #f))
    (loop game-loop running? 60)))

(module+ main (test))
