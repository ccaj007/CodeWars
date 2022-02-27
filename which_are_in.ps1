<#
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical 
order of the strings of a1 which are substrings of strings of a2.
Example 1:

a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]
Example 2:

a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []
Notes:

    Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
    In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
    Beware: r must be without duplicates.
#>

function in-array
{
    [OutputType([string[]])]
    Param ([string[]]$a1, [string[]]$a2)

#    $returnlist = @()
#    foreach ($i in $a2) {
#        foreach ($j in $a1){
#            if ($i.contains($j)) {
#                $returnlist += $j
#            }
#        }     
#    }
#    $returnlist = $returnlist | Sort-Object -Unique
#    return $returnlist

    $a1 |
    Where { $a2 -clike "*$PSItem*" } |
    Sort-Object -Unique

}

<#
in-array -a1 ("live", "arp", "strong") -a2 ("lively", "alive", "harp", "sharp", "armstrong")
$a1 = @("live", "arp", "strong") 
$a2 = @("lively", "alive", "harp", "sharp", "armstrong")
$r = @("arp", "live", "strong")


$a1 = @("arp", "mice", "bull") 
$a2 = @("lively", "alive", "harp", "sharp", "armstrong")
$r = @("arp")
#>
