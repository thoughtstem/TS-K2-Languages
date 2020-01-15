#lang racket

(provide rand)

(require clicker-pokemon-lib)

(define (rand)
  (first (shuffle (list venasaur charizard blastoise mewtwo
                        firestone thunderstone
                        james pokeball girl
                        ice-power turtle-power light-power))))
