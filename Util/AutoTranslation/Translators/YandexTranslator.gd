extends TranslatorBase
class_name YandexTranslator

const yandexLangCode = {
	"af": "af",
	"sq": "sq",
	"am": "am",
	"ar": "ar",
	"hy": "hy",
	"az": "az",
	"eu": "eu",
	"be": "be",
	"bn": "bn",
	"bs": "bs",
	"bg": "bg",
	"ca": "ca",
	"hr": "hr",
	"cs": "cs",
	"da": "da",
	"nl": "nl",
	"en": "en",
	"eo": "eo",
	"et": "et",
	"fi": "fi",
	"fr": "fr",
	"gl": "gl",
	"ka": "ka",
	"de": "de",
	"el": "el",
	"gu": "gu",
	"ht": "ht",
	"hi": "hi",
	"hu": "hu",
	"is": "is",
	"id": "id",
	"ga": "ga",
	"it": "it",
	"ja": "ja",
	"kn": "kn",
	"kk": "kk",
	"km": "km",
	"ko": "ko",
	"ky": "ky",
	"lo": "lo",
	"la": "la",
	"lv": "lv",
	"lt": "lt",
	"lb": "lb",
	"mk": "mk",
	"mg": "mg",
	"ms": "ms",
	"ml": "ml",
	"mt": "mt",
	"mi": "mi",
	"mr": "mr",
	"mn": "mn",
	"my": "my",
	"ne": "ne",
	"no": "no",
	"fa": "fa",
	"pl": "pl",
	"pt": "pt",
	"pa": "pa",
	"ro": "ro",
	"ru": "ru",
	"gd": "gd",
	"sr": "sr",
	"si": "si",
	"sk": "sk",
	"sl": "sl",
	"es": "es",
	"su": "su",
	"sw": "sw",
	"sv": "sv",
	"tg": "tg",
	"ta": "ta",
	"te": "te",
	"th": "th",
	"tr": "tr",
	"uk": "uk",
	"ur": "ur",
	"uz": "uz",
	"vi": "vi",
	"cy": "cy",
	"xh": "xh",
	"yi": "yi",
	"tl": "tl",
	"iw": "he",
	"jw": "jv",
	"zh-CN": "zh"
}

const mainUrl = "https://translate.yandex.net/api/v1/tr.json/translate"

func translate(_targetLanguage, _inputText):
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	var theStuff = yield(requestTranslate(_inputText.replace("\"", "'"), "en", yandexLangCode.get(_targetLanguage, _targetLanguage)), "completed")
	
	if(!(theStuff is String)):
		theResult["error"] = true
		startCooldownMinutes(5)
		return theResult
	
	theResult["success"] = true
	theResult["resultText"] = theStuff
	return theResult

func _generateUuidNoDash() -> String:
	var result = ""
	for _i in range(32):
		result += RNG.pick([
			"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
		])
	return result

func requestTranslate(text: String, sourceLang: String, targetLang: String):
	var uuid = _generateUuidNoDash()
	var lang = targetLang if sourceLang == "auto" else sourceLang + "-" + targetLang
	
	var url = mainUrl + "?id=" + uuid + "-0-0&srv=android"
	
	var body = "lang=" + lang + "&text=" + text
	
	var http = HTTPRequest.new()
	var tree = Engine.get_main_loop()
	if tree:
		tree.root.add_child(http)
	else:
		return null
	
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	var error = http.request(url, headers, true, HTTPClient.METHOD_POST, body)
	if error != OK:
		http.queue_free()
		return null
	
	# Wait for response
	var response = yield(http, "request_completed")
	var result_code = response[0]
	var response_code = response[1]
	var body_response = response[3].get_string_from_utf8()
	http.queue_free()
	
	if result_code != OK or response_code != 200:
		return null
	
	var json_parse = JSON.parse(body_response)
	if json_parse.error != OK:
		return null
	var theRes = json_parse.result
	return wrapResponse(theRes)

func wrapResponse(_res: Dictionary):
	if _res.get("code", "") == 200:
		return _res["text"][0]
	return null

func getName():
	return "Yandex"

func _init():
	id = "yandex"
