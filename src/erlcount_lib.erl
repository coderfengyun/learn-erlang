%%%-------------------------------------------------------------------
%%% @author yangdoudou
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 十一月 2017 上午6:24
%%%-------------------------------------------------------------------
-module(erlcount_lib).
-author("yangdoudou").
-include_lib("kernel/include/file.hrl").

%% API
-export([find_erl/1]).

find_erl(Directory) ->
  find_erl(Directory, queue:new()).

find_erl(Name, Queue) ->
  {ok, F = #file_info{}} = file:read_file_info(Name),
  case F#file_info.type of
    directory -> handle_directory(Name, Queue);
    regular -> handle_regular_file(Name, Queue);
    _Other -> dequeue_and_run(Queue)
  end.


handle_directory(Directory, Queue) ->
   case file:list_dir(Directory) of
     {ok, []} -> dequeue_and_run(Queue);
     {ok, FileNames} -> dequeue_and_run(enqueue_many(Directory, FileNames, Queue))
   end
  .

handle_regular_file(Name, Queue) ->
  erlang:error(not_implemented).

dequeue_and_run(Queue) ->
  case queue:out(Queue) of
    {empty, _} -> done;
    {{value, File}, NewQueue} -> find_erl(File, NewQueue)
  end.

enqueue_many(Directory, FileNames, Queue) ->
  erlang:error(not_implemented).