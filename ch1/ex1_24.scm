(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m)))
)

(define (ferma-test n)
  (define (try-it a) (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((ferma-test n) (fast-prime? n (- times 1)))
        (else false))
)

(define (timed-prime-test n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (fast-prime? n 30)
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

(search-for-primes 1000 1050)
(search-for-primes 10000 10050)
(search-for-primes 100000 100050)
(search-for-primes 1000000 1000050)
