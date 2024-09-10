extends Reference
class_name DialogueFormBank

const CHAR = "CHAR"
const VAR = "VAR"

func form(defText:String, _args:Dictionary, mainRole:String = "", directedToRole:String = ""):
	return {
		text = defText,
		args = _args,
		main = mainRole,
		dirTo = directedToRole,
	}

func getForms() -> Dictionary:
	return {
		
	}
