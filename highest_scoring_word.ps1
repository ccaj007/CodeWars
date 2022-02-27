<#
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

Get-HighestScoringWord("man i need a taxi up to ubud") | Should Be "taxi"
Get-HighestScoringWord("what time are we climbing up to the volcano") | Should Be "volcano"
Get-HighestScoringWord("take me to semynak") | Should Be "semynak"

#>

function Get-HighestScoringWord([string]$s)
{
    $largest = 0
    $total = 0
    $s -split('\s') | foreach {         
        foreach ($char in $_.ToCharArray()) {
            $total += [byte][char]$char - 96            
        }
        if ($total -gt $largest) {$winner = $_; $largest = $total}
        $total = 0
    }
    return $winner    
}

Get-HighestScoringWord("man i need a taxi up to ubud") 