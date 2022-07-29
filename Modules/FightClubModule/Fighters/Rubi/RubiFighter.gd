extends FightClubFighter

func _init():
	id = "rubi"
	
func getVisibleName():
	return "Rubi"

func getNameAndNickname():
	return "Rubi, The Horny"

func getAvyIntroduction():
	return "Alright, your first opponent is a cat named Rubi. Fresh fuck meat, just like you, here to prove everyone that he is the alpha male or whatever. I suggest you be gentle with him, he might break if you push on his buttons too hard."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Rubi! A promising fighter that is yet to win a single fight!"
	
func getRank():
	return FightClubRank.FuckMeat

func getOrder():
	return 0

func getFightCharacter():
	return "rubi"

func getBattleName():
	return "RubiFight"

func getWinScene():
	return null

func getLoseScene():
	return null
