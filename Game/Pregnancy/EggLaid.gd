extends Reference
class_name EggLaid

var type:int = BigEggType.Plant
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
	
	if(type == BigEggType.Plant):
		return "Plant egg"+byWho
	if(type == BigEggType.Latex):
		return "An egg that is made out of latex. Doesn't have much use.. but it can be sold probably."+byWho
	if(type == BigEggType.Unfertilized):
		return "This egg wasn't fertilized. It contains no DNA and is therefore useless."+byWho
	
	if(data.empty()):
		return "Unknown egg"+byWho
	
	var result:String = ""
	var motherID:String = data.get("motherID", "")
	var fatherID:String = data.get("fatherID", "")
	var resultGender:String = data.get("resultGender", NpcGender.Male)
	var speciesArray:Array = data.get("resultSpecies", [])
	
	result += "Nursery will accept this egg.\n\n"
	
	result += "Species: "+Util.getSpeciesName(speciesArray)
	result += "\nMother: "+internal_charName(motherID)
	result += "\nFather: "+internal_charName(fatherID)
	result += "\nGender: "+NpcGender.getVisibleNameColored(resultGender)
	
	return result+byWho

func isPCMother() -> bool:
	if(data.empty()):
		return false
	return data.get("motherID", "") == "pc"

func isPCFather() -> bool:
	if(data.empty()):
		return false
	return data.get("fatherID", "") == "pc"

func internal_charName(_charID:String) -> String:
	var theCharacter = GlobalRegistry.getCharacter(_charID)
	if(!theCharacter):
		return "Unknown"
	return theCharacter.getName()

static func getNameByEggType(_type:int) -> String:
	if(_type == BigEggType.Plant):
		return "Plant egg"
	if(_type == BigEggType.Latex):
		return "Latex egg"
	if(_type == BigEggType.Unfertilized):
		return "Unfertilized egg"
	return "Offspring egg"

static func getANameByEggType(_type:int) -> String:
	if(_type == BigEggType.Plant):
		return "A plant egg"
	if(_type == BigEggType.Latex):
		return "A latex egg"
	if(_type == BigEggType.Unfertilized):
		return "An unfertilized egg"
	return "An offspring egg"

func addSelfToNursery() -> Array:
	var theEggCell := createEggCell()
	if(!theEggCell || !theEggCell.isImpregnated()):
		return []
	var bornChildren := theEggCell.makeChilds()
	for child in bornChildren:
		child.setLaidByID(laidBy)
		GM.CS.addChild(child)
	return bornChildren

func handleNursery() -> bool:
	if(type == BigEggType.Fertilized):
		addSelfToNursery()
		return true
	return false

func handleDisposalByNPC() -> bool:
	if(type == BigEggType.Fertilized):
		addSelfToNursery()
		return true
	return false

func createItem():
	if(type == BigEggType.Plant):
		var theEgg = GlobalRegistry.createItem("PlantEgg")
		theEgg.whoGaveBirth = laidBy
		return theEgg
	
	var genericEgg = GlobalRegistry.createItem("EggGeneric")
	genericEgg.setEggLaid(self)
	return genericEgg

func isOffspringEgg() -> bool:
	return type == BigEggType.Fertilized && !data.empty()

func canSellEgg() -> bool:
	if(isOffspringEgg()):
		return false
	return true

func getEggSellPrice() -> int:
	return 5

func getOrifice() -> int:
	return orifice

func getBodypart() -> String:
	return OrificeType.toBodypart(orifice)

static func canCombineForReportType(_eggType:int) -> bool:
	if(_eggType == BigEggType.Latex):
		return true
	if(_eggType == BigEggType.Plant):
		return true
	if(_eggType == BigEggType.Unfertilized):
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
	laidType = _egg.laidType
	laidColor = _egg.laidColor
	
	if(type == BigEggType.Fertilized):
		var theSpecies = tryGetMainSpecies()
		if(theSpecies):
			theSpecies.onEggLaid(self, _egg)

func getEggColor() -> Color:
	return laidColor

func getEggLaidType() -> int:
	return laidType

static func getEggQueue(_eggs:Array) -> Array:
	var result:Array = []

	for theEgg in _eggs:
		result.append(theEgg.getEggColorOrType())

	return result

func getEggColorOrType():
	if(laidType == BigEggType.Plant):
		return laidType
	elif(laidType == BigEggType.Latex):
		return laidType
	elif(laidType == BigEggType.Unfertilized):
		return Color.whitesmoke
	else:
		return laidColor

func getEggItemImagePath() -> String:
	if(type == BigEggType.Plant):
		return "res://Images/Items/medical/egg-shell.png"
	if(type == BigEggType.Latex):
		return "res://Images/Items/medical/egg-latex.png"
	if(type == BigEggType.Unfertilized):
		return "res://Images/Items/medical/egg.png"
	var theSpecies = tryGetMainSpecies()
	if(theSpecies):
		return theSpecies.getEggInventorySpritePath(self)
	
	return "res://Images/Items/medical/egg.png"

func getEggItemColor() -> Color:
	return laidColor

func createEggCell() -> EggCell:
	if(data.empty()):
		var newEggCell := EggCell.new()
		newEggCell.bigEgg = true
		newEggCell.bigEggType = type
		newEggCell.orificeType = orifice
		newEggCell.laidType = laidType
		newEggCell.laidColor = laidColor
		return newEggCell
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
	type = SAVE.loadVar(_data, "type", BigEggType.Plant)
	laidBy = SAVE.loadVar(_data, "laidBy", "")
	orifice = SAVE.loadVar(_data, "orifice", OrificeType.Anus)
	data = SAVE.loadVar(_data, "data", {})
	laidType = SAVE.loadVar(_data, "laidType", -1)
	laidColor = Color("#"+SAVE.loadVar(_data, "laidColor", ""))
