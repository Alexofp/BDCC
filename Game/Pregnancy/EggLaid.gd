extends Reference
class_name EggLaid

var type:int = TentacleEggType.Plant
var laidBy:String = "" # The character id of the character that laid this egg
var orifice:int = OrificeType.Anus # What orifice has this egg originally came from
var data:Dictionary 

func getName() -> String:
	return getNameByEggType(type)

func getEggDescription() -> String:
	var byWho:String = ""
	if(laidBy != ""):
		var theChar = GlobalRegistry.getCharacter(laidBy)
		if(theChar == null):
			byWho = "\n\nThis egg was laid by someone unknown.."
		elif(laidBy == "pc"):
			byWho = "\n\nThis egg was laid by you!"
		else:
			byWho = "\n\nThis egg was laid by "+str(theChar.getName())
	
	if(type == TentacleEggType.Plant):
		return "Plant egg"+byWho
	if(type == TentacleEggType.Latex):
		return "An egg that is made out of latex. Doesn't have much use.. but it can be sold probably."+byWho
	return "Unknown egg"+byWho

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
	
	var genericEgg = GlobalRegistry.createItem("EggGeneric")
	genericEgg.setEggLaid(self)
	return genericEgg

func canSellEgg() -> bool:
	return true

func getEggSellPrice() -> int:
	return 5

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

# Returns either an egg type or a color, used for the egg prop
func getEggColorType():
	if(type == TentacleEggType.Plant):
		return type
	if(type == TentacleEggType.Latex):
		return type
	return Color.white

func getEggItemImagePath() -> String:
	if(type == TentacleEggType.Plant):
		return "res://Images/Items/medical/egg-shell.png"
	if(type == TentacleEggType.Latex):
		return "res://Images/Items/medical/egg-latex.png"
	return "res://Images/Items/medical/egg.png"

func getEggItemColor() -> Color:
	return Color.white

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
