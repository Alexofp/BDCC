extends FightClubFighter

func _init():
	id = "nova"
	
func getVisibleName():
	return "Nova"

func getNameAndNickname():
	return "Nova, The Angel"

func getAvyIntroduction():
	return "Your next opponent is Nova. She is an ex inmate so she knows about this place even though she is a guard nowadays. Lucky bitch probably sucked and gangbanged her way to freedom, what can I say."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Nova. She was nice enough not to tell on us and even protects us from the other staff in exchange for being able to fight here! Please welcome!"
	
func getRank():
	return FightClubRank.PlayToy

func getOrder():
	return 50

func getFightCharacter():
	return "novaArena"

func getWinScene():
	return "NovaWonScene"

func getLoseScene():
	return "NovaLostToScene"

func getWinExperience():
	return 100

func getWinCredits():
	return 7
