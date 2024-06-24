extends Reference
class_name DatapackCharacter

var id:String = "error"
var name:String = "Rahi"
var bodyparts:Dictionary = {}

var characterType:String = CharacterType.Inmate

var pickedSkin:String = "EmptySkin"
var pickedSkinRColor:Color = Color.white
var pickedSkinGColor:Color = Color.lightgray
var pickedSkinBColor:Color = Color.darkgray

var equippedItems:Dictionary = {}

var attacks:Array = []

var personality:Dictionary = {}

func getEditorName():
	return "id="+id+" name="+name

func getEditVars():
	var attackListFancy = []
	for attackID in GlobalRegistry.getAttacks():
		var attackObj:Attack = GlobalRegistry.getAttack(attackID)
		if(attackObj.isPlayerAttack):
			continue
		attackListFancy.append([attackID, attackID+" = "+attackObj.getVisibleName()])
	
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"characterType": {
			name = "Character type",
			type = "selector",
			values = CharacterType.getAllForDatapackCharacter(),
			value = characterType,
		},
		"skin": {
			name = "Base skin",
			type = "skin",
			skins = GlobalRegistry.getSkins().keys(),
			value = {skin=pickedSkin, r=pickedSkinRColor, g=pickedSkinGColor, b=pickedSkinBColor},
			noBase = true,
		},
		"bodyparts": {
			name = "Bodyparts",
			type = "bodyparts",
			value = bodyparts,
			collapsable = true,
		},
		"equippedItems": {
			name = "Default equipment",
			type = "equippedItems",
			value = equippedItems,
			collapsable = true,
		},
		"attacks": {
			name = "Attacks",
			type = "addRemoveList",
			value = attacks,
			values = attackListFancy,
			collapsable = true,
		},
		"personality": {
			name = "Personality",
			type = "personality",
			value = personality,
			collapsable = true,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "bodyparts"):
		bodyparts = value
		return true
	if(varid == "skin"):
		pickedSkin = value["skin"]
		pickedSkinRColor = value["r"]
		pickedSkinGColor = value["g"]
		pickedSkinBColor = value["b"]
		return true
	if(varid == "characterType"):
		characterType = value
		#return true
	if(varid == "equippedItems"):
		equippedItems = value
		return true
	if(varid == "attacks"):
		attacks = value
	if(varid == "personality"):
		personality = value
	
	return false

func saveData():
	return {
		"name": name,
		"bodyparts": bodyparts,
		"pickedSkin": pickedSkin,
		"pickedSkinRColor": pickedSkinRColor.to_html(),
		"pickedSkinGColor": pickedSkinGColor.to_html(),
		"pickedSkinBColor": pickedSkinBColor.to_html(),
		"characterType": characterType,
		"equippedItems": equippedItems,
		"attacks": attacks,
		"personality": personality,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	bodyparts = loadVar(data, "bodyparts", {})
	pickedSkin = loadVar(data, "pickedSkin", "EmptySkin")
	pickedSkinRColor = Color(SAVE.loadVar(data, "pickedSkinRColor", "ffffff"))
	pickedSkinGColor = Color(SAVE.loadVar(data, "pickedSkinGColor", "cccccc"))
	pickedSkinBColor = Color(SAVE.loadVar(data, "pickedSkinBColor", "999999"))
	characterType = loadVar(data, "characterType", CharacterType.Inmate)
	equippedItems = loadVar(data, "equippedItems", {})
	attacks = loadVar(data, "attacks", [])
	personality = loadVar(data, "personality", {})

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
