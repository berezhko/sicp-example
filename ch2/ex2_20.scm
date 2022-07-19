(define (same−parity x . y)
  (define (even?? x y) (and (even? x) (even? y)))
  (define (not-even?? x y) (and (not (even? x)) (not (even? y))))
  (define (same-parity? x y)
    (if (or (even?? x y) (not-even?? x y)) #true #false))

  (define (main y)
    (cond ((null? y) (list))
          ((same-parity? x (car y)) (cons (car y) (main (cdr y))))
          (else (main (cdr y)))))

  (main (cons x y)))


(same−parity 1 2 3 4 5 6 7 8 9 10 11 12)
(same−parity 2 1 3 4 5 6 7 8 9 10 11 12)

