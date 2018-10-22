(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :AUTO_CONFIG false)
(set-option :pp.bv_literals false)
(set-option :MODEL.V2 true)
(set-option :smt.PHASE_SELECTION 0)
(set-option :smt.RESTART_STRATEGY 0)
(set-option :smt.RESTART_FACTOR |1.5|)
(set-option :smt.ARITH.RANDOM_INITIAL_VALUE true)
(set-option :smt.CASE_SPLIT 3)
(set-option :smt.DELAY_UNITS true)
(set-option :NNF.SK_HACK true)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :TYPE_CHECK true)
(set-option :smt.BV.REFLECT true)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-datatypes () ((T@Invoc (invoc (|k#invoc| Int) ) ) ))
(declare-datatypes () ((T@PendingAsync (PendingAsync_spec_return (|this#PendingAsync_spec_return| T@Invoc) ) (PendingAsync_put (|k#PendingAsync_put| Int) (|v#PendingAsync_put| Int) (|this#PendingAsync_put| T@Invoc) ) PendingAsync_test ) ))
; Invalid
(declare-fun %lbl%+0 () Bool)
(declare-fun %lbl%@1 () Bool)
(declare-fun og_pc@0 () Bool)
(declare-sort T@SetInvoc 0)
(declare-fun vis@0 () (Array T@Invoc T@SetInvoc))
(declare-fun pendingAsyncMultiset@0 () (Array T@PendingAsync Int))
(declare-fun my_vis () T@SetInvoc)
(declare-fun hb (T@Invoc T@Invoc) Bool)
(declare-fun %lbl%@2 () Bool)
(declare-fun og_pc@1 () Bool)
(declare-fun og_ok@1 () Bool)
(declare-fun og_ok@0 () Bool)
(declare-fun %lbl%@3 () Bool)
(declare-fun %lbl%+4 () Bool)
(declare-fun %lbl%+5 () Bool)
(declare-fun %lbl%+6 () Bool)
(declare-fun linear_this_available@2 () (Array T@Invoc Bool))
(declare-fun inline$Impl_YieldChecker_put_1$0$this@0 () T@Invoc)
(declare-fun og_global_old_called@0 () (Array T@Invoc Bool))
(declare-fun %lbl%@7 () Bool)
(declare-fun called@1 () (Array T@Invoc Bool))
(declare-fun %lbl%+8 () Bool)
(declare-fun linear_this_available@1 () (Array T@Invoc Bool))
(declare-fun called@0 () (Array T@Invoc Bool))
(declare-fun %lbl%+9 () Bool)
(declare-fun %lbl%@10 () Bool)
(declare-fun vis () (Array T@Invoc T@SetInvoc))
(declare-fun pendingAsyncMultiset () (Array T@PendingAsync Int))
(declare-fun %lbl%@11 () Bool)
(declare-fun %lbl%+12 () Bool)
(declare-fun linear_this_available@0 () (Array T@Invoc Bool))
(declare-fun called () (Array T@Invoc Bool))
(declare-fun %lbl%+13 () Bool)
(declare-fun %lbl%+14 () Bool)
(push 1)
(set-info :boogie-vc-id test_1)
(assert (not
(let ((anon07_correct  (=> (! (and %lbl%+0 true) :lblpos +0) (and (! (or %lbl%@1  (or og_pc@0 (or (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (exists ((|#tmp_0| T@Invoc) ) (!  (and (and (and (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (= my_vis my_vis)) (forall ((second_j T@Invoc) ) (!  (=> (hb second_j |#tmp_0|) (= (select vis@0 second_j) (select vis@0 |#tmp_0|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0|)))
 :qid |unknown.0:0|
 :skolemid |4|
))))) :lblneg @1) (=> (or og_pc@0 (or (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (exists ((|#tmp_0@@0| T@Invoc) ) (!  (and (and (and (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (= my_vis my_vis)) (forall ((second_j@@0 T@Invoc) ) (!  (=> (hb second_j@@0 |#tmp_0@@0|) (= (select vis@0 second_j@@0) (select vis@0 |#tmp_0@@0|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@0|)))
 :qid |unknown.0:0|
 :skolemid |4|
)))) (and (! (or %lbl%@2  (=> og_pc@0 (and (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (= my_vis my_vis)))) :lblneg @2) (=> (=> og_pc@0 (and (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (= my_vis my_vis))) (=> (and (and (=> og_pc@1 (=> (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) og_pc@0)) (=> (=> (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) og_pc@0) og_pc@1)) (and (=> og_ok@1 (or og_ok@0 (exists ((|#tmp_0@@1| T@Invoc) ) (!  (and (and (and (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (= my_vis my_vis)) (forall ((second_j@@1 T@Invoc) ) (!  (=> (hb second_j@@1 |#tmp_0@@1|) (= (select vis@0 second_j@@1) (select vis@0 |#tmp_0@@1|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@1|)))
 :qid |unknown.0:0|
 :skolemid |4|
)))) (=> (or og_ok@0 (exists ((|#tmp_0@@2| T@Invoc) ) (!  (and (and (and (and (= vis@0 vis@0) (= pendingAsyncMultiset@0 pendingAsyncMultiset@0)) (= my_vis my_vis)) (forall ((second_j@@2 T@Invoc) ) (!  (=> (hb second_j@@2 |#tmp_0@@2|) (= (select vis@0 second_j@@2) (select vis@0 |#tmp_0@@2|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@2|)))
 :qid |unknown.0:0|
 :skolemid |4|
))) og_ok@1))) (! (or %lbl%@3 og_ok@1) :lblneg @3)))))))))
(let ((CallToYieldProc$1_correct  (=> (! (and %lbl%+4 true) :lblpos +4) true)))
(let ((inline$Impl_YieldChecker_put_1$0$L1_correct  (=> (! (and %lbl%+5 true) :lblpos +5) true)))
(let ((inline$Impl_YieldChecker_put_1$0$L0_correct  (=> (! (and %lbl%+6 true) :lblpos +6) (=> (and (exists ((partition_this (Array T@Invoc Int)) ) (!  (and (= ((_ map =>) linear_this_available@2 ((_ map (= (Int Int) Bool)) partition_this ((as const (Array T@Invoc Int)) 0))) ((as const (Array T@Invoc Bool)) true)) (= ((_ map =>) (store ((as const (Array T@Invoc Bool)) false) inline$Impl_YieldChecker_put_1$0$this@0 true) ((_ map (= (Int Int) Bool)) partition_this ((as const (Array T@Invoc Int)) 1))) ((as const (Array T@Invoc Bool)) true)))
 :qid |unknown.0:0|
 :skolemid |1|
)) (select og_global_old_called@0 inline$Impl_YieldChecker_put_1$0$this@0)) (! (or %lbl%@7 (select called@1 inline$Impl_YieldChecker_put_1$0$this@0)) :lblneg @7)))))
(let ((anon00_@2_CallToYieldProc_correct  (=> (! (and %lbl%+8 true) :lblpos +8) (=> (= linear_this_available@2 linear_this_available@1) (=> (and (= og_global_old_called@0 called@0) (= called@1 called@0)) (and (and inline$Impl_YieldChecker_put_1$0$L0_correct inline$Impl_YieldChecker_put_1$0$L1_correct) CallToYieldProc$1_correct))))))
(let ((anon00_correct  (=> (! (and %lbl%+9 true) :lblpos +9) (and (! (or %lbl%@10  (or false (or (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (exists ((|#tmp_0@@3| T@Invoc) ) (!  (and (and (and (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (= my_vis my_vis)) (forall ((second_j@@3 T@Invoc) ) (!  (=> (hb second_j@@3 |#tmp_0@@3|) (= (select vis second_j@@3) (select vis |#tmp_0@@3|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@3|)))
 :qid |unknown.0:0|
 :skolemid |4|
))))) :lblneg @10) (=> (or false (or (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (exists ((|#tmp_0@@4| T@Invoc) ) (!  (and (and (and (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (= my_vis my_vis)) (forall ((second_j@@4 T@Invoc) ) (!  (=> (hb second_j@@4 |#tmp_0@@4|) (= (select vis second_j@@4) (select vis |#tmp_0@@4|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@4|)))
 :qid |unknown.0:0|
 :skolemid |4|
)))) (and (! (or %lbl%@11  (=> false (and (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (= my_vis my_vis)))) :lblneg @11) (=> (=> false (and (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (= my_vis my_vis))) (=> (and (and (and (=> og_pc@0 (=> (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) false)) (=> (=> (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) false) og_pc@0)) (and (=> og_ok@0 (or false (exists ((|#tmp_0@@5| T@Invoc) ) (!  (and (and (and (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (= my_vis my_vis)) (forall ((second_j@@5 T@Invoc) ) (!  (=> (hb second_j@@5 |#tmp_0@@5|) (= (select vis second_j@@5) (select vis |#tmp_0@@5|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@5|)))
 :qid |unknown.0:0|
 :skolemid |4|
)))) (=> (or false (exists ((|#tmp_0@@6| T@Invoc) ) (!  (and (and (and (and (= vis vis) (= pendingAsyncMultiset pendingAsyncMultiset)) (= my_vis my_vis)) (forall ((second_j@@6 T@Invoc) ) (!  (=> (hb second_j@@6 |#tmp_0@@6|) (= (select vis second_j@@6) (select vis |#tmp_0@@6|)))
 :qid |unknown.0:0|
 :skolemid |0|
))) (= 0 (|k#invoc| |#tmp_0@@6|)))
 :qid |unknown.0:0|
 :skolemid |4|
))) og_ok@0))) (and (or og_pc@0 true) (= linear_this_available@1 ((as const (Array T@Invoc Bool)) false)))) (and anon07_correct anon00_@2_CallToYieldProc_correct)))))))))
(let ((anon0_@2_CallToYieldProc_correct  (=> (! (and %lbl%+12 true) :lblpos +12) (=> (= linear_this_available@2 linear_this_available@0) (=> (and (= og_global_old_called@0 called) (= called@1 called)) (and (and inline$Impl_YieldChecker_put_1$0$L0_correct inline$Impl_YieldChecker_put_1$0$L1_correct) CallToYieldProc$1_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+13 true) :lblpos +13) (=> (= linear_this_available@0 ((as const (Array T@Invoc Bool)) false)) (and anon00_correct anon0_@2_CallToYieldProc_correct)))))
(let ((PreconditionGeneratedEntry_correct  (=> (! (and %lbl%+14 true) :lblpos +14) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
