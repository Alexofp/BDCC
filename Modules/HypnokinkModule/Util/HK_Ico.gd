extends Object
class_name HK_Ico

const Prehyp = "Prehyp"
const Hypnod = "Hypnod"
const Trance = "Trance"

const icons = {
		Prehyp = "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno1.png",
		Hypnod = "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno2.png",
		Trance = "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno3.png"
	}
	
static func icon(identifier: String, width: int = 16) -> String:
	return "[img="+str(width)+"]"+icons[identifier]+"[/img]"
