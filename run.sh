erl -compile core.erl
erl -compile iotasks.erl
erl -compile dbase.erl
erl -compile dcons.erl
erl -compile dcons2.erl
erl -compile eunittests.erl
erl -compile make.erl
erl -noshell -s make doit -s init stop
rm *.beam
rm *.dump