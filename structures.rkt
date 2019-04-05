#lang racket

(require ffi/unsafe)

(define-cstruct _Color ([a _int][r _int][g _int][b _int]))
(define-cstruct _Vec2 ([x _float][y _float]))
(define-cstruct _Vec3 ([x _float][y _float][z _float]))
(define-cstruct _Rect ([p1 _Vec2][p2 _Vec2]))

(define (color #:alpha [alpha 255] #:red [red 0] #:green [green 0] #:blue [blue 0])
  (make-Color alpha red green blue))

(define (vec2 #:x [x 0.0] #:y [y 0.0])
  (make-Vec2 
    (exact->inexact x) 
    (exact->inexact y)))

(define (vec3 #:x [x 0.0] #:y [y 0.0] #:z [z 0.0])
  (make-Vec3 
    (exact->inexact x) 
    (exact->inexact y) 
    (exact->inexact z)))

(define (rect #:p1 [p1 (vec2)] #:p2 [p2 (vec2)])
  (make-Rect p1 p2))

(provide
  _Color
  color
  _Vec2
  vec2
  _Vec3
  vec3
  _Rect
  rect)
