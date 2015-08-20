erlc core.erl
erlc iotasks.erl
erlc dbase.erl
erlc dcons.erl
erlc dcons2.erl
erlc make.erl
erl -noshell -s make doit -s init stop
del *.beam
del *.dump