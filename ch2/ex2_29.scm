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

(define (get-weight item)
  (if (mobile? item) (total-weight item) item))

(define (calc-left-weight mobile)
  (get-weight (left-branch-structure mobile)))

(define (calc-right-weight mobile) 
  (get-weight (right-branch-structure mobile)))

(define (total-weight mobile)
  (+ (calc-left-weight mobile) (calc-right-weight mobile)))

(define m1 (make-mobile (make-branch 3 4) (make-branch 1 9)))
(define m2 (make-mobile (make-branch 10 13) (make-branch 10 m1)))
(define m3 (make-mobile (make-branch 10 m1) (make-branch 10 m2)))
(define m4 (make-mobile (make-branch 10 m2) (make-branch 10 m3)))
(define m5 (make-mobile (make-branch 10 m3) (make-branch 10 m4)))

(total-weight (make-mobile (make-branch 7 m4) (make-branch 10 m5)))

(define (calc-left-moment mobile)
  (* (branch-length (left-branch mobile)) (calc-left-weight mobile)))

(define (calc-right-moment mobile)
  (* (branch-length (right-branch mobile)) (calc-right-weight mobile)))

(define (balanced-mobile? mobile)
  (and
    (= (calc-left-moment mobile) (calc-right-moment mobile))
    (if (mobile? (right-branch-structure mobile)) 
      (balanced-mobile? (right-branch-structure mobile)) #true)
    (if (mobile? (left-branch-structure mobile))
      (balanced-mobile? (left-branch-structure mobile)) #true)
  ))

m1
(calc-left-moment m1)
(calc-right-moment m1)
(balanced-mobile? m1)

m2
(calc-left-moment m2)
(calc-right-moment m2)
(balanced-mobile? m2)

;======================================================================
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define m1 (make-mobile (make-branch 3 4) (make-branch 1 9)))
(define m2 (make-mobile (make-branch 10 13) (make-branch 10 m1)))
(define m3 (make-mobile (make-branch 10 m1) (make-branch 10 m2)))
(define m4 (make-mobile (make-branch 10 m2) (make-branch 10 m3)))
(define m5 (make-mobile (make-branch 10 m3) (make-branch 10 m4)))

(total-weight (make-mobile (make-branch 7 m4) (make-branch 10 m5)))

m1
(calc-left-moment m1)
(calc-right-moment m1)
(balanced-mobile? m1)

m2
(calc-left-moment m2)
(calc-right-moment m2)
(balanced-mobile? m2)

