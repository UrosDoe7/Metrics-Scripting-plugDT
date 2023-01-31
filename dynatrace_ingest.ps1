cd 'C:\Program Files\dynatrace\oneagent\agent\tools\'
$ListDisk = Get-WmiObject -Class Win32_LogicalDisk

Foreach($Disk in $ListDisk)
{
	if($Disk.DriveType -eq 4) {
		$DiskSize = ($Disk.Size/1GB)
		$DiskFreeSpace = ($Disk.FreeSpace/1GB)
		$DiskFreeSpacepct = [Math]::Round( ($Disk.freespace / $Disk.size) * 100, 2 )
		$DiskUsedSpace = ($Disk.size - $Disk.freespace)
		$DiskUsedSpacepct = [Math]::Round( (($Disk.size - $Disk.freespace) / $Disk.size) * 100, 2 )
		Write-Host "L'espace disque occupé sur $($Disk.DeviceID) est de $DiskUsedSpace GB ($DiskUsedSpacepct %)"
	}
}
