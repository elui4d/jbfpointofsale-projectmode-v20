//%attributes = {}
C_TEXT:C284($vString)
C_BLOB:C604($vBlobIn; $vBlobOut)
C_TEXT:C284($childName2; $childValue2)


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
	
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "ccnumber"; 1; vTRANSccnumber)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "amount"; 1; vTRANSamount)
	Case of 
		: (vSwiped=True:C214)
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "lastname"; 1; vTRANSlastname)
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "firstname"; 1; vTRANSfirstname)
			$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "ccexpdate"; 1; vTRANSccexpdate)
		: (vSwiped=False:C215)
			vTRANSlastname:=""
			vTRANSfirstname:=""
			vTRANSccexpdate:=""
	End case 
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "cardtype"; 1; vTRANScardtype)
	
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "responsestatusmsg"; 1; vTRANSresponsestatusmsg)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "responsetransid"; 1; vTRANSresponsetransid)
	//$xml_Element_Value:=DOM Get XML element($xml_Child_Ref3;"responseauthcode";1;vTRANSresponseauthcode)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "responsestatuscode"; 1; vTRANSresponsestatuscode)
	$xml_Element_Value:=DOM Get XML element:C725($xml_Child_Ref3; "transactiondate"; 1; vTRANStransactiondate)
	
	
	
	
	
	vResult2:="CC Number (Last 4): "+vTRANSccnumber+Char:C90(13)
	vResult2:=vResult2+"Amount: $"+vTRANSamount+Char:C90(13)
	vResult2:=vResult2+"First Name: "+vTRANSfirstname+Char:C90(13)
	vResult2:=vResult2+"Last Name: "+vTRANSlastname+Char:C90(13)
	vTransaxName:=vTRANSlastname+", "+vTRANSfirstname
	vResult2:=vResult2+"Card Type: "+vTRANScardtype+Char:C90(13)
	vResult2:=vResult2+"Expiration: "+vTRANSccexpdate+Char:C90(13)
	vResult2:=vResult2+"Status: "+vTRANSresponsestatusmsg+Char:C90(13)
	vResult2:=vResult2+"Transaction ID: "+vTRANSresponsetransid+Char:C90(13)
	vResult2:=vResult2+"Auth Code: "+vTRANSresponseauthcode+Char:C90(13)
	vResult2:=vResult2+"Status Code: "+vTRANSresponsestatuscode+Char:C90(13)
	vResult2:=vResult2+"Transaction Date: "+vTRANStransactiondate+Char:C90(13)
	vTRANSAmountNum:=Num:C11(vTRANSamount)
	
	
	DOM CLOSE XML:C722($xml_Parent_Ref)
	
	
Else 
	vResult2:="Transaction Not Found."
End if 




// the query will run based on the values you pass in.  Only use the fields that you need to filter on. 
//For example, if you are looking for a single transaction by transaction ID, you need only pass in that field.

//If (amount!=0)
//$vString:=$vString+"<Amount>"+amount+"</Amount>"+Char(13)
//End if 
//If (firstname!="")
//$vString:=$vString+"<FirstName>"+firstname+"</FirstName>"+Char(13)
//End if 
//If (lastname!="")
//$vString:=$vString+"<LastName>"+lastname+"</LastName>"+Char(13)
//End if 
//If (company!="")
//$vString:=$vString+"<Company>"+company+"</Company>"+Char(13)
//End if 
//If (address1!="")
//$vString:=$vString+"<Address1>"+address1+"</Address1>"+Char(13)
//End if 
//If (city!="")
//$vString:=$vString+"<City>"+city+"</City>"+Char(13)
//End if 
//If (state!="")
//$vString:=$vString+"<State>"+state+"</State>"+Char(13)
//End if 
//If (zip!="")
//$vString:=$vString+"<Zip>"+zip+"</Zip>"+Char(13)
//End if 
//If (phone!="")
//$vString:=$vString+"<Phone>"+phone+"</Phone>"+Char(13)
//End if 
//If (email!="")
//$vString:=$vString+"<EMail>"+email+"</EMail>"+Char(13)
//End if 
//If (SAFE_ID!="")
//$vString:=$vString+"<Safe_ID>"+SAFE_ID+"</Safe_ID>"+Char(13)
//End if 
//If (transactiontype!="")
//$vString:=$vString+"<TransactionType>"+transactiontype+"</TransactionType>"+Char(13)
//End if 
//If (paymenttype!="")
//$vString:=$vString+"<PaymentType>"+paymenttype+"</PaymentType>"+Char(13)
//End if 
//If (StartDate!="")
//$vString:=$vString+"<StartDate>"+StartDate+"</StartDate>"+Char(13)
//End if 
//If (EndDate!="")
//$vString:=$vString+"<EndDate>"+EndDate+"</EndDate>"+Char(13)
//End if 
//If (processor_id!="")
//$vString:=$vString+"<ProcessorID>"+processor_id+"</ProcessorID>"+Char(13)
//End if 
//If (last4!="")
//$vString:=$vString+"<CreditCardLast4>"+last4+"</CreditCardLast4>"+Char(13)
//End if 