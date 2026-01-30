extends "res://Util/SimpleParser.gd"
class_name GameParser

func callFunc(_command: String, _args: Array):
	var shouldBeUpperCase = false
	if(_command.length() > 0 && _command[0].to_upper() == _command[0]):
		shouldBeUpperCase = true
		_command[0] = _command[0].to_lower()
	
	var result = callFuncWrapper(_command, _args)
	if((result is String) && shouldBeUpperCase && result.length() > 0):
		result[0] = result[0].to_upper()
	
	return result
	
# Store synonyms in a flat dictionary for O(1) lookup speed
const SYNONYMS = {
	"penis": ["cock", "dick", "member"], "cock": ["cock", "dick", "member"], "dick": ["cock", "dick", "member"],
	"vagina": ["pussy", "cunt", "vagina"], "pussy": ["pussy", "cunt", "vagina"],
	"ass": ["ass", "butt"], "butt": ["ass", "butt"],
	"asshole": ["asshole", "tailhole", "anus"], "tailhole": ["asshole", "tailhole", "anus"], 
	"butthole": ["asshole", "tailhole", "anus"], "anus": ["asshole", "tailhole", "anus"]
}

func callFuncWrapper(_command: String, _args: Array):
	# 1. Handle Synonyms first (Fastest)
	if SYNONYMS.has(_command):
		return RNG.pick(SYNONYMS[_command])
	
	# 2. Use a match statement for specific logic (Faster than if-else in GDScript)
	match _command:
		"sayMale", "sayFemale", "sayAndro", "sayOther", "sayPlayer":
			if _args.size() == 1:
				var text = str(_args[0])
				# Manual dispatch is safer for static methods in Godot 3
				if _command == "sayMale": return Util.sayMale(text)
				if _command == "sayFemale": return Util.sayFemale(text)
				if _command == "sayAndro": return Util.sayAndro(text)
				if _command == "sayOther": return Util.sayOther(text)
				if _command == "sayPlayer": return Util.sayPlayer(text)
		
		"pick":
			return str(RNG.pick(_args))
			
		"rahiMaster":
			return GM.main.getFlag("RahiModule.rahiPCName", GM.pc.getName())
			
		"rahiFP":
			if _args.size() == 2:
				var can_talk = GlobalRegistry.getModule("RahiModule").canTalkInFirstPerson()
				return _args[0] if can_talk else _args[1]
				
		"taviCorruption":
			var val = GM.main.getFlag("TaviModule.Ch6Corruption", 1.0) * 100.0
			return str(Util.roundF(val, 1)) + "%"
			
		"jackiButt":
			return GlobalRegistry.getModule("JackiModule").getButtTightness()

	# 3. Fallback Error
	return "[color=red]!RUNTIME ERROR NO COMMAND FOUND " + _command + " " + str(_args) + "![/color]"
	
func callObjectFunc(_obj: String, _command: String, _args: Array, overrides: Dictionary = {}) -> String:
	if(overrides.has(_obj)):
		_obj = overrides[_obj]
	
	var shouldBeUpperCase = false
	if(_command.length() > 0 && _command[0].to_upper() == _command[0]):
		shouldBeUpperCase = true
		_command[0] = _command[0].to_lower()
	
	var result:String = callObjectFuncWrapper(_obj, _command, _args)
	if(shouldBeUpperCase && result.length() > 0):
		result[0] = result[0].to_upper()
	
	return result
	
