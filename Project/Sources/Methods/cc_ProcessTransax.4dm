//%attributes = {}
If (ok=1)
	Message_Think("Processing credit card transaction, please wait... ")
	C_TEXT:C284($vString)
	C_BLOB:C604($vBlobIn; $vBlobOut)
	
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
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "AVS_CODE"; 1; $AVS_CODE)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "AVS_MSG"; 1; $AVS_MSG)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "CVV2_CODE"; 1; $CVV2_CODE)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "CVV2_MSG"; 1; $CVV2_MSG)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "ORDERID"; 1; $ORDERID)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref; "SAFE_ID"; 1; $SAFE_ID)
	
	
	vResult:="STATUS CODE: "+$STATUS_CODE+Char:C90(13)
	vResult:=vResult+"STATUS MSG: "+$STATUS_MSG+Char:C90(13)
	vResult:=vResult+"TRANS ID: "+$TRANS_ID+Char:C90(13)
	vResult:=vResult+"AUTH CODE: "+$AUTH_CODE+Char:C90(13)
	vResult:=vResult+"AVS CODE: "+$AVS_CODE+Char:C90(13)
	vResult:=vResult+"AVS MSG: "+$AVS_MSG+Char:C90(13)
	vResult:=vResult+"CVV2 CODE: "+$CVV2_CODE+Char:C90(13)
	vResult:=vResult+"CVV2 MSG: "+$CVV2_MSG+Char:C90(13)
	vResult:=vResult+"ORDER ID: "+$ORDERID+Char:C90(13)
	vResult:=vResult+"SAFE ID: "+$SAFE_ID+Char:C90(13)
	vTransID:=$TRANS_ID
	
	DOM CLOSE XML:C722($xml_Parent_Ref)
	
	MessageBox(""; "Transaction Result: "+Char:C90(13)+vResult; "OKBox"; "Red")
	vResult:=""
	
	
End if 