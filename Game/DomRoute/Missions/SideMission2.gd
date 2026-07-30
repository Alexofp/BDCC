extends MissionBase

func _init():
	id = "SideMission2"
	name = "Rewired"
	desc = "Kait is trying to fix the TV in the other room."
	
	startScene = "DomSM2"
	requiredMissions = ["Mission2"]
	
	flags = {
		"kait": flag(FlagType.Text), # "pat", "strict"
	}
	
	decisions = {
		"kait": {
			name = "Your reaction",
			outcomes = {
				"pat": {
					text = "Praised Kait",
					effects = [
						DECISION_EFFECT_KAIT_LOVE,
					],
					kaitLine = "Can't believe I somehow walked around the whole prison naked. You could have stopped me!",
				},
				"strict": {
					text = "Had a strict talk with Kait",
					effects = [
						DECISION_EFFECT_KAIT_OBEDIENCE,
					],
					kaitLine = "Can't believe I somehow walked around the whole prison naked. I guess it was worth it in the end.",
				},
			},
		}
	}
	
	addAsAQuest = false
	sideMission = true
	
	rewardExp = 20
	rewardCredits = 0
	rewardRepeatRate = 0.0
