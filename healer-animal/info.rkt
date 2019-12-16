#lang info

(define scribblings 
  '(("scribblings/manual.scrbl" ())))

(define deps '(
  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-animal-foods"
  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-animal-friends"
  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-animal-enemies"
  ))

(define compile-omit-paths '(
  "examples.rkt"))
