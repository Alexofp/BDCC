extends PlayerSlaveryDef

func _init():
	id = "ShaftMiner"

func getVisibleName() -> String:
	return "Shaft Miner"

func getVisibleDesc() -> String:
	return "(Non-sexual focus) You will be sold to a guy who will force you to become a shaft miner."

func canBeChosen() -> bool:
	return true

func createSlavery():
	return load("res://Game/PlayerSlavery/Scenarios/ShaftMiner.gd").new()

func getEndings() -> Dictionary:
	return {
		"mined": {
			name = "No rock left unmined",
			desc = "Reach the required amount of credits",
		},
		"escaped": {
			name = "Super Mega drill",
			desc = "Find a way to escape together with other slaves",
		},
		"killedboss": {
			name = "Drilled to see you",
			desc = "Make the guy regret ever messing with you",
		},
	}
