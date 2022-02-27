<#
I got lots of files beginning like this:

Program title: Primes
Author: Kern
Corporation: Gold
Phone: +1-503-555-0091
Date: Tues April 9, 2005
Version: 6.7
Level: Alpha

Here we will work with strings like the string data above and not with files.

The function change(s, prog, version) given:

s=data, prog="Ladder" , version="1.1" will return:

"Program: Ladder Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 1.1"

Rules:

    The date should always be "2019-01-01".

    The author should always be "g964".

    Replace the current "Program Title" with the prog argument supplied to your function. 
    Also remove "Title", so in the example case "Program Title: Primes" becomes "Program: Ladder".

    Remove the lines containing "Corporation" and "Level" completely.

    Phone numbers and versions must be in valid formats.

A valid version in the input string data is one or more digits followed by a dot, 
followed by one or more digits.
So 0.6, 5.4, 14.275 and 1.99 are all valid, but versions like .6, 5, 14.2.7 and 1.9.9 are invalid.

A valid input phone format is +1-xxx-xxx-xxxx, where each x is a digit.

    If the phone or version format is not valid, return "ERROR: VERSION or PHONE".

    If the version format is valid and the version is anything other than 2.0, 
    replace it with the version parameter supplied to your function. If it’s 2.0, don’t modify it.

    If the phone number is valid, replace it with "+1-503-555-0090".
#>

function change($s, $prog, $version)
{
    $new = @()
    $s = $s -split("\n")
    #$s

    # validate phone number
    $reg_phone = "(?<=\-)(\d{3}-\d{3}-\d{4})$"
    if ($s[3] -match $reg_phone ) {$phone = $s[3]} else {$phone = "ERROR: VERSION or PHONE"} 

    # parse date
    #$date_regex = "(?<=\s)[\s\S]*"
    $date_regex = "^([\S]+\s){2}"
    #$date = [regex]::Matches($s[4], $date_regex).value
    $date = $s[4].replace(([regex]::Matches($s[4], $date_regex)),'')
    $date = ([datetime]$date).tostring('yyy-MM-dd')
    #write-host("date: $date")

    # validate version
    $ver_clean = "^([\S]+\s)"
    $ver_valid = "^\d+\.\d+$"
    $ver = $s[5].replace(([regex]::matches($s[5], $ver_clean)), '')
    if ($ver -ne "2.0") {
        if ($ver -match $ver_valid) {$ver = $ver}
    }

    
    $new += ("Program: $prog")
    $new += $s[1] -replace '(?<=\:\s)(\w+)','g964'
    $new += "Phone: +1-503-555-0090"
    $new += ("Date: $date")
    $new += $ver

    return $new

}

$s1="Program title: Primes`nAuthor: Kern`nCorporation: Gold`nPhone: +1-503-555-0091`nDate: Tues April 9, 2005`nVersion: 6.7`nLevel: Alpha"
$s11="Program title: Hammer`nAuthor: Tolkien`nCorporation: IB`nPhone: +1-503-555-0090`nDate: Tues March 29, 2017`nVersion: 2.0`nLevel: Release"
$s12="Program title: Primes`nAuthor: Kern`nCorporation: Gold`nPhone: +1-503-555-009`nDate: Tues April 9, 2005`nVersion: 6.7`nLevel: Alpha"

change -s $s1 -prog "Ladder" -version "1.1"

    <#
    testing $s1 "Ladder" "1.1" "Program: Ladder Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 1.1"    
    testing $s11 "Balance" "1.5.6" "Program: Balance Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 2.0"
    testing $s12 "Ladder" "1.1" "ERROR: VERSION or PHONE"
   
#>