extends Object
class_name Stat

const Strength = "strength" # Physical attacks do more damage
const Agility = "agility" # More stamina
const Vitality = "vitality" # Higher pain threshold
const Sexiness = "sexiness" # Lust attacks do more damage, higher lust threshold

static func getAll():
	return [Strength, Agility, Vitality, Sexiness]
