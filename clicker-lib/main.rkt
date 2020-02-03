#lang racket 

(provide (all-from-out "./assets.rkt")
         (all-from-out ts-icons)    
         (all-from-out colors-as-strings)
         bg->play-icon
         rand
         (all-from-out game-engine)
         (all-from-out game-engine-demos-common)
         (all-from-out "./clicker-lang.rkt")
         )

(require "./assets.rkt"
         ts-icons
         (only-in colors-as-strings
           red
           green
           blue
           yellow
           orange
           purple)
         
         (only-in 2htdp/image overlay crop)
         (only-in game-engine
                  change-img-sat
                  change-img-bright
                  draw-sprite
                  pick-frame
                  sprite->cursor-sprite)
         (only-in game-engine-demos-common
                  FOREST-BG
                  DESERT-BG
                  SNOW-BG
                  LAVA-BG
                  PINK-BG)
         "./clicker-lang.rkt")

(define (bg->play-icon bg [x 624] [y 420])
  (overlay play-outline-icon 
           ((compose (curry change-img-bright 40)
                     (curry change-img-sat -20))
            (crop x y 32 24 bg))))

(define rand
  (lambda () (first (shuffle 
                      (list pointer cage glove magic-wand white-hand)))))
