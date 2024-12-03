$data = get-content -path .\input.txt
$matches = ($data | Select-String -Pattern 'mul\((\d+),(\d+)\)' -AllMatches).Matches

$total = $null

foreach($match in $matches){
  $total += [int]::Parse($match.Groups[1]) * [int]::Parse($match.Groups[2])
}

Write-Host "Total is $total"