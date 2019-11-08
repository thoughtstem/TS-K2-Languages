#lang racket

(require healer-lib/examples-lib "./main.rkt")

(define-enemies-examples 
  #:lang healer-farm-enemies
  #:start start
  #:avatars (llama horse cow rabbit)
  #:foods   (apple kiwi strawberry grapes)
  #:friends (pig dog wolf llama)
  #:colors  (red orange yellow green blue purple)
  #:enemies (pig dog wolf llama)
  #:rand rand)
