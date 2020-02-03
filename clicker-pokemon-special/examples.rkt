#lang racket

(require clicker-lib/examples-lib)

(define-special-examples
  #:lang clicker-pokemon-special
  ;edit
  #:start (start-forest start-snow start-desert)
  #:pointers (venasaur charizard blastoise mewtwo)
  #:collectables (fire-stone sun-stone)
  #:avoidables (james pokeball trainer-girl)
  #:specials (ice-power turtle-power light-power)
  #:colors (red orange yellow green blue purple)
  #:rand  rand)