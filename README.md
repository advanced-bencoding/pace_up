# pace_up

A new Flutter project.

step 1 - interact with native APIs to get gyro info, and derive pace (rolling average)
step 2 - track pace per split (1km fixed)
step 3 - add user input for target pace with confidence interval, notify user when out or in intervals
step 4 - per split (1km) user input target pace
step 5 - custom splits
step 6 - multiple configs
step 7 - activity history
step 8 - register ractivity on strava
step 9 - QOL units: miles/kms

----------------PHASE 1-------------------------

[] read data from sensors every second
[] maintain queue of 10 inputs
[] start displaying average every second as soon as we have 10 inputs

----------------PHASE 2-------------------------

[] at the end of every kilometer store distance/time as pace

----------------PHASE 3-------------------------

[] accept target pace + interval from user
[] display range/notify user about being in or out of interval

----------------PHASE 4--------------------------

[] custom splits
[] pace target per split