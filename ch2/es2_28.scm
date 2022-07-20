(define x (list (list 1 2) (list 3 4)))

x
(list x x)

(define (fringe items)
  (cond ((pair? items) (append (fringe (car items)) (fringe (cdr items))))
        ((null? items) items)
        (else (list items))))

(fringe x)
(fringe (list x x))

