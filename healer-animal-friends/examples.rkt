#lang racket

(require healer-lib/examples-lib "./main.rkt")

(define-friends-examples
  #:lang healer-animal-friends
  #:start start
  #:avatars (llama cow rabbit pig)
  #:foods   (apple banana mushroom kiwi)
  #:friends (llama cow rabbit pig)
  #:colors (red orange yellow green blue purple)
  #:rand rand)
