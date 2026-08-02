extends TranslatorBase
class_name DeepLTranslatorV2

const deeplBaseUrl = "https://www2.deepl.com/jsonrpc"

# THIS TRANSLATOR WORKS BUT ONLY FOR A BIT

const deeplLangCode = {
	"auto": "auto",
	"ar": "AR",
	"bg": "BG",
	"cs": "CS",
	"da": "DA",
	"de": "DE",
	"el": "EL",
	"en": "EN",
	"es": "ES",
	"et": "ET",
	"fi": "FI",
	"fr": "FR",
	"hu": "HU",
	"id": "ID",
	"it": "IT",
	"ja": "JA",
	"ko": "KO",
	"lt": "LT",
	"lv": "LV",
	"no": "NB",
	"nl": "NL",
	"pl": "PL",
	"pt": "PT",
	"ro": "RO",
	"ru": "RU",
	"sk": "SK",
	"sl": "SL",
	"sv": "SV",
	"tr": "TR",
	"uk": "UK",
	"zh-CN": "ZH"
}

func translate(_targetLanguage, _inputText):
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	var theStuff = yield(requestTranslate(_inputText.replace("\"", "'"), "EN", deeplLangCode.get(_targetLanguage, _targetLanguage)), "completed")
	
	if(!(theStuff is String)):
		theResult["error"] = true
		startCooldownMinutes(5)
		return theResult
	
	theResult["success"] = true
	theResult["resultText"] = theStuff
	return theResult

func requestTranslate(text: String, sourceLang: String, targetLang: String):
	var post_data = _initData(text, sourceLang, targetLang)
	post_data["id"] = _getRandomNumber()
	post_data["params"]["timestamp"] = _getTimeStamp(_getICount(text))
	var post_str = _getDeeplJsonText(post_data)
	
	# Prepare HTTP request
	var http = HTTPRequest.new()
	var tree = Engine.get_main_loop()
	if tree:
		tree.root.add_child(http)
	else:
		return null
	
	var headers = ["Content-Type: application/json"]
	#var body = post_str.to_utf8()
	var error = http.request(deeplBaseUrl, headers, true, HTTPClient.METHOD_POST, post_str)
	if error != OK:
		http.queue_free()
		return null
	
	var response = yield(http, "request_completed")
	var result = response[0]
	var response_code = response[1]
	var body_response = response[3].get_string_from_utf8()
	http.queue_free()
	
	if result != OK or response_code != 200:
		return null
	
	var json_parse = JSON.parse(body_response)
	if json_parse.error != OK:
		return null
	var theRes = json_parse.result
	return wrapResponse(theRes)

func wrapResponse(_res: Dictionary):
	if _res.has("result"):
		return _res.result.texts[0].text
	return null

func _initData(text: String, source_lang: String, target_lang: String) -> Dictionary:
	return {
		"jsonrpc": "2.0",
		"method": "LMT_handle_texts",
		"params": {
			"splitting": "newlines",
			"lang": {
				"source_lang_user_selected": source_lang,
				"target_lang": target_lang
			},
			"texts": [
				{
					"text": text,
					"requestAlternatives": 3
				}
			]
		}
	}

func _getICount(translate_text: String) -> int:
	return translate_text.count("i")

func _getRandomNumber() -> int:
	var rand = randi() % 99999 + 100000
	return rand * 1000

func _getTimeStamp(iCount: int) -> int:
	var ts = int(OS.get_unix_time() * 1000)
	if iCount != 0:
		iCount += 1
		return ts - (ts % iCount) + iCount
	else:
		return ts
	
func _getDeeplJsonText(post_data: Dictionary) -> String:
	var id = post_data["id"]
	var post_str = JSON.print(post_data)
	if (id + 5) % 29 == 0 or (id + 3) % 13 == 0:
		post_str = post_str.replace('"method":"', '"method" : "')
	else:
		post_str = post_str.replace('"method":"', '"method": "')
	return post_str


func getName():
	return "DeepL"

func _init():
	id = "deeplv2"
