$data = get-content -path ..\input.txt
$total = $null

foreach ($row in $data){
  $rowArr = $row -split "\s"
  $ascending = $true
  $descending = $true
  $validDifference = $true

  for ($i=1; $i -le $rowArr.Length -1; $i++){
    $currentValue = [int]::Parse($rowArr[$i])
    $previousValue = [int]::Parse($rowArr[$i - 1])

    if ($currentValue -le $previousValue) {
      $ascending = $false
    }
    
    if ($currentValue -ge $previousValue) {
      $descending = $false
    }

    if (([Math]::abs($currentValue - $previousValue)) -gt 3) {
      $validDifference = $false
    }
  }

  if (($ascending -or
      $descending) -and
      ($validDifference)){
        $total +=1
      }
}
Write-Host "Total is $total"