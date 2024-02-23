extends Object
class_name SlaveType

const All = "All"
const Submissive = "Submissive"
const Slut = "Slut"
const Pet = "Pet"

func getAll():
	return [Submissive, Slut, Pet]

func getVisibleName(slaveType):
	return str(slaveType)

func getVisibleDescription(_slaveType):
	return "Fill me"
