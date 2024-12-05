$data = Get-Content -path ..\input.txt

$total = 0

$total += (($data | Select-String -Pattern 'XMAS' -AllMatches).Matches | Measure-Object).Count
$total += (($data | Select-String -Pattern 'SAMX' -AllMatches).Matches | Measure-Object).Count

$i = 0

foreach ($row in $data) {
  $xMatch = ($row | Select-String -Pattern 'X' -AllMatches).Matches

  foreach ($x in $xMatch) {
    if ($i + 3 -lt $data.Length){
      if ($data[$i + 1].Substring($x.Index,1) -ceq "M" -and
          $data[$i + 2].Substring($x.Index,1) -ceq "A" -and
          $data[$i + 3].Substring($x.Index,1) -ceq "S") {
            $total +=1 }
    }
    if ($i - 3 -ge 0) {
      if ($data[$i - 1].Substring($x.Index,1) -ceq "M" -and
          $data[$i - 2].Substring($x.Index,1) -ceq "A" -and
          $data[$i - 3].Substring($x.Index,1) -ceq "S") {
            $total +=1 }
    }
    if ($i + 3 -lt $data.Length -and $x.Index + 3 -lt $row.Length) {
      if ($data[$i + 1].Substring($x.Index + 1,1) -ceq "M" -and
          $data[$i + 2].Substring($x.Index + 2,1) -ceq "A" -and
          $data[$i + 3].Substring($x.Index + 3,1) -ceq "S") {
            $total +=1 }
    }
    if ($i + 3 -lt $data.Length -and $x.Index - 3 -ge 0) {
      if ($data[$i + 1].Substring($x.Index - 1,1) -ceq "M" -and
          $data[$i + 2].Substring($x.Index - 2,1) -ceq "A" -and
          $data[$i + 3].Substring($x.Index - 3,1) -ceq "S") {
            $total +=1 }
    }
    if ($i - 3 -ge 0 -and $x.Index + 3 -lt $row.Length) {
      if ($data[$i - 1].Substring($x.Index + 1,1) -ceq "M" -and
          $data[$i - 2].Substring($x.Index + 2,1) -ceq "A" -and
          $data[$i - 3].Substring($x.Index + 3,1) -ceq "S") {
            $total +=1 }
    }
    if ($i - 3 -ge 0 -and $x.Index - 3 -ge 0) {
      if ($data[$i - 1].Substring($x.Index - 1,1) -ceq "M" -and
          $data[$i - 2].Substring($x.Index - 2,1) -ceq "A" -and
          $data[$i - 3].Substring($x.Index - 3,1) -ceq "S") {
            $total +=1 }
    }
  }
  $i++
}
Write-Host "Total is $total"