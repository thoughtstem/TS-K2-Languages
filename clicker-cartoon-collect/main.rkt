#lang racket

(require ratchet)

;how do I get this to work??!?
#;(define rand
  (lambda () (first (shuffle dragon knight pilot bird
                             coin fruit mushroom))))

(define-ratchet-lang
  (provide
    (all-from-out clicker-cartoon-lib)
    (all-from-out racket))

  (require racket
           clicker-cartoon-lib)

  #:wrapper launch-game-engine

  

  [start-fantasy F (bg->play-icon GRASSY-BG)]

  ;[start-space   S (bg->play-icon SPACE-BG)]

  [start-clouds  C (bg->play-icon CLOUD-BG)]

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