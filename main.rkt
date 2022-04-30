#lang racket/base


(module reader racket/base

  (provide read-syntax)

  (require sgf/private/grammar
           sgf/private/lexer
           syntax/parse)

  (define (read-syntax source port)
    (syntax-parse (parse source (λ () (sgf-lexer port)))
      #:datum-literals (collection)
      [(collection body ...) #'(module anonymous sgf body ...)])))


(provide (rename-out [sgf-notation-module-begin #%module-begin]))


(require syntax/parse/define)


(define-syntax-parse-rule (sgf-notation-module-begin body ...)
  (#%module-begin 'body ...))
