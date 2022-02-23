extends Character

func _init():
	id = "tavi"
	
func _getName():
	return "Tavi"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "Red block inmate. A very tall feline with a unique purple and green fur pattern and red/green eyes"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func reactTease():
	return 0.2

func reactGrope():
	if(lust < 50):
		return 0
	
	return 1.0

func reactSelfHumiliation(_topic):
	if(remembersTopic(_topic)):
		return -0.5
	
	if(_topic == Attack.LustTopic.selfUseMe):
		doRememberTopic(_topic)

		return 1.0
	
	return 0

func reactHumiliation(_topic):
	if(remembersTopic(_topic)):
		return -0.5
	
	if(_topic == Attack.LustTopic.humYouSlut):
		doRememberTopic(_topic)
		return -0.2
	
	return 0

func getFightIntro(_battleName):
	return getName() + " gets into the combat stance and prepares for a fight. "+formatSay("Are you afraid of a little kitty cat~?")
