//%attributes = {}
C_TEXT:C284($vString)
C_BLOB:C604($vBlobIn; $vBlobOut)
C_TEXT:C284($childName2; $childValue2; vTransError)


Result2:=""
vTRANSccnumber:=""
vTRANSamount:=""
vTRANSfirstname:=""
vTRANSlastname:=""
vTRANScardtype:=""
vTRANSccexpdate:=""
vTRANSresponsestatusmsg:=""
vTRANSresponsetransid:=""
vTRANSresponseauthcode:=""
vTRANSresponsestatuscode:=""
vTRANStransactiondate:=""
vTransaxName:=""
vTransError:=""



//MessageBox ("";"2";"OKBox";"green")

$vString:="<TransactionAPI xmlns=\"https://secure.transaxgateway.com/roxapi/\">"
$vString:=$vString+"<objparameters>"
$vString:=$vString+"<GatewayUsername>"+vePNJPOS_Clerk+"</GatewayUsername>"
$vString:=$vString+"<GatewayPassword>"+vePNJPOS_Password+"</GatewayPassword>"
$vString:=$vString+"<AccountNumber>"+vTransaxAccountNumber+"</AccountNumber>"
//You get this number from Transax portal.  Not sure if it is unique to user or if it needs to be a preference to change if needed.
$vString:=$vString+"<TransactionAPIKey>"+vePNJPOS_Path+"</TransactionAPIKey>"




If (vTransID#"")
	$vString:=$vString+"<TransactionID>"+vTransID+"</TransactionID>"
End if 
$vString:=$vString+"</objparameters>"
$vString:=$vString+"</TransactionAPI>"



$result2:=""
TEXT TO BLOB:C554($vString; $vBlobIn; Mac text without length:K22:10)

WEB SERVICE SET PARAMETER:C777("MyXMLInputBlob"; $vBlobIn)

WEB SERVICE CALL:C778("https://secure.transaxgateway.com/roxapi/rox.asmx"; "https://secure.transaxgateway.com/roxapi/TransactionAPI"; "TransactionAPI"; "https://secure.transaxgateway.com/roxapi/"; Web Service manual:K48:4)



If (OK=1)
	WEB SERVICE GET RESULT:C779($vBlobOut; "TransactionAPIResult"; *)  // Memory clean-up on the final return value.
	
	$result2:=BLOB to text:C555($vBlobOut; Mac text without length:K22:10)
	
	$result2:=Replace string:C233($result2; "&lt;"; "<")
	
	$result2:=Replace string:C233($result2; "&gt;"; ">")
	
	$xml_Value:=""
	
	$xml_Parent_Ref:=DOM Parse XML variable:C720($result2)
	
	$xml_Child_Ref:=DOM Get first child XML element:C723($xml_Parent_Ref)
	
	$xml_Child_Ref2:=DOM Get first child XML element:C723($xml_Child_Ref)
	
	// all fields listed on page 24 of the TRANSACTION API documentation.  Only a few listed here as example.
	
	//DOM GET XML ELEMENT VALUE($xml_Parent_Ref;value)
	//DOM GET XML ELEMENT VALUE($xml_Child_Ref;value2)
	//$xml_Child_Ref3:=DOM Get first child XML element($xml_Child_Ref;$childName;$childValue)
	$xml_Child_Ref3:=DOM Get first child XML element:C723($xml_Child_Ref2; $childName2; $childValue2)
	
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref3;"ccnumber";1;vTRANSccnumber)
	
	//vFound:=DOM Find XML element($xml_Child_Ref3;"amount")
	//DOM Get XML element($xml_Child_Ref3;"amount")
	
	//5/15/17 - Error checking before the Transaction Request Data is parsed out!!!
	Case of 
		: ($childName2="error")
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref2; "error"; 1; vTransError)
		: ($childName2="transaction")
			
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "amount"; 1; vTRANSamount)
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "cardtype"; 1; vTRANScardtype)
			//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref3;"responsestatusmsg";1;vTRANSresponsestatusmsg)
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "transactiondate"; 1; vTRANStransactiondate)
			
			//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref3;"responsetransid";1;vTRANSresponsetransid)
			//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref3;"responseauthcode";1;vTRANSresponseauthcode)
			//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref3;"responsestatuscode";1;vTRANSresponsestatuscode)
			
			
			
			
			//
			//vResult2:="CC Number (Last 4): "+vTRANSccnumber+Char(13)
			//vResult2:=vResult2+"Amount: $"+vTRANSamount+Char(13)
			//vResult2:=vResult2+"First Name: "+vTRANSfirstname+Char(13)
			//vResult2:=vResult2+"Last Name: "+vTRANSlastname+Char(13)
			//vTransaxName:=vTRANSlastname+", "+vTRANSfirstname
			//vResult2:=vResult2+"Card Type: "+vTRANScardtype+Char(13)
			//vResult2:=vResult2+"Expiration: "+vTRANSccexpdate+Char(13)
			//vResult2:=vResult2+"Status: "+vTRANSresponsestatusmsg+Char(13)
			//vResult2:=vResult2+"Transaction ID: "+vTRANSresponsetransid+Char(13)
			//vResult2:=vResult2+"Auth Code: "+vTRANSresponseauthcode+Char(13)
			//vResult2:=vResult2+"Status Code: "+vTRANSresponsestatuscode+Char(13)
			//vResult2:=vResult2+"Transaction Date: "+vTRANStransactiondate+Char(13)
			//vTRANSAmountNum:=Num(vTRANSamount)
	End case 
	
	
	DOM CLOSE XML:C722($xml_Parent_Ref)
	
	
Else 
	vResult2:="Transaction Not Found."
End if 



