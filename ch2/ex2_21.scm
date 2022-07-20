(define (square-list items)
  (if (null? items)
    (list)
    (cons (square (car items)) (square-list (cdr items)))))

(square-list (list 1 2 3 4 5))

(define (map proc items)
  (if (null? items)
    (list)
    (cons (proc (car items)) (map proc (cdr items)))))

(define (square-list items)
  (map (lambda (x) (square x) ) items))

(square-list (list 1 2 3 4 5))
