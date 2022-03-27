extends Character

func _init():
	id = "avy"
	
	npcLevel = 3
	npcBasePain = 120
	npcBaseLust = 90
	
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.MasculineBody: Interest.Dislikes,
		InterestTopic.AndroBody: Interest.KindaLikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickBody: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.ReallyLikes,
		InterestTopic.AverageButt: Interest.SlightlyDislikes,
		InterestTopic.ThickButt: Interest.SlightlyDislikes,
		InterestTopic.StuffedThroat: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
		InterestTopic.StuffedAss: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.KindaLikes,
	}
	
func _getName():
	return "Avy"

func getGender():
	return Character.Gender.Androgynous
	
func getPronounGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "Red inmate, medium-height fox with a black fur and a feminine look."

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "Avy stands straight, her hands slightly behind her, clawed digits spread out."
