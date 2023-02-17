extends Node
class_name DamageType

enum {
	Physical,
	Lust,
	Stamina
}

static func getAll():
	return [Physical, Lust, Stamina]

static func getName(type) -> String:
	if(type == Physical):
		return "Physical"
	if(type == Lust):
		return "Lust"
	if(type == Stamina):
		return "Stamina"
	return "Error"

static func getBattleName(type) -> String:
	if(type == Physical):
		return "pain"
	if(type == Lust):
		return "lust"
	if(type == Stamina):
		return "stamina damage"
	return "error bad"

static func getColor(type) -> Color:
	if(type == Physical):
		return Color("#FF9A8E")
	if(type == Lust):
		return Color.violet
	if(type == Stamina):
		return Color.cornflower
	return Color.floralwhite

static func getColorString(type) -> String:
	return "#"+getColor(type).to_html(false)

static func getDamageColoredString(damageType, amountOfDamage):
	return "[color="+getColorString(damageType)+"]"+str(amountOfDamage)+" "+getBattleName(damageType)+"[/color]"
	
