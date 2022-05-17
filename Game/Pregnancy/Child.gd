extends Reference
class_name Child

var gender
var species = []
var birthDay: int
var motherID: String
var fatherID: String

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

func saveData():
	var data = {
		"gender": gender,
		"species": species,
		"birthDay": birthDay,
		"motherID": motherID,
		"fatherID": fatherID,
	}
	
	return data

func loadData(data):
	gender = SAVE.loadVar(data, "gender", ChildGender.Male)
	species = SAVE.loadVar(data, "species", ["feline"])
	birthDay = SAVE.loadVar(data, "birthDay", 0)
	motherID = SAVE.loadVar(data, "motherID", "pc")
	fatherID = SAVE.loadVar(data, "fatherID", "pc")
	
