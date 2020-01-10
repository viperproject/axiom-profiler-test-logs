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


(set-info :category "industrial")
(declare-sort |T@U| 0)
(declare-sort |T@T| 0)
(declare-fun real_pow (Real Real) Real)
(declare-fun UOrdering2 (|T@U| |T@U|) Bool)
(declare-fun UOrdering3 (|T@T| |T@U| |T@U|) Bool)
(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun Ctor (T@T) Int)
(declare-fun intType () T@T)
(declare-fun realType () T@T)
(declare-fun boolType () T@T)
(declare-fun rmodeType () T@T)
(declare-fun int_2_U (Int) T@U)
(declare-fun U_2_int (T@U) Int)
(declare-fun type (T@U) T@T)
(declare-fun real_2_U (Real) T@U)
(declare-fun U_2_real (T@U) Real)
(declare-fun bool_2_U (Bool) T@U)
(declare-fun U_2_bool (T@U) Bool)
(declare-fun rmode_2_U (RoundingMode) T@U)
(declare-fun U_2_rmode (T@U) RoundingMode)
(declare-fun RefType () T@T)
(declare-fun FieldType (T@T T@T) T@T)
(declare-fun FieldTypeInv0 (T@T) T@T)
(declare-fun FieldTypeInv1 (T@T) T@T)
(declare-fun NormalFieldType () T@T)
(declare-fun MapType0Type (T@T) T@T)
(declare-fun MapType0TypeInv0 (T@T) T@T)
(declare-fun MapType0Select (T@U T@U T@U) T@U)
(declare-fun MapType0Store (T@U T@U T@U T@U) T@U)
(declare-fun null () T@U)
(declare-fun $allocated () T@U)
(declare-fun MapType1Type (T@T T@T) T@T)
(declare-fun MapType1TypeInv0 (T@T) T@T)
(declare-fun MapType1TypeInv1 (T@T) T@T)
(declare-fun MapType1Select (T@U T@U T@U) T@U)
(declare-fun MapType1Store (T@U T@U T@U T@U) T@U)
(declare-fun IdenticalOnKnownLocations (T@U T@U T@U) Bool)
(declare-fun HasDirectPerm (T@U T@U T@U) Bool)
(declare-fun FrameTypeType () T@T)
(declare-fun PredicateMaskField (T@U) T@U)
(declare-fun IsPredicateField (T@U) Bool)
(declare-fun ZeroMask () T@U)
(declare-fun NoPerm () Real)
(declare-fun ZeroPMask () T@U)
(declare-fun FullPerm () Real)
(declare-fun state (T@U T@U) Bool)
(declare-fun GoodMask (T@U) Bool)
(declare-fun IsWandField (T@U) Bool)
(declare-fun sumMask (T@U T@U T@U) Bool)
(declare-fun ConditionalFrame (Real T@U) T@U)
(declare-fun EmptyFrame () T@U)
(declare-fun InsidePredicate (T@U T@U T@U T@U) Bool)
(declare-fun ProcessDomainTypeType () T@T)
(declare-fun p_seq (T@U T@U) T@U)
(declare-fun p_ping () T@U)
(declare-fun p_ping_omega () T@U)
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (= (Ctor intType) 0) (= (Ctor realType) 1)) (= (Ctor boolType) 2)) (= (Ctor rmodeType) 3)) (forall ((arg0 Int) ) (! (= (U_2_int (int_2_U arg0)) arg0)
 :qid |typeInv:U_2_int|
 :pattern ( (int_2_U arg0))
))) (forall ((x T@U) ) (!  (=> (= (type x) intType) (= (int_2_U (U_2_int x)) x))
 :qid |cast:U_2_int|
 :pattern ( (U_2_int x))
))) (forall ((arg0@@0 Int) ) (! (= (type (int_2_U arg0@@0)) intType)
 :qid |funType:int_2_U|
 :pattern ( (int_2_U arg0@@0))
))) (forall ((arg0@@1 Real) ) (! (= (U_2_real (real_2_U arg0@@1)) arg0@@1)
 :qid |typeInv:U_2_real|
 :pattern ( (real_2_U arg0@@1))
))) (forall ((x@@0 T@U) ) (!  (=> (= (type x@@0) realType) (= (real_2_U (U_2_real x@@0)) x@@0))
 :qid |cast:U_2_real|
 :pattern ( (U_2_real x@@0))
))) (forall ((arg0@@2 Real) ) (! (= (type (real_2_U arg0@@2)) realType)
 :qid |funType:real_2_U|
 :pattern ( (real_2_U arg0@@2))
))) (forall ((arg0@@3 Bool) ) (! (= (U_2_bool (bool_2_U arg0@@3)) arg0@@3)
 :qid |typeInv:U_2_bool|
 :pattern ( (bool_2_U arg0@@3))
))) (forall ((x@@1 T@U) ) (!  (=> (= (type x@@1) boolType) (= (bool_2_U (U_2_bool x@@1)) x@@1))
 :qid |cast:U_2_bool|
 :pattern ( (U_2_bool x@@1))
))) (forall ((arg0@@4 Bool) ) (! (= (type (bool_2_U arg0@@4)) boolType)
 :qid |funType:bool_2_U|
 :pattern ( (bool_2_U arg0@@4))
))) (forall ((arg0@@5 RoundingMode) ) (! (= (U_2_rmode (rmode_2_U arg0@@5)) arg0@@5)
 :qid |typeInv:U_2_rmode|
 :pattern ( (rmode_2_U arg0@@5))
))) (forall ((x@@2 T@U) ) (!  (=> (= (type x@@2) rmodeType) (= (rmode_2_U (U_2_rmode x@@2)) x@@2))
 :qid |cast:U_2_rmode|
 :pattern ( (U_2_rmode x@@2))
))) (forall ((arg0@@6 RoundingMode) ) (! (= (type (rmode_2_U arg0@@6)) rmodeType)
 :qid |funType:rmode_2_U|
 :pattern ( (rmode_2_U arg0@@6))
))))
(assert (forall ((x@@3 T@U) ) (! (UOrdering2 x@@3 x@@3)
 :qid |bg:subtype-refl|
 :no-pattern (U_2_int x@@3)
 :no-pattern (U_2_bool x@@3)
)))
(assert (forall ((x@@4 T@U) (y T@U) (z T@U) ) (! (let ((alpha (type x@@4)))
 (=> (and (and (= (type y) alpha) (= (type z) alpha)) (and (UOrdering2 x@@4 y) (UOrdering2 y z))) (UOrdering2 x@@4 z)))
 :qid |bg:subtype-trans|
 :pattern ( (UOrdering2 x@@4 y) (UOrdering2 y z))
)))
(assert (forall ((x@@5 T@U) (y@@0 T@U) ) (! (let ((alpha@@0 (type x@@5)))
 (=> (= (type y@@0) alpha@@0) (=> (and (UOrdering2 x@@5 y@@0) (UOrdering2 y@@0 x@@5)) (= x@@5 y@@0))))
 :qid |bg:subtype-antisymm|
 :pattern ( (UOrdering2 x@@5 y@@0) (UOrdering2 y@@0 x@@5))
)))
(assert  (and (and (and (and (and (and (and (and (and (and (and (and (= (Ctor RefType) 4) (forall ((arg0@@7 T@T) (arg1 T@T) ) (! (= (Ctor (FieldType arg0@@7 arg1)) 5)
 :qid |ctor:FieldType|
))) (forall ((arg0@@8 T@T) (arg1@@0 T@T) ) (! (= (FieldTypeInv0 (FieldType arg0@@8 arg1@@0)) arg0@@8)
 :qid |typeInv:FieldTypeInv0|
 :pattern ( (FieldType arg0@@8 arg1@@0))
))) (forall ((arg0@@9 T@T) (arg1@@1 T@T) ) (! (= (FieldTypeInv1 (FieldType arg0@@9 arg1@@1)) arg1@@1)
 :qid |typeInv:FieldTypeInv1|
 :pattern ( (FieldType arg0@@9 arg1@@1))
))) (= (Ctor NormalFieldType) 6)) (forall ((arg0@@10 T@T) ) (! (= (Ctor (MapType0Type arg0@@10)) 7)
 :qid |ctor:MapType0Type|
))) (forall ((arg0@@11 T@T) ) (! (= (MapType0TypeInv0 (MapType0Type arg0@@11)) arg0@@11)
 :qid |typeInv:MapType0TypeInv0|
 :pattern ( (MapType0Type arg0@@11))
))) (forall ((arg0@@12 T@U) (arg1@@2 T@U) (arg2 T@U) ) (! (let ((B (FieldTypeInv1 (type arg2))))
(= (type (MapType0Select arg0@@12 arg1@@2 arg2)) B))
 :qid |funType:MapType0Select|
 :pattern ( (MapType0Select arg0@@12 arg1@@2 arg2))
))) (forall ((arg0@@13 T@U) (arg1@@3 T@U) (arg2@@0 T@U) (arg3 T@U) ) (! (let ((aVar0 (type arg1@@3)))
(= (type (MapType0Store arg0@@13 arg1@@3 arg2@@0 arg3)) (MapType0Type aVar0)))
 :qid |funType:MapType0Store|
 :pattern ( (MapType0Store arg0@@13 arg1@@3 arg2@@0 arg3))
))) (forall ((m T@U) (x0 T@U) (x1 T@U) (val T@U) ) (! (let ((B@@0 (FieldTypeInv1 (type x1))))
 (=> (= (type val) B@@0) (= (MapType0Select (MapType0Store m x0 x1 val) x0 x1) val)))
 :qid |mapAx0:MapType0Select|
 :weight 0
))) (and (and (forall ((val@@0 T@U) (m@@0 T@U) (x0@@0 T@U) (x1@@0 T@U) (y0 T@U) (y1 T@U) ) (!  (or (= x0@@0 y0) (= (MapType0Select (MapType0Store m@@0 x0@@0 x1@@0 val@@0) y0 y1) (MapType0Select m@@0 y0 y1)))
 :qid |mapAx1:MapType0Select:0|
 :weight 0
)) (forall ((val@@1 T@U) (m@@1 T@U) (x0@@1 T@U) (x1@@1 T@U) (y0@@0 T@U) (y1@@0 T@U) ) (!  (or (= x1@@1 y1@@0) (= (MapType0Select (MapType0Store m@@1 x0@@1 x1@@1 val@@1) y0@@0 y1@@0) (MapType0Select m@@1 y0@@0 y1@@0)))
 :qid |mapAx1:MapType0Select:1|
 :weight 0
))) (forall ((val@@2 T@U) (m@@2 T@U) (x0@@2 T@U) (x1@@2 T@U) (y0@@1 T@U) (y1@@1 T@U) ) (!  (or true (= (MapType0Select (MapType0Store m@@2 x0@@2 x1@@2 val@@2) y0@@1 y1@@1) (MapType0Select m@@2 y0@@1 y1@@1)))
 :qid |mapAx2:MapType0Select|
 :weight 0
)))) (= (type null) RefType)) (= (type $allocated) (FieldType NormalFieldType boolType))))
(assert (forall ((o T@U) (f T@U) (Heap T@U) ) (!  (=> (and (and (= (type o) RefType) (= (type f) (FieldType NormalFieldType RefType))) (= (type Heap) (MapType0Type RefType))) (or (= (MapType0Select Heap o f) null) (U_2_bool (MapType0Select Heap (MapType0Select Heap o f) $allocated))))
 :qid |carbon21.29:15|
 :skolemid |0|
 :pattern ( (MapType0Select Heap o f))
)))
(assert  (and (and (and (and (and (and (forall ((arg0@@14 T@T) (arg1@@4 T@T) ) (! (= (Ctor (MapType1Type arg0@@14 arg1@@4)) 8)
 :qid |ctor:MapType1Type|
)) (forall ((arg0@@15 T@T) (arg1@@5 T@T) ) (! (= (MapType1TypeInv0 (MapType1Type arg0@@15 arg1@@5)) arg0@@15)
 :qid |typeInv:MapType1TypeInv0|
 :pattern ( (MapType1Type arg0@@15 arg1@@5))
))) (forall ((arg0@@16 T@T) (arg1@@6 T@T) ) (! (= (MapType1TypeInv1 (MapType1Type arg0@@16 arg1@@6)) arg1@@6)
 :qid |typeInv:MapType1TypeInv1|
 :pattern ( (MapType1Type arg0@@16 arg1@@6))
))) (forall ((arg0@@17 T@U) (arg1@@7 T@U) (arg2@@1 T@U) ) (! (let ((aVar1 (MapType1TypeInv1 (type arg0@@17))))
(= (type (MapType1Select arg0@@17 arg1@@7 arg2@@1)) aVar1))
 :qid |funType:MapType1Select|
 :pattern ( (MapType1Select arg0@@17 arg1@@7 arg2@@1))
))) (forall ((arg0@@18 T@U) (arg1@@8 T@U) (arg2@@2 T@U) (arg3@@0 T@U) ) (! (let ((aVar1@@0 (type arg3@@0)))
(let ((aVar0@@0 (type arg1@@8)))
(= (type (MapType1Store arg0@@18 arg1@@8 arg2@@2 arg3@@0)) (MapType1Type aVar0@@0 aVar1@@0))))
 :qid |funType:MapType1Store|
 :pattern ( (MapType1Store arg0@@18 arg1@@8 arg2@@2 arg3@@0))
))) (forall ((m@@3 T@U) (x0@@3 T@U) (x1@@3 T@U) (val@@3 T@U) ) (! (let ((aVar1@@1 (MapType1TypeInv1 (type m@@3))))
 (=> (= (type val@@3) aVar1@@1) (= (MapType1Select (MapType1Store m@@3 x0@@3 x1@@3 val@@3) x0@@3 x1@@3) val@@3)))
 :qid |mapAx0:MapType1Select|
 :weight 0
))) (and (and (forall ((val@@4 T@U) (m@@4 T@U) (x0@@4 T@U) (x1@@4 T@U) (y0@@2 T@U) (y1@@2 T@U) ) (!  (or (= x0@@4 y0@@2) (= (MapType1Select (MapType1Store m@@4 x0@@4 x1@@4 val@@4) y0@@2 y1@@2) (MapType1Select m@@4 y0@@2 y1@@2)))
 :qid |mapAx1:MapType1Select:0|
 :weight 0
)) (forall ((val@@5 T@U) (m@@5 T@U) (x0@@5 T@U) (x1@@5 T@U) (y0@@3 T@U) (y1@@3 T@U) ) (!  (or (= x1@@5 y1@@3) (= (MapType1Select (MapType1Store m@@5 x0@@5 x1@@5 val@@5) y0@@3 y1@@3) (MapType1Select m@@5 y0@@3 y1@@3)))
 :qid |mapAx1:MapType1Select:1|
 :weight 0
))) (forall ((val@@6 T@U) (m@@6 T@U) (x0@@6 T@U) (x1@@6 T@U) (y0@@4 T@U) (y1@@4 T@U) ) (!  (or true (= (MapType1Select (MapType1Store m@@6 x0@@6 x1@@6 val@@6) y0@@4 y1@@4) (MapType1Select m@@6 y0@@4 y1@@4)))
 :qid |mapAx2:MapType1Select|
 :weight 0
)))))
(assert (forall ((Heap@@0 T@U) (ExhaleHeap T@U) (Mask T@U) (o@@0 T@U) (f_2 T@U) ) (! (let ((B@@1 (FieldTypeInv1 (type f_2))))
(let ((A (FieldTypeInv0 (type f_2))))
 (=> (and (and (and (and (and (and (= (type Heap@@0) (MapType0Type RefType)) (= (type ExhaleHeap) (MapType0Type RefType))) (= (type Mask) (MapType1Type RefType realType))) (= (type o@@0) RefType)) (= (type f_2) (FieldType A B@@1))) (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask)) (HasDirectPerm Mask o@@0 f_2)) (= (MapType0Select Heap@@0 o@@0 f_2) (MapType0Select ExhaleHeap o@@0 f_2)))))
 :qid |carbon21.38:22|
 :skolemid |1|
 :pattern ( (IdenticalOnKnownLocations Heap@@0 ExhaleHeap Mask) (MapType0Select ExhaleHeap o@@0 f_2))
)))
(assert  (and (= (Ctor FrameTypeType) 9) (forall ((arg0@@19 T@U) ) (! (let ((A@@0 (FieldTypeInv0 (type arg0@@19))))
(= (type (PredicateMaskField arg0@@19)) (FieldType A@@0 (MapType1Type RefType boolType))))
 :qid |funType:PredicateMaskField|
 :pattern ( (PredicateMaskField arg0@@19))
))))
(assert (forall ((Heap@@1 T@U) (ExhaleHeap@@0 T@U) (Mask@@0 T@U) (pm_f T@U) ) (! (let ((C (FieldTypeInv0 (type pm_f))))
 (=> (and (and (and (and (and (= (type Heap@@1) (MapType0Type RefType)) (= (type ExhaleHeap@@0) (MapType0Type RefType))) (= (type Mask@@0) (MapType1Type RefType realType))) (= (type pm_f) (FieldType C FrameTypeType))) (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@0)) (and (HasDirectPerm Mask@@0 null pm_f) (IsPredicateField pm_f))) (= (MapType0Select Heap@@1 null (PredicateMaskField pm_f)) (MapType0Select ExhaleHeap@@0 null (PredicateMaskField pm_f)))))
 :qid |carbon21.43:19|
 :skolemid |2|
 :pattern ( (IdenticalOnKnownLocations Heap@@1 ExhaleHeap@@0 Mask@@0) (IsPredicateField pm_f) (MapType0Select ExhaleHeap@@0 null (PredicateMaskField pm_f)))
)))
(assert (forall ((Heap@@2 T@U) (ExhaleHeap@@1 T@U) (Mask@@1 T@U) (pm_f@@0 T@U) ) (! (let ((C@@0 (FieldTypeInv0 (type pm_f@@0))))
 (=> (and (and (and (and (and (= (type Heap@@2) (MapType0Type RefType)) (= (type ExhaleHeap@@1) (MapType0Type RefType))) (= (type Mask@@1) (MapType1Type RefType realType))) (= (type pm_f@@0) (FieldType C@@0 FrameTypeType))) (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@1)) (and (HasDirectPerm Mask@@1 null pm_f@@0) (IsPredicateField pm_f@@0))) (forall ((o2 T@U) (f_2@@0 T@U) ) (! (let ((B@@2 (FieldTypeInv1 (type f_2@@0))))
(let ((A@@1 (FieldTypeInv0 (type f_2@@0))))
 (=> (and (and (= (type o2) RefType) (= (type f_2@@0) (FieldType A@@1 B@@2))) (U_2_bool (MapType1Select (MapType0Select Heap@@2 null (PredicateMaskField pm_f@@0)) o2 f_2@@0))) (= (MapType0Select Heap@@2 o2 f_2@@0) (MapType0Select ExhaleHeap@@1 o2 f_2@@0)))))
 :qid |carbon21.50:134|
 :skolemid |3|
 :pattern ( (MapType0Select ExhaleHeap@@1 o2 f_2@@0))
))))
 :qid |carbon21.48:19|
 :skolemid |4|
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@1) (MapType0Select Heap@@2 null (PredicateMaskField pm_f@@0)) (IsPredicateField pm_f@@0))
 :pattern ( (IdenticalOnKnownLocations Heap@@2 ExhaleHeap@@1 Mask@@1) (MapType0Select ExhaleHeap@@1 null (PredicateMaskField pm_f@@0)) (IsPredicateField pm_f@@0))
)))
(assert (forall ((Heap@@3 T@U) (ExhaleHeap@@2 T@U) (Mask@@2 T@U) (o@@1 T@U) ) (!  (=> (and (and (and (and (and (= (type Heap@@3) (MapType0Type RefType)) (= (type ExhaleHeap@@2) (MapType0Type RefType))) (= (type Mask@@2) (MapType1Type RefType realType))) (= (type o@@1) RefType)) (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@2)) (U_2_bool (MapType0Select Heap@@3 o@@1 $allocated))) (U_2_bool (MapType0Select ExhaleHeap@@2 o@@1 $allocated)))
 :qid |carbon21.56:15|
 :skolemid |5|
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@2) (MapType0Select Heap@@3 o@@1 $allocated))
 :pattern ( (IdenticalOnKnownLocations Heap@@3 ExhaleHeap@@2 Mask@@2) (MapType0Select ExhaleHeap@@2 o@@1 $allocated))
)))
(assert (= (type ZeroMask) (MapType1Type RefType realType)))
(assert (forall ((o_1 T@U) (f_3 T@U) ) (! (let ((B@@3 (FieldTypeInv1 (type f_3))))
(let ((A@@2 (FieldTypeInv0 (type f_3))))
 (=> (and (= (type o_1) RefType) (= (type f_3) (FieldType A@@2 B@@3))) (= (U_2_real (MapType1Select ZeroMask o_1 f_3)) NoPerm))))
 :qid |carbon21.69:22|
 :skolemid |6|
 :pattern ( (MapType1Select ZeroMask o_1 f_3))
)))
(assert (= (type ZeroPMask) (MapType1Type RefType boolType)))
(assert (forall ((o_1@@0 T@U) (f_3@@0 T@U) ) (! (let ((B@@4 (FieldTypeInv1 (type f_3@@0))))
(let ((A@@3 (FieldTypeInv0 (type f_3@@0))))
 (=> (and (= (type o_1@@0) RefType) (= (type f_3@@0) (FieldType A@@3 B@@4))) (not (U_2_bool (MapType1Select ZeroPMask o_1@@0 f_3@@0))))))
 :qid |carbon21.75:22|
 :skolemid |7|
 :pattern ( (MapType1Select ZeroPMask o_1@@0 f_3@@0))
)))
(assert (= NoPerm 0.0))
(assert (= FullPerm 1.0))
(assert (forall ((Heap@@4 T@U) (Mask@@3 T@U) ) (!  (=> (and (and (= (type Heap@@4) (MapType0Type RefType)) (= (type Mask@@3) (MapType1Type RefType realType))) (state Heap@@4 Mask@@3)) (GoodMask Mask@@3))
 :qid |carbon21.86:15|
 :skolemid |8|
 :pattern ( (state Heap@@4 Mask@@3))
)))
(assert (forall ((Mask@@4 T@U) (o_1@@1 T@U) (f_3@@1 T@U) ) (! (let ((B@@5 (FieldTypeInv1 (type f_3@@1))))
(let ((A@@4 (FieldTypeInv0 (type f_3@@1))))
 (=> (and (and (and (= (type Mask@@4) (MapType1Type RefType realType)) (= (type o_1@@1) RefType)) (= (type f_3@@1) (FieldType A@@4 B@@5))) (GoodMask Mask@@4)) (and (>= (U_2_real (MapType1Select Mask@@4 o_1@@1 f_3@@1)) NoPerm) (=> (and (and (GoodMask Mask@@4) (not (IsPredicateField f_3@@1))) (not (IsWandField f_3@@1))) (<= (U_2_real (MapType1Select Mask@@4 o_1@@1 f_3@@1)) FullPerm))))))
 :qid |carbon21.90:22|
 :skolemid |9|
 :pattern ( (GoodMask Mask@@4) (MapType1Select Mask@@4 o_1@@1 f_3@@1))
)))
(assert (forall ((Mask@@5 T@U) (o_1@@2 T@U) (f_3@@2 T@U) ) (! (let ((B@@6 (FieldTypeInv1 (type f_3@@2))))
(let ((A@@5 (FieldTypeInv0 (type f_3@@2))))
 (=> (and (and (= (type Mask@@5) (MapType1Type RefType realType)) (= (type o_1@@2) RefType)) (= (type f_3@@2) (FieldType A@@5 B@@6))) (and (=> (HasDirectPerm Mask@@5 o_1@@2 f_3@@2) (> (U_2_real (MapType1Select Mask@@5 o_1@@2 f_3@@2)) NoPerm)) (=> (> (U_2_real (MapType1Select Mask@@5 o_1@@2 f_3@@2)) NoPerm) (HasDirectPerm Mask@@5 o_1@@2 f_3@@2))))))
 :qid |carbon21.95:22|
 :skolemid |10|
 :pattern ( (HasDirectPerm Mask@@5 o_1@@2 f_3@@2))
)))
(assert (forall ((ResultMask T@U) (SummandMask1 T@U) (SummandMask2 T@U) (o_1@@3 T@U) (f_3@@3 T@U) ) (! (let ((B@@7 (FieldTypeInv1 (type f_3@@3))))
(let ((A@@6 (FieldTypeInv0 (type f_3@@3))))
 (=> (and (and (and (and (and (= (type ResultMask) (MapType1Type RefType realType)) (= (type SummandMask1) (MapType1Type RefType realType))) (= (type SummandMask2) (MapType1Type RefType realType))) (= (type o_1@@3) RefType)) (= (type f_3@@3) (FieldType A@@6 B@@7))) (sumMask ResultMask SummandMask1 SummandMask2)) (= (U_2_real (MapType1Select ResultMask o_1@@3 f_3@@3)) (+ (U_2_real (MapType1Select SummandMask1 o_1@@3 f_3@@3)) (U_2_real (MapType1Select SummandMask2 o_1@@3 f_3@@3)))))))
 :qid |carbon21.100:22|
 :skolemid |11|
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select ResultMask o_1@@3 f_3@@3))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask1 o_1@@3 f_3@@3))
 :pattern ( (sumMask ResultMask SummandMask1 SummandMask2) (MapType1Select SummandMask2 o_1@@3 f_3@@3))
)))
(assert  (and (forall ((arg0@@20 Real) (arg1@@9 T@U) ) (! (= (type (ConditionalFrame arg0@@20 arg1@@9)) FrameTypeType)
 :qid |funType:ConditionalFrame|
 :pattern ( (ConditionalFrame arg0@@20 arg1@@9))
)) (= (type EmptyFrame) FrameTypeType)))
(assert (forall ((p Real) (f_5 T@U) ) (!  (=> (= (type f_5) FrameTypeType) (= (ConditionalFrame p f_5) (ite (> p 0.0) f_5 EmptyFrame)))
 :qid |carbon21.120:15|
 :skolemid |12|
 :pattern ( (ConditionalFrame p f_5))
)))
(assert (forall ((p@@0 T@U) (v T@U) (q T@U) (w T@U) (r T@U) (u T@U) ) (! (let ((C@@1 (FieldTypeInv0 (type r))))
(let ((B@@8 (FieldTypeInv0 (type q))))
(let ((A@@7 (FieldTypeInv0 (type p@@0))))
 (=> (and (and (and (and (and (and (= (type p@@0) (FieldType A@@7 FrameTypeType)) (= (type v) FrameTypeType)) (= (type q) (FieldType B@@8 FrameTypeType))) (= (type w) FrameTypeType)) (= (type r) (FieldType C@@1 FrameTypeType))) (= (type u) FrameTypeType)) (and (InsidePredicate p@@0 v q w) (InsidePredicate q w r u))) (InsidePredicate p@@0 v r u)))))
 :qid |carbon21.127:25|
 :skolemid |13|
 :pattern ( (InsidePredicate p@@0 v q w) (InsidePredicate q w r u))
)))
(assert (forall ((p@@1 T@U) (v@@0 T@U) (w@@0 T@U) ) (! (let ((A@@8 (FieldTypeInv0 (type p@@1))))
 (=> (and (and (= (type p@@1) (FieldType A@@8 FrameTypeType)) (= (type v@@0) FrameTypeType)) (= (type w@@0) FrameTypeType)) (not (InsidePredicate p@@1 v@@0 p@@1 w@@0))))
 :qid |carbon21.132:19|
 :skolemid |14|
 :pattern ( (InsidePredicate p@@1 v@@0 p@@1 w@@0))
)))
(assert  (and (= (Ctor ProcessDomainTypeType) 10) (forall ((arg0@@21 T@U) (arg1@@10 T@U) ) (! (= (type (p_seq arg0@@21 arg1@@10)) ProcessDomainTypeType)
 :qid |funType:p_seq|
 :pattern ( (p_seq arg0@@21 arg1@@10))
))))
(assert (forall ((p1_1 T@U) (p2_1 T@U) (p3 T@U) ) (!  (=> (and (and (= (type p1_1) ProcessDomainTypeType) (= (type p2_1) ProcessDomainTypeType)) (= (type p3) ProcessDomainTypeType)) (= (p_seq (p_seq p1_1 p2_1) p3) (p_seq p1_1 (p_seq p2_1 p3))))
 :qid |carbon21.154:15|
 :skolemid |15|
 :pattern ( (p_seq (p_seq p1_1 p2_1) p3))
)))
(assert  (and (= (type p_ping) ProcessDomainTypeType) (= (type p_ping_omega) ProcessDomainTypeType)))
(assert (= (p_seq p_ping p_ping_omega) p_ping_omega))
(assert (= (p_seq p_ping_omega p_ping) p_ping_omega))
(declare-fun Heap@@5 () T@U)
(declare-fun Mask@@6 () T@U)
(declare-fun %lbl%+0 () Bool)
(declare-fun %lbl%@1 () Bool)
(declare-fun %lbl%+2 () Bool)
(assert  (and (= (type Heap@@5) (MapType0Type RefType)) (= (type Mask@@6) (MapType1Type RefType realType))))
(push 1)
(set-info :boogie-vc-id test)
(assert (not
(let ((anon0_correct  (=> (! (and %lbl%+0 true) :lblpos +0) (=> (state Heap@@5 ZeroMask) (=> (and (= Heap@@5 Heap@@5) (= ZeroMask Mask@@6)) (! (or %lbl%@1 (= (p_seq p_ping p_ping_omega) (p_seq p_ping_omega p_ping))) :lblneg @1))))))
(let ((PreconditionGeneratedEntry_correct  (=> (! (and %lbl%+2 true) :lblpos +2) anon0_correct)))
PreconditionGeneratedEntry_correct))
))
