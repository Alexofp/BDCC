extends TranslatorBase
class_name DeepLTranslator

var req:HTTPRequest
var initdatareq:HTTPRequest
#var initData = ""

var headers = [
	"Content-Type: application/json",
	"Accept: */*",
	"x-app-os-name: iOS",
	"x-app-os-version: 16.3.0",
	"Accept-Language: en-US,en;q=0.9",
	"Accept-Encoding: gzip, deflate, br",
	"x-app-device: iPhone13,2",
	"User-Agent: DeepL-iOS/2.6.0 iOS 16.3.0 (iPhone13,2)",
	"x-app-build: 353933",
	"x-app-version: 2.6",
	"Connection: keep-alive",
]

func _init():
	id = "deepl"
	antispamSeconds = 10

var randomid = 0
func _ready():
	randomid = (randi()%99999 + 8300000) * 1000
	
	req = HTTPRequest.new()
	add_child(req)
	var _ok = req.connect("request_completed", self, "_http_request_completed")


func _http_request_completed(_result, _response_code, _headers, _body):
	var jsonResult = (JSON.parse(_body.get_string_from_utf8()))
	if(jsonResult.error != OK):
		printerr(jsonResult)
	else:
		print(jsonResult.result)
	pass

func fixLang(theLang):
	if(theLang in ["zh-Hans", "zh-CN"]):
		return "zh"
	else:
		return theLang

func translate(_targetLanguage, _inputText):
	var newreq = HTTPRequest.new()
	add_child(newreq)
	
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	var sourceLang = "EN"
	var targetLang = fixLang(_targetLanguage).to_upper()
	var theText = _inputText
	var iAmount = theText.count("i")
	var unixMilli = OS.get_unix_time()*1000000
	var timeStamp = unixMilli
	if(iAmount > 0):
		iAmount += 1
		timeStamp = unixMilli - unixMilli%iAmount + iAmount

	randomid += 1
	var postData = {
		"jsonrpc": "2.0",
		"method": "LMT_handle_texts",
		"params": {
			"splitting": "newlines",
			"lang": {
				"source_lang_user_selected": sourceLang,
				"target_lang": targetLang,
			},
			"common_job_params": {
				"was_spoken": false,
				"transcribe_as": "",
			},
			"texts": [
				{
					"text": theText,
					"request_alternatives": 3,
				}
			],
			"timestamp": timeStamp,
		},
		"id": randomid,
	}
	var jsonString:String = JSON.print(postData)
	if((randomid + 5)%29 == 0 || (randomid + 3)%13 == 0):
		jsonString = jsonString.replace("\"method\":\"", "\"method\" : \"")
	else:
		jsonString = jsonString.replace("\"method\":\"", "\"method\": \"")
		
	#print(jsonString)
	var reqerror = newreq.request("https://www2.deepl.com/jsonrpc", headers, true, HTTPClient.METHOD_POST, jsonString)

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
		
	var resultText:String = theData[3].get_string_from_utf8()
	newreq.queue_free()
	
	var jsonResult = JSON.parse(resultText)
	if(jsonResult.error != OK):
		theResult["error"] = true
		theResult["errorMessage"] = "Couldn't parse json data"
		return theResult
	
	var translateData = jsonResult.result
	
	if(!translateData.has("result") || !translateData["result"].has("texts")):
		theResult["success"] = false
		theResult["errorMessage"] = "No result in json"
		print(translateData)
		startCooldownMinutes(10)
		return
	
	var theActualResultTexts = []
	for someTextData in translateData["result"]["texts"]:
		if(someTextData.has("text")):
			theActualResultTexts.append(someTextData["text"])
	
	theResult["success"] = true
	theResult["resultText"] = join(theActualResultTexts, "\n")
	return theResult

static func join(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

func getName():
	return "DeepL"
