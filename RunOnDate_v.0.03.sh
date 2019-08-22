#! /bin/bash

#Script to run scripts on any date after period
#By Rosen Georgiev1 IBM Linux Support
#version = 0.0003
#Date = 21/8/2019
#You may execute this script with @daily option by cron
#Please reed the comments!
#To be executed as : this_script.sh other_task_script.sh

fIlename=`basename "$0"`

toDay=$((($(date +%s))/(3600*24))) #I am taking the Linux date ;)
startDate=$toDay #This will be changed by the first run!!! original: #startDate=$toDay#

taskToExecute=$1

daysToSkip=2 # change to desired days <<<<<

nextRunDate=$(( startDate + daysToSkip ))

sed -i -e "s/^startDate=\$toDay/startDate=$startDate/" $fIlename

if [[ $toDay -ge $startDate ]]; then

    . "$taskToExecute" && #this will execute the shell script you provide

    sed -i -e "s/^startDate=$startDate/startDate=$nextRunDate/" $fIlename #overwriting the start date

else

    break
fi
