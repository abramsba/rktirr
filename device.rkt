#lang racket

(require
  ffi/unsafe
  "enums.rkt"
  "library.rkt"
  "structures.rkt"
  "pointers.rkt"
  "enums.rkt")

(define _newDevice 
  (get-ffi-obj "newDevice" libirr (_fun driver-type _Vec2 _int _int _int _int -> _IrrlichtDevice)))
(define (new-device 
          #:size [size (vec2 #:x 640 #:y 480)] 
          #:driver [driver 'OpenGL] 
          #:bits [bits 16]
          #:fullscreen? [fullscreen? #f]
          #:stencil-buffer? [stencil-buffer? #f]
          #:vsync? [vsync? #f])
  (_newDevice 
    driver 
    size 
    bits 
    (if fullscreen? 1 0)
    (if stencil-buffer? 1 0)
    (if vsync? 1 0)))

(define _deviceRun 
  (get-ffi-obj "deviceRun" libirr (_fun _IrrlichtDevice -> _int)))
(define (device-running? device)
  (eq? 1 (_deviceRun device)))

(define _setWindowCaption
  (get-ffi-obj "setWindowCaption" libirr (_fun _IrrlichtDevice _string -> _void)))
(define (set-window-caption device [caption ""])
  (_setWindowCaption device caption))

(define _setKeyboardCallback 
  (get-ffi-obj "setKeyboardCallback" libirr (_fun _IrrlichtDevice _keyboardEvent -> _void)))
(define (set-keyboard-callback device callback)
  (_setKeyboardCallback device callback))

(define _setMouseCallback
  (get-ffi-obj "setMouseCallback" libirr (_fun _IrrlichtDevice _mouseEvent -> _void)))
(define (set-mouse-callback device callback)
  (_setMouseCallback device callback))

(provide
  new-device
  device-running?
  set-window-caption
  set-keyboard-callback
  set-mouse-callback)

