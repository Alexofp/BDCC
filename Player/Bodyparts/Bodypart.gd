extends Node
class_name Bodypart

var id
var limbSlot
var visibleName
var needsProcessing = false

var orifice: Orifice = null
var fluidProduction: FluidProduction = null
var character: WeakRef = null

func _init():
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
	return {}
	
func applyAttribute(_attrID: String, _attrValue):
	pass

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

func processTime(_seconds: int):
	if(orifice != null):
		orifice.processTime(_seconds)
	if(fluidProduction != null):
		fluidProduction.processTime(_seconds)

func hoursPassed(_howmuch):
	if(orifice == null):
		return
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
	return result

func loadData(_data):
	if(orifice != null):
		orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	if(fluidProduction != null):
		fluidProduction.loadData(SAVE.loadVar(_data, "fluidProductionData", {}))

func saveDataNPC():
	var result = {}
	
	if(orifice != null):
		result["orificeData"] = orifice.saveData()
	if(fluidProduction != null):
		result["fluidProductionData"] = fluidProduction.saveData()
	return result

func loadDataNPC(_data):
	if(orifice != null):
		orifice.loadData(SAVE.loadVar(_data, "orificeData", {}))
	if(fluidProduction != null):
		fluidProduction.loadData(SAVE.loadVar(_data, "fluidProductionData", {}))

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
