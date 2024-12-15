extends Node
class_name Bodypart

var id
var limbSlot
var visibleName
var needsProcessing = false

var orifice: Orifice = null
var fluidProduction: FluidProduction = null
var sensitiveZone: SensitiveZone = null
var character: WeakRef = null

var pickedSkin = null
var pickedRColor = null
var pickedGColor = null
var pickedBColor = null

func _init():
	pass

func setupSensitiveZone():
	pass

func getDoll3DScene():
	return null

func getLimbSlot():
	return limbSlot

func getSlot():
	return BodypartSlot.Body

func getName():
	return visibleName

func getCharacterCreatorName():
	return getName().capitalize()

func getCharacterCreatorDesc():
	return "Change to this"

func getCompatibleSpecies():
	return []

func getFluids():
	if(orifice != null):
		return orifice.getFluids()
	if(fluidProduction != null):
		return fluidProduction.getFluids()
	
	return null

# Used to make sure we don't get hybrids with human ears unless player really wants that
func getHybridPriority():
	return 0

func getTooltipInfo():
	return "error, let the developer know"

func getLewdSizeAdjective():
	return "average-sized"

func getLewdAdjective():
	return "average-looking"
	
func getLewdName():
	return getName()

func getLewdDescriptionAndName():
	var text = getLewdSizeAdjective() + " " + getLewdAdjective() + " " + getLewdName()
	return text

func getLewdDescriptionAndNameWithA():
	var t = getLewdDescriptionAndName()
	if(t[0].to_lower() in "eyuioa"):
		return "an "+t
	return "a "+t

func getPickableAttributes():
#	if(supportsSkin()):
#		var result = {
#			"skinPrimaryColor": {
#				"text": "Pick your primary color.",
#				"textButton": "Primary color",
#				"buttonDesc": "Change the primary color of your skin",
#				"options": [[1, "Select", "Pick this color"], [null, "Same as body", "Reset the color to body's picked color"]],
#				"type": "color",
#				"currentColor": pickedRColor,
#			},
#			"skinSecondaryColor": {
#				"text": "Pick your secondary color.",
#				"textButton": "Secondary color",
#				"buttonDesc": "Change the secondary color of your skin",
#				"options": [[1, "Select", "Pick this color"], [null, "Same as body", "Reset the color to body's picked color"]],
#				"type": "color",
#				"currentColor": pickedGColor,
#			},
#			"skinTertiaryColor": {
#				"text": "Pick your tertiary color.",
#				"textButton": "Tertiary color",
#				"buttonDesc": "Change the tertiary color of your skin",
#				"options": [[1, "Select", "Pick this color"], [null, "Same as body", "Reset the color to body's picked color"]],
#				"type": "color",
#				"currentColor": pickedBColor,
#			},
#		}
#		if(!hasCustomSkinPattern()):
#			var skinsOptions = [[null, "Same as body", "Reset the skin to the same as what the whole body uses"]]
#			for skinID in GlobalRegistry.getSkinsAllKeys():
#				var theSkin = GlobalRegistry.getSkin(skinID)
#				skinsOptions.append([skinID, theSkin.getName(), "Pick this skin"])
#			result["skin"] = {
#				"text": "Pick your base skin. All bodyparts will use this skin unless overridden.",
#				"textButton": "Skin",
#				"buttonDesc": "Change your skin type",
#				"options": skinsOptions,
#			}
#		return result
	return {}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "skin"):
		pickedSkin = _attrValue
	if(_attrID == "skinPrimaryColor"):
		pickedRColor = _attrValue
	if(_attrID == "skinSecondaryColor"):
		pickedGColor = _attrValue
	if(_attrID == "skinTertiaryColor"):
		pickedBColor = _attrValue

func getAttributesText():
	return []

func getCharCreatorData():
	return null

func addFluidOrifice(fluidType, amount: float, fluidDNA = null):
	assert(orifice != null)
	orifice.addFluid(fluidType, amount, fluidDNA)

func isOrificeEmpty():
	assert(orifice != null)
	return orifice.isEmpty()

func isOrificeStuffed():
	return !isOrificeEmpty()

func getOrifice():
	return orifice

func getOrificeContentsHumanReadableArray():
	if(orifice == null):
		return []
	return orifice.getContentsHumanReadableArray()

func getFluidProduction():
	return fluidProduction

func isProducingFluid():
	if(fluidProduction == null):
		return false
	return fluidProduction.shouldProduce()

func getProducedFluidAmount():
	if(fluidProduction == null):
		return 0.0
	return fluidProduction.getFluidAmount()

func getProducingFluidType():
	if(fluidProduction == null):
		return null
	return fluidProduction.getFluidType()

func drainProductionFluid():
	assert(fluidProduction != null)
	return fluidProduction.drain()

func clearOrificeFluids():
	assert(orifice != null)
	orifice.clear()

func getSensitiveZone():
	return sensitiveZone

func processTime(_seconds: int):
	if(sensitiveZone != null):
		sensitiveZone.processTime(_seconds)
	if(orifice != null):
		orifice.processTime(_seconds)
	if(fluidProduction != null):
		fluidProduction.processTime(_seconds)

