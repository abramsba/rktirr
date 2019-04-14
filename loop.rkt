#lang racket

(define (loop game check? [fps 60][prev-time (current-milliseconds)])
  (let*
    ([now-time (current-milliseconds)]
     [update-time (- now-time prev-time)]
     [delta-time (/ update-time (/ 1000 fps))]
     [sleep-time (/ (+ (- now-time (current-milliseconds)) (/ 1000 fps)) 1000)])
    (game 
      (exact->inexact update-time) 
      (exact->inexact delta-time))
    (sleep sleep-time)
    (cond [(check?) (loop game check? fps now-time)])))

(provide loop)

