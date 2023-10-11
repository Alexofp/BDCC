extends TranslatorBase
class_name PapagoTranslate

#var req:HTTPRequest

var headers2 = [
	#"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36",
	#"Accepts: application/json",
	#"Accept-Language: en-US,en;q=0.9",
	#"Referers: https://translate.google.com/",
	#"Accept-Charsets: utf-8",
	"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0",
	"Host: translate.google.com",
	"Content-Type: application/x-www-form-urlencoded;charset=utf-8",
]

func _init():
	id = "papago"

func _ready():
	#print(makeToken("test"))
	#print(ord('a'))
	#pass
	if(true):
		return
	var req = HTTPRequest.new()
	add_child(req)
	req.connect("request_completed", self, "_http_request_completed")
	
	var theheaders = [
		"Content-Type: application/x-www-form-urlencoded;charset=utf-8",
		"X-Naver-Client-Id: yoiexLp1rXgF6VFt5BQq",
		"X-Naver-Client-Secret: E41Lj1N0V_",
	]
	
	var stuffToSend = "source=en&target=de&text="+("Hello world").percent_encode()
	
	req.request("https://openapi.naver.com/v1/papago/n2mt", theheaders, true, HTTPClient.METHOD_POST, stuffToSend)

func _http_request_completed(_result, _response_code, _headers, _body):
	print(_body.get_string_from_utf8())
	pass

func translate(_targetLanguage, _inputText):
	var newreq = HTTPRequest.new()
	add_child(newreq)
	
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	var theheaders = [
		"Content-Type: application/x-www-form-urlencoded;charset=utf-8",
		"X-Naver-Client-Id: yoiexLp1rXgF6VFt5BQq",
		"X-Naver-Client-Secret: E41Lj1N0V_",
	]
	
	var stuffToSend = "source=en&target="+_targetLanguage+"&text="+_inputText.percent_encode()
	
	var reqerror = newreq.request("https://openapi.naver.com/v1/papago/n2mt", theheaders, true, HTTPClient.METHOD_POST, stuffToSend)

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
	theText = theText.substr(6)
	#var response_code = theData[1]
	#print("RESPONSE CODE IS "+str(response_code))
		
	var body = theData[3]
	#print(body.get_string_from_utf8())
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		theResult["error"] = true
		theResult["errorMessage"] = "Couldn't parse json data"
		return theResult
	
	var translateData = jsonResult.result
	#print(translateData)
	
	#var translatedInputArray = []
	if(translateData.has("message") && translateData["message"].has("result") && translateData["message"]["result"].has("translatedText")):
		theResult["success"] = true
		theResult["resultText"] = translateData["message"]["result"]["translatedText"]
	else:
		theResult["error"] = true
		theResult["errorMessage"] = "Response doesn't contain the translated text"
	#print(theResult)
	return theResult

static func join(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output
