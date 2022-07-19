(define (reverse l)
  (define (make-list list1 list-result)
    (if (null? list1) list-result
      (make-list (cdr list1) (cons (car list1) list-result))))

  (make-list l (list)))

(reverse (list 1 3 5 7 9))
