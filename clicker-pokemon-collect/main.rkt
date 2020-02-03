#lang racket

(require ratchet)


(define-ratchet-lang
  (provide
    (all-from-out clicker-pokemon-lib)
    (all-from-out racket)
    rand)

  (require racket
           pokemon-sprites
           (except-in clicker-pokemon-lib rand)
           (only-in 2htdp/image scale)
           "./rand.rkt")

  #:wrapper launch-game-engine
  

  [start-forest F (bg->play-icon (scale .25 FOREST-BG) 20 140)]
  [start-snow   S (bg->play-icon (scale .25 SNOW-BG)   20 140)]

  ;recommended CURSORS
  [bulbasaur    b (draw-sprite bulbasaur-sprite)]
  [charmander   c (draw-sprite charmander-sprite)]
  [squirtle     s (draw-sprite squirtle-sprite)]
  [pikachu      p (draw-sprite pikachu-sprite)]

  ;recommended COLLECTS
  [leaf-stone    l (draw-sprite leafstone-sprite)]
  [fire-stone    f (draw-sprite firestone-sprite)]
  [water-stone   w (draw-sprite waterstone-sprite)]

  ;rand!
  [rand         ? question-icon]  

  )