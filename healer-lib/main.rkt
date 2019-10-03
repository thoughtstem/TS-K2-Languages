#lang racket

(provide 
  (all-from-out colors-as-strings)
  (rename-out [play play-icon]))

(require 
  (only-in ts-icons play)
  (only-in colors-as-strings
           red
           green
           blue
           yellow
           orange
           purple))
