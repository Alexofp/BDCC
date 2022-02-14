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
