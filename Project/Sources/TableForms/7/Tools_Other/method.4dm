
Case of 
	: (Form event code:C388=On Load:K2:1)
		Case of 
			: (<>TablePointer=(->[Consignors:1]))
				OBJECT SET ENABLED:C1123(rbOther3; True:C214)
				OBJECT SET ENABLED:C1123(rbOther4; True:C214)
				OBJECT SET ENABLED:C1123(rbOther7; True:C214)
				OBJECT SET ENABLED:C1123(rbOther1; False:C215)
				OBJECT SET ENABLED:C1123(rbOther2; False:C215)
				OBJECT SET ENABLED:C1123(rbOther5; False:C215)
				OBJECT SET RGB COLORS:C628(*; "txtSalesLabel"; "rgb(128,128,128)")
				OBJECT SET RGB COLORS:C628(*; "txtConsignorLabel"; "rgb(0,142,255)")
				OBJECT SET RGB COLORS:C628(*; "txtAnyLabel"; "rgb(0,142,255)")
				
			: (<>TablePointer=(->[Sales:2]))
				OBJECT SET ENABLED:C1123(rbOther3; False:C215)
				OBJECT SET ENABLED:C1123(rbOther4; False:C215)
				OBJECT SET ENABLED:C1123(rbOther7; True:C214)
				OBJECT SET ENABLED:C1123(rbOther1; True:C214)
				OBJECT SET ENABLED:C1123(rbOther2; True:C214)
				OBJECT SET ENABLED:C1123(rbOther5; True:C214)
				OBJECT SET RGB COLORS:C628(*; "txtSalesLabel"; "rgb(0,142,255)")
				OBJECT SET RGB COLORS:C628(*; "txtConsignorLabel"; "rgb(128,128,128)")
				OBJECT SET RGB COLORS:C628(*; "txtAnyLabel"; "rgb(0,142,255)")
			Else 
				//When on any other table only mismatch active
				OBJECT SET ENABLED:C1123(rbOther3; False:C215)
				OBJECT SET ENABLED:C1123(rbOther4; False:C215)
				OBJECT SET ENABLED:C1123(rbOther7; True:C214)
				OBJECT SET ENABLED:C1123(rbOther1; False:C215)
				OBJECT SET ENABLED:C1123(rbOther2; False:C215)
				OBJECT SET ENABLED:C1123(rbOther5; False:C215)
				OBJECT SET RGB COLORS:C628(*; "txtSalesLabel"; "rgb(128,128,128)")
				OBJECT SET RGB COLORS:C628(*; "txtConsignorLabel"; "rgb(128,128,128)")
				OBJECT SET RGB COLORS:C628(*; "txtAnyLabel"; "rgb(0,142,255)")
		End case 
End case 
