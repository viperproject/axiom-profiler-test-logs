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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
(declare-const x@0@04 Nat)
(declare-const y@1@04 Nat)
(declare-const z@2@04 Nat)
(declare-const x@3@04 Nat)
(declare-const y@4@04 Nat)
(declare-const z@5@04 Nat)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert sign(succ(zero())) == 1
; [eval] sign(succ(zero())) == 1
; [eval] sign(succ(zero()))
; [eval] succ(zero())
; [eval] zero()
(set-option :timeout 0)
(push) ; 3
(assert (not (= (sign (succ (as zero  Nat))) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= (sign (succ (as zero  Nat))) 1))
; [exec]
; assert x != zero() ==> sign(x) == 1
; [eval] x != zero() ==> sign(x) == 1
; [eval] x != zero()
; [eval] zero()
(push) ; 3
(set-option :timeout 10)
(push) ; 4
(assert (not (= x@3@04 (as zero  Nat))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (not (= x@3@04 (as zero  Nat)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | x@3@04 != zero | live]
; [else-branch: 0 | x@3@04 == zero | live]
(push) ; 4
; [then-branch: 0 | x@3@04 != zero]
(assert (not (= x@3@04 (as zero  Nat))))
; [eval] sign(x) == 1
; [eval] sign(x)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@3@04 == zero]
(assert (= x@3@04 (as zero  Nat)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (implies (not (= x@3@04 (as zero  Nat))) (= (sign x@3@04) 1))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (implies (not (= x@3@04 (as zero  Nat))) (= (sign x@3@04) 1)))
; [exec]
; assert (forall n: Nat :: { sign(n) } sign(n) == 0 || sign(n) == 1)
; [eval] (forall n: Nat :: { sign(n) } sign(n) == 0 || sign(n) == 1)
(declare-const n@6@04 Nat)
(push) ; 3
; [eval] sign(n) == 0 || sign(n) == 1
; [eval] sign(n) == 0
; [eval] sign(n)
; [eval] !v@7@04 && sign(n) == 1
; [eval] !v@7@04
; [eval] v@8@04 ==> sign(n) == 1
(push) ; 4
; [then-branch: 1 | sign(n@6@04) != 0 | live]
; [else-branch: 1 | sign(n@6@04) == 0 | live]
(push) ; 5
; [then-branch: 1 | sign(n@6@04) != 0]
(assert (not (= (sign n@6@04) 0)))
; [eval] sign(n) == 1
; [eval] sign(n)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | sign(n@6@04) == 0]
(assert (= (sign n@6@04) 0))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(pop) ; 3
; Nested auxiliary terms
(push) ; 3
(assert (not (forall ((n@6@04 Nat)) (!
  (or
    (= (sign n@6@04) 0)
    (and
      (not (= (sign n@6@04) 0))
      (implies (not (= (sign n@6@04) 0)) (= (sign n@6@04) 1))))
  :pattern ((sign n@6@04))
  :qid |prog.l65|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((n@6@04 Nat)) (!
  (or
    (= (sign n@6@04) 0)
    (and
      (not (= (sign n@6@04) 0))
      (implies (not (= (sign n@6@04) 0)) (= (sign n@6@04) 1))))
  :pattern ((sign n@6@04))
  :qid |prog.l65|)))
; [exec]
; assert sign(y) != 0 ==> sign(plus(x, y)) != 0
; [eval] sign(y) != 0 ==> sign(plus(x, y)) != 0
; [eval] sign(y) != 0
; [eval] sign(y)
(push) ; 3
(set-option :timeout 10)
(push) ; 4
(assert (not (= (sign y@4@04) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (not (= (sign y@4@04) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | sign(y@4@04) != 0 | live]
; [else-branch: 2 | sign(y@4@04) == 0 | live]
(push) ; 4
; [then-branch: 2 | sign(y@4@04) != 0]
(assert (not (= (sign y@4@04) 0)))
; [eval] sign(plus(x, y)) != 0
; [eval] sign(plus(x, y))
; [eval] plus(x, y)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | sign(y@4@04) == 0]
(assert (= (sign y@4@04) 0))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (implies (not (= (sign y@4@04) 0)) (not (= (sign (plus x@3@04 y@4@04)) 0)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (implies (not (= (sign y@4@04) 0)) (not (= (sign (plus x@3@04 y@4@04)) 0))))
; [exec]
; assert plus(succ(zero()), succ(zero())) == succ(succ(zero()))
; [eval] plus(succ(zero()), succ(zero())) == succ(succ(zero()))
; [eval] plus(succ(zero()), succ(zero()))
; [eval] succ(zero())
; [eval] zero()
; [eval] succ(zero())
; [eval] zero()
; [eval] succ(succ(zero()))
; [eval] succ(zero())
; [eval] zero()
(push) ; 3
(assert (not (=
  (plus (succ (as zero  Nat)) (succ (as zero  Nat)))
  (succ (succ (as zero  Nat))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (plus (succ (as zero  Nat)) (succ (as zero  Nat)))
  (succ (succ (as zero  Nat)))))
; [exec]
; assert (forall m: Nat, n: Nat :: { plus(zero(), plus(m, n)) } plus(zero(), plus(m, n)) == plus(plus(zero(), m), n))
; [eval] (forall m: Nat, n: Nat :: { plus(zero(), plus(m, n)) } plus(zero(), plus(m, n)) == plus(plus(zero(), m), n))
(declare-const m@9@04 Nat)
(declare-const n@10@04 Nat)
(push) ; 3
; [eval] plus(zero(), plus(m, n)) == plus(plus(zero(), m), n)
; [eval] plus(zero(), plus(m, n))
; [eval] zero()
; [eval] plus(m, n)
; [eval] plus(plus(zero(), m), n)
; [eval] plus(zero(), m)
; [eval] zero()
(pop) ; 3
; Nested auxiliary terms
(push) ; 3
(assert (not (forall ((m@9@04 Nat) (n@10@04 Nat)) (!
  (=
    (plus (as zero  Nat) (plus m@9@04 n@10@04))
    (plus (plus (as zero  Nat) m@9@04) n@10@04))
  :pattern ((plus (as zero  Nat) (plus m@9@04 n@10@04)))
  :qid |prog.l70|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((m@9@04 Nat) (n@10@04 Nat)) (!
  (=
    (plus (as zero  Nat) (plus m@9@04 n@10@04))
    (plus (plus (as zero  Nat) m@9@04) n@10@04))
  :pattern ((plus (as zero  Nat) (plus m@9@04 n@10@04)))
  :qid |prog.l70|)))
; [exec]
; assert (forall p: Nat :: { plus(p, plus(y, z)) } { plus(plus(p, y), z) } { plus(succ(p), plus(y, z)) } { plus(plus(succ(p), y), z) } plus(p, plus(y, z)) == plus(plus(p, y), z) ==> plus(succ(p), plus(y, z)) == plus(plus(succ(p), y), z))
; [eval] (forall p: Nat :: { plus(p, plus(y, z)) } { plus(plus(p, y), z) } { plus(succ(p), plus(y, z)) } { plus(plus(succ(p), y), z) } plus(p, plus(y, z)) == plus(plus(p, y), z) ==> plus(succ(p), plus(y, z)) == plus(plus(succ(p), y), z))
(declare-const p@11@04 Nat)
(push) ; 3
; [eval] plus(p, plus(y, z)) == plus(plus(p, y), z) ==> plus(succ(p), plus(y, z)) == plus(plus(succ(p), y), z)
; [eval] plus(p, plus(y, z)) == plus(plus(p, y), z)
; [eval] plus(p, plus(y, z))
; [eval] plus(y, z)
; [eval] plus(plus(p, y), z)
; [eval] plus(p, y)
(push) ; 4
; [then-branch: 3 | plus(p@11@04, plus(y@4@04, z@5@04)) == plus(plus(p@11@04, y@4@04), z@5@04) | live]
; [else-branch: 3 | plus(p@11@04, plus(y@4@04, z@5@04)) != plus(plus(p@11@04, y@4@04), z@5@04) | live]
(push) ; 5
; [then-branch: 3 | plus(p@11@04, plus(y@4@04, z@5@04)) == plus(plus(p@11@04, y@4@04), z@5@04)]
(assert (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04)))
; [eval] plus(succ(p), plus(y, z)) == plus(plus(succ(p), y), z)
; [eval] plus(succ(p), plus(y, z))
; [eval] succ(p)
; [eval] plus(y, z)
; [eval] plus(plus(succ(p), y), z)
; [eval] plus(succ(p), y)
; [eval] succ(p)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | plus(p@11@04, plus(y@4@04, z@5@04)) != plus(plus(p@11@04, y@4@04), z@5@04)]
(assert (not (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(pop) ; 3
; Nested auxiliary terms
(push) ; 3
(assert (not (and
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus p@11@04 (plus y@4@04 z@5@04)))
    :qid |prog.l73|))
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus (plus p@11@04 y@4@04) z@5@04))
    :qid |prog.l73|))
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus (succ p@11@04) (plus y@4@04 z@5@04)))
    :qid |prog.l73|))
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus (plus (succ p@11@04) y@4@04) z@5@04))
    :qid |prog.l73|)))))
