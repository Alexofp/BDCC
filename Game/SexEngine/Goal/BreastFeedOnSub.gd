extends SexGoalBase

func _init():
	id = SexGoal.BreastFeedOnSub

func getVisibleName():
	return "Breastfeed on sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	#if(!_subInfo.getChar().canBeMilked()):
	#	return false
	if(_domInfo.getChar().isOralBlocked()):
		return false
	
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}
	
func getGoalDefaultWeight():
	return 0.5

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	var madeLactate:bool = false
	for _i in range(RNG.randi_range(0, 3)):
		if(sub.stimulateLactation()):
			madeLactate = true
	
	var howMuchCollected:float = 0.0
	if(RNG.chance(50) && sub.hasBodypart(BodypartSlot.Breasts) && dom.hasBodypart(BodypartSlot.Head)):
		howMuchCollected = sub.getBodypart(BodypartSlot.Breasts).getFluids().transferTo(dom.getBodypart(BodypartSlot.Head), RNG.randf_range(0.4, 1.0), 50.0)
	
	if(RNG.chance(85) && !sub.hasPerk(Perk.MilkNoSoreNipples) && !sub.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
		sub.addEffect(StatusEffect.SoreNipplesAfterMilking)
	
	sendSexEvent(_sexEngine, SexEvent.BreastFeeding, _domInfo, _subInfo, {madeLactate=madeLactate, loadSize=howMuchCollected, targetIsDom=false})
	
	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Breastfeed on me"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to feed on your milky breasts!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to breastfeed on {sub.yourHis} {sub.breasts}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to feel your lips around my nips.. feed from my breasts.",
		"I'm so full and aching for you.. please, suckle on my tits.",
		"Let me feel your lips around my nipples, I need it so badly.",
		"Use me, feed from my tits, I really want it.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Lactation: 1.0,
	}
