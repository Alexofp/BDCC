extends MissionBase

func _init():
	id = "Mission0"
	name = "Rahi The Thief"
	desc = "Recruit Rahi!"
	
	startScene = "DomM0RahiBreakIntroScene"
	
	flags = {
		"kait": flag(FlagType.Text), # "assert", "allow"
	}
	
	decisions = {
		"kait": {
			name = "Kait took Rahi's leash",
			outcomes = {
				"assert": {
					text = "Asserted yourself",
					effects = [
						DECISION_EFFECT_KAIT_OBEDIENCE,
					],
				},
				"allow": {
					text = "Allowed it",
					effects = [
						DECISION_EFFECT_KAIT_LOVE,
					],
				},
			},
		}
	}
	
	rewardExp = 20
	rewardCredits = 0

func getObjectives() -> Array:
	var result:Array = []
	
	return result
