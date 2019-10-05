#lang racket

(require ratchet)

(define-ratchet-lang
  (provide
    (all-from-out clicker-cartoon-lib)
    (all-from-out racket))

  (require racket
           clicker-cartoon-lib)

  #:wrapper launch-game-engine

  [start-fantasy F (bg->play-icon GRASSY-BG)]

  [start-space   S (bg->play-icon SPACE-BG)]

  [start-clouds  C (bg->play-icon CLOUD-BG)]

  ;recommended CURSORS
  [dragon  d (draw-sprite dragon)]
  [knight  k (draw-sprite knight)]
  [pilot   p (draw-sprite pilot)]
  ;NEEDS ICON
  [ufo     u (draw-sprite greenufo-sprite)]

  ;recommended COLLECTS
  [cow      c (draw-sprite coin)]
  [mushroom  m (draw-sprite mushroom)]
  ;NEEDS ICON
  [fruit     f (draw-sprite apple-sprite)]


  ;rand!
  [rand   ? question-icon] 

  )
