(define (sum term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (+ result (term a))))
  )
  (iter a 0)
)

(define (inc x) (+ x 1))

(sum (lambda (x) x) 0 inc 10)
