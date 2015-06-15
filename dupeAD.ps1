import-module activedirectory

#Creates an object to hold all computers in CAZ Computers
$users = Get-ADComputer -Filter * -Properties Name,Description -SearchBase "OU=CAZ Computers,OU=NGD - Peak,DC=newgold,DC=net"

#Initialise an array
$serviceTag = @()


foreach ($user in $users) {
    
    #Matches services tags and adds them to the serviceTag array
    $serviceTag += [regex]::match($user.description,'[0-9A-Z]{7,10}')
    
    }

#Finds all duplicated services tags and adds them to an array
$dupes = $serviceTag | Group-Object | Where-Object {$_.Count -gt 1}

#Initialise a hashtable
$finalList = @{}

foreach ($user in $users) {

    #tests if service tag in description matches in dupes array
    if ($dupes.name -contains [regex]::match($user.description,'[0-9A-Z]{7,10}')) {
    
       #adds the result to the hashtable
		$user | %{
			$finalList.add(($_.Name),([regex]::match($_.description,'[0-9A-Z]{7,10}')))
			}
		}
    } 

#sorts and outputs the hash table
$sortedList = $finalList.GetEnumerator() | Sort-Object {$_.value} -Descending > P:\causeimawesome.txt