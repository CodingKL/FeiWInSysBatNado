#!/bin/bash 

function log() 
{
	echo "$@" 
} 

function logDate() 
{ 
   echo "$(date '+%Y-%m-%d %H:%M:%S') $@" 
} 

function logSW1() 
{ 
     [ 0 -gt 1 ]  && echo "$(date '+%Y-%m-%d %H:%M:%S') $@" 
} 

LOG_OPEN=0 
 
function logSW2() 
{ 
     [ $LOG_OPEN -eq 1 ]  && echo "$(date '+%Y-%m-%d %H:%M:%S') $@" 
} 

需要开启日志的时候，把 LOG_OPEN 设置为1，关闭日志打印，设置为0即可




