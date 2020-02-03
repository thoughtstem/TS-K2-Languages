#lang racket

(provide define-simple-examples
         define-collect-examples
         define-avoid-examples
         define-special-examples)

(require 
  english
  ts-kata-util
  ts-kata-util/inline-stimuli)

(require ts-kata-util/katas/main
         syntax/parse/define)




(define (code-a-game [something #f])
  (if something
      (english "Code a" (string-replace (~a something) "start-" "") "game")
      "Code a game"))

(define (background something)
  (english something "game"))

(define (where-the-pointer-is something)
  (english "where the cursor is" something))

(define (collecting something)
  (english "collecting" something))

(define (avoiding something)
  (english "avoiding" something))

(define (special something)
  (english "special" something))

(define (described thing)
  (define (number->power-level n)
    (~a "speed " n))

  (define (move-numbers-to-front l)
    (append (map number->power-level (filter number? l))
            (filter-not number? l)))

  (define (maybe-dash-to-space s)
    (string-replace (~a s) "-" " "))

  (define (replace-rand s)
    (if (string=? (~a s) "rand")
        "[choose-your-own-sprite]"
        s))

  (match thing
    [(list noun adj ... ) (apply english (append (move-numbers-to-front adj) (list (replace-rand (maybe-dash-to-space noun)))))]
    [_ (replace-rand (maybe-dash-to-space thing))]))

(define (described-special thing)
  (define (number->points n)
    (~a n "-point"))

  (define (move-numbers-to-front l)
    (append (map number->points (filter number? l))
            (filter-not number? l)))


  (define (replace-rand s)
    (if (string=? (~a s) "rand")
      "[choose-your-own-sprite]"
      s))

  (match thing
    [(list noun adj ... ) (apply english (append (move-numbers-to-front adj) (list (replace-rand noun))))]
    [_ (replace-rand thing)]))

(define-syntax-rule (define-example-code-with-stimuli-inferred lang id stuff ...)
  (begin
    (new-stimuli id (~a (infer-stimuli stuff ...) "."))
    (define-example-code 
      lang id stuff ...)))

(define-syntax (infer-stimuli-base stx)
  (syntax-parse stx
    [(_ POINTER)
     #'(english (where-the-pointer-is 
                  (a/an (described 'POINTER))))]
    [(_ POINTER (COLLECTABLE ...))
     #'(english (where-the-pointer-is 
                  (a/an (described 'POINTER)))
                (collecting 
                  (list-of (let ([thing (described 'COLLECTABLE)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                           #:or "nothing")))]
    [(_ POINTER (COLLECTABLE ...) (AVOIDABLE ...))
     #'(english (where-the-pointer-is 
                  (a/an (described 'POINTER)))
                (collecting 
                  (list-of (let ([thing (described 'COLLECTABLE)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                           #:or "nothing"))
               ", and is"
               (avoiding 
                 (list-of (let ([thing (described 'AVOIDABLE)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                          #:or "no one")))]
    [(_ POINTER (COLLECTABLE ...) (AVOIDABLE ...) (SPECIAL ...))
     #'(english (where-the-pointer-is
                  (a/an (described 'POINTER)))
                (collecting 
                  (list-of (let ([thing (described 'COLLECTABLE)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                           #:or "nothing"))
               ", and is"
               (avoiding 
                 (list-of (let ([thing (described 'AVOIDABLE)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                          #:or "nothing "))
               ", and can get"
               (special 
                 (list-of (let ([thing (described-special 'SPECIAL)])
                             (if (string-contains? (~a thing) "[choose-your-own-sprite]")
                                 (~a thing)
                                 (plural thing))) ...
                          #:or "nothing")))]))

(define-syntax (infer-stimuli stx)
  (syntax-parse stx
    [(_ (start STUFF ...))
     #'(english (code-a-game 'start)
                (infer-stimuli-base STUFF ...))]
    [(_ (start STUFF ...) ...)
     #'(english (code-a-game)
                "with multiple levels:"
                (itemize
                  (infer-stimuli-base STUFF ...)
                  ...))]))

(define-syntax-rule (define-simple-examples 
                      #:lang lang
                      #:start START
                      #:pointers (POINTER-A POINTER-B POINTER-C POINTER-D)
                      #:collectables (COLLECTABLE-A COLLECTABLE-B COLLECTABLE-C COLLECTIBLE-D)
                      #:avoidables (AVOIDABLE-A AVOIDABLE-B AVOIDABLE-C AVOIDABLE-D)
                      #:specials (SPECIAL-A SPECIAL-B SPECIAL-C)
                      #:colors (COLOR-A COLOR-B COLOR-C COLOR-D)
                      #:rand  RAND)
  (begin

    (define-example-code-with-stimuli
      lang
      clicker-000
      "Code a basic game with no customizations."
      (START))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-001
      (START POINTER-A))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-002
      (START POINTER-A 
             (COLLECTABLE-A) 
             (AVOIDABLE-A)
             (SPECIAL-A)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-003
      (START POINTER-A 
             ((COLLECTABLE-A COLOR-A 2))
             ((AVOIDABLE-A COLOR-A 2))
             ((SPECIAL-A COLOR-A 2)
              (SPECIAL-B COLOR-B 2))))))

(define-syntax-rule (define-collect-examples
                      ;numbers based of numbers of cartoon-collect
                      ;2 start, 4 pointer, 3 collectables, 1 rand
                      ;10 total
                      #:lang lang
                      #:start (START-A START-B)
                      #:pointers (POINTER-A POINTER-B POINTER-C POINTER-D)
                      #:collectables (COLLECTABLE-A COLLECTABLE-B COLLECTABLE-C)
                      #:rand  RAND)
  (begin

    (define-example-code-with-stimuli
      lang
      hello-world-000 
      "Code a simple game with no customizations."
      (START-A))

    ;introducing pointers
    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-001
      (START-A POINTER-A))

    ;introducing collectables
    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-002
      (START-B POINTER-C
               (COLLECTABLE-B)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-003
      (START-B POINTER-D
               (COLLECTABLE-B COLLECTABLE-C)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-004
      (START-A POINTER-B
               (COLLECTABLE-A RAND)))

    ;Introducing numbers (speed)
    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-005
      (START-B RAND
               ((COLLECTABLE-C 4))))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-006
      (START-A COLLECTABLE-A
               (POINTER-A POINTER-B (POINTER-C 1))))
   

    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-007
      (START-B RAND
               ((COLLECTABLE-C 1) (COLLECTABLE-B 5))))
    
    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-008
      (START-A POINTER-D
               (POINTER-D POINTER-D POINTER-D)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-009
      (START-B COLLECTABLE-C
               (RAND (RAND 5))))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-collect-010
      (START-A POINTER-A
               ((COLLECTABLE-A 5) (POINTER-C 4) (POINTER-B 1))))))

(define-syntax-rule (define-avoid-examples
                      ;numbers based of numbers of cartoon-collect
                      ;3 start, 4 pointer, 3 collectables, 4 avoidables, 6 colors, 1 rand
                      ;21 total
                      #:lang lang
                      #:start (START-A START-B START-C)
                      #:pointers (POINTER-A POINTER-B POINTER-C POINTER-D)
                      #:collectables (COLLECTABLE-A COLLECTABLE-B COLLECTABLE-C)
                      #:avoidables (AVOIDABLE-A AVOIDABLE-B AVOIDABLE-C AVOIDABLE-D)
                      #:colors (COLOR-A COLOR-B COLOR-C COLOR-D COLOR-E COLOR-F)
                      #:rand  RAND)
  (begin
    ;Introducing avoids
    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-001
      (START-C POINTER-D
               (COLLECTABLE-B)
               (AVOIDABLE-D)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-002
      (START-B POINTER-C
               (COLLECTABLE-C)
               (AVOIDABLE-B AVOIDABLE-C)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-003
      (START-C POINTER-B
               (COLLECTABLE-A)
               ((COLLECTABLE-A 1))))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-004
      (START-A AVOIDABLE-A
               (POINTER-A (POINTER-D 5))
               (COLLECTABLE-C (POINTER-C 5))))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-005
      (START-A AVOIDABLE-D
               (AVOIDABLE-D)
               ((AVOIDABLE-D 1))))

    ;Introducing color
    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-006
      (START-A (POINTER-A COLOR-A)
               (COLLECTABLE-A COLLECTABLE-B)
               (AVOIDABLE-A)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-007
      (START-B POINTER-B
               ((COLLECTABLE-C COLOR-D))
               (AVOIDABLE-B AVOIDABLE-C)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-008
      (START-C RAND
               (COLLECTABLE-C (AVOIDABLE-D COLOR-B) POINTER-C)
               (COLLECTABLE-B (AVOIDABLE-B 1) POINTER-D)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-009
      (START-A AVOIDABLE-A
               ((POINTER-B COLOR-C) (RAND 5))
               ((COLLECTABLE-A 1) (RAND COLOR-F))))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-avoid-010
      (START-A (POINTER-A COLOR-E)
               ((POINTER-A COLOR-D))
               ((POINTER-A COLOR-A))))))

(define-syntax-rule (define-special-examples
                      ;numbers based of numbers of cartoon-collect
                      ;3 start, 4 pointer, 2 collectables & 3 avoidables (somewhat interchangeable),
                      ;3 specials (with powers),
                      ;6 colors, 1 rand
                      ;22 total
                      #:lang lang
                      #:start (START-A START-B START-C)
                      #:pointers (POINTER-A POINTER-B POINTER-C POINTER-D)
                      #:collectables (COLLECTABLE-A COLLECTABLE-B)
                      #:avoidables (AVOIDABLE-A AVOIDABLE-B AVOIDABLE-C)
                      #:specials (SPECIAL-A SPECIAL-B SPECIAL-C)
                      #:colors (COLOR-A COLOR-B COLOR-C COLOR-D COLOR-E COLOR-F)
                      #:rand  RAND)
  (begin
    ;Introducing power specials
    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-001
      (START-A POINTER-B
               (COLLECTABLE-A)
               (AVOIDABLE-A)
               (SPECIAL-A)
               ))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-002
      (START-C POINTER-C
               (COLLECTABLE-A (COLLECTABLE-B COLOR-F))
               ((AVOIDABLE-B COLOR-A))
               (SPECIAL-B)
               ))

    ;Introducing color and number at once
    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-003
      (START-B AVOIDABLE-C
               (POINTER-A POINTER-D)
               ((POINTER-A 3 COLOR-A) (POINTER-D 1 COLOR-B))
               (SPECIAL-C)
               ))

    ;introducing extra point specials
    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-004
      (START-C POINTER-D
               ((AVOIDABLE-A COLOR-D) (COLLECTABLE-A COLOR-E))
               (AVOIDABLE-B)
               ((COLLECTABLE-B 200))
               ))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-005
      (START-A POINTER-C
               ((COLLECTABLE-B COLOR-A) (AVOIDABLE-C 4))
               ((POINTER-A 1 COLOR-C) POINTER-B)
               ((COLLECTABLE-A 200 COLOR-F))
               ))

    ;introducing multiple levels
    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-006
      (START-B POINTER-D
               (COLLECTABLE-A COLLECTABLE-B)
               (AVOIDABLE-A))
      (START-B POINTER-D
               ((COLLECTABLE-A COLOR-B) (COLLECTABLE-B 4))
               ((AVOIDABLE-A 5 COLOR-A))
               (SPECIAL-A)))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-007
      (START-A POINTER-A
               (COLLECTABLE-A)
               ((AVOIDABLE-C 1)))
      (START-B POINTER-A
               ((COLLECTABLE-B 3 COLOR-D))
               ((POINTER-C 3 COLOR-A))
               (SPECIAL-C))
      (START-C POINTER-A
               ((COLLECTABLE-A 5))
               ((POINTER-C 5) (AVOIDABLE-C 5))
               ((COLLECTABLE-B 300))))

    (define-example-code-with-stimuli-inferred
      lang
      clicker-special-008
      (START-C COLLECTABLE-A
               (POINTER-A POINTER-B)
               (AVOIDABLE-B)
               (SPECIAL-A))
      (START-B COLLECTABLE-A
               ((POINTER-A 5 COLOR-C))
               ((AVOIDABLE-A 5 COLOR-A) (AVOIDABLE-C 5 COLOR-A))
               (SPECIAL-B (POINTER-B 300))))

      (define-example-code-with-stimuli-inferred
      lang
      clicker-special-009
      (START-A POINTER-A
               ((COLLECTABLE-A 1 COLOR-E))
               (AVOIDABLE-C)
               (SPECIAL-C))
      (START-A POINTER-B
               ((COLLECTABLE-A 3 COLOR-F))
               ((AVOIDABLE-A 3) (AVOIDABLE-C 3))
               (SPECIAL-B (SPECIAL-C 5)))
      (START-A (POINTER-C COLOR-B)
               ((COLLECTABLE-A 5))
               ((AVOIDABLE-A 5) (AVOIDABLE-B 5)(AVOIDABLE-C 5))
               (SPECIAL-A SPECIAL-C (COLLECTABLE-B 500))))
        
    ))
