#lang racket 

(require pokemon-sprites
         (only-in game-engine sprite->cursor-sprite)
         (only-in clicker-lib freeze
                              slow
                              light
                              FOREST-BG
                              DESERT-BG
                              SNOW-BG))

(provide (rename-out (firestone-sprite         firestone)
                     (leafstone-sprite         leafstone)
                     (thunderstone-sprite      thunderstone)
                     (waterstone-sprite        waterstone)
                     (sunstone-sprite          sunstone)

                     (armoredmewtwo-sprite     mewtwo)
                     (pikachu-sprite           pikachu)
                     (bulbasaur-sprite         bulbasaur)
                     (ivysaur-sprite           ivysaur)
                     (venasaur-sprite          venasaur)
                     (charmander-sprite        charmander)
                     (charmeleon-sprite        charmeleon)
                     (charizard-sprite         charizard)
                     (squirtle-sprite          squirtle)
                     (wartortle-sprite         wartortle)
                     (blastoise-sprite         blastoise)
                     
                     (jessie-sprite            jessie)
                     (james-sprite             james)
                     
                     (redboy-sprite            boy)
                     (redgirl-sprite           girl)

                     (pokeball-sprite          pokeball)
                     
                     (freeze                   ice-power) 
                     (slow                     turtle-power)
                     (light                    light-power)
                     )

         pokeballcursor-sprite
         FOREST-BG
         DESERT-BG
         SNOW-BG
         )


(define pokeballcursor-sprite
  (sprite->cursor-sprite pokeball-sprite 60 30))










