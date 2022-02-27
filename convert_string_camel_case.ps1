<#
Complete the method/function so that it converts dash/underscore delimited words into camel casing. 
The first word within the output should be capitalized only if the original word was capitalized 
(known as Upper Camel Case, also often referred to as Pascal case).
Examples

"the-stealth-warrior" gets converted to "theStealthWarrior"
"The_Stealth_Warrior" gets converted to "TheStealthWarrior"
#>

function Convert-StringToCamelCase($String)
{
    if($string -eq ""){return ""}
    if($string -match "-"){$arr = $string -split "-"}
    if($string -match "_"){$arr = $string -split "_"}

    0..($arr.length-1) | foreach  {
        $arr[$_] = (Get-Culture).TextInfo.ToTitleCase($arr[$_])
        }
    $arr = $arr -join ""
    return $arr

}

Convert-StringToCamelCase -string "the-stealth-warrior"
