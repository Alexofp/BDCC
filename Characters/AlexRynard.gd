extends Character

func _init():
	id = "alexrynard"
	
	npcLevel = 10
	npcBasePain = 150
	npcBaseLust = 250
	npcBaseStamina = 150
	npcCharacterType = CharacterType.Engineer
	
	pickedSkin="CunningSkin"
	pickedSkinRColor=Color("ffe07a35")
	pickedSkinGColor=Color("ffe7e7e7")
	pickedSkinBColor=Color("ff512c13")
	npcSkinData={
	"hair": {"r": Color("ff1f1f1f"),"g": Color("ff090909"),"b": Color("ffb8542d"),},
	"ears": {"b": Color("ffffffff"),},
	"arms": {"g": Color("ff070707"),},
	"penis": {"g": Color("ffd2160c"),"b": Color("ff8b0000"),},
	"legs": {"g": Color("ff070707"),},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Loves,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.Loves,
		InterestTopic.Blindfolds: Interest.Loves,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Loves,
		InterestTopic.VaginalPlugs: Interest.Loves,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Likes,
		InterestTopic.ThickBody: Interest.ReallyLikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.ReallyLikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.Likes,
		InterestTopic.NoBreasts: Interest.Likes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.Likes,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Hates,
		InterestTopic.StuffedAss: Interest.Hates,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.Pregnant: Interest.ReallyDislikes,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.Dislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.FullyNaked: Interest.Hates,
		InterestTopic.ExposedPussy: Interest.KindaLikes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.Dislikes,
		InterestTopic.ExposedCock: Interest.Dislikes,
		InterestTopic.ExposedPanties: Interest.ReallyLikes,
		InterestTopic.ExposedBra: Interest.ReallyLikes,
		InterestTopic.LooseAnus: Interest.Hates,
		InterestTopic.LoosePussy: Interest.Hates,
		InterestTopic.TightAnus: Interest.Loves,
		InterestTopic.TightPussy: Interest.Loves,
		InterestTopic.NoVagina: Interest.SlightlyDislikes,
		InterestTopic.HasVaginaOnly: Interest.KindaLikes,
		InterestTopic.HasVaginaAndCock: Interest.Dislikes,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.Likes,
		InterestTopic.NoCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "Having kids in prison? Are you out of your mind?"
	if(interest == InterestTopic.Bodywritings):
		return "I do like art. I guess even the body art."
	if(interest == InterestTopic.CoveredInCum):
		return "Go get a shower, kiddo."
	if(interest == InterestTopic.LoosePussy):
		return "What makes you fuck so much. Go fix your libido."
	if(interest == InterestTopic.LooseAnus):
		return "I don't need to see your destoyed ass."
	if(interest == InterestTopic.BDSMRestraints):
		return "Bondage rigging is my biggest pleasure. I will leave breeding to others."
	if(interest == InterestTopic.AndroBody):
		return "I never cared how people look. What inside matters more."
	if(interest == InterestTopic.FullyNaked):
		return "Put some clothes on, this is embarrassing."
	if(interest == InterestTopic.LactatingBreasts):
		return "Are you a cow? Go eat grass."
	if(interest == InterestTopic.BigCock):
		return "How are you even.. whatever"
	if(interest == InterestTopic.StuffedPussy):
		return "Breeding is all you can think about? Do you have dreams?"
	if(interest == InterestTopic.StuffedAss):
		return "I didn't need to see that."
	
func _getName():
	return "Alex Rynard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Male fox with a cold stare. Wears an engineer uniform"

func getSpecies():
	return ["canine"]

func getChatColor():
	return '#FFF60C'

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxtail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["EngineerClothesAlex", "plainBriefs"]

func _getAttacks():
	return ["NpcScratch", "StrongBite", "simplekickattack", "HeatGrenade", "BolaThrow", "ForceBlindfoldPC", "trygetupattack"]

func getFightIntro(_battleName):
	return "Alex grunts as he gets into a fighting stance, his prosthetic spine is not meant for combat. But he seems tough even with that handicap."

func getLootTable(_battleName):
	return EngineerLoot.new()

func reactRestraint(restraintType, restraintAmount, isGettingForced):
	if(!isGettingForced):
		if(restraintAmount == 0):
			return RNG.pick([
				"You can't tie me up so easily",
				"Try harder next time",
				"What now?",
				"You can't tie up a rigger",
			])
		
		return RNG.pick([
			"I will break your toys",
			"These can't hold me back forever",
		])
	
	if(isGettingForced):
		if(restraintAmount > 2 && RNG.chance(30)):
			return RNG.pick([
				"Stop with this crap",
				"Enough, save these for lilacs and reds",
				"How many more do you have?",
			])
		
		if(restraintType == RestraintType.Gag):
			return RNG.pick([
				"Hey! Don't fucking gag me",
				"You think gagging me will save you?",
			])
		if(restraintType == RestraintType.Muzzle):
			return RNG.pick([
				"Hey! Don't fucking muzzle me",
				"You think muzzling me will save you?",
			])
		if(restraintType == RestraintType.ButtPlug):
			return RNG.pick([
				"Hey! Not my ass!",
				"Don't touch my fucking ass",
			])
	
		return RNG.pick([
			"Hey! Restraints are my thing!",
			"The fuck are you doing?",
			"You are making me real mad",
			"You can't win like this",
			"Fight me instead of this shit",
			"Keep that shit away from me",
		])
	return null
