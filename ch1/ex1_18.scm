(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (half b))))
        (else (+ a (fast-mult a (- b 1)))))
)

(define (double x) (+ x x))
(define (half x) (/ x 2))

(fast-mult 8 3)
(fast-mult 16 4)
(fast-mult 1000 1000)

(define (fast-mult a b) (fast-mult-iter 0 a b))

(define (fast-mult-iter m a b)
  (cond ((= b 0 ) m)
        (else (if (even? b)
                (fast-mult-iter m (double a) (half b))
                (fast-mult-iter (+ m a) a (- b 1)))))
)

(fast-mult 8 3)
(fast-mult 16 4)
(fast-mult 1000 1000)
