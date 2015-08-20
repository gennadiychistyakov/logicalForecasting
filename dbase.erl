-module(dbase).
-export([method/2]).

method(M, D) ->
	procedure(M, [], [], D).

procedure([], [], _, _) -> 
	1;

procedure([], B, M, _) ->
	Y = reduce(product(B, [])),
	case Y of
		[]-> 0;
		_ -> R = lists:map(fun(X) -> inverse2(X) end, Y),
				Q = lists:sum(lists:map(fun(X) -> procedure(M,[],[],X) end, R)),
				if 
					Q ==0 -> 0;
					Q > 0 -> 1 
				end
	end;	

procedure([H | T], B, M, D) -> 
	case core:opbase(H, D) of
		0 -> 0;
		1 -> procedure(T, B, M ++ [H], D);
		Other -> procedure(T, B ++ [Other], M, D)
	end.

product([], P) ->
	lists:map(fun(X) -> lists:usort(X) end, P);

product([H | T], []) ->
 	product(T, lists:map(fun(X) -> [X] end, H));

product([H | T], P) ->
	product(T, [X ++ [Y] || X <- P, Y <- H]).

inverse2(Z) ->
	lists:map(fun(X) -> core:inverse(X) end, Z).

reduce(P) ->
	B = lists:map(fun(X) -> reduce2(X, X) end, P),
	lists:filter(fun(X) -> X /= [] end, B).

reduce2([H1 | [H2 | T]], X) ->
	case H1 == core:inverse(H2) of
		true -> [];
		false -> reduce2([H2] ++ T, X)
	end;

reduce2(_, X) ->
	X.