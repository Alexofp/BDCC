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

func getEndings() -> Dictionary:
	return {
		"earned": {
			name = "Pay off the debt",
			desc = "Be a good cow/bull",
		},
		"annoyed": {
			name = "Buying you was a mistake",
			desc = "Be the most annoying thing imaginable",
		},
		"escaped": {
			name = "Teamwork makes the dream work",
			desc = "Escape with the help of other slaves",
		},
		"officer": {
			name = "Special treat",
			desc = "Get the attention of a hero",
		},
	}
