Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		If (Records in selection:C76([Sales:2])>1)
			
			BEEP:C151
			MessageBox(" "; "You can not modify this transaction because it already has sold items."; "OKBox"; "red")
			[Point of Sale:5]ReduceBy:8:=vReduceByTemp
			
		Else 
			ARRAY TEXT:C222(clnd_Month; 12)
			LIST TO ARRAY:C288("mois"; clnd_Month)
			
			CLND_DlgDay_Open(->[Point of Sale:5]Sold Date:5)
			
			vCal_Date1:=[Point of Sale:5]Sold Date:5
			
			
			POST KEY:C465(Tab key:K12:28)
			
		End if 
		
		
End case 