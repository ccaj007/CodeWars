<#
Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

Examples:

solution('abc') // should return ['ab', 'c_']
solution('abcdef') // should return ['ab', 'cd', 'ef']
#>

function Split-String($string)
{
  if ($string.Length % 2 -ne 0) {$string += "_"}
  $result = @()
    for($i = 0; $i -lt $string.Length; $i+=2){
        $result += ($string[$i] + $string[$i+1])
    }

    return $result
}

Split-String("abc")
Split-String("abcdef")