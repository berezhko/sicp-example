(define (filtered-accumulate filter combiner null−value term a next b)
  (define (iter a result)
    (if (> a b) result
        (if (filter a) (iter (next a) (combiner result (term a)))))
  )
  (iter a null−value)
)

(define (combiner a b) (+ a b))

(define (sum-square-prime a b)
  (filtered-accumulate prime? combiner 0 square a (lambda (x) (if (> x 2) (+ x 2) x)) b)
)

; -------------------
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor))))
)

(define (divides? a b) (= (remainder b a) 0))

(define (next i)
  (if (= i 2) 3 (+ i 2))
)

(define (prime? n) (= n (smallest-divisor n)))
; --------------------

(sum-square-prime 1 10)

(define (filtered-accumulate filter combiner null−value term a next b)
    (if (> a b)
        null−value
        (if (filter a) (combiner (term a) (filtered-accumulate filter combiner null−value term (next a) next b))))
)

(sum-square-prime 1 10)
