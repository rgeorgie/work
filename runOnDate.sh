#! /bin/bash

#Script to run tasks on any date after given period of days
#By Rosen Georgiev1 IBM Linux Support
#version = 0.0002
#Date = 21/8/2019
#You may execute this script with @daily option by cron
#Please reed the comments!

fIlename=`basename "$0"`

toDay=$((($(date +%s))/(3600*24))) #I am taking the Linux date ;)
startDate=$toDay #This will change by first run!!! original: #startDate=$toDay#


daysToSkip=70 #desired number of days here <<<<

nextRunDate=$(( startDate + daysToSkip ))

sed -i -e "s/^startDate=\$toDay/startDate=$startDate/" $fIlename

if [[ $toDay == $startDate ]]; then


    echo "Run the task"; #Put your task here <<<<
    sed -i -e "s/^startDate=$startDate/startDate=$nextRunDate/" $fIlename #changing the start date

else

    echo "Next Date to execute is: $nextRunDate"
fi
