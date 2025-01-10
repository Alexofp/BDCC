extends Reference
class_name Child

var name: String = ""
var gender
var species = []
var birthDay: int
var motherID: String
var fatherID: String
var causerID: String
var rememberedMotherName: String = "" # Required in case the character gets deleted
var rememberedFatherName: String = ""
var uniqueID: int
var bornFromMonozygotic: String = ""
const EGG_MONOZYGOTIC_LEVEL = {1: "", 2: "Twins", 3: "Triplets", 4: "Quadruplets", 5: "Quintuplets", 6: "Sextuplets"}

func generateUniqueID():
	uniqueID = GlobalRegistry.generateChildUniqueID()
	
func setBornFromMonozygoticStatus(monozygotic):
	bornFromMonozygotic = EGG_MONOZYGOTIC_LEVEL[monozygotic]
	
func generateName():
	if(gender == NpcGender.Male || gender == NpcGender.Peachboy):
		name = RNG.randomMaleName()
	else:
		name = RNG.randomFemaleName()

func setName(newName):
	name = newName

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

func setCauserID(newcauser:String):
	causerID = newcauser

func getMotherID():
	return motherID

func getFatherID():
	return fatherID
	
func getCauserID() -> String:
	return causerID
	
func getMonozygotic():
	return bornFromMonozygotic

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
	setCauserID(egg.causerID)

func saveData():
	var data = {
		"name": name,
		"bornFromMonozygotic": bornFromMonozygotic,
		"gender": gender,
		"species": species,
		"birthDay": birthDay,
		"motherID": motherID,
		"fatherID": fatherID,
		"uniqueID": uniqueID,
		"rememberedMotherName": rememberedMotherName,
		"rememberedFatherName": rememberedFatherName,
		"causerID": causerID,
	}
	
	return data

func loadData(data):
	name = SAVE.loadVar(data, "name", "")
	if(name == ""):
		generateName()
	bornFromMonozygotic = SAVE.loadVar(data, "bornFromMonozygotic", "")
	gender = SAVE.loadVar(data, "gender", NpcGender.Male)
	species = SAVE.loadVar(data, "species", ["feline"])
	birthDay = SAVE.loadVar(data, "birthDay", 0)
	motherID = SAVE.loadVar(data, "motherID", "pc")
	fatherID = SAVE.loadVar(data, "fatherID", "pc")
	uniqueID = SAVE.loadVar(data, "uniqueID", 0)
	rememberedMotherName = SAVE.loadVar(data, "rememberedMotherName", "")
	rememberedFatherName = SAVE.loadVar(data, "rememberedFatherName", "")
	if(data.has("causerID")):
		causerID = SAVE.loadVar(data, "causerID", "")
