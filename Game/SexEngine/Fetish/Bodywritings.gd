extends FetishBase

func _init():
	id = Fetish.Bodywritings
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Brat: 0.4,
		PersonalityStat.Mean: 0.25, # Kind logic: Why would anyone write such mean things on bodies!
	}

func getVisibleName():
	return "Bodywritings"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
