#lang info

(define scribblings 
  '(("scribblings/manual.scrbl" ())))

(define deps '(
  "https://github.com/thoughtstem/TS-Kata-Collections.git?path=clicker-cartoon-collect"
  "https://github.com/thoughtstem/TS-Kata-Collections.git?path=clicker-cartoon-avoid"
  "https://github.com/thoughtstem/TS-Kata-Collections.git?path=clicker-cartoon-special"
  ))

(define compile-omit-paths '(
  "examples.rkt"))
