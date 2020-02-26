#lang scribble/manual


@require[scribble/extract]

@require[@for-label[healer-animal-foods
                    racket/base]]

@title{Healer-Animal langs}
@author{thoughtstem}

@defmodulelang[healer-animal-food]

@table-of-contents[]

@section{Functions}

@defproc[(start [avatar-sprite (listof sprite?) (list question-icon)] 
                [food-sprites  (listof sprite?) '()]
                [npc-sprites   (listof sprite?) '()] 
                [enemy-sprites (listof sprite?) '()])
         game?]{Produces a Healer-type 2-d game.}]

@(include-section "asset-library.rkt")
