#lang racket

(require clicker-lib/examples-lib)

(define-collect-examples
  #:lang clicker-pokemon-collect
  #:start (start-forest start-snow)
  #:pointers (bulbasaur charmander squirtle pikachu)
  #:collectables (leaf-stone fire-stone water-stone)
  #:rand  rand)