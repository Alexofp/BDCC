extends Character

func _init():
	id = "eliza"
	npcLevel = 5
	npcBaseLust = 150
	npcBasePain = 120
	
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.SlightlyDislikes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Dislikes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.SmallBreasts: Interest.SlightlyDislikes,
		InterestTopic.NoBreasts: Interest.Dislikes,
		InterestTopic.HasCockOnly: Interest.Loves,
		InterestTopic.HasVaginaOnly: Interest.SlightlyDislikes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.ThickButt: Interest.ReallyDislikes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.KindaLikes,
	}
	
func _getName():
	return "Eliza Quinn"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "An elegant feline with pastel yellow fur. Wears a lab coat and carries quite a few medical tools on her belt"

func getSpecies():
	return ["feline"]

func getFightIntro(_battleName):
	var text = "Eliza makes her hair into a careful ponytail and opens her lab coat, displaying a rich set of syringes, injectors, pill bottles and drug vials on her belt."
	text += "\n\n"
	text += "[say=eliza]"+RNG.pick([
		"I’m doctor Quinn. But you can call me Queen.",
		"I can show you everything. Just ask me nicely.",
		"We have so many drugs to test, don’t be silly.",
		"Did I ever tell you I blew up a whole lab once?",
	])+"[/say]"	
	
	return text
	
func _getAttacks():
	return ["biteattack", "stretchingAttack", "lickWounds", "trygetupattack", "ElizaHornyCloud", "ElizaHornyDrug", "ElizaTaunt", "ElizaWeaknessDrug", "NpcScratch", "ForceMuzzlePC"]
