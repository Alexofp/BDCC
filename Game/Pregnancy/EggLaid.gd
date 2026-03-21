extends Reference
class_name EggLaid

var type:int = TentacleEggType.Plant
var laidBy:String = "" # The character id of the character that laid this egg
var orifice:int = OrificeType.Anus # What orifice has this egg originally came from
var data:Dictionary 

func getName() -> String:
	return getNameByEggType(type)

static func getNameByEggType(_type:int) -> String:
	if(_type == TentacleEggType.Plant):
		return "Plant egg"
	if(_type == TentacleEggType.Latex):
		return "Latex egg"
	return "Unknown egg"

func createItem() -> ItemBase:
	if(type == TentacleEggType.Plant):
		var theEgg = GlobalRegistry.createItem("PlantEgg")
		theEgg.whoGaveBirth = laidBy
		return theEgg
	
	return null

func getOrifice() -> int:
	return orifice

func getBodypart() -> String:
	return OrificeType.toBodypart(orifice)

static func generateOneLineList(_eggs:Array) -> String:
	var theDict:Dictionary = {}
	for theEgg in _eggs:
		if(!theDict.has(theEgg.type)):
			theDict[theEgg.type] = 1
		else:
			theDict[theEgg.type] += 1
	
	var theTexts:Array = []
	for theEggType in theDict:
		var theAm:int = theDict[theEggType]
		
		theTexts.append(getNameByEggType(theEggType)+" x"+str(theAm))
	return Util.humanReadableList(theTexts)

func saveData() -> Dictionary:
	return {
		type = type,
		laidBy = laidBy,
		orifice = orifice,
		data = data,
	}

func loadData(_data:Dictionary):
	type = SAVE.loadVar(_data, "type", TentacleEggType.Plant)
	laidBy = SAVE.loadVar(_data, "laidBy", "")
	orifice = SAVE.loadVar(_data, "orifice", OrificeType.Anus)
	data = SAVE.loadVar(_data, "data", {})
