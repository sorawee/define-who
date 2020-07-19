#lang racket/base

(provide define/who who)

(require racket/stxparam
         racket/splicing
         syntax/parse/define
         (for-syntax racket/base
                     syntax/parse/lib/function-header))

(module+ test (require rackunit))

(define-syntax-parameter who
  (λ (stx) (raise-syntax-error #f "the who keyword is used out of context")))

(define-simple-macro (define/who header:function-header body:expr ...+)
  (splicing-syntax-parameterize ([who (λ (stx) #''header.name)])
    (define header body ...)))

(module+ test
  (define/who (test1 x)
    (list x who))
  (check-equal? (test1 3) '(3 test1))
  (define/who ((test2 x) y)
    (list x y who))
  (check-equal? ((test2 3) 4) '(3 4 test2)))
