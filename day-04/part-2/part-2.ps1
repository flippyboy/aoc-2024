$data = Get-Content -path ..\input.txt

$total = 0

$i = 0

foreach ($row in $data) {
  $aMatch = ($row | Select-String -Pattern 'A' -AllMatches).Matches

  foreach ($a in $aMatch) {
    if ($i + 1 -lt $data.Length -and
        $i - 1 -ge 0 -and
        $a.Index + 1 -lt $row.Length -and
        $a.Index - 1 -ge 0){
      if ($data[$i - 1].Substring($a.Index - 1,1) -ceq "M" -and #upp vänster
          $data[$i - 1].Substring($a.Index + 1,1) -ceq "S" -and #upp höger
          $data[$i + 1].Substring($a.Index - 1,1) -ceq "M" -and #ner vänster
          $data[$i + 1].Substring($a.Index + 1,1) -ceq "S"      #ner höger
          ) {
            $total +=1 }
      if ($data[$i - 1].Substring($a.Index - 1,1) -ceq "S" -and
          $data[$i - 1].Substring($a.Index + 1,1) -ceq "M" -and
          $data[$i + 1].Substring($a.Index - 1,1) -ceq "S" -and
          $data[$i + 1].Substring($a.Index + 1,1) -ceq "M"
          ) {
            $total +=1 }
      if ($data[$i - 1].Substring($a.Index - 1,1) -ceq "M" -and
          $data[$i - 1].Substring($a.Index + 1,1) -ceq "M" -and
          $data[$i + 1].Substring($a.Index - 1,1) -ceq "S" -and
          $data[$i + 1].Substring($a.Index + 1,1) -ceq "S"
          ) {
            $total +=1 }
      if ($data[$i - 1].Substring($a.Index - 1,1) -ceq "S" -and
          $data[$i - 1].Substring($a.Index + 1,1) -ceq "S" -and
          $data[$i + 1].Substring($a.Index - 1,1) -ceq "M" -and
          $data[$i + 1].Substring($a.Index + 1,1) -ceq "M"
          ) {
            $total +=1 }
    }
  }
  $i++
}
Write-Host "Total is $total"