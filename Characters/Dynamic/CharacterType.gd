extends Object
class_name CharacterType

const Generic = "Generic"
const Inmate = "Inmate"
const Guard = "Guard"
const Nurse = "Nurse"
const Engineer = "Engineer"

static func getAll():
	return [Generic, Inmate, Guard, Nurse, Engineer]

static func getAllForDatapackCharacter():
	return [Inmate, Guard, Nurse, Engineer]

static func getName(charType):
	if charType == Generic:
		return "Generic"
	elif charType == Inmate:
		return "Inmate"
	elif charType == Guard:
		return "Guard"
	elif charType == Nurse:
		return "Nurse"
	elif charType == Engineer:
		return "Engineer"
	else:
		return "Error"

