(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1)))))
)

(fast-expt 8 3)
(fast-expt 16 4)

(define (fast-expt b n) (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        (else (if (even? n)
                (fast-expt-iter a (square b) (/ n 2))
                (fast-expt-iter (* a b) b (- n 1)))))
)

(fast-expt 8 3)
(fast-expt 16 4)
