#lang racket

(provide start-fantasy
         start-clouds
         start-space)

(require
  cartoon-sprites
  (except-in clicker-lib FOREST-BG start-forest)
  (except-in game-engine freeze) 
  (only-in game-engine-demos-common apply-image-function))


(define (sprite->world-object sprite posn)
  (define clear-sprite (apply-image-function (curry change-img-alpha -128) sprite))
  (precompile! clear-sprite)
  (sprite->entity sprite
                  #:name "world-object"
                  #:position posn
                  #:components (layer "tops")
                               (observe-change touching-pointer?
                                               (if/r touching-pointer?
                                                     (change-sprite clear-sprite)
                                                     (change-sprite sprite)))))

;start-fantasy world-objects
(define redcastle01
  (sprite->world-object redcastle-sprite (posn 210 230)))
(define redcastle02
  (sprite->world-object redcastle-sprite (posn 570 280)))
(define greencastle01
  (sprite->world-object greencastle-sprite (posn 350 240)))
(define greencastle02
  (sprite->world-object greencastle-sprite (posn 100 340)))
(define greentower01
  (sprite->world-object greentower-sprite (posn 20 250)))
(define greentower02
  (sprite->world-object greentower-sprite (posn 400 400)))
(define redtower01
  (sprite->world-object redtower-sprite (posn 455 300)))
(define redtower02
  (sprite->world-object redtower-sprite (posn 270 355)))
(define redtower03
  (sprite->world-object redtower-sprite (posn 195 420)))

;start-fantasy
(define-start start-fantasy
              #:bg-sprite
              (scale-and-crop-to 640 480 GRASSY-BG "center" "bottom")
              #:world-objects
              (list redcastle01
                    redcastle02
                    greencastle01
                    greencastle02
                    greentower01
                    greentower02
                    redtower01
                    redtower02))

;start-space world-objects
(define moon1
  (sprite->world-object (colorize-sprite red moon-sprite)
                        (posn 70 110)))
(define moon2
  (sprite->world-object (colorize-sprite orange moon-sprite)
                        (posn 230 195)))
(define moon3
  (sprite->world-object (colorize-sprite yellow moon-sprite)
                        (posn 580 220)))
(define moon4
  (sprite->world-object (colorize-sprite green moon-sprite)
                        (posn 270 55)))
(define moon5
  (sprite->world-object (colorize-sprite blue moon-sprite)
                        (posn 430 290)))
(define moon6
  (sprite->world-object (colorize-sprite purple moon-sprite)
                        (posn 525 70)))
(define moon7
  (sprite->world-object moon-sprite
                        (posn 90 270)))

;start-space
(define-start start-space
              #:bg-sprite
              (scale-and-crop-to 640 480 SPACE-BG)
              #:world-objects
              (list moon1 moon2
                    moon3 moon4
                    moon5 moon6
                    moon7))

;start-clouds world-objects
(define cloud1
  (sprite->world-object cloud1-sprite (posn 115 315)))
(define cloud2
  (sprite->world-object cloud2-sprite (posn 170 160)))
(define cloud3
  (sprite->world-object cloud3-sprite (posn 185 380)))
(define cloud4
  (sprite->world-object cloud4-sprite (posn 480 90)))

;start-clouds
(define-start start-clouds
              #:bg-sprite
              (scale-and-crop-to 640 480 CLOUD-BG)
              #:world-objects
              (list cloud1 cloud2
                    cloud3 cloud4))




