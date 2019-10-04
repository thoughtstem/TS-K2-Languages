#lang racket

(require ratchet)

(define-ratchet-lang
  (provide
    (all-from-out "./start.rkt")
    (all-from-out "./assets.rkt")
    (all-from-out racket)
    (all-from-out clicker-lib)
    )

  (require racket
           (except-in clicker-lib FOREST-BG start-forest)
           "./start.rkt"
           "./assets.rkt"
           (only-in 2htdp/image overlay)
           (only-in pict pict->bitmap))

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