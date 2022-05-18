extends Character

func _init():
	id = "maleguard_canine"
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcLevel = 1
	npcBasePain = 70
	npcBaseLust = 50
	npcBaseStamina = 60
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Hates,
		InterestTopic.MasculineBody: Interest.Hates,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.SlightlyDislikes,
		InterestTopic.HasCockOnly: Interest.ReallyDislikes,
		InterestTopic.HasVaginaOnly: Interest.ReallyLikes,
		InterestTopic.HasVaginaAndCock: Interest.Loves,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.BigCock: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.SlightlyDislikes,
	}
	
func _getName():
	return "Male guard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A buff canine wearing a guard uniform and armor, this one don’t look kind"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["DoubleCuffPC", "CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "stunbatonAttack", "stunbatonOverchargeAttack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard prepares to fight"
	
func getLootTable(_battleName):
	return GuardLoot.new()

func getPenisSize():
	return 25.0
