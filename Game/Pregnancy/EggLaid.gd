extends Reference
class_name EggLaid

var type:int = TentacleEggType.Plant
var laidBy:String = "" # The character id of the character that laid this egg
var orifice:int = OrificeType.Anus # What orifice has this egg originally came from
var data:Dictionary
var laidType:int = -1 # Of the egg
var laidColor:Color = Color.white # Of the egg

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
	
	if(data.empty()):
		return "Unknown egg"+byWho
	
	var result:String = ""
	var motherID:String = data.get("motherID", "")
	var fatherID:String = data.get("fatherID", "")
	var resultGender:String = data.get("resultGender", NpcGender.Male)
	var speciesArray:Array = data.get("resultSpecies", [])
	
	result += "Species: "+Util.getSpeciesName(speciesArray)
	result += "\nMother: "+internal_charName(motherID)
	result += "\nFather: "+internal_charName(fatherID)
	result += "\nGender: "+NpcGender.getVisibleNameColored(resultGender)
	
	return result+byWho

func internal_charName(_charID:String) -> String:
	var theCharacter = GlobalRegistry.getCharacter(_charID)
	if(!theCharacter):
		return "Unknown"
	return theCharacter.getName()

static func getNameByEggType(_type:int) -> String:
	if(_type == TentacleEggType.Plant):
		return "Plant egg"
	if(_type == TentacleEggType.Latex):
		return "Latex egg"
	return "Offspring egg"

func addSelfToNursery() -> bool:
	var theEggCell := createEggCell()
	if(!theEggCell):
		return false
	var bornChildren := theEggCell.makeChilds()
	for child in bornChildren:
		GM.CS.addChild(child)
	return true

func handleNursery() -> bool:
	if(type == TentacleEggType.NONE):
		addSelfToNursery()
		return true
	return false

func handleDisposalByNPC() -> bool:
	if(type == TentacleEggType.NONE):
		addSelfToNursery()
		return true
	return false

func createItem():
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

static func canCombineForReportType(_eggType:int) -> bool:
	if(_eggType == TentacleEggType.Latex):
		return true
	if(_eggType == TentacleEggType.Plant):
		return true
	return false

func canCombineForReport() -> bool:
	return canCombineForReportType(type)

func generateReportLine() -> String:
	return ""

static func generateEggReport(_eggs:Array) -> Array:
	var result:Array = []
	
	var eggAmountByType:Dictionary = {}
	var eggNameByType:Dictionary = {}
	for theEgg in _eggs:
		if(theEgg.canCombineForReport()):
			if(!eggAmountByType.has(theEgg.type)):
				eggAmountByType[theEgg.type] = 1
				eggNameByType[theEgg.type] = theEgg.getName()
			else:
				eggAmountByType[theEgg.type] += 1
			continue
		
		var theReport:String = theEgg.generateReportLine()
		result.append("- 1x"+theEgg.getName()+((": "+theReport) if !theReport.empty() else ""))
	
	for eggType in eggAmountByType:
		var theAm:int = eggAmountByType[eggType]
		var theName:String = eggNameByType[eggType]
		
		result.append("- "+str(theAm)+"x"+theName)
	
	return result

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

func tryGetMainSpeciesID() -> String:
	var theSpecies: Array = data.get("resultSpecies", [])
	if(theSpecies.empty()):
		return ""
	return theSpecies[0]

func tryGetMainSpecies():
	var theSpeciesID:String = tryGetMainSpeciesID()
	if(theSpeciesID.empty()):
		return null
	return GlobalRegistry.getSpecies(theSpeciesID)

func onCreated(_egg:EggCell):
	if(type == TentacleEggType.NONE):
		var theSpecies = tryGetMainSpecies()
		if(theSpecies):
			theSpecies.onEggLaid(self, _egg)

# Returns either an egg type or a color, used for the egg prop
func getEggColor() -> Color:
	return laidColor

func getEggLaidType() -> int:
	if(laidType < 0):
		if(type == TentacleEggType.Plant):
			laidType = type
		elif(type == TentacleEggType.Latex):
			laidType =  type
		else:
			var theSpecies = tryGetMainSpecies()
			if(theSpecies):
				laidType = theSpecies.generateEggType(self)
				laidColor = theSpecies.generateEggColor(self)
			else:
				laidType = TentacleEggType.NONE
	return laidType

static func getEggQueue(_eggs:Array) -> Array:
	var result:Array = []

	for theEgg in _eggs:
		result.append(theEgg.getEggColorOrType())

	return result

func getEggColorOrType():
	if(laidType == TentacleEggType.Plant):
		return laidType
	elif(laidType == TentacleEggType.Latex):
		return laidType
	else:
		return laidColor

func getEggItemImagePath() -> String:
	if(type == TentacleEggType.Plant):
		return "res://Images/Items/medical/egg-shell.png"
	if(type == TentacleEggType.Latex):
		return "res://Images/Items/medical/egg-latex.png"
	var theSpecies = tryGetMainSpecies()
	if(theSpecies):
		return theSpecies.getEggInventorySpritePath(self)
	
	return "res://Images/Items/medical/egg.png"

func getEggItemColor() -> Color:
	return laidColor

func createEggCell() -> EggCell:
	if(data.empty()):
		return null
	var theEggCell := EggCell.new()
	theEggCell.loadData(data)
	return theEggCell

func saveData() -> Dictionary:
	return {
		type = type,
		laidBy = laidBy,
		orifice = orifice,
		data = data,
		laidType = laidType,
		laidColor = laidColor.to_html(false),
	}

func loadData(_data:Dictionary):
	type = SAVE.loadVar(_data, "type", TentacleEggType.Plant)
	laidBy = SAVE.loadVar(_data, "laidBy", "")
	orifice = SAVE.loadVar(_data, "orifice", OrificeType.Anus)
	data = SAVE.loadVar(_data, "data", {})
	laidType = SAVE.loadVar(_data, "laidColor", -1)
	laidColor = Color("#"+SAVE.loadVar(_data, "laidColor", ""))
