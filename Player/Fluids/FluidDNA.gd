extends Reference
class_name FluidDNA

var charID: String = ""
var causerID: String = "" # If a strapon was used, this will hold the id of the person who was wearing it
var virility: float = 0.0
var species: Array = []

func canCombineWith(otherDNA):
	if(otherDNA == null):
		return false
	
	if(charID != otherDNA.charID):
		return false
	
	if(causerID != otherDNA.causerID):
		return false
	
	if(abs(virility - otherDNA.virility) > 0.01):
		return false
	
	if(species != otherDNA.species):
		return false
	
	return true

func getCharacterID():
	return charID

func getCharacter():
	if(charID == null || charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func setCauserID(_charID:String):
	causerID = _charID

func getCauserID() -> String:
	return causerID

func getVirility():
	return virility

func getSpecies():
	return species

func isBlank():
	return charID == "" || charID == null

func saveData():
	return {
		"charID": charID,
		"causerID": causerID,
		"virility": virility,
		"species": species,
	}

func loadData(data):
	charID = SAVE.loadVar(data, "charID", "")
	causerID = SAVE.loadVar(data, "causerID", "")
	virility = SAVE.loadVar(data, "virility", 0.0)
	species = SAVE.loadVar(data, "species", [])
