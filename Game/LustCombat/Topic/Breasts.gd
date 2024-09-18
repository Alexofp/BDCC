extends TopicBase

func _init():
	handles_ids = [
		InterestTopic.NoBreasts,
		InterestTopic.SmallBreasts,
		InterestTopic.MediumBreasts,
		InterestTopic.BigBreasts,
		InterestTopic.LactatingBreasts,
	]

func getTopicValue(_topicID, _pc):
	var breasts = _pc.getBodypart(BodypartSlot.Breasts)
	if(breasts == null):
		return 0.0
	var size = breasts.getSize()

	if(_topicID == InterestTopic.NoBreasts):
		return constantIfBelow(size, BreastsSize.FLAT, 1.0, linearCloseness(size, BreastsSize.FLAT, 1.7))
	
	if(_topicID == InterestTopic.SmallBreasts):
		return constantIfBelow(size, BreastsSize.FLAT, 0.2, linearCloseness(size, BreastsSize.A, 1.5))
	
	if(_topicID == InterestTopic.MediumBreasts):
		return linearCloseness(size, BreastsSize.C, 1.5)
	
	if(_topicID == InterestTopic.BigBreasts):
		return constantIfAbove(size, BreastsSize.DDD, 1.0, linearCloseness(size, BreastsSize.DDD, 3.5))
	
	if(_topicID == InterestTopic.LactatingBreasts):
		if(breasts.isProducingFluid()):
			return 1.0
	
	return 0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.NoBreasts):
		return "flat-chests"
	if(_topicID == InterestTopic.SmallBreasts):
		return "small breasts"
	if(_topicID == InterestTopic.MediumBreasts):
		return "perky tits"
	if(_topicID == InterestTopic.BigBreasts):
		return "huge milkers"
	if(_topicID == InterestTopic.LactatingBreasts):
		return "lactation"
	
	return "error:"+str(_topicID)

func getAddsToFocus(_topicID, _focus) -> float:
	if(_focus == LustFocus.Breasts):
		return 1.0
	return 0.0
