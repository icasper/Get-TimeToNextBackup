# Get-TimeToNextBackup

## SYNOPSIS
Function, pass day of week and time of day and return time to next backup as Days, Hours, Minutes

## DESCRIPTION
This PowerShell function returns the time to the next backup by passing the day of the week and the 
hour of the day. The format in which it returns the result is Days, Hours, Minutes, Seconds. in addition
to the days of the week, "Everyday" can be passed to the function to calculate the time to the next backup
on that day.
  
## PARAMETERS 

### dayOfWeek
Passes the day of the week i.e. Friday

### hourOfDay
Passes the hour of the day i.e 23
  
## INPUTS
None

## OUTPUTS
Returns the time information Days, Hours, Minutes and Seconds to the next backup

## NOTES
Program		 :: function Get-TimeToNextBackup
Author		 :: Ian Casper
Creation Date	 :: 28.11.2018
Change Info	 :: 30.11.2018 Added this documentation code

## EXAMPLE

### C:\PS> Get-TimeToNextBackup Everyday 23
This example gets the days, hours, minutes and seconds to the next backup today at 23h00

## EXAMPLE

### C:\PS> Get-TimeToNextBackup Thursday 11
This example gets the days, hours, minutes and seconds to the next backup on Thursday this 
week if Thursday is in the future. If Thursday is in the past i.e. it has already gon by for
this week. then the time information for Thursday of the following week will be returned

## Why write this function?

This function is part of an operations monitoring project and there was a requirement to output at regular intervals, the
time to the next backup.

The Ops Monitoring project has not yet been published to github. However this repository will serve as a placeholder for any 
future delvelopments regarding the publication of the operations monitoring project.
