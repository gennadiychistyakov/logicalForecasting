-module(core).
-export([inverse/1, inverse2/1, opbase/2, opgeneric/2]).

inverse(L) ->
	INV = atom_to_list(L),
	case lists:last(INV) of 
		95 -> list_to_atom(lists:droplast(INV));
		_ -> list_to_atom(INV ++ [95])
	end.

inverse2({X, Y, Z}) ->
	{X, Z, Y}.

opbase(D1, D2) -> 
	case D1 -- D2 of
		[] -> 0;
		D1 -> 1;
		Other -> Other
	end.

opgeneric(D1, D2) ->
	L = lists:filter(fun(X) -> {Q, P, W} = element(1, X), {T, V, U} = element(2, X), (Q == T) and ((P + U == 0) or (W + V == 0)) end, [{X, Y} || X <- D1, Y <- D2]),
	A = lists:map(fun(X) -> {Q, P, W} = element(1, X), {Q, T, V} = element(2, X), {Q, P + T, W + V} end , L),
	B = lists:filter(fun({Q, P, W}) -> {Y, _} = lists:partition(fun({T, _, _}) -> T == Q end, A), (not lists:keymember(P, 2, Y)) and (not lists:keymember(W, 3, Y)) end, D1),
	if
		A == [] -> {[], 1};
		B == [] -> {A, 0};
		true -> {A, B}
	end.