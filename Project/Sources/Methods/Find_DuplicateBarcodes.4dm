//%attributes = {}
ARRAY LONGINT:C221(aDups; 0)



ALL RECORDS:C47([Sales:2])
QUERY:C277([Sales:2]; [Sales:2]Item Number:13>0)



ORDER BY:C49([Sales:2]; [Sales:2]Item Number:13; >)

$Field1:=[Sales:2]Item Number:13

NEXT RECORD:C51([Sales:2])
//v12 - Why was this set to loop by 2's?
For ($i; 1; Records in selection:C76([Sales:2]))
	
	
	If (([Sales:2]Item Number:13=$Field1))
		
		$vlElem:=Size of array:C274(aDups)+1
		INSERT IN ARRAY:C227(aDups; $vlElem)
		aDups{$vlElem}:=[Sales:2]Item Number:13
	Else 
		
		$Field1:=[Sales:2]Item Number:13
		
		
	End if 
	
	
	NEXT RECORD:C51([Sales:2])
	
End for 

QUERY WITH ARRAY:C644([Sales:2]Item Number:13; aDups)
