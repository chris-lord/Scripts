# Script to document how to open a remote powershell session
# Created by Chris Lord

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://mail01/PowerShell/ -Authentication Kerberos

Import-PSSession $Session
