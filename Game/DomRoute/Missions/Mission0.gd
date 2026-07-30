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
					kaitLine = "Hey.. uh.. I should have asked before taking Rahi's leash, you're right.",
				},
				"allow": {
					text = "Allowed it",
					effects = [
						DECISION_EFFECT_KAIT_LOVE,
					],
					kaitLine = "We got our own personal thief now. A pretty cute one at that. Can't wait to see her in action.",
				},
			},
		}
	}
	
	rewardExp = 20
	rewardCredits = 0
	addAsAQuest = false

func getObjectives() -> Array:
	var result:Array = []
	
	return result
