#lang racket/base


(require racket/contract/base)


(provide
 (contract-out
  [sgf-lexer (-> input-port? any/c)]))


(require br-parser-tools/lex
         brag/support)


;@----------------------------------------------------------------------------------------------------


(define-lex-abbrev digits (:+ (char-set "0123456789")))
(define-lex-abbrev uppercase-ascii-alphabetic (char-range #\A #\Z))
(define-lex-abbrev number (:seq (:? (:or "+" "-")) digits (:? (:seq "." digits))))
(define-lex-abbrev value (:or number color))


(define sgf-lexer
  (lexer
   [whitespace (token lexeme #:skip? #true)]
   [(char-set "();:") lexeme]
   [(:seq uppercase-ascii-alphabetic (:? uppercase-ascii-alphabetic))
    (token 'PROPERTY-IDENTIFIER (string->symbol lexeme))]
   [(:seq "[" number "]") (token 'NUMBER (string->number (trim-ends "[" lexeme "]")))]
   [(:seq "[B]") (token 'COLOR 'black)]
   [(:seq "[W]") (token 'COLOR 'white)]
   [(from/to "[" "]") (token 'SIMPLE-TEXT (trim-ends "[" lexeme "]"))]))
