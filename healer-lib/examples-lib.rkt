#lang racket

(provide define-food-examples 
         define-friends-examples 
         define-enemies-examples)

(require 
  english
  ts-kata-util
  ts-kata-util/inline-stimuli)

(require ts-kata-util/katas/main
         syntax/parse/define)

(define-syntax-rule (define-example-code-with-stimuli-inferred lang id stuff ...)
  (begin
    (new-stimuli id (~a (infer-stimuli stuff ...) "."))
    (define-example-code 
      lang id stuff ...)))

(define-syntax (infer-stimuli-base stx)
  (syntax-parse stx
    [(_ AVATAR)
     #'(english (where-the-player-is 
                  (a/an (described 'AVATAR))))]
    [(_ AVATAR (FOOD ...))
     #'(english (where-the-player-is 
                  (a/an (described 'AVATAR)))
                (eating 
                  (list-of (let ([thing (described 'FOOD)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                           #:or "nothing")))]
    [(_ AVATAR (FOOD ...) (FRIENDS ...))
     #'(english (where-the-player-is 
                  (a/an (described 'AVATAR)))
                (eating 
                  (list-of (let ([thing (described 'FOOD)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                           #:or "nothing"))
               ", and with"
               (friends-with 
                 (list-of (described 'FRIENDS) ...
                          #:or "no")))]
    [(_ AVATAR (FOOD ...) (FRIENDS ...) (ENEMIES ...))
     #'(english (where-the-player-is 
                  (a/an (described 'AVATAR)))
                (eating 
                  (list-of (let ([thing (described 'FOOD)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                           #:or "nothing"))
               ", and with"
               (friends-with 
                 (list-of (described 'FRIENDS) ...
                          #:or "no one"))
               ", and with"
               (enemies-are 
                 (list-of (described 'ENEMIES) ...
                          #:or "no")))]))

(define-syntax (infer-stimuli stx)
  (syntax-parse stx
    [(_ (start STUFF ...))
     #'(english code-a-game
                (infer-stimuli-base STUFF ...))]
    [(_ (start STUFF ...) ...)
     #'(english code-a-game
                "with multiple levels:"
                (itemize
                  (infer-stimuli-base STUFF ...)
                  ...))]))


(define (described thing)
  (define (move-numbers-to-front l)
    (append (filter number? l)
            (filter-not number? l)))


  (define (replace-rand s)
    (if (string=? (~a s) "rand")
      "[choose-your-own-sprite]"
      s))

  (match thing
    [(list noun adj ... ) (apply english (append (move-numbers-to-front adj) (list (replace-rand noun))))]
    [_ (replace-rand thing)]))

(define code-a-game "Code a game")

(define (where-the-player-is something)
  (english "with" something))

(define (eating something)
  (english "eating" something))

(define (friends-with something)
  (english something "friends"))

(define (enemies-are something)
  (english something "enemies"))


(define-syntax-rule (define-food-examples 
                      #:lang lang
                      #:start START
                      #:avatars (AVATAR-A AVATAR-B AVATAR-C AVATAR-D) 
                      #:foods   (FOOD-A FOOD-B FOOD-C FOOD-D) 
                      #:rand  RAND)
  (begin

    (define-example-code-with-stimuli
      lang
      hello-world-000
      "Code a basic game with no customizations."
      (START))

    (define-example-code-with-stimuli-inferred
      lang
      healer-foods-001
      (START AVATAR-A))

    (define-example-code-with-stimuli-inferred
      lang
      healer-foods-002
      (START AVATAR-A (FOOD-A)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-foods-003
      (START AVATAR-B (FOOD-B FOOD-C)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-foods-004
      (START AVATAR-C (FOOD-C FOOD-D FOOD-A)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-foods-005
      (START RAND (RAND RAND RAND)))))

(define-syntax-rule (define-friends-examples 
                      #:lang lang
                      #:start START
                      #:avatars (AVATAR-A AVATAR-B AVATAR-C AVATAR-D) 
                      #:foods   (FOOD-A   FOOD-B   FOOD-C   FOOD-D) 
                      #:friends (FRIEND-A   FRIEND-B   FRIEND-C   FRIEND-D) 
                      #:colors  (COLOR-A COLOR-B COLOR-C COLOR-D COLOR-E COLOR-F)
                      #:rand  RAND)
  (begin

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-001
      (START AVATAR-A
             (FOOD-A)
             (FRIEND-A)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-002
      (START AVATAR-B
             (FOOD-B FOOD-C)
             (FRIEND-B FRIEND-C)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-003
      (START (AVATAR-C COLOR-A)
             (FOOD-D FOOD-A)
             (FRIEND-D)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-004
      (START (AVATAR-D COLOR-B)
             (FOOD-B FOOD-C)
             (FRIEND-A RAND)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-005
      (START (FOOD-A COLOR-C)
             (FOOD-D FOOD-B)
             (FRIEND-B FRIEND-D FRIEND-C)))


    ; -- section 3 - more friends

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-006
      (START AVATAR-A
             ((FOOD-D 5))
             ((FRIEND-B 5))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-007
      (START (AVATAR-B COLOR-D)
             (FOOD-A)
             ((FRIEND-C COLOR-E))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-008
      (START AVATAR-C
             ((FOOD-B COLOR-B 4) (FOOD-C COLOR-C 2))
             ((FRIEND-D COLOR-F 3))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-009
      (START AVATAR-D
             ((FOOD-D COLOR-E 5))
             ((FOOD-A 3) (FOOD-B COLOR-A))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-friends-010
      (START (RAND COLOR-B)
             ((FOOD-C COLOR-C) (FOOD-D COLOR-D) (FOOD-A 2))
             ((FRIEND-A 2) (RAND COLOR-F))))))


(define-syntax-rule (define-enemies-examples 
                      #:lang lang
                      #:start START
                      #:avatars (AVATAR-A AVATAR-B AVATAR-C AVATAR-D) 
                      #:foods   (FOOD-A FOOD-B FOOD-C FOOD-D) 
                      #:friends (FRIEND-A   FRIEND-B   FRIEND-C   FRIEND-D) 
                      #:colors  (COLOR-A COLOR-B COLOR-C COLOR-D COLOR-E COLOR-F)
                      #:enemies (ENEMY-A   ENEMY-B   ENEMY-C   ENEMY-D) 
                      #:rand  RAND)
  (begin

    ; === ANIMAL/ENEMIES
    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-001
      (START AVATAR-A
             ((FOOD-A 5))
             ((FRIEND-A 5))
             (ENEMY-A)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-002
      (START RAND
             ((FOOD-B COLOR-D))
             ((FRIEND-B 2))
             ((ENEMY-B 3))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-003
      (START AVATAR-C
             ((FOOD-C COLOR-F))
             ((FOOD-B 5))
             (FOOD-D)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-004
      (START FOOD-A
             ((FOOD-B COLOR-B 5) (FOOD-C COLOR-E 5))
             (FOOD-D FOOD-A)
             ((FOOD-B COLOR-A 3))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-005
      (START RAND
             ((FOOD-A COLOR-C 5))
             ((FOOD-A COLOR-E 5))
             ((FOOD-A COLOR-D 5))))

    ; section 5 - more enemies

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-006
      (START AVATAR-A
             ((FOOD-A COLOR-D 5)))
      (START AVATAR-A
             ((FOOD-A COLOR-B 5))
             ((FRIEND-C 3))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-007
      (START (AVATAR-A COLOR-B)
             ((FOOD-B 8))
             (FRIEND-D))
      (START (AVATAR-A COLOR-A)
             ((FOOD-B 2))
             ((FRIEND-D 3))
             (ENEMY-B)))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-008
      (START AVATAR-C
             ((AVATAR-C COLOR-A 2))
             ((AVATAR-C COLOR-B 3))
             ((AVATAR-C COLOR-C)))
      (START FOOD-A
             ((FOOD-A COLOR-E 2))
             ((FOOD-A COLOR-D 3))
             ((FOOD-A COLOR-F 4))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-009
      (START AVATAR-D
             ((FOOD-B COLOR-B 2)))
      (START AVATAR-A
             (FOOD-C)
             ((FRIEND-D COLOR-D 4)))
      (START AVATAR-B
             (FOOD-D)
             (FRIEND-A)
             ((ENEMY-C COLOR-A 3))))

    (define-example-code-with-stimuli-inferred
      lang
      healer-enemies-010
      (START AVATAR-C
             ((FOOD-A 2)))
      (START AVATAR-C
             ((FOOD-B COLOR-E))
             ((FRIEND-D COLOR-D 4)))
      (START AVATAR-C
             (FOOD-D)
             ((FRIEND-A 2))
             ((ENEMY-C COLOR-A 3))))
    ))
