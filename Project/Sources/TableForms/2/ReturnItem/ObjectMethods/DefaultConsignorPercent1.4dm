Case of 
	: (Form event code:C388=On Losing Focus:K2:8)
		
		vBarcodeScan2:=StripSpaces(vBarcodeScan2)
		
		If (vBarcodeScan2#"")
			
			If (Length:C16(vBarcodeScan2)<12)
				//Item number entered
				vTagItemNumber:=Num:C11(vBarcodeScan2)
			Else 
				//Item scanned
				//Parse out barcode ********************************** 
				vtempBarcode:=""
				vtempBarcode:=vBarcodeScan2
				//ConsignorNumber
				vPos1:=Position:C15("-"; vtempBarcode)
				vConsignorNumber:=Substring:C12(vtempBarcode; 1; (vPos1-1))
				vtempBarcode:=Substring:C12(vtempBarcode; (vPos1+1))
				
				//Price
				vPos2:=Position:C15("-"; vtempBarcode)
				vPrice:=Substring:C12(vtempBarcode; 1; (vPos2-1))
				vtempBarcode:=Substring:C12(vtempBarcode; (vPos2+1))
				
				//reduce
				vPos3:=Position:C15("-"; vtempBarcode)
				vTagReduce:=Substring:C12(vtempBarcode; 1; (vPos3-1))
				vtempBarcode:=Substring:C12(vtempBarcode; (vPos3+1))
				
				vTagItemNumber:=Num:C11(vtempBarcode)
				//end parse
				
			End if 
			
			QUERY:C277([Sales:2]; [Sales:2]Item Number:13=vTagItemNumber)
			
			If (Records in selection:C76([Sales:2])>0)
				OBJECT SET ENABLED:C1123(btnReturn; True:C214)
				
				
			Else 
				//There is no sale for that item in the POS database.  Do you still want to return it?
				
				
				//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
				MessageBox(""; "That item has not been sold on this POS database.   You will need to return it on"+" the master or on the computer that it was entered on."; "OKBox"; "green")
				vConsignorNumber:=""
				//back tab to the field
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				
				OBJECT SET ENABLED:C1123(btnReturn; False:C215)
				
			End if 
			
			
			
			
			
			
		Else 
			//Nothing entered, do nothing@@@@@@@@@@@@@@@
			
			//BEEP
			//MessageBox (" ";"That is not a valid barcode.";"OKBox";"red")
			//POST KEY(Tab Key ;Shift key mask )
			//REDRAW WINDOW
		End if 
		
		
		
End case 