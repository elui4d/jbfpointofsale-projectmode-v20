Case of 
	: (Form event code:C388=On Load:K2:1)
		vCCNumber:=""
		vCCExpiration:=""
		vSwiped:=True:C214
		
		//OBJECT SET COLOR(vCCSwipe;-(Black+(256*(66))))
		OBJECT SET VISIBLE:C603(bGo; False:C215)
		
		
		Case of 
			: (vCCType="Visa")
				OBJECT SET VISIBLE:C603(picVisa; True:C214)
				OBJECT SET VISIBLE:C603(picMastercard; False:C215)
				OBJECT SET VISIBLE:C603(picDiscover; False:C215)
				OBJECT SET VISIBLE:C603(picAMEX; False:C215)
			: (vCCType="Mastercard")
				OBJECT SET VISIBLE:C603(picVisa; False:C215)
				OBJECT SET VISIBLE:C603(picMastercard; True:C214)
				OBJECT SET VISIBLE:C603(picDiscover; False:C215)
				OBJECT SET VISIBLE:C603(picAMEX; False:C215)
			: (vCCType="Discover")
				OBJECT SET VISIBLE:C603(picVisa; False:C215)
				OBJECT SET VISIBLE:C603(picMastercard; False:C215)
				OBJECT SET VISIBLE:C603(picDiscover; True:C214)
				OBJECT SET VISIBLE:C603(picAMEX; False:C215)
			: (vCCType="AMEX")
				OBJECT SET VISIBLE:C603(picVisa; False:C215)
				OBJECT SET VISIBLE:C603(picMastercard; False:C215)
				OBJECT SET VISIBLE:C603(picDiscover; False:C215)
				OBJECT SET VISIBLE:C603(picAMEX; True:C214)
				
			Else 
				OBJECT SET VISIBLE:C603(picVisa; False:C215)
				OBJECT SET VISIBLE:C603(picMastercard; False:C215)
				OBJECT SET VISIBLE:C603(picDiscover; False:C215)
				OBJECT SET VISIBLE:C603(picAMEX; False:C215)
				
		End case 
		
		
		
End case 