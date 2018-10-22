// A simplified hash table implementation with weakly consistent contains method


// ---------- Types and axiomatization of sequences of invocations

type {:datatype} Invoc;
function {:constructor} invoc(k: int) : Invoc;

// Boilerplate stuff for linear variables
function {:builtin "MapConst"} MapConstBool(bool) : [Invoc]bool;
function {:inline} {:linear "this"} TidCollector(x: Invoc) : [Invoc]bool
{
  MapConstBool(false)[x := true]
}


// Sets of invocations
type SetInvoc;

function subset(s: SetInvoc, t: SetInvoc) : bool;

type AbsState = [int]int; // Abstract state

// ---------- Representation of execution and linearization

// hb(x, y) : x happens-before y.
// We assume there exists such a function, given by the client program
function hb(x: Invoc, y: Invoc) : bool;

// The set of invocations that have been called
var {:layer 0,1} called: [Invoc]bool;

// A map from invocations to the set of prior invocations visible to them
var vis: [Invoc]SetInvoc;


// ---------- Logical and concrete shared state

procedure {:atomic} {:layer 1} spec_return_spec({:linear "this"} this: Invoc)
{}
procedure {:yields} {:layer 0} {:refines "spec_return_spec"}
  spec_return({:linear "this"} this: Invoc);


// ---------- The ADT methods

procedure {:atomic} {:layer 2} put_spec(k: int, v: int, {:linear "this"} this: Invoc)
  returns (my_vis: SetInvoc)
{}

procedure {:yields} {:layer 1} {:refines "put_spec"} put(k, v: int, {:linear "this"} this: Invoc)
  returns (my_vis: SetInvoc)
{
  yield; assert {:layer 1} called[this];

  call spec_return(this);
  yield;
}


procedure {:atomic} {:layer 2} test_spec()
  returns (my_vis: SetInvoc)
{
  var {:linear "this"} this: Invoc;
  assume 0 == k#invoc(this);
  // test is monotonic
  assume (forall j: Invoc :: hb(j, this) ==> vis[j] == vis[this]);
}

procedure {:yields} {:layer 1} {:refines "test_spec"} test()
  returns (my_vis: SetInvoc)
{
  yield;
}
