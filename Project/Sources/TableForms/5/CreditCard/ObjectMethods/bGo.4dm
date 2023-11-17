If (ok=1)
	
	
	vStatusCode:=""
	Message_Think("Processing credit card transaction, please wait... ")
	
	//2 second pause
	//DELAY PROCESS(Current process;120)
	
	
	C_TEXT:C284($vString)
	C_BLOB:C604($vBlobIn; $vBlobOut)
	//9/22/17
	C_BOOLEAN:C305(vSwiped)
	
	$vString:="<ProcessTransaction xmlns=\"https://secure.transaxgateway.com/roxapi/\">"+Char:C90(13)
	$vString:=$vString+"<objparameters>"+Char:C90(13)
	
	$vString:=$vString+"<TransactionType>"+"sale"+"</TransactionType>"+Char:C90(13)
	//Using eProcessing UserName + Password in Prefs
	$vString:=$vString+"<GatewayUserName>"+vePNJPOS_Clerk+"</GatewayUserName>"+Char:C90(13)
	$vString:=$vString+"<GatewayPassword>"+vePNJPOS_Password+"</GatewayPassword>"+Char:C90(13)
	//$vString:=$vString+"<GatewayUserName>"+"transaxdemo"+"</GatewayUserName>"+Char(13)
	//$vString:=$vString+"<GatewayPassword>"+"Nelix123!"+"</GatewayPassword>"+Char(13)
	$vString:=$vString+"<PaymentType>"+"creditcard"+"</PaymentType>"+Char:C90(13)
	
	
	//$vString:=$vString+"<CCNumber>"+"4111111111111111"+"</CCNumber>"+Char(13)
	//$vString:=$vString+"<CCExpDate>"+"1017"+"</CCExpDate>"+Char(13)
	//$vString:=$vString+"<CVV>"+"123"+"</CVV>"+Char(13)
	
	$vString:=$vString+"<Amount>"+vTransaxCCAmount+"</Amount>"+Char:C90(13)
	//$vString:=$vString+"<Tax>"+".21"+"</Tax>"+Char(13)
	$vString:=$vString+"<MagData>"+vCCSwipe+"</MagData>"+Char:C90(13)
	
	$vString:=$vString+"</objparameters>"+Char:C90(13)
	$vString:=$vString+"</ProcessTransaction>"
	
	
	$result:=""
	TEXT TO BLOB:C554($vString; $vBlobIn; Mac text without length:K22:10)
	WEB SERVICE SET PARAMETER:C777("MyXMLInputBlob"; $vBlobIn)
	WEB SERVICE CALL:C778("https://secure.transaxgateway.com/roxapi/rox.asmx"; "https://secure.transaxgateway.com/roxapi/ProcessTransaction"; "ProcessTransaction"; "https://secure.transaxgateway.com/roxapi/"; Web Service manual:K48:4)
	If (OK=1)
		WEB SERVICE GET RESULT:C779($vBlobOut; "ProcessTransactionResult"; *)  // Memory clean-up on the final return value.
		$result:=BLOB to text:C555($vBlobOut; Mac text without length:K22:10)
		
	End if 
	
	
	$xml_Value:=""
	
	$xml_Parent_Ref:=DOM Parse XML variable:C720($result)
	$xml_Child_Ref:=DOM Get first child XML element:C723($xml_Parent_Ref)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "TRANS_ID"; 1; $TRANS_ID)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "STATUS_CODE"; 1; $STATUS_CODE)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "STATUS_MSG"; 1; $STATUS_MSG)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "AUTH_CODE"; 1; $AUTH_CODE)
	//9/22/17
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref;"AVS_CODE";1;$AVS_CODE)
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref;"AVS_MSG";1;$AVS_MSG)
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref;"CVV2_CODE";1;$CVV2_CODE)
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref;"CVV2_MSG";1;$CVV2_MSG)
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref;"ORDERID";1;$ORDERID)
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref;"SAFE_ID";1;$SAFE_ID)
	
	
	vResult:="STATUS CODE: "+$STATUS_CODE+Char:C90(13)
	vResult:=vResult+"STATUS MSG: "+$STATUS_MSG+Char:C90(13)
	vResult:=vResult+"TRANS ID: "+$TRANS_ID+Char:C90(13)
	vResult:=vResult+"AUTH CODE: "+$AUTH_CODE+Char:C90(13)
	//9/22/17
	//vResult:=vResult+"AVS CODE: "+$AVS_CODE+Char(13)
	//vResult:=vResult+"AVS MSG: "+$AVS_MSG+Char(13)
	//vResult:=vResult+"CVV2 CODE: "+$CVV2_CODE+Char(13)
	//vResult:=vResult+"CVV2 MSG: "+$CVV2_MSG+Char(13)
	//vResult:=vResult+"ORDER ID: "+$ORDERID+Char(13)
	//vResult:=vResult+"SAFE ID: "+$SAFE_ID+Char(13)
	vTransID:=$TRANS_ID
	vStatusCode:=$STATUS_CODE
	
	DOM CLOSE XML:C722($xml_Parent_Ref)
	
	
	//If ($STATUS_MSG="Approved")
	If (vStatusCode="1")
		vMessage:=vResult
		Open Centered window(360; 362; Movable dialog box:K34:7; " ")
		DIALOG:C40([Dialogs:7]; "Message_Approved")  // Display a custom search dialog 
		
		
		//MessageBox ("";"Transaction Result: "+Char(13)+vResult;"OKBox";"Green")
		vResult:=""
		
	Else 
		
		vMessage:=vResult
		Open Centered window(360; 362; Movable dialog box:K34:7; " ")
		DIALOG:C40([Dialogs:7]; "Message_Declined")
		//MessageBox ("";"Transaction Result: "+Char(13)+vResult;"OKBox";"Red")
		vResult:=""
		
	End if 
	
	
End if 

If (vStatusCode="1")
	vSwiped:=True:C214
	ACCEPT:C269
Else 
	OBJECT SET RGB COLORS:C628(vCCSwipe; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(1))
	
	vCCSwipe:=""
	//9/22/17
	vSwiped:=False:C215
End if 

