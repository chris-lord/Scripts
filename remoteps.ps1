$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://mail01-caz/PowerShell/ -Authentication Kerberos

Import-PSSession $Session
