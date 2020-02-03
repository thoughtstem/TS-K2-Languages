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
                                scale
                                crop/align)
           "./rand.rkt")

  #:wrapper launch-game-engine

  [start-forest F (bg->play-icon (scale .25 FOREST-BG) 20 140)]
  [start-snow   S (bg->play-icon (scale .25 SNOW-BG)   20 140 )]
  [start-desert D (bg->play-icon (scale .25 DESERT-BG) 20 140)]

  ;recommended CURSORS
  [venasaur     v (draw-sprite venasaur-sprite)]
  [charizard    c (draw-sprite charizard-sprite)]
  [blastoise    b (draw-sprite blastoise-sprite)]
  [mewtwo       m (draw-sprite armoredmewtwo-sprite)]

  ;recommended COLLECTS
  [fire-stone    f (draw-sprite firestone-sprite)]
  [sun-stone     s (draw-sprite sunstone-sprite)]

  ;recommended AVOIDS
  [james        j (draw-sprite james-sprite)]
  [pokeball     p (pick-frame pokeball-sprite 7)]
  [trainer-girl         g (draw-sprite redgirl-sprite)]

  ;recommended SPECIALS
  [ice-power    i (draw-sprite ice-power)]
  [turtle-power t (draw-sprite turtle-power)]
  [light-power  l (draw-sprite light-power)]

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
