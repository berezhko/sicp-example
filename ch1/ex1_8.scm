(define (sqrt3 x) (sqrt3-iter 1.0 x))

(define (sqrt3-iter guess x)
    (if (good-enough? guess x) 
        guess 
        (sqrt3-iter (improve guess x) x)
    )
)

(define (improve guess x)
    (/ 
        (+ 
            (/ x (* guess guess))
            (* 2 guess)) 
        3))

(define (cub x) (* (* x x) x))

(define (good-enough? guess x) (< (abs (- (cub guess) x)) 0.001))
(display (sqrt3 27))
(display "\n")

(define (good-enough? guess x) (< (abs (- guess (improve guess x))) 0.001))
(display (sqrt3 27))
