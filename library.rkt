#lang racket

(require ffi/unsafe)

(define os (system-type 'os))

(define library-filename
  (cond
	[(eq? os 'macosx) "libirr.dylib"]
	[(eq? os 'windows) "libirr.dll"]
	[(eq? os 'unix) "libirr.so"]))

(define in-working-dir? 
  (file-exists? 
    (format "~a~a" (current-directory) library-filename)))

(define in-path?
  (file-exists?
    (format "~a~a" (getenv "LIBIRR_DIR") library-filename)))

(define in-lib? (file-exists? (format "/usr/lib/~a" library-filename)))

(define libirr_path
  (cond
    [in-working-dir? (format "~alibirr" (current-directory))]
    [in-path? (format "~alibirr" (getenv "LIBIRR_DIR"))]
    [in-lib? (format "/usr/lib/~a" library-filename)]
    [else (error 'no_libirr.so)]))

(define libirr 
  (ffi-lib libirr_path))

(provide libirr)
