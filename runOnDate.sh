#! /bin/bash

#Script to run scripts on any date after period
#By Rosen Georgiev1 IBM Linux Support
#version = 0.0001
#Date = 21/8/2019
#You may execute this script with @daily option by cron
#Please reed the comments!

toDay=`date +%j`
startDate=$toDay #This will change by first run!!! original: #startDate=$toDay#


daysToSkip=70

nextRunDate=$(( startDate + daysToSkip ))

sed -i -e "s/^startDate=\$toDay/startDate=$startDate/" ./runOnDate.sh

if [[ $toDay == $startDate ]]; then


    echo "Run the task"; #Put your task here <<<<
    sed -i -e "s/^startDate=$startDate/startDate=$nextRunDate/" ./runOnDate.sh #changing the start date

else

    echo "Next Date to execute is: $nextRunDate"
fi
