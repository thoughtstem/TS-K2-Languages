#lang racket

(provide rand)

(require clicker-cartoon-lib)

  
(define (rand)
  (first (shuffle (list dragon knight pilot bird
                        coin fruit mushroom))))
