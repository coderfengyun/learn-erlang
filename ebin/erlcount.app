%%%-------------------------------------------------------------------
%%% @author yangdoudou
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 十一月 2017 上午6:02
%%%-------------------------------------------------------------------
{application, erlcount, [
  {description, ""},
  {vsn, "1.0.0"},
  {registered, [erlcount]},
  {applications, [
    kernel,
    stdlib,
    ppool
  ]},
  {mod, {erlcount, [erlcount, erlcount_sup, erlcount_lib,
    erlcount_dispatch, erlcount_counter]}},
  {env, [
    {directory, "."},
    {regex, ["if\\s.+->", "case\\s.+\\sof"]},
    {max_files, 10}
  ]}
]}.