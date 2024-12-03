$data = Get-Content -path ..\input.txt

$total = $null
$dos = ($data -join " ").Split("do()")

foreach ($do in $dos){
  $matches = ($do.Split("don't()")[0] | Select-String -Pattern 'mul\((\d+),(\d+)\)' -AllMatches).Matches
  
  foreach($match in $matches){
    $total += [int]::Parse($match.Groups[1]) * [int]::Parse($match.Groups[2])
  }
}

Write-Host "Total is $total"