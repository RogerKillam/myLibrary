##################################################################################################
# Get-EventLog is a PowerShell script which builds an overview report of the Windows Event Logs. #
##################################################################################################

Get-WinEvent -ListLog * -EA silentlycontinue |
Where-Object { $_.recordcount -AND $_.lastwritetime -gt [datetime]::today } |
Foreach-Object { get-winevent -LogName $_.logname -MaxEvents 1 } |
Format-Table TimeCreated, ID, ProviderName, Message -AutoSize -Wrap
