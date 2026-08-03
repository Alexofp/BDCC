extends TranslatorBase
class_name GoogleGTXTranslator

# From https://github.com/ttop32/MouseTooltipTranslator/blob/main/src/translator/googleGTX.js
# I hated every second of it

const GOOGLE_TRANSLATE_TKK = "448487.932609646"
const API_PATH = "https://translate.googleapis.com/translate_a/t"

func translate(_targetLanguage, _inputText, _sourceLanguage = "en"):
	var theResult = {
		error = false,
		success = false,
		errorMessage = "No error message provided",
		resultText = "No text provided",
	}
	
	var raw_result = yield(requestTranslate(_inputText, _sourceLanguage, _targetLanguage), "completed")
	
	if typeof(raw_result) != TYPE_DICTIONARY and typeof(raw_result) != TYPE_ARRAY:
		theResult["error"] = true
		theResult["errorMessage"] = "Translation request failed"
		return theResult
	
	var wrapped = wrapResponse(raw_result)
	if wrapped == null:
		theResult["error"] = true
		theResult["errorMessage"] = "Could not parse translation response"
		return theResult
	
	theResult["success"] = true
	theResult["resultText"] = wrapped
	return theResult

func requestTranslate(text: String, sourceLang: String, targetLang: String):
	text = text.replace("\n", "[[[]]]")
	var tk = _getToken(text)
	
	var url = API_PATH + "?" + _buildQueryString({
		"client": "te_lib",
		"sl": sourceLang,
		"tl": targetLang,
		"hl": targetLang,
		"anno": 3,
		"format": "html",
		"v": 1.0,
		"tc": 1,
		"sr": 1,
		"mode": 1,
		"q": text,
		"tk": tk
	})
	#623137.1004998   for Meow
	
	var http = HTTPRequest.new()
	var tree = Engine.get_main_loop()
	if tree:
		tree.root.add_child(http)
	else:
		return null
	
	var headers = [
		"Content-Type: application/x-www-form-urlencoded;charset=UTF-8",
	]
	var error = http.request(url, headers, true, HTTPClient.METHOD_GET)
	if error != OK:
		http.queue_free()
		return null
	
	var response = yield(http, "request_completed")
	var result_code = response[0]
	var response_code = response[1]
	var body_response = response[3].get_string_from_utf8()
	http.queue_free()
	
	#https://translate.googleapis.com/translate_a/t?client=te_lib&sl=auto&tl=ru&hl=ru&anno=3&format=html&v=1&tc=1&sr=1&mode=1&q=Meow&tk=623137.1004998
	if result_code != OK or response_code != 200:
		return null
	
	var json_parse = JSON.parse(body_response)
	if json_parse.error != OK:
		return null
	return json_parse.result

func wrapResponse(_res):
	if typeof(_res) != TYPE_ARRAY:
		return null
	if _res.size() == 0:
		return null
	
	var targetText = str(_res[0])
	
	var textDecoded = _decodeHtmlEntities(targetText)
	var textWithoutITag = _stripITags(textDecoded)
	var textWithoutBTag = _stripBTags(textWithoutITag)
	var textWithTrim = textWithoutBTag.replace("  ", " ").strip_edges()
	
	return textWithTrim.replace("[[[]]]", "\n")

func _buildQueryString(params: Dictionary) -> String:
	var parts := []
	for key in params:
		var value = str(params[key])
		parts.append(key + "=" + value.percent_encode())
	return Util.join(parts, "&")

func ipow(base: int, eexp: int) -> int:
	var result = 1
	var b = base
	var e = eexp

	while e > 0:
		if e & 1:
			result *= b

		b *= b
		e >>= 1

	return result

func unsigned_rshift(x: int, y: int) -> int:
	y &= 31

	# ToUint32
	var u = x & 0xFFFFFFFF

	if y == 0:
		return u

	# Perform a logical 32-bit shift.
	return u / ipow(2, y)

# Behaves identically to JavaScript's >>> operator.
func unsigned_right_shift(value, shift) -> int:
	var int_val = _to_int32(value)
	var shift_count = (_to_uint32(shift) & 0x1F)  # only lower 5 bits
	var uint32_val = int_val & 0xFFFFFFFF         # treat int_val as unsigned 32‑bit
	return uint32_val >> shift_count

# Returns the result of `value << shift` as a signed 32‑bit integer.
# Behaves identically to JavaScript's << operator.
func left_shift_32(value:int, shift:int) -> int:
	var int_val = _to_int32(value)
	var shift_count = _to_uint32(shift) & 0x1F   # only lower 5 bits
	var shifted = (int_val << shift_count) & 0xFFFFFFFF   # keep lower 32 bits
	return _to_int32(shifted)   # convert back to signed 32‑bit

# Converts any value to a signed 32‑bit integer (ToInt32).
func _to_int32(value) -> int:
	var num = float(value)
	if is_nan(num) or num == INF or num == -INF:
		return 0
	var truncated = int(num)          # truncates toward zero
	var lower = truncated & 0xFFFFFFFF
	if lower >= 0x80000000:
		lower -= 0x100000000
	return lower

# Converts any value to an unsigned 32‑bit integer (ToUint32).
func _to_uint32(value) -> int:
	var num = float(value)
	if is_nan(num) or num == INF or num == -INF:
		return 0
	var truncated = int(num)
	return truncated & 0xFFFFFFFF

