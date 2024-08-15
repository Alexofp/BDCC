extends Reference
class_name DialogueFormBank

const CHAR = "CHAR"

func form(defText:String, _args:Dictionary):
	return {
		text = defText,
		args = _args,
	}

func getForms() -> Dictionary:
	return {
		
	}
