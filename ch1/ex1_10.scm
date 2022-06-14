(define (A x y)
    (cond   ((= y 0) 0)
            ((= x 0) (* 2 y))
            ((= y 1) 2)
            (else (A (- x 1) (A x (- y 1))))
    )
)

(display (A 1 10))
(display (A 2 4))
(display (A 3 3))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))

(display (h 1))
(display (h 2))
(display (h 3))
(display (h 4))

