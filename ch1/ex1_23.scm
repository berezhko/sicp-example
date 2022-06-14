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

(define (timed-prime-test n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time) n))
)

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
)

(define (search-for-primes a b)
  (define (next b i)
    (cond ((< i b) (timed-prime-test i) (next b (+ i 2))))
  )
  (if (even? a)
    (next b (+ a 1))
    (next b a))
  0
)

(search-for-primes 1000 1100)
(search-for-primes 10000 10100)
(search-for-primes 100000 100100)
(search-for-primes 1000000 1000100)
