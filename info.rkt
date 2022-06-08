#lang info
(define collection "define-who")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/define-who.scrbl" ())))
(define pkg-desc "An anaphoric macro that binds who to function name")
(define version "0.0")
(define pkg-authors '(sorawee))
(define license '(Apache-2.0 OR MIT))
