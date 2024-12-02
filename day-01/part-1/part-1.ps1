$data = get-content -path ..\testinput.txt
$left = @()
$right = @()
$total = $null

foreach ($row in $data){
  $split = $row -split "\s{3,3}"
  $left += $split[0]
  $right += $split[1]
}

$left = $left|Sort-Object [int]$_
$right = $right|Sort-Object [int]$_

for ($i=0; $i -le $left.Length; $i++){
  $total += [Math]::abs(($left[$i] - $right[$i]))
}
$total