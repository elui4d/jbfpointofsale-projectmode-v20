//%attributes = {}
vApply_Fee:=0
vApply_Percent:=0
vApply_Consigning:=""
vApply_Envelope:=""



Open Centered window(600; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "Apply_Consignors")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 


Case of 
	: (vApply1=1)
		Case of 
			: (vApply_Fee#0)
				APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Consignor Fee:17:=vApply_Fee)
		End case 
		
		Case of 
			: (vApply_Percent#0)
				APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Percent:14:=vApply_Percent)
		End case 
		
		Case of 
			: (vApply_Consigning="Yes")
				APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Consigning this sale:16:=True:C214)
			: (vApply_Consigning="No")
				APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Consigning this sale:16:=False:C215)
		End case 
		
		Case of 
			: (vApply_Envelope="Yes")
				APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Envelope:15:=True:C214)
			: (vApply_Envelope="No")
				APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Envelope:15:=False:C215)
		End case 
		
	: (vRunMatch1=1)
		
		Tools_VolunteerMatch
		
End case 