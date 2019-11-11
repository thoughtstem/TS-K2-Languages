#lang racket

(require clicker-lib/examples-lib)

(define-special-examples
  #:lang clicker-cartoon-special
  ;edit
  #:start (start-fantasy start-clouds start-space)
  #:pointers (knight dragon spaceship alien)
  #:collectables (coin gem)
  #:avoidables (ninja meteor zombie)
  #:specials (ice-power turtle-power light-power)
  #:colors (red orange yellow green blue purple)
  #:rand  rand)