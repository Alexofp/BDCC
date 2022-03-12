extends TopicBase

func _init():
	id = TopicGroup.BodyThickness
	
	handles_ids = [
		InterestTopic.ThickBody,
		InterestTopic.AverageMassBody,
		InterestTopic.SlimBody,
	]

func getTopicValue(_topicID, _pc):
	var thickness = _pc.getThickness()/100.0
	
	if(_topicID == InterestTopic.ThickBody):
		return linearCloseness(thickness, 1.0, 0.3, 0.1)
	
	if(_topicID == InterestTopic.AverageMassBody):
		return linearCloseness(thickness, 0.5, 0.3, 0.1)
	
	if(_topicID == InterestTopic.SlimBody):
		return linearCloseness(thickness, 0.0, 0.3, 0.1)
	
	return 0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.ThickBody):
		return "thick body"
	if(_topicID == InterestTopic.AverageMassBody):
		return "average body"
	if(_topicID == InterestTopic.SlimBody):
		return "slim body"
	
	return "error:"+str(_topicID)

func getTeaseValue(_topicID, _teaseType):
	if(_teaseType == TeaseType.Body):
		return 0.5
	return 0.0
