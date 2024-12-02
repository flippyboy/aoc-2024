$data = get-content -path ..\testinput.txt
$left = @()
$right = @()
$total = $null

foreach ($row in $data){
  $split = $row -split "\s{3,3}"
  $left += $split[0]
  $right += $split[1]
}

$group = $right | Group-Object -NoElement

foreach ($number in $left){
  $total += ($group | Where-Object "Name" -eq $number).Count * $number
}
$total