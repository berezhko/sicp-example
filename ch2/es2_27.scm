(define x (list (list 1 2) (list 3 4)))

(define (reverse l)
  (define (make-list list1 list-result)
    (if (null? list1) list-result
      (make-list (cdr list1) (cons (car list1) list-result))))

  (make-list l (list)))

(define (deep-reverse l)
  (define (make-list list1 list-result)
    (cond ((null? list1)
            list-result)
          ((pair? (car list1))
            (make-list
              (cdr list1)
              (cons (make-list (car list1) (list)) list-result)
          ))
          (else (make-list
                  (cdr list1)
                  (cons (car list1) list-result))
          ))
  )

  (make-list l (list)))

x
(reverse x)
(deep-reverse x)
