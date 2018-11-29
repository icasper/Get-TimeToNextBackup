#
# Get-TimeToNextBackup.ps1
#

function Get-TimeToNextBackup([string]$dayOfWeek, [int]$hourOfDay){

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
		$timeToNextBackupHash = (Get-Date -Hour $hourOfDay)-(Get-Date)
		$timeToNextBackup = $timeToNextBackupHash.Days.toString()+" Days "+$timeToNextBackupHash.Hours.toString()+" Hours "+$timeToNextBackupHash.Minutes.toString()+ " Minutes"
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
	$timeToNextBackup = $timeToNextBackupHash.Days.toString()+" Days "+$timeToNextBackupHash.Hours.toString()+" Hours "+$timeToNextBackupHash.Minutes.toString()+ " Minutes"
	return $timeToNextBackup
	
}

Get-TimeToNextBackup Everyday 23
