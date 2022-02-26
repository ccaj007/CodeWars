<#
I'm new to coding and now I want to get the sum of two arrays...
actually the sum of all their elements. I'll appreciate for your help.

P.S. Each array includes only integer numbers. Output is a number too.

      @{ arr1 = 1, 2, 3; arr2 = 4, 5, 6; ; r = 21 }
      @{ arr1 = -1, -2, -3; arr2 = -4, -5, -6; ; r = -21 }
      @{ arr1 = 0, 0, 0; arr2 = 4, 5, 6; ; r = 15 }
      @{ arr1 = 100, 200, 300; arr2 = 400, 500, 600; ; r = 2100 }
#>

function array_plus_array($arr1,$arr2){

    $arr1 | % { $total += $_ }
    $arr2 | % { $total += $_ }
    $total
  
    $sum = ($arr1 + $arr2) | Measure-Object -Sum
    $sum.Sum
}

$arr1 = 1, 2, 3
$arr2 = 4, 5, 6
#array_plus_array -arr1 $arr1 -arr2 $arr2
array_plus_array $arr1 $arr2

