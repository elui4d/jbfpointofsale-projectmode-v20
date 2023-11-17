//%attributes = {}
C_TEXT:C284(gTableRecordCount2; gTableName)

<>TablePointer:=Current form table:C627

QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vEntryMode:=[Preferences:3]EntryMode:7
End if 
UNLOAD RECORD:C212([Preferences:3])

Case of 
	: (<>TablePointer=(->[Consignors:1]))
		OBJECT SET ENABLED:C1123(bConsignors; False:C215)
		OBJECT SET ENABLED:C1123(bViewSales; True:C214)
		OBJECT SET ENABLED:C1123(bEnterTags; True:C214)
		OBJECT SET ENABLED:C1123(bViewItems; True:C214)
		OBJECT SET ENABLED:C1123(bVolunteer; True:C214)
		OBJECT SET VISIBLE:C603(bFinish; True:C214)
		OBJECT SET VISIBLE:C603(bNew1; False:C215)
		OBJECT SET VISIBLE:C603(bNew2; True:C214)
		
		OBJECT SET ENABLED:C1123(bPop; False:C215)
		OBJECT SET VISIBLE:C603(bPop; False:C215)
		
	: (<>TablePointer=(->[Volunteers:9]))
		OBJECT SET ENABLED:C1123(bConsignors; True:C214)
		OBJECT SET ENABLED:C1123(bViewSales; True:C214)
		OBJECT SET ENABLED:C1123(bEnterTags; True:C214)
		OBJECT SET ENABLED:C1123(bViewItems; True:C214)
		OBJECT SET ENABLED:C1123(bVolunteer; False:C215)
		OBJECT SET VISIBLE:C603(bFinish; True:C214)
		OBJECT SET VISIBLE:C603(bNew1; False:C215)
		OBJECT SET VISIBLE:C603(bNew2; True:C214)
		
		OBJECT SET ENABLED:C1123(bPop; False:C215)
		OBJECT SET VISIBLE:C603(bPop; False:C215)
		
		
	: (<>TablePointer=(->[Point of Sale:5]))
		OBJECT SET ENABLED:C1123(bConsignors; True:C214)
		OBJECT SET ENABLED:C1123(bViewSales; True:C214)
		OBJECT SET ENABLED:C1123(bEnterTags; False:C215)
		OBJECT SET ENABLED:C1123(bViewItems; True:C214)
		OBJECT SET ENABLED:C1123(bVolunteer; True:C214)
		OBJECT SET ENABLED:C1123(bPop; True:C214)
		OBJECT SET VISIBLE:C603(bPop; True:C214)
		OBJECT SET VISIBLE:C603(bFinish; True:C214)
		OBJECT SET VISIBLE:C603(bNew1; True:C214)
		OBJECT SET VISIBLE:C603(bNew2; False:C215)
		
		
	: (<>TablePointer=(->[Sales:2]))
		OBJECT SET ENABLED:C1123(bConsignors; True:C214)
		OBJECT SET ENABLED:C1123(bViewSales; False:C215)
		OBJECT SET ENABLED:C1123(bEnterTags; True:C214)
		OBJECT SET ENABLED:C1123(bViewItems; True:C214)
		OBJECT SET ENABLED:C1123(bVolunteer; True:C214)
		OBJECT SET VISIBLE:C603(bFinish; True:C214)
		OBJECT SET VISIBLE:C603(bNew1; False:C215)
		OBJECT SET VISIBLE:C603(bNew2; False:C215)
		
		OBJECT SET ENABLED:C1123(bPop; False:C215)
		OBJECT SET VISIBLE:C603(bPop; False:C215)
		
		
	: (<>TablePointer=(->[Inventory:4]))
		OBJECT SET ENABLED:C1123(bConsignors; True:C214)
		OBJECT SET ENABLED:C1123(bViewSales; True:C214)
		OBJECT SET ENABLED:C1123(bEnterTags; True:C214)
		OBJECT SET ENABLED:C1123(bViewItems; False:C215)
		OBJECT SET ENABLED:C1123(bVolunteer; True:C214)
		OBJECT SET VISIBLE:C603(bFinish; True:C214)
		OBJECT SET VISIBLE:C603(bNew1; False:C215)
		OBJECT SET VISIBLE:C603(bNew2; False:C215)
		
		OBJECT SET ENABLED:C1123(bPop; False:C215)
		OBJECT SET VISIBLE:C603(bPop; False:C215)
		
		
	: (<>TablePointer=(->[Dialogs:7]))
		OBJECT SET ENABLED:C1123(bConsignors; True:C214)
		OBJECT SET ENABLED:C1123(bViewSales; True:C214)
		OBJECT SET ENABLED:C1123(bEnterTags; True:C214)
		OBJECT SET ENABLED:C1123(bViewItems; True:C214)
		OBJECT SET ENABLED:C1123(bVolunteer; True:C214)
		OBJECT SET VISIBLE:C603(bFinish; False:C215)
		OBJECT SET VISIBLE:C603(bNew1; False:C215)
		OBJECT SET VISIBLE:C603(bNew2; False:C215)
		
		OBJECT SET ENABLED:C1123(bPop; False:C215)
		OBJECT SET VISIBLE:C603(bPop; False:C215)
		
		
	Else 
		OBJECT SET ENABLED:C1123(bConsignors; True:C214)
		OBJECT SET ENABLED:C1123(bViewSales; True:C214)
		OBJECT SET ENABLED:C1123(bEnterTags; True:C214)
		OBJECT SET ENABLED:C1123(bViewItems; True:C214)
		OBJECT SET ENABLED:C1123(bVolunteer; True:C214)
		OBJECT SET VISIBLE:C603(bFinish; True:C214)
		OBJECT SET VISIBLE:C603(bNew1; False:C215)
		OBJECT SET VISIBLE:C603(bNew2; False:C215)
		
		OBJECT SET ENABLED:C1123(bPop; False:C215)
		OBJECT SET VISIBLE:C603(bPop; False:C215)
		
End case 

If (vEntryMode="POS Mode")
	OBJECT SET ENABLED:C1123(bConsignors; False:C215)
	OBJECT SET ENABLED:C1123(bViewSales; False:C215)
	OBJECT SET ENABLED:C1123(bPrint; False:C215)
	OBJECT SET ENABLED:C1123(bVolunteer; False:C215)
End if 


If (<>TablePointer=(->[Dialogs:7]))
	gTableRecordCount2:=" "
Else 
	gTableName:=Table name:C256(<>TablePointer)
	gTableRecordCount:=String:C10(Records in selection:C76(<>TablePointer->))+"  of  "+String:C10(Records in table:C83(<>TablePointer->))
	gTableRecordCount2:=gTableName+" : "+gTableRecordCount
End if 
