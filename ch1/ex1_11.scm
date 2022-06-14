(define (f n) 
    (if (< n 3) n (+ (f (- n 1)) (f (- n 2)) (f (- n 3))))
)

(f 10)

(define (f n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (f-iter 1 0 0 2 1 n))
    )
)

(define (f-iter a b c product counter n)
    (if (= counter n)
        product
        (f-iter (+ a b) (+ a c) a (+ (* 2 a) b) (+ 1 counter) n)
    )
)

(f 10)
