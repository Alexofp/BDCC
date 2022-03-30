extends Orifice
class_name ThroatOrifice

func _init():
	isGenital = false
	orificeType = OrificeType.Throat

func getCapacity() -> float:
	return round(1500.0 + 100.0 * looseness)

func getBaseElasticity() -> float:
	return 0.5

func getBaseResistance() -> float:
	return 5.0
