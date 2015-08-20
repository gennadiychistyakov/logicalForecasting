-module(dcons2).
-export([method/2]).

method(M, MF) ->
	F = lists:filter(fun(X) -> length(X) == 1 end, M),
	RV = lists:append(F),
	step(M -- F, MF, RV, [lists:filter(fun({Q, _, _}) -> lists:keymember(Q, 1, MF) end, RV)], []).

step(M, R, RV, S, G) ->
	{P, SH, M1, G1} = procedure(M, R, RV, [], [], []),
	case P of
		0 -> step(M1, SH, RV, S ++ [SH], G ++ [G1]);
		1 -> MS = lists:filter(fun(X) -> not lists:member(X, lists:map(fun({T, V, _}) -> {T, V, 0} end, lists:append(G))) end, lists:append(lists:sublist(S, 2, length(S) - 1))), {S, G ++ [MS]}
	end.

procedure([], _, _, [], _, _) -> 
	{1, [], [], []};

procedure([], _, [], B, M, G) ->
	S = lists:append(lists:filter(fun(X) -> (length(X) == 1) and (element(2, lists:last(X)) /= 0) end, B)),
	{0, S, M, G};	

procedure([], _, RV, B, M, G) ->
	{B1, G1} = reduce(B, RV, G, []),
	procedure([], [], [], B1, M, G1);

procedure([H | T], R, RV, B, M, G) -> 
	case core:opgeneric(H, R) of
		{[], 1} -> procedure(T, R, RV, B, M ++ [H], G);
		{A, 0} -> procedure(T, R, RV, B, M, G ++ A);
		{A, Other} -> procedure(T, R, RV, B ++ [Other], M, G ++ A)
	end.

reduce([], _, G, Acc) ->
	{lists:filter(fun(X) -> lists:all(fun(Y) -> element(2, Y) /= 0 end, X) end, Acc), G};

reduce([H | T], RV, G, Acc) ->
	case core:opgeneric(H, RV) of
		{[], 1} -> reduce(T, RV, G, Acc ++ [H]);
		{A, 0} -> reduce(T, RV, G + A, Acc);
		{A, Other} -> reduce(T, RV, G ++ A, Acc ++ [Other])
	end.