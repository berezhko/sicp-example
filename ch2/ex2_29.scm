(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (left-branch-structure mobile)
  (branch-structure (left-branch mobile)))

(define (right-branch-structure mobile)
  (branch-structure (right-branch mobile)))

(define (mobile? mobile)
  (if (pair? mobile) #true #false))

(define (total-weight mobile)
  (define (calc-weight item) (if (mobile? item) (total-weight item) item))
  (let ((lbs (left-branch-structure mobile))
        (rbs (right-branch-structure mobile)))
    (+ (calc-weight lbs) (calc-weight rbs))))


(define m1 (make-mobile (make-branch 2 5) (make-branch 1 10)))
(define m2 (make-mobile (make-branch 10 10) (make-branch 10 m1)))
(define m3 (make-mobile (make-branch 10 m1) (make-branch 10 m2)))
(define m4 (make-mobile (make-branch 10 m2) (make-branch 10 m3)))
(define m5 (make-mobile (make-branch 10 m3) (make-branch 10 m4)))

(total-weight (make-mobile (make-branch 7 m4) (make-branch 10 m5)))

(define (calc-momen mobile direction-branch)
  (* (branch-length (direction-branch mobile)) (total-weight (branch-structure (direction-branch mobile)))))

(define (balanced-mobile? mobile)
  (= (calc-momen mobile left-branch) (calc-momen mobile right-branch)))

(branch-length (left-branch m1))
(branch-structure (left-branch m1))
;(calc-momen m1 left-branch)
;(balanced-mobile? m1)
