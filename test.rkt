#lang racket

(require 
  "device.rkt"
  "scene.rkt"
  "video.rkt"
  "structures.rkt"
  "gui.rkt")

(define (test)
  (let*
    ([resolution (vec2 #:x 900 #:y 600)]
     [device (new-device resolution)]
     [driver (get-video-driver device)]
     [manager (get-scene-manager device)]
     [gui (get-gui-environment device)]
     [bg-color (color #:red 50 #:green 50 #:blue 50)]
     [camera (add-camera manager)]
     [crate (get-texture driver "images/crate.jpg")]
     [font (get-default-font gui)]
     [cube1 (add-cube manager)])
    (set-window-caption device "Hello world example")
    (set-target camera (vec3))
    (set-material-flag cube1 'Lighting #f)
    (set-material-texture cube1 0 crate)
    (let loop ([x 30][dir -1])
      (cond [(device-running? device)
             (let ([next-x (+ x dir)])
               (set-position camera (vec3 #:x x #:y 10 #:z 10))
               (begin-scene driver #t #t bg-color)
               (draw-text font "This is a message. Hello, world." 
                          (rect 
                            #:p1 (vec2 #:x 0 #:y 0) 
                            #:p2 (vec2 #:x 300 #:y 20))
                          (color
                            #:red 255
                            #:green 100
                            #:blue 0))
               (draw-scene manager)
               (end-scene driver)
               (sleep 0.0165)
               (loop next-x (cond 
                              [(= next-x -30) 1]
                              [(= next-x 30) -1]
                              [else dir])))]))))

(module+ main (test))
