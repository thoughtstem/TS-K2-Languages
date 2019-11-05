#lang racket

(require clicker-lib/examples-lib)

(define-avoid-examples
  #:lang clicker-cartoon-avoid
  #:start (start-fantasy start-clouds start-space)
  #:pointers (knight dragon pilot ufo)
  #:collectables (fruit cow alien)
  #:avoidables (goblin zombie human meteor)
  #:colors (red orange yellow green blue purple)
  #:rand  rand)