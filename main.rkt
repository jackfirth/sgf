#lang racket/base


(provide
 #%app
 #%datum
 #%module-begin
 #%top
 #%top-interaction
 sgf-game-tree
 sgf-node
 sgf-property
 sgf-property-identifier
 (rename-out [vector-immutable sgf-node-list]
             [vector-immutable sgf-variation-list]
             [vector-immutable sgf-property-list]
             [vector-immutable sgf-property-value-list]))


(require syntax/parse/define)


;@----------------------------------------------------------------------------------------------------


(module reader racket/base

  (provide read-syntax)

  (require sgf/private/grammar
           sgf/private/lexer
           syntax/parse)

  (define (read-syntax source port)
    (define stx (parse source (λ () (sgf-lexer port))))
    (syntax-parse stx
      #:datum-literals (collection)
      [(collection . body)
       (datum->syntax #false (list* 'module 'anonymous 'sgf #'body) stx stx)])))


(define-syntax-parse-rule (sgf-property-identifier id:id)
  'id)


(struct sgf-game-tree (nodes variations) #:transparent #:property prop:custom-print-quotable 'never)
(struct sgf-node (properties) #:transparent #:property prop:custom-print-quotable 'never)
(struct sgf-property (name values) #:transparent #:property prop:custom-print-quotable 'never)
