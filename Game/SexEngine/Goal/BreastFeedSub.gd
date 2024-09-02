extends SexGoalBase

func _init():
	id = SexGoal.BreastFeedSub

func getVisibleName():
	return "Breastfeed sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	#if(!_subInfo.getChar().canBeMilked()):
	#	return false
	if(_subInfo.getChar().isOralBlocked()):
		return false
	
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressDom: 1.0,
	}
	
func getGoalDefaultWeight():
	return 0.5

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	var madeLactate:bool = false
	for _i in range(RNG.randi_range(0, 3)):
		if(dom.stimulateLactation()):
			madeLactate = true
	
	var howMuchCollected:float = 0.0
	if(RNG.chance(50) && dom.hasBodypart(BodypartSlot.Breasts) && sub.hasBodypart(BodypartSlot.Head)):
		howMuchCollected = dom.getBodypart(BodypartSlot.Breasts).getFluids().transferTo(sub.getBodypart(BodypartSlot.Head), RNG.randf_range(0.4, 1.0), 50.0)
	
	if(RNG.chance(85) && !dom.hasPerk(Perk.MilkNoSoreNipples) && !dom.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
		dom.addEffect(StatusEffect.SoreNipplesAfterMilking)
	
	sendSexEvent(_sexEngine, SexEvent.BreastFeeding, _subInfo, _domInfo, {madeLactate=madeLactate, loadSize=howMuchCollected, targetIsDom=true})
