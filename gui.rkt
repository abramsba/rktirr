#lang racket

(require
  ffi/unsafe
  "library.rkt"
  "structures.rkt"
  "pointers.rkt"
  "enums.rkt")

(define _getGUIEnvironment
  (get-ffi-obj "getGUIEnvironment" libirr
               (_fun _IrrlichtDevice -> _IGUIEnvironment)))
(define (get-gui-environment device)
  (_getGUIEnvironment device))

(define _getDefaultFont
  (get-ffi-obj "getDefaultFont" libirr
               (_fun _IGUIEnvironment -> _IGUIFont)))
(define (get-default-font gui)
  (_getDefaultFont gui))

(define _getFont
  (get-ffi-obj "getFont" libirr
               (_fun _IGUIEnvironment _string -> _IGUIFont)))
(define (get-font gui filepath)
  (_getFont gui filepath))

(define _drawText
  (get-ffi-obj "drawText" libirr
               (_fun _IGUIFont _string _Rect _Color -> _void)))
(define (draw-text font message rct clr)
  (_drawText font message rct clr))

(provide
  get-gui-environment
  get-default-font
  get-font
  draw-text)

