#lang racket

(require healer-lib/examples-lib "./main.rkt")

(define-enemies-examples 
  #:lang healer-farm-enemies
  #:start start
  #:avatars (llama horse cow rabbit)
  #:foods   (apple kiwi pepper grapes)
  #:friends (sheep dog wolf llama)
  #:colors  (red orange yellow green blue purple)
  #:enemies (sheep dog wolf llama)
  #:rand rand)
