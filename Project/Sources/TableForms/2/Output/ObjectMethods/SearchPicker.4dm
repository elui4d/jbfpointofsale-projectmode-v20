//Searchpicker sample code

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		// Init the var itself
		// this can be done anywhere else in your code
		C_TEXT:C284(vSearch)
		
		// the let's customise the SearchPicker (if needed)
		
		C_BOOLEAN:C305($Customise)
		$Customise:=True:C214
		
		C_TEXT:C284($ObjectName)
		$ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		// The exemple below shows how to set a label (ex : "name") inside the search zone
		
		If ($Customise)
			
			//SearchPicker SET HELP TEXT ($ObjectName;"Item Search")
			
		End if 
		
		
		
	: (Form event code:C388=On Losing Focus:K2:8)
		
		QUERY:C277([Sales:2]; [Sales:2]Item Description:4="@"+vSearch+"@"; *)
		QUERY:C277([Sales:2];  | ; [Sales:2]Item Number:13=Num:C11(vSearch))
		Toolbar_Setup
End case 




