#! /bin/bash

#Script to run scripts on any date after period
#By Rosen Georgiev1 IBM Linux Support
#version = 0.0002
#Date = 21/8/2019
#You may execute this script with @daily option by cron
#Please reed the comments!
#To be executed as : this_script.sh other_task_script.sh

fIlename=`basename "$0"`

toDay=$((($(date +%s))/(3600*24))) #I am taking the Linux date ;)
startDate=18199 #This will change by first run!!! original: #startDate=$toDay#

taskToExecute=$1


daysToSkip=70

nextRunDate=$(( startDate + daysToSkip ))

sed -i -e "s/^startDate=\$toDay/startDate=$startDate/" $fIlename

if [[ $toDay == $startDate ]]; then


    echo "Running the task";

    . "$taskToExecute" &&

    sed -i -e "s/^startDate=$startDate/startDate=$nextRunDate/" $fIlename #overwriting the start date

else

    echo "Next Date to execute is: $nextRunDate"
fi

echo "Done at `date`"
