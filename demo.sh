#!/bin/bash
source $(dirname $0)/bashtk -q
str_rep '-' 11
msg 'BashTk demo' red bold
str_rep '-' 11

#start a timer
tic
#start logging
log_on bashtk.log
log_reset

msg 'Message functions' cyan underline
msg 'msg supports color and logging' green
msg 'This line is in light-magenta and underlined.' magenta bold underline
color cyan
echo 'In cyan'
color reset
echo 'Reset to default color.'
echo

msg 'Init-style status notification' cyan underline
status_busy 'Running...'
sleep 2
status_append 'done'
status_pass
ls -l > /dev/null
status 'Status of ls -l' 
status_cmd 'Test 0 > 1' [[ 0 -gt 1 ]]
echo

msg 'Math functions' cyan underline
x=(`echo {1..10}`)
echo "x=${x[@]}"
msg 'Descriptive Statistics'
echo "${x[@]}" | describe
msg 'Commands accept pipes: echo {1..5}|pow2|sqrt'
echo {1..5} | pow2 |sqrt
msg "Evaluate expressions: calc 'sqrt(2)*100/2'"
calc 'sqrt(2)*100/2'
msg

msg 'Plotting functions' cyan underline
msg 'Line plot'
linspace 1 10 100|log2|line
msg 'Histogram'
randn 500|hist -n 20 -t 'Random numbers' -x 'X' -y 'Count'
msg 'Plot using a dumb terminal'
linspace 1 10 100|log2|line -d 'dumb'
msg 'Saving a plot to demo.png'
linspace 1 10 100|log2|line -d 'png' -o 'demo.png'
msg 'Plot CDF'
randn 1000|cdfplot
echo

msg 'String utilities' cyan underline
echo 'upperCase'|upper
echo 'LOwercase'|lower
echo 'capiTalize'|capitalize
echo '  >strtrim<  '|str_trim
echo 'Highlight terms in a string' | colorize 'terms' 'a'
str_rep '-x' 25
log_off
echo

msg "Playback log:" cyan underline
log_cat
str_rep '-' 20

#time elapsed
echo "Time elapsed $(toc)(s)."
