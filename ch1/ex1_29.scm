(define (sum term a next b)
  (if (> a b) 0 (+ (term a)
                   (sum term (next a) next b))
  )
)

(define (integral f a b dx)
  (define (add−dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add−dx b) dx)
)

(define (cube x) (* x x x))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next-a x) (+ x h))
  (define (next-even-a x) (+ x (* 2 h)))

  (/ (* (- (* 4 (sum f a next-a b) ) (* 2 (sum f a next-even-a b)) (f a) (f b)) h) 3)
)

(simpson cube 0 1 100.0)
(simpson cube 0 1 1000.0)
(simpson cube 0 1 10000.0)
