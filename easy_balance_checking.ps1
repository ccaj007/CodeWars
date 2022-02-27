<#
You are given a (small) check book as a - sometimes - cluttered (by non-alphanumeric characters) string:

"1000.00
125 Market 125.45
126 Hardware 34.95
127 Video 7.45
128 Book 14.32
129 Gasoline 16.10"

The first line shows the original balance. Each other line (when not blank) gives information: check number, category, check amount. (Input form may change depending on the language).

First you have to clean the lines keeping only letters, digits, dots and spaces.

Then return a report as a string (underscores show spaces -- don't put them in your solution. They are there so you can see them and how many of them you need to have):

"Original_Balance:_1000.00
125_Market_125.45_Balance_874.55
126_Hardware_34.95_Balance_839.60
127_Video_7.45_Balance_832.15
128_Book_14.32_Balance_817.83
129_Gasoline_16.10_Balance_801.73
Total_expense__198.27
Average_expense__39.65"

On each line of the report you have to add the new balance and then in the last two lines the total expense and the average expense. So as not to have a too long result string we don't ask for a properly formatted result.
Notes

    See input examples in Sample Tests.
    It may happen that one (or more) line(s) is (are) blank.
    Round to 2 decimals your calculated results (Elm: without traling 0)
    The line separator of results may depend on the language \n or \r\n. See examples in the "Sample tests".
    R language: Don't use R's base function "mean()" that could give results slightly different from expected ones.
#>

function balance($book) {
    
    $specialCharacterRegex = '[' + (-join (($book -replace '\r' -replace '\n' -replace '[A-Za-z0-9. ]').ToCharArray() |
        Select-Object -Unique)) + ']'
    
    $rows = $book -replace $specialCharacterRegex -replace '\r' -split '\n' -notmatch '^\s*$'
    [decimal]$balance = $rows[0]
    
    [decimal]$totalExpense = 0.00
    $output = [System.Collections.ArrayList]::new()
    $null = $output.Add("Original Balance: $($balance)")
    
    foreach ($entry in $rows[1..($rows.Count - 1)]) {
        $expense = [decimal]($entry -replace '^.+\s+(\d+[.]\d+)$', '$1')
        $totalExpense += $expense
        $balance -= $expense
        $entryString = $entry -replace '^(\d+)\s+(\w+)\s+(\d+[.]\d+)$', "`$1 `$2 `$3 Balance $($balance.ToString('0.00'))"
        $null = $output.Add($entryString)
    }
    
    $null = $output.Add("Total expense  $($totalExpense.ToString('0.00'))")
    
    $averageExpense = ($totalExpense / ($rows.Count - 1)).ToString('0.00')
    $null = $output.Add("Average expense  $($averageExpense)")
    
    return ($output -join "`n")
}

balance -book "1000.00!=`n125 Market !=:125.45`n126 Hardware =34.95`n127 Video! 7.45`n128 Book :14.32`n129 Gasoline ::16.10"
#balance -book "Original Balance: 1000.00`n125 Market 125.45 Balance 874.55`n126 Hardware 34.95 Balance 839.60`n127 Video 7.45 Balance 832.15`n128 Book 14.32 Balance 817.83`n129 Gasoline 16.10 Balance 801.73`nTotal expense  198.27`nAverage expense  39.65"

balance -book "1000.00!=`n125 Market !=:125.45`n126 Hardware =34.95`n127 Video! 7.45`n128 Book :14.32`n129 Gasoline ::16.10"
#$b1sol="Original Balance: 1000.00`n125 Market 125.45 Balance 874.55`n126 Hardware 34.95 Balance 839.60`n127 Video 7.45 Balance 832.15`n128 Book 14.32 Balance 817.83`n129 Gasoline 16.10 Balance 801.73`nTotal expense  198.27`nAverage expense  39.65"

balance -book "1233.00`n125 Hardware;! 24.80?`n123 Flowers 93.50;`n127 Meat 120.90`n120 Picture 34.00`n124 Gasoline 11.00`n" 
#$b2sol="Original Balance: 1233.00`n125 Hardware 24.80 Balance 1208.20`n123 Flowers 93.50 Balance 1114.70`n127 Meat 120.90 Balance 993.80`n120 Picture 34.00 Balance 959.80`n124 Gasoline 11.00 Balance 948.80`n123 Photos 71.40 Balance 877.40`n122 Picture 93.50 Balance 783.90`n132 Tyres 19.00 Balance 764.90`n129 Stamps 13.60 Balance 751.30`n129 Fruits 17.60 Balance 733.70`n129 Market 128.00 Balance 605.70`n121 Gasoline 13.60 Balance 592.10`nTotal expense  640.90`nAverage expense  53.41"
