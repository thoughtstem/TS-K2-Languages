#lang info

(define collection "clicker-pokemon-special")

(define deps '("base" 
               "https://github.com/thoughtstem/pokemon-sprites.git"
               "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-lib"
               "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-pokemon-lib"
               "https://github.com/thoughtstem/TS-GE-Languages.git?path=adventure"))

(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/clicker-pokemon-special.scrbl" ())))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(thoughtstem))
