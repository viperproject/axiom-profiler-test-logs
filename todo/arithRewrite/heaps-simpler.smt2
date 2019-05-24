(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :AUTO_CONFIG false)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :smt.refine_inj_axioms false)
; done setting options

(declare-sort Arr)
(declare-sort Loc)
(declare-sort Heap)
(declare-fun slot (Arr Int) Loc) ; heap location for array slot
(declare-fun lookup (Heap Loc) Int) ; dereference on the heap
(declare-fun next (Loc) Loc) ; next slot / pointer increment
(declare-const h1 Heap)
(declare-const a Arr)
(declare-const size Int)
(declare-const i Int)
(assert (forall ((j Int)) (!(or (< j 0) (>= j size)  (>= (lookup h1 (slot a j)) (lookup h1 (next (slot a j)))) ) :pattern ((lookup h1 (slot a j))))))
;(assert (forall ((j Int)) (!(or (< j 0) (>= j size)  (>= (lookup h1 (slot a j)) (lookup h1 (next (slot a j)))) ) :pattern ((next (slot a j))))))
(assert (forall ((ar Arr) (j Int)) (= (next (slot a j)) (slot a (+ j 1))  )))
;(assert (forall ((ar Arr) (j Int)) (!(= (next (slot a j)) (slot a (+ j 1)) ) :pattern ((next (slot ar j))))))
(assert (forall ((ar Arr) (j Int) (k Int)) (or (= j k) (not (= (slot ar j) (slot ar k))))))
(assert (and (>= i 0) (< (+ i 100) size))) ; stops there being trivial models / cases where unsat can't be proven
(assert (not (> (lookup h1 (slot a i)) (lookup h1 (next (slot a i))) ))) ; not (quite) implied false by the above
(check-sat)