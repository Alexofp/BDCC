extends FightClubFighter

func _init():
	id = "rebel"
	
func getVisibleName():
	return "Rebel"

func getNameAndNickname():
	return "Rebel, The Doomfist"

func getAvyIntroduction():
	return "Your next opponent is Rebel. She is a buff mare, dumb as a pile of bricks but can crush your skull with her left pinkie. So you know, avoid that and you will be fine."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Rebel. She decided to skip working out today and came here to test her skills. Welcome!"
	
func getRank():
	return FightClubRank.FailedHero

func getOrder():
	return 40

func getFightCharacter():
	return "rebel"

func getWinScene():
	return "RebelWonScene"

func getLoseScene():
	return "RebelLostToScene"

func getWinExperience():
	return 100

func getWinCredits():
	return 5
