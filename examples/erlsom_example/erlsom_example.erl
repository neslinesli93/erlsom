%%% a simple example of the use of erlsom.
%%%
-module(erlsom_example).

%% user interface
-export([run/0]).

%% define records
-record('out:resultType', {anyAttribs, result}).
-record('out:errorType', {anyAttribs, errorCode, errorDescription}).

run() ->
  %% compile xsd
  {ok, ModelIn} = erlsom:compile_xsd_file(example_in_xsd(), [{prefix, "in"},
                                                             {strict, false}]),
  {ok, ModelOut} = erlsom:compile_xsd_file(example_out_xsd(),[{prefix, "out"},
                                                              {strict, false}]),

  %% parse xml
  {ok, _, _} = erlsom:scan_file(example_in_xml(), ModelIn),

  {ok, Data} = file:read_file("/home/neslinesli93/STUFF/erlsom/docs/large.pdf"),
  Encoded = base64:encode_to_string(Data),
  Result = #'out:errorType'{errorCode = "01", errorDescription = Encoded},

  %% generate xml.
  Response = #'out:resultType'{result=Result},
  {ok, XmlResult} = erlsom:write(Response, ModelOut),
  io:format("Result size: ~p~n", [string:length(XmlResult)]),
  ok.


%% this is just to make it easier to test this little example
example_in_xsd() -> filename:join([codeDir(), "example_in.xsd"]).
example_out_xsd() -> filename:join([codeDir(), "example_out.xsd"]).
example_in_xml() -> filename:join([codeDir(), "example_in.xml"]).
codeDir() -> filename:dirname(code:which(?MODULE)).

