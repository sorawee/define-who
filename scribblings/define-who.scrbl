#lang scribble/manual
@require[scribble/example
         @for-label[define-who
                    racket/base]]

@(define evaluator (make-base-eval))
@(evaluator '(require define-who))

@title{define-who}
@author[@author+email["Sorawee Porncharoenwase" "sorawee.pwase@gmail.com"]]

@defmodule[define-who]

This library provides a macro @racket[define/who] which is similar to
@racket[define], but it additionally binds @racket[who] to the name of the function.

@defform*[((define/who (head args) body ...+)
           (define/who id expr))]{
  @examples[#:eval evaluator
    (define/who (test x)
      (list x who))
    (test 42)
    (define/who ((foo #:x x) #:y y)
      (list x y who))
    ((foo #:x 1) #:y 2)
    (define/who (bar)
      (define who 42)
      who)
    (bar)
    (define/who baz
      (let ([table (make-hash)])
        (λ () who)))
    (baz)
  ]
}


@defidform[who]{
  Recognized specially within forms like @racket[define/who].
  A @racket[who] form out of context is a syntax error.
}
