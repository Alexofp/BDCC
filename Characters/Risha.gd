extends Character

func _init():
	id = "risha"
	npcLevel = 3
	npcBasePain = 140
	npcBaseLust = 70
	
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
	}
	
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
	return getName() + " eyes you out and licks her lips.\n\n"+formatSay("You're an easy prey for me. Why don't you just undress and we can have some fun instead~")+"\n\nRisha then gets into a combat stance and gestures you to come closer. Her heavy armor doesn't seem to inpact her mobility one bit, her hand holds the stun baton very tightly\n\nSeems the first move is yours"

func getFightState(_battleName):
	if(getPainLevel() > getLustLevel()):
		var mypain = getPainLevel() * 100
		
		if(mypain >= 70):
			return getName() + " constantly grunts from pain. "+heShe()+" can barely stand at this point, all "+hisHer()+" bruises are really wearing "+himHer()+" down.\n" + formatSay("GHh.. Fuck it really hurts")
		if(mypain >= 50):
			return getName() + " looks pretty beat up and "+hisHer()+" face shows it but "+heShe()+" is still standing strong.\n" + formatSay("I'm not losing to some inmate, you're done for!")
		if(mypain >= 25):
			return getName() + " has a bruise there and there but "+heShe()+" clearly won't give up the fight any time soon.\n" + formatSay("Is that the best you got? Weak")
	else:
		var mylust = getLustLevel() * 100
		
		if(mylust >= 70):
			return getName() + " keeps moaning to "+himselfHerself()+" and can't hide the arousal anymore, "+heShe()+" blatantly gropes and rubs "+hisHer()+" body in front of you.\n" + formatSay("Fuck you're hot")
		if(mylust >= 50):
			return getName() + " breathes warmly, "+hisHer()+" blush starts to shine through, "+ heShe()+" is lusty and "+hisHer()+" eyes show it.\n" + formatSay("Stop it, you whore, I wanna fight you")
		if(mylust >= 25):
			return getName() + " looks alright but you notice some desire in "+hisHer()+" eyes.\n" + formatSay("What a slut you are")
		
	return getName() + " looks completely fine, no visible bruises or signs of lust."

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 6
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears2"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
