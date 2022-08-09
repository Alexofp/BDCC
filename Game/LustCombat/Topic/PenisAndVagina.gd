extends TopicBase

func _init():
	handles_ids = [
		InterestTopic.NoVagina,
		InterestTopic.HasVaginaOnly,
		InterestTopic.HasVaginaAndCock,
		InterestTopic.BigCock,
		InterestTopic.AverageCock,
		InterestTopic.SmallCock,
		InterestTopic.NoCock,
		InterestTopic.HasCockOnly,
	]

func getTopicValue(_topicID, _pc):
	var hasCock = _pc.hasBodypart(BodypartSlot.Penis)
	var hasPussy = _pc.hasBodypart(BodypartSlot.Vagina)
	var cockSize = -999
	if(hasCock):
		var cock:BodypartPenis = _pc.getBodypart(BodypartSlot.Penis)
		cockSize = cock.getLength()

	if(_topicID == InterestTopic.NoVagina):
		return float(!hasPussy)
	
	if(_topicID == InterestTopic.HasVaginaOnly):
		return float(hasPussy && !hasCock)
	
	if(_topicID == InterestTopic.HasVaginaAndCock):
		return float(hasPussy && hasCock)
	
	if(_topicID == InterestTopic.BigCock):
		if(!hasCock):
			return 0.0
		return constantIfAbove(cockSize, 30.0, 1.0, linearCloseness(cockSize, 30.0, 20.0))
	
	if(_topicID == InterestTopic.AverageCock):
		if(!hasCock):
			return 0.0
		return linearCloseness(cockSize, 15.0, 10.0)
	
	
	if(_topicID == InterestTopic.SmallCock):
		if(!hasCock):
			return 0.0
		return constantIfBelow(cockSize, 5.0, 1.0, linearCloseness(cockSize, 5.0, 10.0))
	
	if(_topicID == InterestTopic.NoCock):
		return float(!hasCock)
		
	if(_topicID == InterestTopic.HasCockOnly):
		return float(!hasPussy && hasCock)
	
	return 0.0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.NoVagina):
		return "lack of a pussy"
	if(_topicID == InterestTopic.HasVaginaOnly):
		return "just a pussy"
	if(_topicID == InterestTopic.HasVaginaAndCock):
		return "herms"
	if(_topicID == InterestTopic.BigCock):
		return "huge cocks"
	if(_topicID == InterestTopic.AverageCock):
		return "average-sized cocks"
	if(_topicID == InterestTopic.SmallCock):
		return "small cute cocks"
	if(_topicID == InterestTopic.NoCock):
		return "lack of a cock"
	if(_topicID == InterestTopic.HasCockOnly):
		return "just a cock"
	
	return "error:"+str(_topicID)
