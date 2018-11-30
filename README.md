# Get-TimeToNextBackup

## Synopsis:

This PowerShell function returns the time to the next backup by passing the day of the week and the hour of the day.
The format in which it returns the result is <Days> <Hours> <Minutes> <Seconds>. in addition to the days of the week,
"Everyday" can be passed to the function, to calculate the time to the next backup on that day.

## Why write this function?

This function is part of an operations monitoring project and there was a requirement to output at regular intervals, the
time to the next backup.

The Ops Monitoring project has not yet been published to github. However this repository will serve as a placeholder for any 
future delvelopments regarding the publication of the operations monitoring project.
