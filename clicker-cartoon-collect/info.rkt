#lang info
(define collection "clicker-cartoon-collect")
(define deps '("base" 
               "https://github.com/thoughtstem/cartoon-assets.git"
               "clicker-lib"
               "https://github.com/thoughtstem/adventure.git"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/clicker-farm-collect.scrbl" ())))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(thoughtstem))
