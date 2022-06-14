(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2)))))
)

(define (timed-fib n)
  (start-fib n (runtime))
)

(define (start-fib n start-time)
    (fib n)
    (report-prime (- (runtime) start-time) n))
)

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
)

(timed-fib 30)

(define (fib n) (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a b 
                        (+ (* p p) (* q q))   ; p'
                        (+ (* 2 p q) (* q q)) ; q'
                        (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p q (- count 1))))
)

(timed-fib 30)
