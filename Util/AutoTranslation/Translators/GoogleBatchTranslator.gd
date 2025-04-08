extends TranslatorBase
class_name GoogleBatchTranslator

var req:HTTPRequest
var initdatareq:HTTPRequest
#var initData = ""
var fd = ""
var cf = ""


func extract(thekey, theres):
	var regex = RegEx.new()
	regex.compile('"'+thekey+'":"(.*?)"')
	var result = regex.search(theres)
	if result:
		return (result.get_string(1))
	return ""

func _init():
	id = "googlebatch"

func _ready():
	req = HTTPRequest.new()
	add_child(req)
	var _ok = req.connect("request_completed", self, "_http_request_completed")

	initdatareq = HTTPRequest.new()
	add_child(initdatareq)
	var _ok2 = initdatareq.connect("request_completed", self, "_http_request_completed_init_data")
	
	var _ok3 = initdatareq.request("https://translate.google.com")

func _http_request_completed_init_data(_result, _response_code, _headers, body):
	#print(body.get_string_from_utf8())
	var initData = body.get_string_from_utf8()
	#print("Got init data")
	fd = extract("FdrFJe", initData)
	cf = extract("cfb2h", initData)

func _http_request_completed(_result, _response_code, _headers, _body):
	#print(body.get_string_from_utf8())
	pass

func translate(_targetLanguage, _inputText):
	var newreq = HTTPRequest.new()
	add_child(newreq)
	var headers2 = [
		#"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36",
		#"Accepts: application/json",
		#"Accept-Language: en-US,en;q=0.9",
		#"Referers: https://translate.google.com/",
		#"Accept-Charsets: utf-8",
		#"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0",
		#"Host: translate.google.com",
		"Content-Type: application/x-www-form-urlencoded;charset=UTF-8",
	]
	
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	#var textToTranslate = _inputText.percent_encode()
	
	var extraParams = "rpcids=MkEWBc&source-path=%2F&f.sid="+fd+"&bl="+cf+"&hl=en-US&soc-app=1&soc-platform=1&soc-device=1&_reqid="+str(randi() % 9000 + 1000)+"&rt=c"
	#print(extraParams)
	
	var payload = [[
		['MkEWBc', to_json([[_inputText, "en", _targetLanguage, true], [null]]), null, "generic"],
	]]
	var payloadString = "f.req="+to_json(payload).http_escape()+"&"
	#print(payloadString)
	var reqerror = newreq.request('https://translate.google.com/_/TranslateWebserverUi/data/batchexecute?'+extraParams, headers2, true, HTTPClient.METHOD_POST, payloadString)
	
	

	
	if(reqerror != OK):
		theResult["error"] = true
		theResult["errorMessage"] = "An error occurred in the HTTP request."
		newreq.queue_free()
		return theResult
	
	var theData = yield(newreq, "request_completed")
	
	if(theData == null || !(theData is Array) || theData.size() != 4):
		theResult["error"] = true
		theResult["errorMessage"] = "HTTP request returned null data"
		newreq.queue_free()
		return theResult
	
	var result = theData[0]
	if result != HTTPRequest.RESULT_SUCCESS:
		theResult["error"] = true
		theResult["errorMessage"] = "HTTP request wasn't successful"
		newreq.queue_free()
		return theResult
		
	#var response_code = theData[1]
	#print("RESPONSE CODE IS "+str(response_code))
		
		
		
	var theText:String = theData[3].get_string_from_utf8()
	newreq.queue_free()
	theText = theText.substr(6)
	
	#print("==START==")
	#print(theText)
	#print("==END==")
	
	for chunk in theText.split("\n"):
		if(chunk.length() == 0 || chunk[0] != "[" || chunk[3] == "e"):
			continue
		
		var jsonChunk = parse_json(chunk)
		for translation in jsonChunk:
			if (translation[0] != 'wrb.fr'):
				continue
			#var theid = translation[translation.size() - 1]
			#print(theid)
			
			if(translation[2] == null):
				theResult["success"] = true
				theResult["resultText"] = ""
				return theResult
			translation = parse_json(translation[2])
			#print(translation)
			
			var somestuff = translation[1][0][0][5]
			var someresult = []
			for asdf in somestuff:
				if(asdf[0] != null && asdf[0] != ""):
					print("A:"+str(asdf[0])+":A")
					someresult.append(asdf[0])
			var bestResult = joinSkipNewLines(someresult, " ")
			#print("START:"+bestResult+":END")
			#print(1)
			theResult["success"] = true
			theResult["resultText"] = bestResult
			return theResult
	
	if(true):
		return theResult
		
		
		
	var body = theData[3]
	print(body.get_string_from_utf8())
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
	return theResult

static func join(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

static func joinSkipNewLines(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		if(s.strip_edges() == ""):
			output += str(s)
		else:
			output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

func getName():
	return "Google (batch)"
