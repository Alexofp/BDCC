extends Object
class_name Util

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

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
