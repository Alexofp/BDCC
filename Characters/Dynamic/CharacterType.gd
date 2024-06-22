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
	return str(charType)
