#lang at-exp racket

(provide start)

(require healer-lib/start
         (only-in animal-assets question-icon)
         (only-in ts-kata-util define/contract/doc)
         )

(define/contract/doc (my-start
                      (avatar-sprite (list question-icon)) 
                      (food-sprites '()) 
                      (npc-sprites '()) 
                      (enemy-sprites '()))
  (->i () ([avatar-sprite (listof sprite?)]
           [food-sprites  (listof sprite?)]
           [npc-sprites   (listof sprite?)]
           [enemy-sprites (listof sprite?)])
       [returns game?])

  @{This is the game function for all three healer-animal languages. Generates a healer game.}

  (displayln "Animal game starting!")

  (generic-start
    #:bg               (custom-bg #:rows 2 #:columns 2)
    #:avatar-sprite    avatar-sprite
    #:food-sprites     food-sprites
    #:npc-sprites      npc-sprites
    #:enemy-sprites    enemy-sprites
    #:score-prefix     "Animals Healed"
    #:instructions 
    (make-instructions "ARROW KEYS to move"
                       "SPACE to eat food and collect coins"
                       "ENTER to close dialogs"
                       "H to heal animals"
                       "I to open these instructions"
                       "M to open and close the map")))

(bind-start-to my-start)
