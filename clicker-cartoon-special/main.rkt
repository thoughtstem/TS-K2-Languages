#lang racket

(require ratchet)

(define-ratchet-lang
  (provide
    (all-from-out clicker-cartoon-lib)
    (all-from-out racket)
    rand)

  (require racket
           (except-in clicker-cartoon-lib rand)
           (only-in 2htdp/image square
                                scale)
           "./rand.rkt")

  #:wrapper launch-game-engine

  [start-fantasy F (bg->play-icon (scale .25 GRASSY-BG) 20 140)]
  
  [start-space   S (bg->play-icon (scale .25 SPACE-BG) 415 130)]

  [start-clouds  C (bg->play-icon (scale .25 CLOUD-BG) 10 20)]

   ;recommended CURSORS
  [dragon    d (draw-sprite dragon)]
  [knight    k (draw-sprite knight)]
  ;NEEDS ICON
  [spaceship s (draw-sprite spaceship01-sprite)]

  ;recommended COLLECTS
  ;NEEDS ICON
  [alien    a (draw-sprite greenalien-sprite)]

  ;recommended AVOIDS
  ;NEEDS ICON
  [ninja    n (draw-sprite ninja)]
  [zombie   z (draw-sprite zombie)]
  [meteor   m (draw-sprite meteor01-sprite)]

  ;recommended SPECIALS
  [coin         c (draw-sprite coin)]
  [gem          g (draw-sprite gem)]
  [ice-power    i (draw-sprite ice-power)]
  [turtle-power t (draw-sprite turtle-power)]
  [light-power  l (draw-sprite light-power)]

  ;COLORS
  [red            R (square 32 'solid 'red)]
  [orange         O (square 32 'solid 'orange)]
  [yellow         Y (square 32 'solid 'yellow)]
  [green          G (square 32 'solid 'green)]
  [blue           B (square 32 'solid 'blue)]
  [purple         P (square 32 'solid 'purple)]

  ;rand!  NEEDS CARTOON SPRITES
  [rand   ? question-icon] 

  )
