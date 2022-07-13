(define (cont-frac n d k)
    (define (func i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (func (+ i 1))))))
    (func 1)
)

(define (Di i)
    (if (or (= i 1) (not (= (remainder (- i 2) 3) 0)))
        1.0
        (/ (* 2.0 (+ i 1)) 3))
)

(+ 2 (cont-frac (lambda (i) 1.0) Di 149))
(+ 2 (cont-frac (lambda (i) 1.0) Di 150))
(+ 2 (cont-frac (lambda (i) 1.0) Di 151))
(+ 2 (cont-frac (lambda (i) 1.0) Di 152))

(define (cont-frac n d k)
    (define (cont-frac-iter k result)
        (if (= k 0) result
            (cont-frac-iter (- k 1) (/ (n k) (+ (d k) result)))))
    (cont-frac-iter k (/ (n k) (d k)))
)

(+ 2 (cont-frac (lambda (i) 1.0) Di 149))
(+ 2 (cont-frac (lambda (i) 1.0) Di 150))
(+ 2 (cont-frac (lambda (i) 1.0) Di 151))
(+ 2 (cont-frac (lambda (i) 1.0) Di 152))
