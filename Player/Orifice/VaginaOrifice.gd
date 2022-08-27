extends Orifice
class_name VaginaOrifice

func _init():
	orificeType = OrificeType.Vagina

func getCapacity() -> float:
	return round(100.0 + 50.0 * looseness * looseness)

func getBaseElasticity() -> float:
	return 1.0

func getBaseResistance() -> float:
	return 1.0
