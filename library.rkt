#lang racket

(require ffi/unsafe)

(define in-working-dir? 
  (file-exists? 
    (format "~alibirr.so" (current-directory))))

(define in-path?
  (file-exists?
    (format "~alibirr.so" (getenv "LIBIRR_DIR"))))

(define in-lib? (file-exists? "/usr/lib/libirr.so"))

(define libirr_path
  (cond
    [in-working-dir? (format "~alibirr" (current-directory))]
    [in-path? (format "~alibirr" (getenv "LIBIRR_DIR"))]
    [in-lib? "/usr/lib/libirr.so"]
    [else (error 'no_libirr.so)]))

(define libirr 
  (ffi-lib libirr_path))

(provide libirr)
