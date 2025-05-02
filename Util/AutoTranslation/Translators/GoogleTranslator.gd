extends TranslatorBase
class_name GoogleTranslator

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
	id = "google"

func _ready():
	#print(makeToken("test"))
	#print(ord('a'))
	pass
	#req = HTTPRequest.new()
	#add_child(req)
	#req.connect("request_completed", self, "_http_request_completed")

func _http_request_completed(_result, _response_code, _headers, _body):
	#print(body.get_string_from_utf8())
	pass

func makeToken(inputText):
	var _salt1 = "+-a^+6"
	var _salt2 = "+-3^+b+-f"
	var a = int(Time.get_unix_time_from_system() / 3600)#DateTimeOffset.UtcNow.ToUnixTimeSeconds() / 3600
	var b = a
	
	for c in inputText:
		a = workToken(a + ord(c), _salt1)
		
	a = workToken(a, _salt2)
	if(a < 0):
		a = (a & 2147483647) + 2147483647 + 1
	
	a = a % 1000000
	return str(a)+"."+str(a ^ b)

func workToken(num, someseed):
	var i = 0
	var seedLen = someseed.length()
	while(i < (seedLen - 2)):
		var d = ord(someseed[i+2])
		
		if(d >= ord('a')):
			d -= ord('W')
		
		if(someseed[i + 1] == '+'):
			num = (num + (num >> d)) & 4294967295
		else:
			num = (num ^ (num << (d & 0x3F)))
		i += 3
	
	return num

func translate(_targetLanguage, _inputText):
	var newreq = HTTPRequest.new()
	add_child(newreq)
	
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	#var textToTranslate = _inputText.percent_encode()
	
#	var params = {
#		sl = "en",
#		tl = _targetLanguage,
#		q = _inputText,
#	}
	
	#var reqerror = newreq.request('https://translate.google.com/translate_a/single?client=at&dt=t&dt=rm&dj=1', headers2, true, HTTPClient.METHOD_POST, to_json(params))
	#var reqerror = newreq.request('https://translate.google.com/translate_a/single?client=gtx&sl=en&tl='+_targetLanguage+"&dt=t&q="+_inputText.percent_encode())
	var theurl = 'https://translate.googleapis.com/translate_a/single'
	theurl += "?client=gtx"
	theurl += "&sl="+"en"
	theurl += "&tl="+_targetLanguage
	theurl += "&dt=t"
	theurl += "&dt=bd"
	theurl += "&dj=1"
	theurl += "&source=input"
	theurl += "&tk="+makeToken(_inputText)
	var reqerror = newreq.request(theurl, headers2, true, HTTPClient.METHOD_POST, "q="+_inputText.percent_encode())
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
	
	var translatedInputArray = []
	if(translateData.has("sentences")):
		for sentence in translateData["sentences"]:
			if(sentence.has("trans")):
				translatedInputArray.append(sentence["trans"])
	
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
	return "Google"
