#!/bin/bash

#Lists next sink
next_sink_name=$(pactl list short sinks | grep -A1 "RUNNING" |  tail -n 1 | awk '{print $2}')

#Lists first sink
first_sink_name=$(pactl list short sinks  |head -n 1 | awk '{print $2}')

#List default sink
default_sink_name=$(pactl list short sinks | grep -A1 "RUNNING" | head -n 1 | awk '{print $2}')

if [ $default_sink_name == $next_sink_name ]; #if default sink and next sink is eqal run fist sink
then 
pactl set-default-sink $first_sink_name
else
pactl set-default-sink $next_sink_name
fi

