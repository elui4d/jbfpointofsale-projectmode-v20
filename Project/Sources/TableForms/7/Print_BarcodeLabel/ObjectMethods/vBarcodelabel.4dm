Case of 
	: (Form event code:C388=On Losing Focus:K2:8)
		If (vBarcodeLabel#"")
			//ACCEPT
			//CLOSE WINDOW
			//End if 
			//End case 
			
			If (cbPrint=1)
				//ACCEPT
				PrintBarcode_Meat
			End if 
		End if 
End case 
