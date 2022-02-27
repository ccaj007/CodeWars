<#
This time no story, no theory. The examples below show you how to write function accum:
Examples:

accum("abcd") -> "A-Bb-Ccc-Dddd"
accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
accum("cwAt") -> "C-Ww-Aaa-Tttt"

The parameter of accum is a string which includes only letters from a..z and A..Z.

testing "ZpglnRxqenU" "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
testing "NyffsGeyylB" "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
testing "MjtkuBovqrU" "M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu"

#>

function accum($s)
{
    $i = 0
    $s.ToCharArray() | 
    foreach {
        $total += $($_.tostring().toupper())
        $total += $($_.tostring().ToLower())*$i
        $total += "-"
        $i++
    }
    return $total.trim("-")
}

accum("abcd")
accum("RqaEzty")
accum("cwAt")