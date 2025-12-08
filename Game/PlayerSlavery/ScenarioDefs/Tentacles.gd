extends PlayerSlaveryDef

func _init():
	id = "Tentacles"

func getVisibleName() -> String:
	return "Tentacles"

func getVisibleDesc() -> String:
	return "You will help grow your very own tentacles monster."

func canBeChosen() -> bool:
	return false #TODO: SWITCH TO TRUE

func isVisibleAtAll() -> bool:
	return false #TODO: SWITCH TO TRUE

func createSlavery():
	return load("res://Game/PlayerSlavery/Scenarios/Tentacles.gd").new()

func getEndings() -> Dictionary:
	return {
#		"mined": {
#			name = "No rock left unmined",
#			desc = "Reach the required amount of credits",
#		},
#		"escaped": {
#			name = "Super Mega drill",
#			desc = "Find a way to escape together with other slaves",
#		},
#		"killedboss": {
#			name = "Drilled to see you",
#			desc = "Make the guy regret ever messing with you",
#		},
	}
