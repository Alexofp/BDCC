extends MissionBase

func _init():
	id = "SideMission4"
	name = "Lab Brat"
	desc = "Avy and Ferri seem to be having some kind of argument."
	
	startScene = "DomSM4"
	requiredMissions = ["Mission4"]
	
	flags = {
		"punish": flag(FlagType.Text), # "ferri" "avy"
	}
	
	decisions = {
		"punish": {
			name = "Who got punished",
			outcomes = {
				"ferri": {
					text = "Ferri",
					effects = [
						DECISION_EFFECT_AVY_LOVE,
					],
					avyLine = "That brat got what she deserved! She is just our slave.",
				},
				"avy": {
					text = "Avy",
					effects = [
						DECISION_EFFECT_AVY_OBEDIENCE,
					],
					avyLine = "Don't look at me like that. Shut up. Grr-r.",
				},
			},
		}
	}
	
	addAsAQuest = false
	sideMission = true
	
	rewardExp = 150
	rewardCredits = 0
	rewardRepeatRate = 0.0
