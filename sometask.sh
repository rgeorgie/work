#! /bin/bash

echo "This is the task to be executed" &&
echo "This task is executed at `date` by $USER" >> /log/crontasktest.log &&

sleep 10



