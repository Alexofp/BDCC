extends PlayerSlaveryDef

func _init():
	id = "MilkCafe"

func getVisibleName() -> String:
	return "Milking slave"

func getVisibleDesc() -> String:
	return "You will be sold to a lovely couple that runs a cafe that is in dire need of milk and/or seed."

func canBeChosen() -> bool:
	return true

func createSlavery():
	return load("res://Game/PlayerSlavery/Scenarios/MilkCafe.gd").new()
