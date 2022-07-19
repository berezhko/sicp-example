(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
          (else (if (even? n)
            (fast-expt-iter a (square b) (/ n 2))
            (fast-expt-iter (* a b) b (- n 1))))))
  (fast-expt-iter 1 b n))

(define (cons a b) (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car z)
  (if (not (= (remainder z 2) 0)) 0 (+ 1 (car (/ z 2)))))

(define (cdr z)
  (if (not (= (remainder z 3) 0)) 0 (+ 1 (cdr (/ z 3)))))

(car (cons 7 12))
(cdr (cons 7 12))

