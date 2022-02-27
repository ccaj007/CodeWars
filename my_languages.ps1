<#
Task

You are given a dictionary/hash/object containing some languages and your 
test results in the given languages. Return the list of languages where
 your test score is at least 60, in descending order of the results.

Note: the scores will always be unique (so no duplicate values)
Examples
 
My-Languages @{"Java" = 10; "Ruby" = 80; "Python" = 65} | @("Ruby", "Python")
My-Languages @{"Hindi"= 60; "Greek"= 71; "Dutch"= 93}   | @("Dutch", "Greek", "Hindi")
My-Languages @{"C++"= 50; "ASM"= 10; "Haskell"= 20}     | @()
  }
#>

function My-Languages ([hashtable] $results) {
    $pass = @()
    foreach ($h in $results.GetEnumerator() | sort-object value -Descending ) {
        if ($h.value -ge 60) {
            $pass += $h.name        
        }
    }
    $pass
}


My-Languages @{"Java" = 10; "Ruby" = 80; "Python" = 65}
My-Languages @{"Hindi"= 60; "Greek"= 71; "Dutch"= 93}  
My-Languages @{"C++"= 50; "ASM"= 10; "Haskell"= 20}    