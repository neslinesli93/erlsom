APPLICATION := erlsom

ERL := erl
EPATH := -pa ebin
TEST_EPATH := -pa .eunit

DIALYZER=dialyzer
DIALYZER_OPTS=-Wno_return -Wrace_conditions -Wunderspecs -Wbehaviours
PLT_FILE=.erlsom_plt
APPS=kernel stdlib

.PHONY: all clean test

all: compile

compile:
	rebar3 compile

doc:
	rebar3 doc

clean:
	rebar3 clean

build-plt: compile
	rebar3 build-plt

check-plt: compile
	rebar3 check-plt

dialyze:
	rebar3 dialyze

eunit:
	rebar3 eunit

shell: compile
	$(ERL) -sname $(APPLICATION) $(EPATH)

touch:
	find . -name '*' -print | xargs touch -m
	find . -name '*.erl' -print | xargs touch -m
