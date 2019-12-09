#lang racket

(provide rand)

(require animal-assets)

(define (rand)
  (first (shuffle (list zookeeper
                        monkey
                        elephant
                        giraffe
                        hippo
                        kangaroo
                        penguin
                        zebra))))

