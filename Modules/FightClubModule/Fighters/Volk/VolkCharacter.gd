extends Character

func _init():
	id = "volk"
	
	npcLevel = 3
	npcBasePain = 120
	npcBaseLust = 100
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="WoonaSkin"
	pickedSkinRColor=Color("ff868686")
	pickedSkinGColor=Color("ff3b3b3b")
	pickedSkinBColor=Color("ffcbcbcb")
	npcSkinData={
	"hair": {"r": Color("ffffffff"),"g": Color("ffd3d3d3"),"b": Color("ffa9a9a9"),},
	"penis": {"g": Color("ff732a2a"),"b": Color("ffd14747"),},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Likes,
		InterestTopic.Bodywritings: Interest.Likes,
		InterestTopic.Gags: Interest.Hates,
		InterestTopic.Blindfolds: Interest.Loves,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Hates,
		InterestTopic.VaginalPlugs: Interest.Hates,
		InterestTopic.FeminineBody: Interest.Dislikes,
		InterestTopic.AndroBody: Interest.Hates,
		InterestTopic.MasculineBody: Interest.Dislikes,
		InterestTopic.ThickBody: Interest.ReallyDislikes,
		InterestTopic.AverageMassBody: Interest.Dislikes,
		InterestTopic.SlimBody: Interest.SlightlyDislikes,
		InterestTopic.ThickButt: Interest.Dislikes,
		InterestTopic.AverageButt: Interest.Dislikes,
		InterestTopic.SlimButt: Interest.Loves,
		InterestTopic.NoBreasts: Interest.Dislikes,
		InterestTopic.SmallBreasts: Interest.Loves,
		InterestTopic.MediumBreasts: Interest.Dislikes,
		InterestTopic.BigBreasts: Interest.Dislikes,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.ReallyDislikes,
		InterestTopic.StuffedAss: Interest.ReallyDislikes,
		InterestTopic.StuffedPussyOrAss: Interest.SlightlyDislikes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.Hates,
		InterestTopic.CoveredInCum: Interest.Hates,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.FullyNaked: Interest.Hates,
		InterestTopic.ExposedPussy: Interest.Hates,
		InterestTopic.ExposedAnus: Interest.Hates,
		InterestTopic.ExposedBreasts: Interest.Hates,
		InterestTopic.ExposedCock: Interest.Hates,
		InterestTopic.ExposedPanties: Interest.Loves,
		InterestTopic.ExposedBra: Interest.Loves,
		InterestTopic.LooseAnus: Interest.Dislikes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Likes,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Hates,
		InterestTopic.SmallCock: Interest.Hates,
		InterestTopic.NoCock: Interest.ReallyLikes,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Gags):
		return "I wanna hear you moan, suka"
	if(interest == InterestTopic.ButtPlugs):
		return "Why don't you use dicks instead?"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "Suka, having both dick and pussy is not normal"
	if(interest == InterestTopic.ExposedPanties):
		return "Can't wait to cut your panties into little bits"
	if(interest == InterestTopic.ExposedBra):
		return "Is that bra armored, suka?"
	if(interest == InterestTopic.FullyNaked):
		return "Put something on, suka"
	if(interest == InterestTopic.CoveredInCum):
		return "I'm not touching you, suka"
	if(interest == InterestTopic.AndroBody):
		return "Are you a girl or a boy?"
	if(interest == InterestTopic.SmallBreasts):
		return "Will you squeel if I poke your tits?"
		
func _getName():
	return "Volk"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A male canine from the general block. Gray fur, short height, lots of scars"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["biteattack", "ShivAttack", "VolkTaunt", "trygetupattack"]

func getFightIntro(_battleName):
	if(_battleName == "arenafight"):
		var text = "Volk squats, lowering his profile even more. He then spits to the side. Kinda rude. His voice sounds very raspy, like he was smoking for 10 years straight."
		text += "\n\n"
		text += "[say=volk]What? Have a problem with that?[/say]"
		text += "\n\n"
		text += "He then stretches his neck and stands up before suddenly pulling out a shiv, a sharp-looking piece of glass that has a handle made out of cloth. No rules policy means he is free to use it."
		text += "\n\n"
		text += "[say=volk]Surprise. Come here, suka.[/say]"
		
		return text
	else:
		return .getFightIntro(_battleName)

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 30

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getLootTable(_battleName):
	var loot = InmateLoot.new()
	loot.addLoot(100, ["Shiv"])
	return loot
	
func getDefaultEquipment():
	return ["inmatecollar", "inmateuniform"]
