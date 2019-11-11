#lang racket

(require clicker-lib/examples-lib)

(define-collect-examples
  #:lang clicker-cartoon-collect
  #:start (start-fantasy start-clouds)
  #:pointers (knight dragon pilot bird)
  #:collectables (mushroom coin fruit)
  #:rand  rand)