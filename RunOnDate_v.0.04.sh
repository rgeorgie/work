#! /bin/bash

#Script running tasks on any date after given period
#By Rosen Georgiev1 IBM Linux & OSS Support
#version = 0.0004
#Date = 27/8/2019
#You may execute this script with @daily option by cron
#Please reed the comments!
#To be executed as : this_script.sh other_task_script.sh

dirName=`dirname "$0"`
fIlename=`basename "$0"`
pAth=$dirName"/"$fIlename

toDay=$((($(date +%s))/(3600*24))) #I am taking the Linux date ;)

startDate=$toDay #This will be changed by the first run!!! original: #startDate=$toDay#

taskToExecute=$1

daysToSkip=2 # change to desired days <<<<<

nextRunDate=$(( startDate + daysToSkip ))

sed -i -e "s/^startDate=\$toDay/startDate=$startDate/" $pAth

if [[ $toDay -ge $startDate ]]; then

    . "$taskToExecute" && #this will execute the shell script you provide

    sed -i -e "s/^startDate=$startDate/startDate=$nextRunDate/" $pAth #overwriting the start date

fi
