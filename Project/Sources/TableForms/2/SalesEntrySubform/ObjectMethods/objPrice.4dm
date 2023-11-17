Case of 
		
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET RGB COLORS:C628([Sales:2]Sold Price:2; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(66))
		
		//v12
		//: (Form event=On Losing Focus) & ([Sales]Consignor Number#"")
	: (Form event code:C388=On Data Change:K2:15) & ([Sales:2]Consignor Number:6#"")
		
		C_LONGINT:C283(vAllow)
		vTempFail:=0
		[Sales:2]Sold Price:2:=Round:C94([Sales:2]Sold Price:2; 2)
		If ([Sales:2]Sold Price:2=0) & (ok=1)
			
			MessageBox("Warning"; "You entered a dollar amount of $0."; "OKBox"; "red")
			vAllow:=0
			[Sales:2]Sold Price:2:=0
			[Sales:2]Consignor Number:6:=""
			//If (ok=1)
			vTempFail:=1
			//End if 
			//back tab to the field
			
		End if 
		
		//12/15/17 to stop barcode scans on manual entry
		If ([Sales:2]Sold Price:2=(Num:C11([Sales:2]Consignor Number:6))) & (ok=1) & ([Sales:2]Sold Price:2>99)
			
			MessageBox("Warning"; "Price matches the consignor number.  You can not scan the tag to obtain the price in Manual Entry mode."; "OKBox"; "red")
			vAllow:=0
			[Sales:2]Sold Price:2:=0
			[Sales:2]Consignor Number:6:=""
			//If (ok=1)
			vTempFail:=1
			//End if 
			//back tab to the field
			
		End if 
		
		If ([Sales:2]Sold Price:2>9.99) & (ok=1)
			
			
			
			
			Case of 
				: (vTenDollar="Prompt")
					
					BEEP:C151  //added on 1/27/09
					
					//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
					
					MessageBox("Warning"; "Your entry is $10 or more.  Please verify the amount."; "OKBox"; "red")
					vAllow:=1
				: (vTenDollar="Don't Allow")
					BEEP:C151  //added on 1/27/09
					MessageBox("Warning"; "You are not allowed to enter items $10 or more."; "OKBox"; "red")
					vAllow:=0
					[Sales:2]Sold Price:2:=0
					[Sales:2]Consignor Number:6:=""
					//back tab to the field
					//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
				: (vTenDollar="Allow")
					vAllow:=1
					//Do nothing
					
					
			End case 
			
			
		End if 
		
		If ([Sales:2]Consignor Number:6#"") & ([Sales:2]Sold Price:2>0)
			//v12
			vCountIt:=vCountIt+1
			[Sales:2]Entered Date Stamp:7:=Current date:C33
			[Sales:2]Entered Time Stamp:8:=Current time:C178
			[Sales:2]Entered By:10:=<>User
			[Sales:2]Sold Date:11:=vCal_Date1
			[Sales:2]PercentOff:15:="N/A"
			[Sales:2]Item Description:4:="N/A"
			If (vTaxPrompt=True:C214)
				//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
				MessageBox(" "; "Do you want to charge Tax on this item?"; "YesNoBox"; "red")
				If (ok=1)
					[Sales:2]Taxed:16:="T"
					[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
				Else 
					[Sales:2]Taxed:16:=""
				End if 
			Else 
				[Sales:2]Taxed:16:="T"
				[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
				
			End if 
			
			GetSequenceNums("Sales")
			//v12
			//[Sales]Unique Entry ID:=[Point of Sale]Batch ID+"-"+String(vSalesSequenceNumber)
			[Sales:2]Unique Entry ID:1:=Generate UUID:C1066
			Sales_RecalculateTotals
		End if 
		
End case 