# Map all aliases to a "base" command to reduce match cases
const CMD_MAP = {
	"youre": "youreTheyre", "youreTheyre": "youreTheyre",
	"youve": "youveTheyve", "youveTheyve": "youveTheyve",
	"does": "doesDo", "doesDo": "doesDo",
	"doesnt": "doesntDont", "doesntDont": "doesntDont",
	"nameOrYou": "nameOrYou", "you": "nameOrYou",
	"hisYour": "hisYour", "hisYou": "hisYour", "yourHis": "hisYour", "yourTheir": "hisYour", "youHis": "hisYour",
	"nameSOrYou": "nameSOrYou", "your": "nameSOrYou",
	"yoursHis": "hisYours", "yoursTheirs": "hisYours", "hisYours": "hisYours",
	"wasnt": "wasntWerent", "werent": "wasntWerent", "wasntWerent": "wasntWerent",
	"isnt": "isntArent", "arent": "isntArent", "isntArent": "isntArent",
	"hasnt": "hasntHavent", "havent": "hasntHavent", "hasntHavent": "hasntHavent",
	"she": "heShe", "he": "heShe", "heShe": "heShe",
	"their": "hisHer", "his": "hisHer", "her": "hisHer", "hisHer": "hisHer",
	"theirs": "hisHers", "hers": "hisHers", "hisHers": "hisHers",
	"him": "himHer", "himHer": "himHer",
	"was": "wasWere", "were": "wasWere", "wasWere": "wasWere",
	"is": "isAre", "are": "isAre", "isAre": "isAre",
	"has": "hasHave", "have": "hasHave", "hasHave": "hasHave",
	"himself": "himselfHerself", "herself": "himselfHerself", "himselfHerself": "himselfHerself", "themself": "himselfHerself", "itself": "himselfHerself",
	"penis": "cock", "cock": "cock", "dick": "cock"
}

func callObjectFuncWrapper(_obj: String, _command: String, _args: Array) -> String:
	var resolvedName = GM.main.resolveCustomCharacterName(_obj)
	if resolvedName != null:
		_obj = resolvedName
	
	var object = null
	if _obj == "pc":
		object = GM.pc
	else:
		object = GlobalRegistry.getCharacter(_obj)
		
	if object == null:
		return "[color=red]!RUNTIME ERROR NO CHARACTER FOUND "+_obj+"."+_command+" "+str(_args)+"![/color]"

	var is_pc = object.isPlayer()
	# Normalize command using the map
	var cmd = CMD_MAP.get(_command, _command)

	match cmd:
		"theyre": return object.theyre()
		"youreTheyre": return "you're" if is_pc else object.theyre()
		"theyve": return object.theyve()
		"youveTheyve": return "you've" if is_pc else object.theyve()
		"doesDo": return object.doesDo()
		"youDo": return "do" if is_pc else object.doesDo()
		"doesntDont": return object.doesntDont()
		"youDont": return "don't" if is_pc else object.doesntDont()
		"name": return object.getName()
		"nameS": return object.getName() + "'s"
		"nameOrYou": return "you" if is_pc else object.getName()
		"youHe": return "you" if is_pc else object.heShe()
		"himYou", "youHim": return "you" if is_pc else object.himHer()
		"hisYour": return "your" if is_pc else object.hisHer()
		"nameSOrYou", "yours": return "your" if is_pc else object.getName() + "'s"
		"hisYours": return "yours" if is_pc else object.hisHers()
		"youWere": return "were" if is_pc else object.wasWere()
		"youAre": return "are" if is_pc else object.isAre()
		"youArent": return "aren't" if is_pc else (object.isAre() + "n't")
		"youHave": return "have" if is_pc else object.hasHave()
		"youVerb":
			if is_pc: return str(_args[0])
			return object.callv("verbS", _args)
		"yourself": return "yourself" if is_pc else object.himselfHerself()
		"say": return object.formatSay(str(_args[0]))
		"heShe": return object.heShe()
		"hisHer": return object.hisHer()
		"hisHers": return object.hisHers()
		"himHer": return object.himHer()
		"wasWere": return object.wasWere()
		"wasntWerent": return object.wasWere() + "n't"
		"isAre": return object.isAre()
		"isntArent": return object.isAre() + "n't"
		"hasHave": return object.hasHave()
		"hasntHavent": return object.hasHave() + "n't"
		"himselfHerself": return object.himselfHerself()
		"verbS", "verb": return object.callv("verbS", _args)
		"cock": return object.getBodypartLewdDescriptionAndName(BodypartSlot.Penis)
		# Add other specific logic cases here...

	return "[color=red]!RUNTIME ERROR NO COMMAND FOUND "+_command+" "+str(_args)+"![/color]"
