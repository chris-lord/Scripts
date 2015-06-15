$input = Read-Host "What is the input file?"

$pattern = Read-Host "What is the search string?"

Get-Content $input | Select-String -AllMatches $pattern