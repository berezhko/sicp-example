;(cons 1 (cons 2 (cons 3 (cons 4 nil))))

(list 1 2 3 4)


(define (length items)
  (if (null? items) 0 (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))

(length odds)

(define (append list1 list2)
  (if (null? list1) list2
    (cons (car list1) (append (cdr list1) list2))))

(append (list 1 3 5) (list 1 2 4 9))

(define (last-pair l)
  (if (null? (cdr l)) (car l) (last-pair (cdr l))))

(last-pair (list 1 3 5))

(define (reverse l)
  (define (make-list list1 list-result)
    (if (null? list1) list-result
      (make-list (cdr list1) (cons (car list1) list-result))))

  (make-list l (list)))

(reverse (list 1 3 5 7 9))

(define (even-fibs n)
  (define (next k)
    (if (> k n)
      (list )
      (let ((f (fib k)))
        (if (even? f)
          (cons f (next (+ k 1)))
          (next (+ k 1))))))

  (next 0))

(define (fib k)
  (cond ((= k 1) 1)
        ((= k 2) 2)
        (else (+ (fib (- k 1)) (fib (- k 2))))))

(fib 10)

(even-fibs 10)