func _shiftLeftOrRightThenSumOrXor(num: int, optString: String) -> int:
	var i := 0
	while i < optString.length() - 2:
		var acc = optString[i + 2]
		if "a" <= acc:
			acc = ord(acc) - 87
		else:
			acc = int(acc)
		if optString[i + 1] == "+":
			acc = unsigned_rshift(num, acc)
			#print("acc ",acc)
		else:
			acc = left_shift_32(num, acc) # FUCK THESE BITWISE SHITS
			#print("acc<< ",acc)
		if optString[i] == "+":
			num += acc & 4294967295
		else:
			num ^= acc
		i += 3
	return _to_int32(num)

#function shiftLeftOrRightThenSumOrXor(num, optString) {
#  for (let i = 0; i < optString.length - 2; i += 3) {
#    let acc = optString.charAt(i + 2);
#    if ("a" <= acc) {
#      acc = acc.charCodeAt(0) - 87;
#    } else {
#      acc = Number(acc);
#    }
#    if (optString.charAt(i + 1) == "+") {
#      acc = num >>> acc;
#    } else {
#      acc = num << acc;
#    }
#    if (optString.charAt(i) == "+") {
#      num += acc & 4294967295;
#    } else {
#      num ^= acc;
#    }
#  }
#  return num;
#}

func _transformQuery(query: String) -> Array:
	var bytesArray:Array = []
	
	var _i:int = 0
	while _i < query.length():
		var charCode:int = ord(query[_i])
		
		if(128 > charCode):
			bytesArray.append(charCode)
		else:
			if(2048 > charCode):
				bytesArray.append( (charCode >> 6) | 192 )
			else:
				if((55296 == (charCode & 64512)) && (_i + 1 < query.length()) && (56320 == (ord(query[_i+1]) & 64512)) ):
					_i += 1
					charCode = 65536 + ((charCode & 1023) << 10) + (ord(query[_i]) & 1023)
					bytesArray.append((charCode >> 18) | 240)
					bytesArray.append(((charCode >> 12) & 63) | 128)
				else:
					bytesArray.append((charCode >> 12) | 224)
				bytesArray.append(((charCode >> 6) & 63) | 128)
			bytesArray.append((charCode & 63) | 128)
		_i += 1
	
	return bytesArray

#function transformQuery(query) {
#  const bytesArray = [];
#  let idx = [];
#  for (let i = 0; i < query.length; i++) {
#    let charCode = query.charCodeAt(i);
#
#    if (128 > charCode) {
#      bytesArray[idx++] = charCode;
#    } else {
#      if (2048 > charCode) {
#        bytesArray[idx++] = (charCode >> 6) | 192;
#      } else {
#        if (
#          55296 == (charCode & 64512) &&
#          i + 1 < query.length &&
#          56320 == (query.charCodeAt(i + 1) & 64512)
#        ) {
#          charCode =
#            65536 + ((charCode & 1023) << 10) + (query.charCodeAt(++i) & 1023);
#          bytesArray[idx++] = (charCode >> 18) | 240;
#          bytesArray[idx++] = ((charCode >> 12) & 63) | 128;
#        } else {
#          bytesArray[idx++] = (charCode >> 12) | 224;
#        }
#        bytesArray[idx++] = ((charCode >> 6) & 63) | 128;
#      }
#      bytesArray[idx++] = (charCode & 63) | 128;
#    }
#  }
#  return bytesArray;
#}

func _getToken(query: String) -> String:
	var tkkIndex := 448487
	var tkkKey := 932609646
	
	var bytesArray := _transformQuery(query)
	
	var encondingRound := tkkIndex
	for i in bytesArray.size():
		encondingRound += bytesArray[i]
		encondingRound = _shiftLeftOrRightThenSumOrXor(encondingRound, "+-a^+6")
		#print("encondingRound ",encondingRound)
	encondingRound = _shiftLeftOrRightThenSumOrXor(encondingRound, "+-3^+b+-f")
	
	encondingRound ^= tkkKey
	if encondingRound <= 0:
		encondingRound = (encondingRound & 2147483647) + 2147483648
	
	var normalized := encondingRound % 1000000
	return str(normalized) + "." + str(normalized ^ tkkIndex)

#function getToken(query, windowTkk) {
#  const tkkSplited = windowTkk.split(".");
#  const tkkIndex = Number(tkkSplited[0]) || 0;
#  const tkkKey = Number(tkkSplited[1]) || 0;
#
#  const bytesArray = transformQuery(query);
#
#  let encondingRound = tkkIndex;
#  for (let i = 0; i < bytesArray.length; i++) {
#    encondingRound += bytesArray[i];
#    encondingRound = shiftLeftOrRightThenSumOrXor(encondingRound, "+-a^+6");
#  }
#  encondingRound = shiftLeftOrRightThenSumOrXor(encondingRound, "+-3^+b+-f");
#
#  encondingRound ^= tkkKey;
#  if (encondingRound <= 0) {
#    encondingRound = (encondingRound & 2147483647) + 2147483648;
#  }
#
#  const normalizedResult = encondingRound % 1000000;
#  return normalizedResult.toString() + "." + (normalizedResult ^ tkkIndex);
#}

func _decodeHtmlEntities(text: String) -> String:
	return text.xml_unescape()

func _stripITags(text: String) -> String:
	var regex = RegEx.new()
	regex.compile("<i>.*?</i>")
	return regex.sub(text, " ", true)

func _stripBTags(text: String) -> String:
	var regex = RegEx.new()
	regex.compile("</?b[^>]*>")
	return regex.sub(text, " ", true)

func getName():
	return "Google GTX"

func _init():
	id = "googlegtx"
	
	#var _l :=(unsigned_right_shift(-100, 5))
