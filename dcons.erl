-module(dcons).
-export([method/2]).

method(M, MF) ->
	F = lists:filter(fun(X) -> length(X) == 1 end, M),
	RV = lists:map(fun(X) -> core:inverse(X) end, lists:append(F)),
	S = [lists:filter(fun(X) -> lists:member(X, lists:append(F)) end, MF)],
	step(M -- F, lists:map(fun(X) -> core:inverse(X) end, MF), RV, S).

step(M, R, RV, S) ->
	{P, SH, R1, M1} = procedure(M, R, RV, [], []),
	case P of
		0 -> step(M1, R1, RV, S ++ [SH]);
		1 -> S
	end.

procedure([], _, _, [], _) -> 
	{1, [], [], []};

procedure([], _, [], B, M) ->
	S = lists:append(lists:filter(fun(X) -> (length(X) == 1) and (lists:last(atom_to_list(lists:nth(1,X))) /= 95) end, B)),
	R = lists:map(fun(X) -> core:inverse(X) end, S),
	{0, S, R, M};	

procedure([], _, RV, B, M) ->
	B1 = reduce(B, RV, []),
	procedure([], [], [], B1, M);

procedure([H | T], R, RV, B, M) -> 
	case core:opbase(H, R) of
		0 -> procedure(T, R, RV, B, M);
		1 -> procedure(T, R, RV, B, M ++ [H]);
		Other -> procedure(T, R, RV, B ++ [Other], M)
	end.

reduce([], _, A) ->
	lists:filter(fun(X) -> lists:all(fun(Y) -> lists:last(atom_to_list(Y)) /= 95 end, X) end, A);

reduce([H | T], RV, A) ->
	case core:opbase(H, RV) of
		0 -> reduce(T, RV, A);
		1 -> reduce(T, RV, A ++ [H]);
		Other -> reduce(T, RV, A ++ [Other])
	end.