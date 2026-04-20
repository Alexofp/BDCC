extends PlayerSlaveryDef

func _init():
	id = "Tentacles"

func getVisibleName() -> String:
	return "Tentacles"

func getVisibleDesc() -> String:
	return "You will help grow your very own tentacle monster."

func canBeChosen() -> bool:
	return true

func isVisibleAtAll() -> bool:
	return true

func createSlavery():
	return load("res://Game/PlayerSlavery/Scenarios/Tentacles.gd").new()

func getEndings() -> Dictionary:
	return {
		"murder": {
			name = "BLOODTHIRSTY",
			desc = "Escape while murdering at least one of the villains",
		},
		"stealth": {
			name = "A Whole New World",
			desc = "Escape the biolab completely stealthily",
		},
		"egged": {
			name = "Parting gift",
			desc = "Escape while getting at least one of the villains egged-up",
		},
	}
