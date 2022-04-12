extends Character

func _init():
	id = "cp_guard"
	
	npcBasePain = 80
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcStats = {
		Stat.Sexiness: 1,
	}
	npcLevel = 2
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.Loves,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Dislikes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.Dislikes,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.SmallCock: Interest.ReallyDislikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.ThickBody: Interest.SlightlyDislikes,
		InterestTopic.StuffedPussy: Interest.ReallyLikes,
		InterestTopic.StuffedAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.KindaLikes,
		InterestTopic.NoVagina: Interest.Dislikes,
		InterestTopic.SlimButt: Interest.SlightlyDislikes,
		InterestTopic.SlimBody: Interest.Likes,
	}
	
func _getName():
	return "Checkpoint guard"

func getGender():
	return Character.Gender.Male
	
func getSmallDescription() -> String:
	return "A male canine wearing a guard uniform and a light armor"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["DoubleCuffPC", "CuffPCHands", "ForceRingGagPC", "stunbatonAttack", "stunbatonOverchargeAttack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard grabs his stun baton and offers you to do the first move"

func getLootTable(_battleName):
	return GuardLoot.new()
