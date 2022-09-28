extends Character

func _init():
	id = "risha"
	npcLevel = 5
	npcBasePain = 150
	npcBaseLust = 120
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Likes,
		InterestTopic.Bodywritings: Interest.ReallyLikes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.KindaLikes,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.KindaLikes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.ReallyDislikes,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.Dislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Likes,
		InterestTopic.LactatingBreasts: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.ReallyLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.ReallyLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Likes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.Dislikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Hates,
		InterestTopic.LooseAnus: Interest.KindaLikes,
		InterestTopic.LoosePussy: Interest.KindaLikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Dislikes,
		InterestTopic.AverageCock: Interest.SlightlyDislikes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.SlightlyDislikes,
		InterestTopic.Pregnant: Interest.ReallyLikes,
	}
	
	npcHasMenstrualCycle = true
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "You like breeding too, huh. Come to me when you're in heat next time"
	if(interest == InterestTopic.BDSMRestraints):
		return "Fuck yeah, bound sluts are so hot"
	if(interest == InterestTopic.NoVagina):
		return "If you don't have a vagina how I'm gonna breed you, whore?"
	if(interest == InterestTopic.ExposedBra):
		return "Throw that bra into trash, you don't need it here"
	if(interest == InterestTopic.ExposedPanties):
		return "Your stupid panties are getting torn first"
	if(interest == InterestTopic.ExposedPussy):
		return "Yeah~. Now bend over, slut"
	if(interest == InterestTopic.BigCock):
		return "I will find the smallest cage for that cock, I swear"
	if(interest == InterestTopic.StuffedPussy):
		return "Oh yeah, I love seeing bred sluts"
	if(interest == InterestTopic.StuffedAss):
		return "You're leaking back there, slut"
	if(interest == InterestTopic.CoveredInCum):
		return "So messy, I love cum sluts"
	if(interest == InterestTopic.FullyNaked):
		return "Think you can just undress without me fucking you after?"
	if(interest == InterestTopic.SlimButt):
		return "That butt can't fit all my cum, whore"
	if(interest == InterestTopic.FeminineBody):
		return "I like girly types, they moan the best"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "You're a herm too, huh~. I'm the top though"
	
	
func _getName():
	return "Risha"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall lynx with cyan fur. Usually wears her bulky guard armor. Her feline face features a huge amount of piercings"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["aitaunthumiliate", "stunbatonAttack", "stunbatonStrongAttack", "biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " eyes you out and licks her lips.\n\n"+("[say=risha]You're an easy prey for me. Why don't you just undress and we can have some fun instead~[/say]")+"\n\nRisha then gets into a combat stance and gestures you to come closer. Her heavy armor doesn't seem to inpact her mobility one bit, her hand holds the stun baton very tightly\n\nSeems the first move is yours"

func getThickness() -> int:
	return 110

func getFemininity() -> int:
	return 70

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))
