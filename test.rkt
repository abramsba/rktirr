#lang racket

(require 
  "device.rkt"
  "scene.rkt"
  "video.rkt"
  "structures.rkt"
  "gui.rkt")

(define (test)
  (let*
    ([resolution (vec2 900 600)]
     [device (new-device 
               #:size resolution 
               #:vsync? #t)]
     [driver (get-video-driver device)]
     [manager (get-scene-manager device)]
     [gui (get-gui-environment device)]
     [bg-color (color 50 50 50)]
     [camera (add-camera manager)]
     [crate (get-texture driver "images/crate.jpg")]
     [font (get-default-font gui)]
     [msg (add-billboard-text manager font "Some Random Text Floating Above Box" 
                              #:position (vec3 0 7 0)
                              #:size (vec2 20 4))]
     [cube1 (add-cube manager #:size 5)])
    (set-window-caption device "Hello world example")
    (set-target camera (vec3 0 0 0))
    (set-material-flag cube1 'Lighting #f)
    (set-material-flag cube1 'Bilinear_Filter #f)
    (set-material-flag msg 'Bilinear_Filter #f)
    (set-material-texture cube1 0 crate)
    (define d (get-active-camera manager))
    (let loop ([x 30][dir -0.05])
      (cond [(device-running? device)
             (let ([next-x (+ x dir)])
               (set-position camera (vec3 x 10 10))
               (begin-scene driver #t #t bg-color)
               (draw-text font (format "This is a message. Hello, world. FPS: ~a" (get-fps driver)) 
                          (rect (vec2 0 0) (vec2 300 20))
                          (color 255 100 0))
               (draw-scene manager)
               (end-scene driver)
               (sleep 0.0165)
               (loop next-x (cond 
                              [(<= next-x -30) 0.05]
                              [(>= next-x 30) -0.05]
                              [else dir])))]))))

(module+ main (test))
