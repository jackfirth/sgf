#lang info

(define collection "sgf")

(define scribblings
  (list (list "main.scrbl"
              (list 'multi-page)
              (list 'library)
              "sgf")))

(define deps
  (list "base"))

(define build-deps
  (list "racket-doc"
        "rackunit-lib"
        "scribble-lib"))
