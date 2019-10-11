#lang racket 

(provide (rename-out (random-alien-sprite      alien)  
                     (fatbird-sprite           bird)  
                     (goldcoin-sprite          coin) 
                     (cowcursor-sprite         cow)    ;fixed for cursor
                     (dragoncursor-sprite      dragon) ;fixed for cursor
                     (random-fruit-sprite      fruit) 
                     (yellowgem-sprite         gem)   
                     (goblin-sprite            goblin)
                     (random-squarehead-sprite human)  
                     (freeze                   ice-power) 
                     (knight-sprite            knight) 
                     (light                    light-power) 
                     (random-meteor-sprite     meteor) 
                     (mushroom-sprite          mushroom) 
                     (ninja-sprite             ninja)  
                     (pilot-sprite             pilot) 
                     (random-spaceship-sprite  spaceship) 
                     (slow                     turtle-power) 
                     (random-ufo-sprite        ufo)    
                     (zombie-sprite            zombie))
         GRASSY-BG
         SPACE-BG
         CLOUD-BG
         apple-sprite
         greenalien-sprite
         greenufo-sprite
         boy-sprite
         spaceship01-sprite)

(require cartoon-sprites
         (only-in game-engine sprite->cursor-sprite)
         (only-in clicker-lib freeze slow light))

(define dragoncursor-sprite
  (sprite->cursor-sprite dragon-sprite 60 30))

(define cowcursor-sprite
  (sprite->cursor-sprite cow-sprite 40 20))










