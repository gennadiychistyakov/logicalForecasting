-module(eunittests).
-include_lib("eunit/include/eunit.hrl").

core_opbase_test() ->
	[a, c] = core:opbase([a, b, c, d], [b, d]).

dbase_method1_test() ->
	1 = dbase:method([[a, b, c, d], [e, b, f], [a_, q, d]], [b, d]).

dbase_method2_test() ->
	0 = dbase:method([[c], [a_, c], [c_, d], [d_, b]], [b]).

core_opgeneric_test() ->
	{[{a, 3, 1}], [{b, 1, 0}, {e, 0, 1}]} = core:opgeneric([{a, 0, 1}, {b, 1, 0}, {e, 0, 1}], [{a, 3, 0}, {b, 3, 0}]).

dcons_method1_test() ->
	[[], [c, n], [e, v], [l], [r], [u, x], [z]] = dcons:method([[a_, b_, c], [d], [c_, d_, e], [e_, l, v_], [p], [l_, r], [m_, n, p_], [s], [r_, u], [n_, v], [r_, s_, x], [x_, z]], [a, b, m]).

dcons_method2_test() ->
	[[m], [c, n], [e, v], [l], [r], [u, x], [z]] = dcons:method([[a_, b_, c], [d], [m], [c_, d_, e], [e_, l, v_], [p], [l_, r], [m_, n, p_], [s], [r_, u], [n_, v], [r_, s_, x], [x_, z]], [a, b, m]).

dcons2_method1_test() ->
	{[[], [{c, 1, 0}, {n, 7, 0}], [{e, 3, 0}, {v, 10, 0}], [{l, 4, 0}], [{r, 6, 0}], [{u, 9, 0}, {x, 11, 0}], [{z, 12, 0}]], [[{a, 13, 1}, {b, 14, 1}, {m, 15, 7}, {p, 5, 7}], [{c, 1, 3}, {n, 7, 10}, {d, 2, 3}], [{e, 3, 4}, {v, 10, 4}], [{l, 4, 6}], [{r, 6, 9}, {r, 6, 11}, {s, 8, 11}], [{x, 11, 12}], [{u, 9, 0}, {z, 12, 0}]]} =
		dcons2:method([[{a, 0, 1}, {b, 0, 1}, {c, 1, 0}], [{d, 2, 0}], [{c, 0, 3}, {d, 0, 3}, {e, 3, 0}], [{e, 0, 4}, {l, 4, 0}, {v, 0, 4}], [{p, 5, 0}], [{l, 0, 6}, {r, 6, 0}], [{m, 0, 7}, {n, 7, 0}, {p, 0, 7}], [{s, 8, 0}], [{r, 0, 9}, {u, 9, 0}], [{n, 0, 10}, {v, 10, 0}], [{r, 0, 11}, {s, 0, 11}, {x, 11, 0}], [{x, 0, 12}, {z, 12, 0}]], [{a, 13, 0}, {b, 14, 0}, {m, 15, 0}]).

dcons2_method2_test() ->
	{[[{m, 20, 0}], [{c, 1, 0}, {n, 7, 0}], [{e, 3, 0}, {v, 10, 0}], [{l, 4, 0}], [{r, 6, 0}], [{u, 9, 0}, {x, 11, 0}], [{z, 12, 0}]], [[{a, 13, 1}, {b, 14, 1}, {m, 15, 7}, {p, 5, 7}], [{c, 1, 3}, {n, 7, 10}, {d, 2, 3}], [{e, 3, 4}, {v, 10, 4}], [{l, 4, 6}], [{r, 6, 9}, {r, 6, 11}, {s, 8, 11}], [{x, 11, 12}], [{u, 9, 0}, {z, 12, 0}]]} =
		dcons2:method([[{m, 20, 0}], [{a, 0, 1}, {b, 0, 1}, {c, 1, 0}], [{d, 2, 0}], [{c, 0, 3}, {d, 0, 3}, {e, 3, 0}], [{e, 0, 4}, {l, 4, 0}, {v, 0, 4}], [{p, 5, 0}], [{l, 0, 6}, {r, 6, 0}], [{m, 0, 7}, {n, 7, 0}, {p, 0, 7}], [{s, 8, 0}], [{r, 0, 9}, {u, 9, 0}], [{n, 0, 10}, {v, 10, 0}], [{r, 0, 11}, {s, 0, 11}, {x, 11, 0}], [{x, 0, 12}, {z, 12, 0}]], [{a, 13, 0}, {b, 14, 0}, {m, 15, 0}]).

iotasks_getDCConclusionTask1_test() ->
	{[[a, b, c, d], [b, e, f], [a_, d, q]], [b, d]} = iotasks:getDConclusionTask("tests/test1.txt").

iotasks_getDCConclusionTask2_test() ->
	Task = iotasks:getDConclusionTask("tests/test2.txt"),
 	0 = dbase:method(element(1, Task), element(2, Task)).

iotasks_getDCConsequenceTask_test() ->
	{[[a_, b_, c], [d], [c_, d_, e], [e_, l, v_], [p], [l_, r], [m_, n, p_], [s], [r_, u], [n_, v], [r_, s_, x], [x_, z]], [a, b, m]} = 
		iotasks:getDConsequenceTask("tests/test3.txt").

iotasks_getDSCConsequenceTask_test() ->
	Task = iotasks:getDSConsequenceTask("tests/test3.txt"),
	{[[], [{c, 1, 0}, {n, 7, 0}], [{e, 3, 0}, {v, 10, 0}], [{l, 4, 0}], [{r, 6, 0}], [{u, 9, 0}, {x, 11, 0}], [{z, 12, 0}]], [[{a, 13, 1}, {b, 14, 1}, {m, 15, 7}, {p, 5, 7}], [{c, 1, 3}, {n, 7, 10}, {d, 2, 3}], [{e, 3, 4}, {v, 10, 4}], [{l, 4, 6}], [{r, 6, 9}, {r, 6, 11}, {s, 8, 11}], [{x, 11, 12}], [{u, 9, 0}, {z, 12, 0}]]} = 
		dcons2:method(element(1, Task), element(2, Task)).

branches_method_test() ->
	[[{a, 13, 1}, {b, 14, 1}, {c, 1, 3}, {d, 2, 3}, {e, 3, 4}, {l, 4, 6}, {m, 15, 7}, {n, 7, 10}, {p, 5, 7}, {r, 6, 9}, {u, 9, 0}, {v, 10, 4}], [{a, 13, 1}, {b, 14, 1}, {c, 1, 3}, {d, 2, 3}, {e, 3, 4}, {l, 4, 6}, {m, 15, 7}, {n, 7, 10}, {p, 5, 7}, {r, 6, 11}, {s, 8, 11}, {v, 10, 4}, {x, 11, 12}, {z, 12, 0}]] = 
		branches:method([{a, 13, 1}, {b, 14, 1}, {m, 15, 7}, {p, 5, 7}, {c, 1, 3}, {n, 7, 10}, {d, 2, 3}, {e, 3, 4}, {v, 10, 4}, {l, 4, 6}, {r, 6, 9}, {r, 6, 11}, {s, 8, 11}, {x, 11, 12}, {u, 9, 0}, {z, 12, 0}]).