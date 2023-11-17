Case of 
	: (Form event code:C388=On Losing Focus:K2:8)
		If (vLookup#"")
			
			QUERY:C277([Consignors:1]; [Consignors:1]Last Name:3=vLookup+"@")
			
			ORDER BY:C49([Consignors:1]; [Consignors:1]Last Name:3; >)
			SELECTION TO ARRAY:C260([Consignors:1]First Name:2; aFirst; [Consignors:1]Last Name:3; aLast; [Consignors:1]Address1:4; aAddress; [Consignors:1]City:6; aCity; [Consignors:1]State:7; aState; [Consignors:1]Zip:8; aZip; [Consignors:1]Home Phone:9; aPhone; [Consignors:1]Email Address:13; aEmail)
		End if 
		
End case 