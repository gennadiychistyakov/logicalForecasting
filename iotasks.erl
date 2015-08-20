-module(iotasks).
-export([getDConclusionTask/1, getDConsequenceTask/1, getDSConsequenceTask/1]).

getDConclusionTask(FileName) ->
	{ok, Device} = file:open(FileName, read),
	getCTL(Device, []).

getCTL(Device, Acc) ->
	case io:get_line(Device, "") of
		eof -> R = lists:map(fun(X) -> lists:sort(X) end, Acc), {lists:droplast(R), lists:last(R)};
		Other -> getCTL(Device, Acc ++ [lists:map(fun(X) -> list_to_atom(X) end, string:tokens(string:strip(Other, right, $\n), " "))])
	end.

getDConsequenceTask(FileName) ->
	{ok, Device} = file:open(FileName, read),
	getSTL(Device, [], []).

getSTL(Device, Acc1, Acc2) ->
	case io:get_line(Device, "") of
		eof -> R1 = lists:map(fun(X) -> lists:sort(X) end, Acc2), R2 = lists:sort(lists:append(Acc1)) , {R1, R2};
		"\n" ->	getSTL(Device, Acc2, Acc1);
		Other -> getSTL(Device, Acc1 ++ [lists:map(fun(X) -> list_to_atom(X) end, string:tokens(string:strip(Other, right, $\n), " "))], Acc2)
	end.

getDSConsequenceTask(FileName) ->
	{ok, Device} = file:open(FileName, read),
	getSSTL(Device, 1, [], []).

getSSTL(Device, N, Acc1, Acc2) ->
	case io:get_line(Device, "") of
		eof -> R1 = lists:map(fun(X) -> lists:sort(X) end, Acc2), R2 = lists:sort(lists:append(Acc1)) , {R1, R2};
		"\n" ->	getSSTL(Device, N, Acc2, Acc1);
		Other -> A = string:tokens(string:strip(Other, right, $\n), " "),
				 B = lists:map(fun(X) -> literal_to_tuple(X, N) end, A),
				 getSSTL(Device, N + 1, Acc1 ++ [B], Acc2)
	end.

literal_to_tuple(L, N) ->
	case lists:last(L) of 
		95 -> {list_to_atom(lists:droplast(L)), 0, N};
		_ -> {list_to_atom(L), N, 0}
	end.