func hoursPassed(_howmuch):
	if(sensitiveZone != null):
		sensitiveZone.hoursPassed(_howmuch)
	if(orifice != null):
		orifice.hoursPassed(_howmuch)

func handleInsertion(size: float, stretchMult = 1.0):
	if(orifice == null):
		return
	orifice.handleInsertion(size, stretchMult)

func getOrificeName():
	return "error"

func saveData():
	var result = {}
	
	if(orifice != null):
		result["orificeData"] = orifice.saveData()
	if(fluidProduction != null):
		result["fluidProductionData"] = fluidProduction.saveData()
	if(sensitiveZone != null):
		result["sensitiveZone"] = sensitiveZone.saveData()
	if(supportsSkin()):
		result["pickedSkin"] = pickedSkin
		if(pickedRColor is Color):
			result["pickedRColor"] = pickedRColor.to_html()
		else:
			result["pickedRColor"] = pickedRColor
		if(pickedGColor is Color):
			result["pickedGColor"] = pickedGColor.to_html()
		else:
			result["pickedGColor"] = pickedGColor
		if(pickedBColor is Color):
			result["pickedBColor"] = pickedBColor.to_html()
		else:
			result["pickedBColor"] = pickedBColor
	return result

func loadData(_data):
	if(orifice != null):
		orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	if(fluidProduction != null):
		fluidProduction.loadData(SAVE.loadVar(_data, "fluidProductionData", {}))
	if(sensitiveZone != null):
		if(!_data.has("sensitiveZone") && getCharacter() != null && !getCharacter().isPlayer()):
			sensitiveZone.generateDataFor(getCharacter())
		else:
			sensitiveZone.loadData(SAVE.loadVar(_data, "sensitiveZone", {}))
	if(supportsSkin()):
		if(_data.has("pickedSkin")):
			pickedSkin = SAVE.loadVar(_data, "pickedSkin", null)
		if(_data.has("pickedRColor")):
			pickedRColor = SAVE.loadVar(_data, "pickedRColor", null)
			if(pickedRColor is String):
				pickedRColor = Color(pickedRColor)
		if(_data.has("pickedGColor")):
			pickedGColor = SAVE.loadVar(_data, "pickedGColor", null)
			if(pickedGColor is String):
				pickedGColor = Color(pickedGColor)
		if(_data.has("pickedBColor")):
			pickedBColor = SAVE.loadVar(_data, "pickedBColor", null)
			if(pickedBColor is String):
				pickedBColor = Color(pickedBColor)

func saveDataNPC():
	var result = {}
	
	if(orifice != null):
		result["orificeData"] = orifice.saveData()
	if(fluidProduction != null):
		result["fluidProductionData"] = fluidProduction.saveData()
	# No reason to save sensitivity zone. Static npcs aren't usually participating in procedural sex
	return result

func loadDataNPC(_data):
	if(orifice != null):
		orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	if(fluidProduction != null):
		fluidProduction.loadData(SAVE.loadVar(_data, "fluidProductionData", {}))
	# No reason to load sensitivity zone

func safeWhenExposed():
	return true

func getCharacter():
	if(character == null):
		return null
	return character.get_ref()

func hasWomb():
	return false

func updateAppearance():
	if(character != null && getCharacter() != null):
		getCharacter().updateAppearance()

func getRevealMessage():
	return getLewdName()+" got revealed."

func getTraits():
	return null

func hasTrait(traitID):
	var theTraits = getTraits()
	
	if(theTraits == null):
		return false
	
	if(theTraits is Array):
		return theTraits.has(traitID)
	
	if(theTraits is Dictionary):
		return theTraits.has(traitID) && theTraits[traitID]
	
	return false

func npcGenerationWeight(_dynamicCharacter):
	return 1.0

func generateDataFor(_dynamicCharacter):
	if(orifice != null):
		orifice.generateDataFor(_dynamicCharacter)
	if(sensitiveZone != null):
		sensitiveZone.generateDataFor(_dynamicCharacter)
	generateRandomColors(_dynamicCharacter)
	generateRandomSkinIfCan(_dynamicCharacter)

func supportsSkin():
	return true

func hasCustomSkinPattern():
	return false


func getSkinData():
	if(hasCustomSkinPattern() && pickedSkin != null):
		return {
			"partskin": pickedSkin,
			"partid": id,
			"skin": null,
			"r": pickedRColor,
			"g": pickedGColor,
			"b": pickedBColor,
		}
	
	return {
		"skin": pickedSkin,
		"r": pickedRColor,
		"g": pickedGColor,
		"b": pickedBColor,
	}

func generateRandomSkinIfCan(_dynamicCharacter):
	if(hasCustomSkinPattern()):
		if(!GlobalRegistry.getPartSkins(id).empty()):
			pickedSkin = RNG.pick(GlobalRegistry.getPartSkins(id).keys() + [null])

func generateRandomColors(_dynamicCharacter):
	pass
