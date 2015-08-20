-module(make).
-export([doit/0]).

%doit() -> io:fwrite("~w\n", [dbase:operation([a, b, c, d], [b, d])]).
%doit() -> io:fwrite("~w\n", [dbase:method([[a, b, c, d], [e, b, f], [a_, q, d]], [b, d])]).
%doit() -> io:fwrite("~w\n", [dbase:method([[c], [a_, c], [c_, d], [d_, b]], [b])]).
%doit() -> io:fwrite("~w\n", [dcons:procedure([[a_, b_, c], [m_, n], [p]], [a_, b_, m_], [], [], [])]).
%doit() -> io:fwrite("~w\n", [dcons:method([[a_, b_, c], [d], [c_, d_, e], [e_, l, v_], [p], [l_, r], [m_, n, p_], [s], [r_, u], [n_, v], [r_, s_, x], [x_, z]], [a, b, m])]).
%doit() -> io:fwrite("~w\n", [core:opgeneric([{a, 0, 1}, {b, 1, 0}, {e, 0, 1}], [{a, 3, 0}, {b, 3, 0}])]).
%doit() -> io:fwrite("~w\n", [dcons2:procedure([[{a, 0, 1}, {b, 0, 1}, {c, 1, 0}], [{m, 0, 2}, {n, 2, 0}, {p, 0, 2}]], [{a, 4, 0}, {b, 5, 0}, {m, 6, 0}], [{p, 3, 0}], [], [], [])]).
%doit() -> io:fwrite("~w\n", [dcons:method([[a_, b_, c], [d], [m], [c_, d_, e], [e_, l, v_], [p], [l_, r], [m_, n, p_], [s], [r_, u], [n_, v], [r_, s_, x], [x_, z]], [a, b, m])]).
%doit() -> io:fwrite("~w\n", [dcons2:method([[{a, 0, 1}, {b, 0, 1}, {c, 1, 0}], [{d, 2, 0}], [{c, 0, 3}, {d, 0, 3}, {e, 3, 0}], [{e, 0, 4}, {l, 4, 0}, {v, 0, 4}], [{p, 5, 0}], [{l, 0, 6}, {r, 6, 0}], [{m, 0, 7}, {n, 7, 0}, {p, 0, 7}], [{s, 8, 0}], [{r, 0, 9}, {u, 9, 0}], [{n, 0, 10}, {v, 10, 0}], [{r, 0, 11}, {s, 0, 11}, {x, 11, 0}], [{x, 0, 12}, {z, 12, 0}]], [{a, 13, 0}, {b, 14, 0}, {m, 15, 0}])]).
%doit() -> io:fwrite("~w\n", [dcons2:method([[{m, 20, 0}], [{a, 0, 1}, {b, 0, 1}, {c, 1, 0}], [{d, 2, 0}], [{c, 0, 3}, {d, 0, 3}, {e, 3, 0}], [{e, 0, 4}, {l, 4, 0}, {v, 0, 4}], [{p, 5, 0}], [{l, 0, 6}, {r, 6, 0}], [{m, 0, 7}, {n, 7, 0}, {p, 0, 7}], [{s, 8, 0}], [{r, 0, 9}, {u, 9, 0}], [{n, 0, 10}, {v, 10, 0}], [{r, 0, 11}, {s, 0, 11}, {x, 11, 0}], [{x, 0, 12}, {z, 12, 0}]], [{a, 13, 0}, {b, 14, 0}, {m, 15, 0}])]).
%doit() -> io:fwrite("~w\n", [iotasks:getDConclusionTask("tests/test1.txt")]).
% doit() -> 
% 	Task = iotasks:getDConclusionTask("tests/test2.txt"),
% 	io:fwrite("~w\n", [dbase:method(element(1, Task), element(2, Task))]).
%doit() -> io:fwrite("~w\n", [iotasks:getDConsequenceTask("tests/test3.txt")]).
%doit() -> io:fwrite("~w\n", [iotasks:getDSConsequenceTask("tests/test3.txt")]).
doit() -> 
	Task = iotasks:getDSConsequenceTask("tests/test3.txt"),
	io:fwrite("~w\n", [dcons2:method(element(1, Task), element(2, Task))]).