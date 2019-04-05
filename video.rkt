#lang racket

(require
  ffi/unsafe
  "library.rkt"
  "structures.rkt"
  "pointers.rkt"
  "enums.rkt")

(define _getVideoDriver
  (get-ffi-obj "getVideoDriver" libirr
               (_fun _IrrlichtDevice -> _IVideoDriver)))
(define (get-video-driver device)
  (_getVideoDriver device))

(define _beginScene
  (get-ffi-obj "beginScene" libirr
               (_fun _IVideoDriver _int _int _Color -> _void)))
(define (begin-scene driver back-buffer? z-buffer? clr)
  (_beginScene driver (if back-buffer? 1 0) (if z-buffer? 1 0) clr))

(define _endScene
  (get-ffi-obj "endScene" libirr
               (_fun _IVideoDriver -> _void)))
(define (end-scene driver)
  (_endScene driver))

(define _getFPS
  (get-ffi-obj "getFPS" libirr
               (_fun _IVideoDriver -> _int)))
(define (get-fps driver)
  (_getFPS driver))

(define _getTexture
  (get-ffi-obj "getTexture" libirr
               (_fun _IVideoDriver _string -> _ITexture)))
(define (get-texture driver filepath)
  (_getTexture driver filepath))

(provide
  get-video-driver
  begin-scene
  end-scene
  get-fps
  get-texture)
