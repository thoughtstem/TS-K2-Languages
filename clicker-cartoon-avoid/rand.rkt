#lang racket

(provide rand)

(require clicker-cartoon-lib)

(define (rand)
  (first (shuffle (list dragon knight pilot ufo
                        cow fruit alien human
                        goblin zombie meteor))))
