extends Reference
class_name Child

var gender
var species = []
var birthDay: int
var motherID: String
var fatherID: String
var rememberedMotherName: String = "" # Required in case the character gets deleted
var rememberedFatherName: String = ""
var uniqueID: int

func generateUniqueID():
	uniqueID = GlobalRegistry.generateChildUniqueID()

func setGender(newGender):
	gender = newGender

func setSpecies(newspecies):
	species = newspecies

func setBirthday(newday):
	birthDay = newday

func setMotherID(newmother):
	motherID = newmother
	
	var character = GlobalRegistry.getCharacter(motherID)
	if(character != null):
		rememberedMotherName = character.getName()

func setFatherID(newfather):
	fatherID = newfather
	
	var character = GlobalRegistry.getCharacter(fatherID)
	if(character != null):
		rememberedFatherName = character.getName()

func getMotherID():
	return motherID

func getFatherID():
	return fatherID

func getMotherName():
	var character = GlobalRegistry.getCharacter(motherID)
	if(character != null):
		return character.getName()
	if(rememberedMotherName == null || rememberedMotherName == ""):
		return "unknown"
	return rememberedMotherName + " (forgotten)"

func getFatherName():
	var character = GlobalRegistry.getCharacter(fatherID)
	if(character != null):
		return character.getName()
	if(rememberedFatherName == null || rememberedFatherName == ""):
		return "unknown"
	return rememberedFatherName + " (forgotten)"

func loadFromEggCell(egg: EggCell):
	gender = egg.resultGender
	species = egg.resultSpecies
	setMotherID(egg.motherID)
	setFatherID(egg.fatherID)

func saveData():
	var data = {
		"gender": gender,
		"species": species,
		"birthDay": birthDay,
		"motherID": motherID,
		"fatherID": fatherID,
		"uniqueID": uniqueID,
		"rememberedMotherName": rememberedMotherName,
		"rememberedFatherName": rememberedFatherName,
	}
	
	return data

func loadData(data):
	gender = SAVE.loadVar(data, "gender", NpcGender.Male)
	species = SAVE.loadVar(data, "species", ["feline"])
	birthDay = SAVE.loadVar(data, "birthDay", 0)
	motherID = SAVE.loadVar(data, "motherID", "pc")
	fatherID = SAVE.loadVar(data, "fatherID", "pc")
	uniqueID = SAVE.loadVar(data, "uniqueID", 0)
	rememberedMotherName = SAVE.loadVar(data, "rememberedMotherName", "")
	rememberedFatherName = SAVE.loadVar(data, "rememberedFatherName", "")
	
