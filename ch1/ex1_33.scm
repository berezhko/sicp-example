(define (filtered-accumulate filter combiner null−value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (newline) (display a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))
    )
  )
  (iter a null−value)
)

(define (sum-square-prime a b)
  (define (combiner a b) (+ a b))
  (filtered-accumulate prime? combiner 0 square a (lambda (x) (if (> x 2) (+ x 2) (+ x 1))) b)
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


; --------------------
(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b)))
)
; --------------------

(define (product-gcd-simple n)
  (define (combiner a b) (* a b))
  (filtered-accumulate (lambda (x) (= (gcd n x) 1)) combiner 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n)
)

(product-gcd-simple 11)

