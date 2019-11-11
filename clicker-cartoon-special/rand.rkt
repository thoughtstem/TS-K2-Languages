#lang racket

(provide rand)

(require clicker-cartoon-lib)

(define (rand)
  (first (shuffle (list dragon knight spaceship
                        alien ninja zombie meteor
                        coin gem ice-power
                        turtle-power light-power))))
