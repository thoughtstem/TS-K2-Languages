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
           (only-in 2htdp/image square
                                scale)
           "./rand.rkt")

  #:wrapper launch-game-engine

  [start-forest F (bg->play-icon (scale .25 FOREST-BG) 20 140)]
  [start-snow   S (bg->play-icon (scale .25 SNOW-BG)   10 20 )]
  [start-desert D (bg->play-icon (scale .25 DESERT-BG) 10 20 )]

  ;recommended CURSORS
  [ivysaur      i (draw-sprite ivysaur-sprite)]
  [charmeleon   c (draw-sprite charmeleon-sprite)]
  [wartortle    w (draw-sprite wartortle-sprite)]
  [pikachu      p (draw-sprite pikachu-sprite)]
  

  ;recommended COLLECTS
  [leafstone    l (draw-sprite leafstone-sprite)]
  [firestone    f (draw-sprite firestone-sprite)]
  [thunderstone t (draw-sprite thunderstone-sprite)]

  ;recommended AVOIDS
  [jessie       j (draw-sprite jessie-sprite)]
  [james        a (draw-sprite james-sprite)]
  [boy          b (draw-sprite redboy-sprite)]
  [girl         g (draw-sprite redgirl-sprite)]

  ;COLORS
  [red          R (square 32 'solid 'red)]
  [orange       O (square 32 'solid 'orange)]
  [yellow       Y (square 32 'solid 'yellow)]
  [green        G (square 32 'solid 'green)]
  [blue         B (square 32 'solid 'blue)]
  [purple       P (square 32 'solid 'purple)]

  ;rand!
  [rand         ? question-icon] 

  )