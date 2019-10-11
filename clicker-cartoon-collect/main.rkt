#lang racket

(require ratchet)


(define-ratchet-lang
  (provide
    (all-from-out clicker-cartoon-lib)
    (all-from-out racket)
    rand)

  (require racket
           (except-in clicker-cartoon-lib rand)
           (only-in 2htdp/image scale)
           "./rand.rkt")

  #:wrapper launch-game-engine
  

  [start-fantasy F (bg->play-icon (scale .25 GRASSY-BG) 20 140)]
  
  ;[start-space   S (bg->play-icon (scale .25 SPACE-BG) 415 130)]

  [start-clouds  C (bg->play-icon (scale .25 CLOUD-BG) 10 20)]

  ;recommended CURSORS
  [dragon  d (draw-sprite dragon)]
  [knight  k (draw-sprite knight)]
  [pilot   p (draw-sprite pilot)]
  [bird    b (draw-sprite bird)]

  ;recommended COLLECTS
  [coin      c (draw-sprite coin)]
  [mushroom  m (draw-sprite mushroom)]
  ;NEEDS ICON
  [fruit     f (draw-sprite apple-sprite)]

  ;rand!
  [rand   ? question-icon]  

  )