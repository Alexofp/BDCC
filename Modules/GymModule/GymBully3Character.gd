extends Character

func _init():
	id = "gymbully3"
	
	npcLevel = 5
	npcBasePain = 120
	npcBaseLust = 120
	npcBaseStamina = 50
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffd07053")
	pickedSkinGColor=Color("ffdcdcdc")
	pickedSkinBColor=Color("ff7f573c")
	npcSkinData={
	"hair": {"r": Color("ff2c1e14"),"g": Color("ff1c1c1c"),"b": Color("ff000000"),},
	"arms": {"skin": "WoonaSkin",},
	"legs": {"skin": "MonsterGirl",},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Likes,
		InterestTopic.Bodywritings: Interest.Likes,
		InterestTopic.Gags: Interest.Loves,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.KindaLikes,
		InterestTopic.ButtPlugs: Interest.KindaLikes,
		InterestTopic.VaginalPlugs: Interest.KindaLikes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Dislikes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.KindaLikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.KindaLikes,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.KindaLikes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.LactatingBreasts: Interest.KindaLikes,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.StuffedAss: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.Pregnant: Interest.ReallyLikes,
		InterestTopic.StuffedThroat: Interest.Loves,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.KindaLikes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.KindaLikes,
		InterestTopic.ExposedCock: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Hates,
		InterestTopic.LooseAnus: Interest.Loves,
		InterestTopic.LoosePussy: Interest.Loves,
		InterestTopic.TightAnus: Interest.Hates,
		InterestTopic.TightPussy: Interest.Hates,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.Hates,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Gags):
		return "GAGS ARE AMAZING! I love grinding gagged bitches while they can't do anything!"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "EWW! Which hole are you pissing from!?"
	if(interest == InterestTopic.TightAnus):
		return "BITCH, I SO WANT THAT ASS. Would give anything to get a chance to train my dirty asshole again."
	if(interest == InterestTopic.TightPussy):
		return "SLUT! GET THAT BEATIFUL CUNT OUT OF HERE"
	if(interest == InterestTopic.ExposedPanties):
		return "FUCK YOUR PANTIES, mine are yet to survive a single day"
	if(interest == InterestTopic.ExposedBra):
		return "Why are you hiding your tits!? That's stupid! I wanna see them!"
	if(interest == InterestTopic.FullyNaked):
		return "WHAT A BRAVE SLUT! I LOVE YOU!!"
	if(interest == InterestTopic.SmallCock):
		return "Oh.. hmm.. oof.. oh, sorry. It's not your fault, you were born like that"
	if(interest == InterestTopic.BigCock):
		return "THEY DON'T CALL ME A SIZE QUEEN FOR NOTHING, LET ME RIDE IT!"
	if(interest == InterestTopic.Pregnant):
		return "ALWAYS PREG-O IS MY CREDO"
	if(interest == InterestTopic.CoveredInLotsOfCum):
		return "FUCK YEAH, LET ME LICK YOU! OHH!! CAN I GET PREGO BY RUBBING MY PUSSY AGAINST YOU?"
	if(interest == InterestTopic.StuffedThroat):
		return "Can we kiss and share that cum?!!"
	
	
func _getName():
	return "Bully Girl"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Red inmate, has a red band on her head."

func getFightIntro(_battleName):
	var text = "The girl shows you her crazy eyes as she licks her shiv, even causing a little bleeding."
	text += "\n\n"
	text += "[say=gymbully3]"+RNG.pick([
		"A wrong girl with a right knife can do a lot of good stuff in a bad world. It's crazy how they think they are the sane ones~",
	])+"[/say]"
	
	return text

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "slapTitsAttack", "stretchingAttack", "ShivAttack", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]

func reactRestraint(restraintType, restraintAmount, isGettingForced):
	if(!isGettingForced):
		if(restraintAmount == 0):
			return RNG.pick([
				"NOW STOP IT!",
				"TO THE TRASH IT GOES",
				"TIE YOUR ANUS UP, BITCH",
				"You can't stop me!",
			])
		
		return RNG.pick([
			"THIS IS NOT FUN!",
			"WHAT A BUZZKILL",
			"Huff!",
			"It's only fun when others are tied up!",
		])
	
	if(isGettingForced):
		if(restraintAmount > 2 && RNG.chance(30)):
			return RNG.pick([
				"SHIT SHIT SHIT",
				"FUCK FUCK FUCK",
				"OH SHIT OH FUCK",
				"BITCH ASS PUSSY FUCK SLUT",
			])
		
		if(restraintType == RestraintType.Gag):
			return RNG.pick([
				"AHHH! FUUUCK",
				"BITCH MY GAGTALK IS PERFECT, I WAS TRAINING FOR YEARS",
			])
		if(restraintType == RestraintType.Muzzle):
			return RNG.pick([
				"RAAAWR. Wait, what the fuck",
				"HOW AM I GONNA SUCK A COCK NOW?!",
			])
		if(restraintType == RestraintType.ButtPlug):
			return RNG.pick([
				"WHY IS IT SO SMALL?",
				"I NEED THREE OF THEM AT LEAST TO FEEL ANYTHING",
				"BITCH, I USED TO COSPLAY AS A KITSUNE",
			])
		if(restraintType == RestraintType.VaginalPlug):
			return RNG.pick([
				"If it's not a horsecock dildo I can't feel shit!",
				"Oh, cute!",
			])
		if(restraintType == RestraintType.Straitjacket):
			return RNG.pick([
				"NOT AGAIN! FUCK THAT ASYLUM!",
				"NO NO NO, THIS REMINDS ME OF MY TIME IN ASYLUM TOO MUCH",
			])
	
		return RNG.pick([
			"THE FUCK IS THIS SHIT",
			"OH MY FUCKING GOD",
			"Are you for real!?",
			"FUCK!",
			"Fight fair, bitch!",
		])
	return null
