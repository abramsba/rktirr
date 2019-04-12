#lang racket

(require 
  "device.rkt"
  "scene.rkt"
  "video.rkt"
  "structures.rkt"
  "gui.rkt"
  "physics.rkt")

(define (test)
  (let*
    ([resolution (vec2 900 600)]
     [device (new-device 
               #:size resolution 
               #:vsync? #t)]
     [timer (get-timer device)]
     [driver (get-video-driver device)]
     [manager (get-scene-manager device)]
     [gui (get-gui-environment device)]
     [bg-color (color 50 50 50)]
     [camera (add-camera manager)]
     [crate (get-texture driver (format "~aimages/crate.jpg" (current-directory)))]
     [font (get-default-font gui)]
     [msg (add-billboard-text manager font "Some Random Text Floating Above Box" 
                              #:position (vec3 0 7 0)
                              #:size (vec2 20 4))]
     [cube1 (add-cube manager 
                      #:size 1)]
     [cube2 (add-cube manager 
                      #:size 1
                      #:position (vec3 0 -20 0))]
     [bt-cube1 (cube->rigid-body cube1 10.0)]
     [bt-cube2 (cube->rigid-body cube2)]
     [config (new-collision-configuration)]
     [broadphase (new-axis-sweep (vec3 -1000 -1000 -1000) (vec3 1000 1000 1000))]
     [dispatcher (new-collision-dispatcher config)]
     [solver (new-sequential-constraint-solver)]
     [world (new-dynamics-world dispatcher broadphase solver config)])
    (set-window-caption device "Hello world example")
    (set-target camera (vec3 0 0 0))
    (set-material-flag cube1 'Lighting #f)
    (set-material-flag cube2 'Lighting #f)
    (set-material-flag cube1 'Bilinear_Filter #f)
    (set-material-flag msg 'Bilinear_Filter #f)
    (set-material-texture cube1 0 crate)
    (set-material-texture cube2 0 crate)
    (set-parent cube1 msg)
    (add-rigid-body world bt-cube1)
    (add-rigid-body world bt-cube2)
    (set-position camera (vec3 10 -15 0))
    (set-target camera (vec3 0 -15 0))
    (let loop ([x 30]
               [dir -0.05]
               [last-time (get-time timer)])
      (cond [(device-running? device)
             (let ([next-x (+ x dir)]
                   [now-time (get-time timer)])
               (step-simulation world (- now-time last-time))
               (update-rigid-body bt-cube1)
               (update-rigid-body bt-cube2)
               (begin-scene driver #t #t bg-color)
               (draw-text 
                 font 
                 (format "This is a message. Hello, world. FPS: ~a (~a ms)" (get-fps driver) (- now-time last-time))
                 (rect (vec2 0 0) (vec2 300 20))
                 (color 255 100 0))
               (draw-scene manager)
               (end-scene driver)
               (sleep 0.016)
               (loop next-x 
                     (cond 
                       [(<= next-x -30) 0.05]
                       [(>= next-x 30) -0.05]
                       [else dir])
                     now-time))]))))

(module+ main (test))
