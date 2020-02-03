#lang racket

(provide rand)

(require clicker-pokemon-lib)

(define (rand)
  (first (shuffle (list ivysaur charmeleon wartortle pikachu
                        fire-stone water-stone thunder-stone
                        jessie james trainer-boy trainer-girl))))
