extends MissionBase

func _init():
	id = "SideMission1"
	name = "Going broke"
	desc = "Avy needs your help with returning a debt."
	
	startScene = "DomSM1"
	requiredMissions = ["Mission1"]
	
	flags = {
		"avy": flag(FlagType.Text), # "allow", "stopped"
	}
	
	decisions = {
		"avy": {
			name = "Stopped Avy",
			outcomes = {
				"allow": {
					text = "No",
					effects = [
						DECISION_EFFECT_AVY_LOVE,
					],
				},
				"stopped": {
					text = "Yes",
					effects = [
						DECISION_EFFECT_AVY_OBEDIENCE,
					],
				},
			},
		}
	}
	
	addAsAQuest = false
	sideMission = true
	
	rewardExp = 10
	rewardCredits = 10
	rewardRepeatRate = 0.0
