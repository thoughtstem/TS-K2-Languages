#lang racket

(provide (all-from-out "./start.rkt")
         (all-from-out "./assets.rkt")
         (all-from-out clicker-lib))

(require "./start.rkt"
         "./assets.rkt"
         clicker-lib
         (only-in 2htdp/image crop/align
                  image-width
                  image-height))