


#
# Get-TimeToNextBackup.ps1
#

function Get-TimeToNextBackup([string]$dayOfWeek, [int]$hourOfDay){

	<#

	.Synopsis
	Function, pass day of week and time of day and return time to next backup as Days, Hours, Minutes

	.Description
	This PowerShell function returns the time to the next backup by passing the day of the week and the 
	hour of the day. The format in which it returns the result is Days, Hours, Minutes, Seconds. in addition
	to the days of the week, "Everyday" can be passed to the function to calculate the time to the next backup
	on that day.

	#>

	$weekDay = @{
		Monday = 1;
		Tuesday = 2;
		Wednesday = 3;
		Thursday = 4;
		Friday = 5;
		Saturday = 6;
		Sunday = 7
	}

	if($dayOfWeek -eq "Everyday"){
		$timeToNextBackupHash = (Get-Date -Hour $hourOfDay -Minute 0 -Second 0)-(Get-Date)
		$timeToNextBackup = $timeToNextBackupHash.Days.toString()+" Days "+$timeToNextBackupHash.Hours.toString()+" Hours "+$timeToNextBackupHash.Minutes.toString()+ " Minutes "+$timeToNextBackupHash.Seconds.toString()+" Seconds"
		return $timeToNextBackup
	}

	$daysToBackup = $weekDay[$dayOfWeek]-(Get-Date).dayOfWeek.value__
	if($daysToBackup -lt 1 -and (Get-Date).dayOfWeek -ne $weekDay[$dayOfWeek]){
		$daysToBackup+=7
	}
	$dayOfyear = (Get-Date).dayOfYear
	$dayOfYearBackup = $dayOfyear+$daysToBackup
	$dateOfNextBackup = (Get-Date -Month 1 -Day 1 -Hour $hourOfDay -Minute 0 -Second 0).addDays($dayOfYearBackup-1)
	$timeToNextBackupHash = $dateOfNextBackup-(Get-Date)
	$timeToNextBackup = $timeToNextBackupHash.Days.toString()+" Days "+$timeToNextBackupHash.Hours.toString()+" Hours "+$timeToNextBackupHash.Minutes.toString()+ " Minutes "+$timeToNextBackupHash.Seconds.toString()+" Seconds"
	return $timeToNextBackup
	
}


