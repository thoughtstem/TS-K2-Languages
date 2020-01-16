#lang racket

(provide rand)

(require clicker-pokemon-lib)

(define (rand)
  (first (shuffle (list ivysaur charmeleon wartortle pikachu
                        firestone waterstone thunderstone
                        jessie james boy girl))))
