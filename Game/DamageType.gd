extends Node
class_name DamageType

enum {
	Blunt,
	Sharp,
	Lust,
	Stamina
}

static func getName(type) -> String:
	if(type == Blunt):
		return "Blunt"
	if(type == Sharp):
		return "Sharp"
	if(type == Lust):
		return "Lust"
	if(type == Stamina):
		return "Stamina"
	return "Error"
