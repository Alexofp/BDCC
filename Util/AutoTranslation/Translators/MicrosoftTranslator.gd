extends TranslatorBase
class_name MicrosoftTranslator

var token = ""
var expire_time: float = Time.get_unix_time_from_system()
var expire_lapse = 5 * 60;

func _init():
	id = "bing"

func _ready():
	pass

func _get_token(req: HTTPRequest, force_refresh = false):
	if (!force_refresh and token != "" and Time.get_unix_time_from_system() < expire_time):
		return token
	var header = [
		"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.42"
	]
	var response = req.request(
		"https://edge.microsoft.com/translate/auth",
		header,
		true,
		HTTPClient.METHOD_GET
	)
	if(response != OK):
		return ""
	
	var theData = yield(req, "request_completed")
	if(theData == null || !(theData is Array) || theData.size() != 4):
		return ""
	
	var result = theData[0]
	if result != HTTPRequest.RESULT_SUCCESS:
		return ""
		
	var theText:String = theData[3].get_string_from_utf8()
	token = theText
	expire_time = Time.get_unix_time_from_system() + expire_lapse
	return token

func translate(_targetLanguage, _inputText):
	var newreq = HTTPRequest.new()
	add_child(newreq)
	
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	var theurl = 'https://api-edge.cognitive.microsofttranslator.com/translate'
	theurl += "?from="+"en"
	theurl += "&to="+_targetLanguage
	theurl += "&api-version=3.0"
	theurl += "&includeSentenceLength=true"
	
	var get_token = _get_token(newreq)
	var tk  = ""
	
	if get_token is GDScriptFunctionState:
		tk = yield(get_token, "completed")
	else:
		tk = get_token
	
	var header = [
		"accept: */*",
		"accept-language: zh-TW,zh;q=0.9,ja;q=0.8,zh-CN;q=0.7,en-US;q=0.6,en;q=0.5",
		"authorization: %s" % tk,
		"cache-control: no-cache",
		"content-type: application/json",
		"pragma: no-cache",
		"sec-fetch-dest: empty",
		"sec-fetch-mode: cors",
		"sec-fetch-site: cross-site",
		"Referrer-Policy: strict-origin-when-cross-origin",
		"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.42",
	]
	
	var body = JSON.print([{
		"Text": _inputText
	}])
	
	
	var reqerror = newreq.request(theurl, header, true, HTTPClient.METHOD_POST, body)
	if(reqerror != OK):
		theResult["error"] = true
		theResult["errorMessage"] = "An error occurred in the HTTP request."
		return theResult
	
	var theData = yield(newreq, "request_completed")
	
	if(theData == null || !(theData is Array) || theData.size() != 4):
		theResult["error"] = true
		theResult["errorMessage"] = "HTTP request returned null data"
		return theResult
	
	var result = theData[0]
	if result != HTTPRequest.RESULT_SUCCESS:
		theResult["error"] = true
		theResult["errorMessage"] = "HTTP request wasn't successful"
		return theResult
		
	var theText:String = theData[3].get_string_from_utf8()
	newreq.queue_free()

	#print(body.get_string_from_utf8())
	var jsonResult = JSON.parse(theText)
	if(jsonResult.error != OK):
		theResult["error"] = true
		theResult["errorMessage"] = "Couldn't parse json data"
		return theResult
	
	var translateData = jsonResult.result[0]["translations"]
	#print(translateData)
	
	var translatedInputArray = []
	for sentence in translateData:
		if sentence.has("text"):
			translatedInputArray.append(sentence["text"])
	
	theResult["success"] = true
	theResult["resultText"] = join(translatedInputArray, "")
	#print(theResult)
	return theResult

static func join(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

func getName():
	return "Bing"
