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

func getComfortableInsertion() -> float:
	return 8.0 + pow(looseness, 2.0)

func getNaturalDrain() -> float:
	return 100.0
	
func getOverstuffedSpill() -> float:
	return 200.0
