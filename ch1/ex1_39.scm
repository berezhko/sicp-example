(define (cont-frac n d k)
    (define (cont-frac-iter k result)
        (if (= k 0) result
            (cont-frac-iter (- k 1) (/ (n k) (+ (d k) result)))))
    (cont-frac-iter k (/ (n k) (d k)))
)

(define (tan-cf x k)
    (define (Di i)
        (let ((y (- (* 2 i) 1)))
            (if (= (remainder i 2) 0) (- y) y)))
    (define (Ni i) (* x x))

    (/ (cont-frac Ni Di k) x)
)

(tan-cf 2.0 10)
(tan 2.0)
