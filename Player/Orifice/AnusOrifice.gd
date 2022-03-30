extends Orifice
class_name AnusOrifice

func _init():
	orificeType = OrificeType.Anus

func getCapacity() -> float:
	return round(500.0 + 100.0 * looseness)

func getBaseElasticity() -> float:
	return 1.5

func getBaseResistance() -> float:
	return 0.8
