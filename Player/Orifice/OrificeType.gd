extends Object
class_name OrificeType

enum {
	Vagina,
	Anus,
	Throat,
}

static func getAll():
	return [Vagina, Anus, Throat]

static func fromBodypart(_slot:String) -> int:
	if(_slot == "vagina"):
		return Vagina
	if(_slot == "anus"):
		return Anus
	if(_slot == "head"):
		return Throat
	return -1

static func toBodypart(_orifice:int) -> String:
	if(_orifice == Vagina):
		return "vagina"
	if(_orifice == Anus):
		return "anus"
	if(_orifice == Throat):
		return "head"
	return ""
