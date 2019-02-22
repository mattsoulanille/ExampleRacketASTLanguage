#lang racket

(define (read-syntax path port)
  (define src-lines (port->lines port))
  (datum->syntax #f '(module lucy racket
                       42)))
(provide read-syntax)