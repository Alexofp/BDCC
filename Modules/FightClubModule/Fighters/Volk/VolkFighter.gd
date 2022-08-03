extends FightClubFighter

func _init():
	id = "volk"
	
func getVisibleName():
	return "Volk"

func getNameAndNickname():
	return "Volk, The Suka"

func getAvyIntroduction():
	return "Your next opponent is a guy named Volk. He is short and small but the fucker got it where it counts, watch out for his tricks."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Volk. Don’t underestimate him, a huge amount of fight is packed into this tiny package."
	
func getRank():
	return FightClubRank.FuckMeat

func getOrder():
	return 10

func getFightCharacter():
	return "volk"

func getWinScene():
	return "VolkWonScene"

func getLoseScene():
	return "VolkLostToScene"

func getWinExperience():
	return 40

func getWinCredits():
	return 5
