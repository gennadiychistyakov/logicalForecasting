-module(branches).
-export([method/1]).

method(G) ->
	S = lists:filter(fun({_, _, W}) -> W == 0 end, G),
	getBranches(S, G -- S, []).

getBranches([], _, Acc) ->
	Acc;

getBranches([H | T], G, Acc) ->
	getBranches(T, G, Acc ++ [lists:usort(getBranch(H, G))]).

getBranch(H, G) ->
	{_, Q, _} = H,
	L = lists:filter(fun(X) -> {_, _, P} = X, P == Q end, G),
	G1 = G -- L,
	B = lists:append(lists:map(fun(X) -> getBranch(X, G1) end, L)),
	B ++ L ++ [H].