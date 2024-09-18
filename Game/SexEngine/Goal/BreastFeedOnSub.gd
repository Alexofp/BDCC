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