(check-sat)
; unsat
(pop) ; 3
; 0.04s
; (get-info :all-statistics)
(assert (and
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus p@11@04 (plus y@4@04 z@5@04)))
    :qid |prog.l73|))
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus (plus p@11@04 y@4@04) z@5@04))
    :qid |prog.l73|))
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus (succ p@11@04) (plus y@4@04 z@5@04)))
    :qid |prog.l73|))
  (forall ((p@11@04 Nat)) (!
    (implies
      (= (plus p@11@04 (plus y@4@04 z@5@04)) (plus (plus p@11@04 y@4@04) z@5@04))
      (=
        (plus (succ p@11@04) (plus y@4@04 z@5@04))
        (plus (plus (succ p@11@04) y@4@04) z@5@04)))
    :pattern ((plus (plus (succ p@11@04) y@4@04) z@5@04))
    :qid |prog.l73|))))
; [exec]
; assert plus(x, plus(y, z)) == plus(plus(x, y), z)
; [eval] plus(x, plus(y, z)) == plus(plus(x, y), z)
; [eval] plus(x, plus(y, z))
; [eval] plus(y, z)
; [eval] plus(plus(x, y), z)
; [eval] plus(x, y)
(push) ; 3
(assert (not (= (plus x@3@04 (plus y@4@04 z@5@04)) (plus (plus x@3@04 y@4@04) z@5@04))))
(check-sat)
; unknown
(pop) ; 3
; 3.47s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] plus(x, plus(y, z)) == plus(plus(x, y), z)
; [eval] plus(x, plus(y, z))
; [eval] plus(y, z)
; [eval] plus(plus(x, y), z)
; [eval] plus(x, y)
(set-option :timeout 0)
(push) ; 3
(assert (not (= (plus x@3@04 (plus y@4@04 z@5@04)) (plus (plus x@3@04 y@4@04) z@5@04))))
(check-sat)
; unknown
(pop) ; 3
; timeout
