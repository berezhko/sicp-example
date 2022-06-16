(define (accumulate combiner null−value term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (combiner result (term a))))
  )
  (iter a null−value)
)

(define (combiner a b) (* a b))

(define (factorial n)
  (accumulate combiner 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n)
)

(factorial 5)

(define (pi n)
  (define (f x) (/ (- (square x) 1) (square x)))
  (* 4 (accumulate combiner 1 f 3.0 (lambda (x) (+ x 2)) n))
)

(pi 1000)

(define (accumulate combiner null−value term a next b)
    (if (> a b)
        null−value
        (combiner (term a) (accumulate combiner null−value term (next a) next b)))
)

(factorial 5)
(pi 1000)


(define (sum-first n)
  (define (combiner a b) (+ a b))
  (accumulate combiner 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) n)
)

(sum-first 10)
