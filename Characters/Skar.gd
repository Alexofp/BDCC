extends Character

func _init():
	id = "skar"
	npcLevel = 10
	npcBasePain = 200
	npcBaseLust = 200
	
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.SlightlyDislikes,
		InterestTopic.MasculineBody: Interest.Hates,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.Hates,
		InterestTopic.HasCockOnly: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.StuffedPussyOrAss: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.CoveredInCum: Interest.SlightlyDislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.ReallyDislikes,
		InterestTopic.StuffedThroat: Interest.SlightlyDislikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.Likes,
	}
	
func _getName():
	return "Skar"

func getGender():
	return Character.Gender.Male
	
func getSmallDescription() -> String:
	return "A male guard with wolf features and a scarred face. His arms, eyes and lower jaw are replaced with prosthetics."

func getSpecies():
	return ["wolf"]

func _getAttacks():
	return ["aitaunthumiliate", "stunbatonAttack", "stunbatonStrongAttack", "biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard holds his weapon tightly and waits for you to do the first move.\n\n"+formatSay("You know it’s only gonna end one way for you.")
