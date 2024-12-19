extends TopicBase

func _init():
	handles_ids = [
		InterestTopic.StuffedPussy,
		InterestTopic.StuffedAss,
		InterestTopic.StuffedPussyOrAss,
		InterestTopic.Pregnant,
		InterestTopic.StuffedThroat,
		InterestTopic.CoveredInCum,
		InterestTopic.CoveredInLotsOfCum,
	]

func getTopicValue(_topicID, _pc):
	var messiness = _pc.getOutsideMessinessLevel()
	
	var isButtStuffed := false
	if(_pc.hasBodypart(BodypartSlot.Anus)):
		isButtStuffed = !_pc.getBodypart(BodypartSlot.Anus).isOrificeEmpty()
		
	var isPussyStuffed := false
	if(_pc.hasBodypart(BodypartSlot.Vagina)):
		isPussyStuffed = !_pc.getBodypart(BodypartSlot.Vagina).isOrificeEmpty()
		
	var isThroatStuffed := false
	if(_pc.hasBodypart(BodypartSlot.Head)):
		isThroatStuffed = !_pc.getBodypart(BodypartSlot.Head).isOrificeEmpty()

	
	if(_topicID == InterestTopic.CoveredInCum):
		if(messiness >= 1.0):
			return 1.0
		else:
			return 0.0

	if(_topicID == InterestTopic.CoveredInLotsOfCum):
		if(messiness > 0):
			return constantIfAbove(messiness, 5.0, 1.0, linearCloseness(messiness, 5.0, 5.0))
		else:
			return 0.0
	
	if(_topicID == InterestTopic.StuffedPussy):
		return float(isPussyStuffed)
	
	if(_topicID == InterestTopic.StuffedAss):
		return float(isButtStuffed)
	
	if(_topicID == InterestTopic.StuffedPussyOrAss):
		return float(isButtStuffed || isPussyStuffed)
	
	if(_topicID == InterestTopic.Pregnant):
		if(_pc.isVisiblyPregnant()):
			return 1.0
		return 0.0
	
	if(_topicID == InterestTopic.StuffedThroat):
		return float(isThroatStuffed)
	
	return 0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.StuffedPussy):
		return "a creamed pussy"
	if(_topicID == InterestTopic.StuffedAss):
		return "a cum-stuffed ass"
	if(_topicID == InterestTopic.StuffedPussyOrAss):
		return "any used hole"
	if(_topicID == InterestTopic.Pregnant):
		return "pregnant bellies"
	if(_topicID == InterestTopic.StuffedThroat):
		return "cum eaters"
	if(_topicID == InterestTopic.CoveredInCum):
		return "sluts covered with cum"
	if(_topicID == InterestTopic.CoveredInLotsOfCum):
		return "total cumdumpsters"
	
	return "error:"+str(_topicID)

func getChatName(_topicID) -> String:
	if(_topicID == InterestTopic.StuffedPussy):
		return "creamed pussies"
	if(_topicID == InterestTopic.StuffedAss):
		return "cream-stuffed butts"
	if(_topicID == InterestTopic.StuffedPussyOrAss):
		return "creampies"
	if(_topicID == InterestTopic.Pregnant):
		return "breeding"
	if(_topicID == InterestTopic.StuffedThroat):
		return "cum eaters"
	if(_topicID == InterestTopic.CoveredInCum):
		return "cum facials"
	if(_topicID == InterestTopic.CoveredInLotsOfCum):
		return "cumdumpsters"
	
	return .getChatName(_topicID)

func getAddsToFocus(_topicID, _focus) -> float:
	if(_topicID == InterestTopic.StuffedPussy):
		if(_focus == LustFocus.Crotch):
			return 1.0
	if(_topicID == InterestTopic.StuffedAss):
		if(_focus == LustFocus.Butt):
			return 1.0
	if(_topicID == InterestTopic.StuffedPussyOrAss):
		if(_focus == LustFocus.Crotch):
			return 1.0
		if(_focus == LustFocus.Butt):
			return 1.0
	if(_topicID == InterestTopic.Pregnant):
		if(_focus == LustFocus.Body):
			return 1.0
		if(_focus == LustFocus.Breasts):
			return 0.25
	if(_topicID == InterestTopic.StuffedThroat):
		if(_focus == LustFocus.Body):
			return 0.25
	if(_topicID == InterestTopic.CoveredInCum):
		if(_focus == LustFocus.Body):
			return 1.0
		if(_focus == LustFocus.Breasts):
			return 0.5
	if(_topicID == InterestTopic.CoveredInLotsOfCum):
		if(_focus == LustFocus.Body):
			return 1.0
		if(_focus == LustFocus.Breasts):
			return 0.5
	
	return 0.0
