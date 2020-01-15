#lang racket

(require clicker-lib/examples-lib)

(define-avoid-examples
  #:lang clicker-pokemon-avoid
  #:start (start-forest start-snow start-desert)
  #:pointers (ivysaur charmeleon wartortle pikachu)
  #:collectables (firestone waterstone thunderstone)
  #:avoidables (jessie james boy girl)
  #:colors (red orange yellow green blue purple)
  #:rand  rand)