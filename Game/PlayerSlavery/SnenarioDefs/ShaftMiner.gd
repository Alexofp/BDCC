extends PlayerSlaveryDef

func _init():
	id = "ShaftMiner"

func getVisibleName() -> String:
	return "Shaft Miner"

func getVisibleDesc() -> String:
	return "(Non-sexual focus) You will be sold to one of the mining corporations and become a shaft miner slave."

func canBeChosen() -> bool:
	return true

func createSlavery():
	return load("res://Game/PlayerSlavery/Scenarios/ShaftMiner.gd").new()
