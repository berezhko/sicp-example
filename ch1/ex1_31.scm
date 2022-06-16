(define (product term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (* result (term a))))
  )
  (iter a 1)
)

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n)
)

(factorial 5)

(define (pi n)
  (define (f x) (/ (- (square x) 1) (square x)))
  (* 4 (product f 3.0 (lambda (x) (+ x 2)) n))
)

(pi 1000)

(define (product term a next b)
    (if (> a b) 1 (* (term a) (product term (next a) next b)))
)

(factorial 5)
(pi 1000)
