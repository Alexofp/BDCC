extends TopicBase

func _init():
	id = TopicGroup.BodyFemininity
	
	handles_ids = [
		InterestTopic.FeminineBody,
		InterestTopic.AndroBody,
		InterestTopic.MasculineBody,
	]

func getTopicValue(_topicID, _pc):
	var thickness = _pc.getFemininity()/100.0
	
	if(_topicID == InterestTopic.FeminineBody):
		return linearCloseness(thickness, 1.0, 0.3, 0.05)
	
	if(_topicID == InterestTopic.AndroBody):
		return linearCloseness(thickness, 0.5, 0.3, 0.05)
	
	if(_topicID == InterestTopic.MasculineBody):
		return linearCloseness(thickness, 0.0, 0.3, 0.05)
	
	return 0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.FeminineBody):
		return "feminine body"
	if(_topicID == InterestTopic.AndroBody):
		return "androgynous body"
	if(_topicID == InterestTopic.MasculineBody):
		return "masculine body"
	
	return "error:"+str(_topicID)

func getTeaseValue(_topicID, _teaseType):
	if(_teaseType == TeaseType.Body):
		return 0.5
	return 0.0
