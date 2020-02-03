#lang racket

(provide rand)

(require clicker-pokemon-lib)

(define (rand)
  (first (shuffle (list venasaur charizard blastoise mewtwo
                        fire-stone thunder-stone
                        james pokeball trainer-girl
                        ice-power turtle-power light-power))))
