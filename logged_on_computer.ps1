## AD Search script.
## Adapted from https://technet.microsoft.com/en-us/library/ff730967.aspx
## By Chris Lord, 16/02/2015
## TODO: Add input for filter rather than hardcoded.

## Set filter to search for
$strFilter =(objectCategory -like "computer")

## Create new DirectoryEntry object. This sets the AD location to start search from.
$objDomain = New-Object System.DirectoryServices.DirectoryEntry("LDAP://ou=CAZ Computers,ou=NGD - Peak,dc=newgold,dc=net")


## Creates a search object to actually search AD. Assigns values to the search object properties.
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objDomain
$objSearcher.PageSize = 1000
$objSearcher.Filter = $strFilter
$objSearcher.SearchScope = "Subtree"

## Defines an array with the attributes we want the search to return.
$colPropList = "name", "username"
foreach ($i in $colPropList){$objSearcher.PropertiesToload.add($i)}
## Loops through the array calling the add method to add the attribute to the Search objects 
## PropertiesToLoad property

## Kicks off the AD search
$colResults = $objSearcher.FindAll()

## Processes returned properties to be more readable
foreach ($objResult in $colResults)
	{$objItem = $objResult.Properties
		$objItem
	}
	