-module(make).
-export([doit/0]).

doit() -> eunit:test({inparallel, eunittests}).