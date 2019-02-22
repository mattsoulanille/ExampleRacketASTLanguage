#lang racket
(require syntax/strip-context)

(provide (except-out (all-from-out racket) lambda)
         (rename-out [lambda function]))

; (rename-out [hello-read read]
;             [hello-read-syntax read-syntax]
;             ))

(define (hello-read in)
  (syntax->datum
   (hello-read-syntax #f in)))

;(define hello-read read)


;(define hello-read-syntax read-syntax)
(define (hello-read-syntax src in)
 (with-syntax ([stx (read in)])
      (strip-context
       #'(module anything racket
           (provide data)
           (define data 'stx)
           )
       )
    )
  )
  


;(define (hello-read-syntax src in)
;  (with-syntax ([str (port->string in)])
;    (strip-context
;     #'(module anything racket
;         (provide data)
;         (define data 'str)))))