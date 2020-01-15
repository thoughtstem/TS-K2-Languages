#lang racket

(provide rand)

(require clicker-pokemon-lib)

  
(define (rand)
  (first (shuffle (list bulbasaur charmander squirtle pikachu
                        firestone waterstone thunderstone))))
