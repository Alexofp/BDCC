extends PlayerSlaveryBase

func _init():
	id = "ShaftMiner"

func onSlaveryStart():
	print("Meow")
	pass

func getStartScene() -> String:
	return "PSShaftMinerStart"
