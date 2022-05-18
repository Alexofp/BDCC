extends Reference
class_name Child

var gender
var species = []
var birthDay: int
var motherID: String
var fatherID: String
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

func setFatherID(newfather):
	fatherID = newfather

func loadFromEggCell(egg: EggCell):
	gender = egg.resultGender
	species = egg.resultSpecies
	motherID = egg.motherID
	fatherID = egg.fatherID

func saveData():
	var data = {
		"gender": gender,
		"species": species,
		"birthDay": birthDay,
		"motherID": motherID,
		"fatherID": fatherID,
		"uniqueID": uniqueID,
	}
	
	return data

func loadData(data):
	gender = SAVE.loadVar(data, "gender", ChildGender.Male)
	species = SAVE.loadVar(data, "species", ["feline"])
	birthDay = SAVE.loadVar(data, "birthDay", 0)
	motherID = SAVE.loadVar(data, "motherID", "pc")
	fatherID = SAVE.loadVar(data, "fatherID", "pc")
	uniqueID = SAVE.loadVar(data, "uniqueID", 0)
	
