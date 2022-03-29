extends Object
class_name Util

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

# input ["a", "b", "c"]
# output "a, b and c"
static func humanReadableList(arr: Array, andConnector: String = "and", commaConnector: String = ","):
	var arrSize = arr.size()
	if(arrSize == 0):
		return ""
	if(arrSize == 1):
		return arr[0]
	if(arrSize == 2):
		return arr[0] + " "+andConnector+" " + arr[1]
	
	var res = ""
	for i in range(arrSize):
		if(i == (arrSize - 1)):
			res += " "+andConnector+" "
		
		res += arr[i]
		
		if(i <= (arrSize - 3)):
			res += commaConnector + " "
	return res

# Util.multipleOrSingularEnding(1, "apple") = apple
# Util.multipleOrSingularEnding(2, "apple") = apples
static func multipleOrSingularEnding(value, word, wordMultiple = null):
	if(value == 1):
		return word
	if(wordMultiple == null):
		return word+"s"
	return wordMultiple

# https://godotengine.org/qa/20058/elegant-way-to-create-string-from-array-items
static func join(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

# input 12345
# output "3h 25m 45s"
static func getTimeStringHumanReadable(t):
	var _seconds = floor(fmod(t, 60.0))
	var _minutes = floor(fmod(t/60.0, 60.0))
	var _hours = floor(t/3600.0)
	
	var result = ""
	if(_hours > 0):
		result += str(_hours)+"h "
	if(_minutes > 0):
		result += str(_minutes)+"m "
	if(_seconds > 0):
		result += str(_seconds)+"s "
	return result.trim_suffix(" ")

# input 12345
# output "03:25:45"
static func getTimeStringHHMMSS(t):
	var _seconds = floor(fmod(t, 60.0))
	var _minutes = floor(fmod(t/60.0, 60.0))
	var _hours = floor(t/3600.0)
	
	var time = "%02d:%02d:%02d" % [_hours, _minutes, _seconds]
	
	return time
	
# input 12345
# output "03:25"
static func getTimeStringHHMM(t):
	var _seconds = floor(fmod(t, 60.0))
	var _minutes = floor(fmod(t/60.0, 60.0))
	var _hours = floor(t/3600.0)
	
	var time = "%02d:%02d" % [_hours, _minutes]
	
	return time

static func getSpeciesName(species: Array):
	if(species.size() == 0):
		return "Unknown species"
	
	if(species.size() == 1):
		var specie = GlobalRegistry.getSpecies(species[0])
		return specie.getVisibleName()
	
	var names = []
	for specieID in species:
		var specie = GlobalRegistry.getSpecies(specieID)
		names.append(specie.getVisibleName())
	
	return join(names, "-") + " hybrid"

static func numberToPercentString(value: float):
	if(value < 0):
		return str(value*100)+"%"
	if(value > 0):
		return "+"+str(value*100)+"%"
	return "0%"

# https://godotengine.org/qa/19077/how-to-get-the-date-as-per-rfc-1123-date-format-in-game
static func datetimeToRFC113(time):
	var nameweekday= ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
	var namemonth= ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
	var dayofweek = time["weekday"]   # from 0 to 6 --> Sunday to Saturday
	var day = time["day"]                         #   1-31
	var month= time["month"]               #   1-12
	var year= time["year"]             
	var hour= time["hour"]                     #   0-23
	var minute= time["minute"]             #   0-59
	var second= time["second"]             #   0-59

	var dateRFC1123 = str(nameweekday[dayofweek]) + ", " + str("%02d" % [day]) + " " + str(namemonth[month-1]) + " " + str(year) + " " + str("%02d" % [hour]) + ":" + str("%02d" % [minute]) + ":" + str("%02d" % [second]) + " GMT"
	return dateRFC1123

static func stripBadFilenameCharacters(path: String) -> String:
	var escapeCharacters = ':/\\?*"|%<>'
	for ch in escapeCharacters:
		path = path.replace(ch, "")
	return path

static func sayMale(text):
	return "[color=#3E84E0]\""+text+"\"[/color]"
	
static func sayFemale(text):
	return "[color=#FF837A]\""+text+"\"[/color]"

static func sayAndro(text):
	return "[color=#BA82FF]\""+text+"\"[/color]"
	
static func sayOther(text):
	return "[color=#77D86C]\""+text+"\"[/color]"

static func sayPlayer(text):
	if(GM.pc == null):
		return sayFemale(text)
	
	return GM.pc.formatSay(text)

static func sayChar(charID, text):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.formatSay(text)

static func heShe(charID):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.heShe()

static func hisHer(charID):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.hisHer()
	
static func himHer(charID):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.himHer()
	
static func isAre(charID):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.isAre()
	
static func hasHave(charID):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.hasHave()
	
static func himselfHerself(charID):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.himselfHerself()

static func verbS(charID, verbWithNoS, verbWithS = null):
	var character = GlobalRegistry.getCharacter(charID)
	
	return character.verbS(verbWithNoS, verbWithS)

static func muffledSpeech(text: String, strenght: int = 1):
	var newtext = ""
	
	for ch in text:
		var isCapital = false
		var oldch = ch
		if(ch == ch.to_upper()):
			isCapital = true
		var chlower = ch.to_lower()
		
		if(strenght == 1):
			if(chlower == "l"):
				ch = "w"
			if(chlower == "r"):
				ch = "w"
			if(chlower == "s"):
				ch = "f"
			if(chlower == "t"):
				ch = "g"
		if(strenght == 2):
			if(chlower in "abjsvz"):
				ch = "r"
			if(chlower in "dklw"):
				ch = "f"
			if(chlower in "gx"):
				ch = "n"
			if(chlower in "himu"):
				ch = "d"
			if(chlower in "q"):
				ch = "m"
		if(strenght == 3):
			if(oldch in "BDKTV"):
				ch = "Mph"
			if(oldch in "bdktv"):
				ch = "m"
			if(oldch in "DJLQR"):
				ch = "M"
			if(oldch in "djlqr"):
				ch = "ph"
			if(oldch in "S"):
				ch = "H"
			if(oldch in "s"):
				ch = "m"
			if(oldch in "C"):
				ch = "Mf"
			if(oldch in "c"):
				ch = "m"
			if(oldch in "AEIOU"):
				ch = "Mph"
			if(oldch in "aeiou"):
				ch = "m"
			if(oldch in "CVNY"):
				ch = "Mh"
			if(oldch in "cvny"):
				ch = "ph"
			if(oldch in "WYZX"):
				ch = "Mf"
			if(oldch in "wyzx"):
				ch = "f"
				
		if(oldch != ch && isCapital):
			ch = ch.capitalize()

		newtext += ch
		
	return newtext

static func variantTypeToString(type):
	if(type == TYPE_NIL):
		return "TYPE_NIL"
	if(type == TYPE_BOOL):
		return "TYPE_BOOL"
	if(type == TYPE_INT):
		return "TYPE_INT"
	if(type == TYPE_REAL):
		return "TYPE_REAL"
	if(type == TYPE_STRING):
		return "TYPE_STRING"
	if(type == TYPE_VECTOR2):
		return "TYPE_VECTOR2"
	if(type == TYPE_RECT2):
		return "TYPE_RECT2"
	if(type == TYPE_VECTOR3):
		return "TYPE_VECTOR3"
	if(type == TYPE_TRANSFORM2D):
		return "TYPE_TRANSFORM2D"
	if(type == TYPE_PLANE):
		return "TYPE_PLANE"
	if(type == TYPE_QUAT):
		return "TYPE_QUAT"
	if(type == TYPE_AABB):
		return "TYPE_AABB"
	if(type == TYPE_BASIS):
		return "TYPE_BASIS"
	if(type == TYPE_TRANSFORM):
		return "TYPE_TRANSFORM"
	if(type == TYPE_COLOR):
		return "TYPE_COLOR"
	if(type == TYPE_NODE_PATH):
		return "TYPE_NODE_PATH"
	if(type == TYPE_RID):
		return "TYPE_RID"
	if(type == TYPE_OBJECT):
		return "TYPE_OBJECT"
	if(type == TYPE_DICTIONARY):
		return "TYPE_DICTIONARY"
	if(type == TYPE_ARRAY):
		return "TYPE_ARRAY"
	if(type == TYPE_RAW_ARRAY):
		return "TYPE_RAW_ARRAY"
	if(type == TYPE_INT_ARRAY):
		return "TYPE_INT_ARRAY"
	if(type == TYPE_REAL_ARRAY):
		return "TYPE_REAL_ARRAY"
	if(type == TYPE_STRING_ARRAY):
		return "TYPE_STRING_ARRAY"
	if(type == TYPE_VECTOR2_ARRAY):
		return "TYPE_VECTOR2_ARRAY"
	if(type == TYPE_VECTOR3_ARRAY):
		return "TYPE_VECTOR3_ARRAY"
	if(type == TYPE_COLOR_ARRAY):
		return "TYPE_COLOR_ARRAY"
	return "UNKNOWN_TYPE"

const spaceCharacters = {
	" ": true,
	"\t": true,
}

const digits = {
	"0": true,
	"1": true,
	"2": true,
	"3": true,
	"4": true,
	"5": true,
	"6": true,
	"7": true,
	"8": true,
	"9": true,
}

const asciiletters = {
	"a": true, "A": true,
	"b": true, "B": true,
	"c": true, "C": true,
	"d": true, "D": true,
	"e": true, "E": true,
	"f": true, "F": true,
	"g": true, "G": true,
	"h": true, "H": true,
	"i": true, "I": true,
	"j": true, "J": true,
	"k": true, "K": true,
	"l": true, "L": true,
	"m": true, "M": true,
	"n": true, "N": true,
	"o": true, "O": true,
	"p": true, "P": true,
	"q": true, "Q": true,
	"r": true, "R": true,
	"s": true, "S": true,
	"t": true, "T": true,
	"u": true, "U": true,
	"v": true, "V": true,
	"w": true, "W": true,
	"x": true, "X": true,
	"y": true, "Y": true,
	"z": true, "Z": true,
}
