(get-info :version)
; (:version "4.5.1")
; Started: 2017-11-17 14:49:56
; Silicon.buildVersion: 1.1-SNAPSHOT ed0eca6860b9+ default 2017/09/21 10:20:50
; Input file: null
; Verifier id: 00
; ------------------------------------------------------------
; Begin preamble
; ////////// Static preamble
; 
; ; /z3config.smt2
(set-option :print-success true) ; Boogie: false
(set-option :global-decls true) ; Boogie: default
(set-option :auto_config false) ; Usually a good idea
(set-option :smt.mbqi false)
(set-option :model.v2 true)
(set-option :smt.phase_selection 0)
(set-option :smt.restart_strategy 0)
(set-option :smt.restart_factor |1.5|)
(set-option :smt.arith.random_initial_value true)
(set-option :smt.case_split 3)
(set-option :smt.delay_units true)
(set-option :smt.delay_units_threshold 16)
(set-option :nnf.sk_hack true)
(set-option :smt.qi.eager_threshold 100)
(set-option :smt.qi.cost "(+ weight generation)")
(set-option :type_check true)
(set-option :smt.bv.reflect true)
; 
; ; /preamble.smt2
(declare-datatypes () ((
    $Snap ($Snap.unit)
    ($Snap.combine ($Snap.first $Snap) ($Snap.second $Snap)))))
(declare-sort $Ref 0)
(declare-const $Ref.null $Ref)
(define-sort $Perm () Real)
(define-const $Perm.Write $Perm 1.0)
(define-const $Perm.No $Perm 0.0)
(define-fun $Perm.isValidVar ((p $Perm)) Bool
	(<= $Perm.No p))
(define-fun $Perm.isReadVar ((p $Perm) (ub $Perm)) Bool
    (and ($Perm.isValidVar p)
         (not (= p $Perm.No))
         (< p $Perm.Write)))
(define-fun $Perm.min ((p1 $Perm) (p2 $Perm)) Real
    (ite (<= p1 p2) p1 p2))
(define-fun $Math.min ((a Int) (b Int)) Int
    (ite (<= a b) a b))
(define-fun $Math.clip ((a Int)) Int
    (ite (< a 0) 0 a))
; ////////// Sorts
(declare-sort Nat)
(declare-sort $FVF<$Ref>)
(declare-sort Set<$Snap>)
(declare-sort $PSF<$Snap>)
; ////////// Sort wrappers
; Declaring additional sort wrappers
(declare-fun $SortWrappers.IntTo$Snap (Int) $Snap)
(declare-fun $SortWrappers.$SnapToInt ($Snap) Int)
(assert (forall ((x Int)) (!
    (= x ($SortWrappers.$SnapToInt($SortWrappers.IntTo$Snap x)))
    :pattern (($SortWrappers.IntTo$Snap x))
    :qid |$Snap.Int|
    )))
(declare-fun $SortWrappers.BoolTo$Snap (Bool) $Snap)
(declare-fun $SortWrappers.$SnapToBool ($Snap) Bool)
(assert (forall ((x Bool)) (!
    (= x ($SortWrappers.$SnapToBool($SortWrappers.BoolTo$Snap x)))
    :pattern (($SortWrappers.BoolTo$Snap x))
    :qid |$Snap.Bool|
    )))
(declare-fun $SortWrappers.$RefTo$Snap ($Ref) $Snap)
(declare-fun $SortWrappers.$SnapTo$Ref ($Snap) $Ref)
(assert (forall ((x $Ref)) (!
    (= x ($SortWrappers.$SnapTo$Ref($SortWrappers.$RefTo$Snap x)))
    :pattern (($SortWrappers.$RefTo$Snap x))
    :qid |$Snap.$Ref|
    )))
(declare-fun $SortWrappers.$PermTo$Snap ($Perm) $Snap)
(declare-fun $SortWrappers.$SnapTo$Perm ($Snap) $Perm)
(assert (forall ((x $Perm)) (!
    (= x ($SortWrappers.$SnapTo$Perm($SortWrappers.$PermTo$Snap x)))
    :pattern (($SortWrappers.$PermTo$Snap x))
    :qid |$Snap.$Perm|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.NatTo$Snap (Nat) $Snap)
(declare-fun $SortWrappers.$SnapToNat ($Snap) Nat)
(assert (forall ((x Nat)) (!
    (= x ($SortWrappers.$SnapToNat($SortWrappers.NatTo$Snap x)))
    :pattern (($SortWrappers.NatTo$Snap x))
    :qid |$Snap.Nat|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<$Ref>To$Snap ($FVF<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<$Ref> ($Snap) $FVF<$Ref>)
(assert (forall ((x $FVF<$Ref>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<$Ref>($SortWrappers.$FVF<$Ref>To$Snap x)))
    :pattern (($SortWrappers.$FVF<$Ref>To$Snap x))
    :qid |$Snap.$FVF<$Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.Set<$Snap>|
    )))
(declare-fun $SortWrappers.$PSF<$Snap>To$Snap ($PSF<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<$Snap> ($Snap) $PSF<$Snap>)
(assert (forall ((x $PSF<$Snap>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<$Snap>($SortWrappers.$PSF<$Snap>To$Snap x)))
    :pattern (($SortWrappers.$PSF<$Snap>To$Snap x))
    :qid |$Snap.$PSF<$Snap>|
    )))
; ////////// Symbols
(declare-fun plusL (Nat Nat) Nat)
(declare-fun plus (Nat Nat) Nat)
(declare-fun pred (Nat) Nat)
(declare-fun tag (Nat) Int)
(declare-fun sign (Nat) Int)
(declare-fun succ (Nat) Nat)
(declare-const zero Nat)
; /dafny_axioms/qpp_sets_declarations_dafny.smt2 [Snap]
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((m Nat) (n Nat)) (!
  (= (plus (succ m) n) (succ (plus m n)))
  :pattern ((plus (succ m) n))
  :qid |prog.plus_succ|)))
(assert (forall ((n Nat)) (!
  (= (plus (as zero  Nat) n) n)
  :pattern ((plus (as zero  Nat) n))
  :qid |prog.plus_zero|)))
(assert (forall ((m Nat) (n Nat)) (!
  (= (plus m n) (plusL m n))
  :pattern ((plus m n))
  :qid |prog.plusL_def|)))
(assert (forall ((m Nat) (n Nat)) (!
  (= (plus m n) (ite (= (tag m) 0) n (succ (plusL (pred m) n))))
  :pattern ((plus m n))
  :qid |prog.plus_def|)))
(assert (forall ((m Nat)) (!
  (implies (= (tag m) 1) (= (succ (pred m)) m))
  :pattern ((pred m))
  :qid |prog.succ_pred|)))
(assert (forall ((m Nat)) (!
  (= (pred (succ m)) m)
  :pattern ((succ m))
  :qid |prog.pred_succ|)))
(assert (forall ((a Nat)) (!
  (or
    (and (= (tag a) 0) (= a (as zero  Nat)))
    (and (= (tag a) 1) (exists ((b Nat)) (! (= a (succ b))  ))))
  :pattern ((tag a))
  :qid |prog.tag_cases|)))
(assert (forall ((a Nat)) (!
  (= (sign a) (ite (= (tag a) 0) 0 1))
  :pattern ((sign a))
  :qid |prog.sign_def|)))
(assert (forall ((a Nat)) (!
  (= (sign (succ a)) 1)
  :pattern ((sign (succ a)))
  :qid |prog.sign_alt|)))
(assert (= (sign (as zero  Nat)) 0))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
