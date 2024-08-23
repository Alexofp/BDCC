extends TopicBase

func _init():
	handles_ids = [
		InterestTopic.TallyMarks,
		InterestTopic.Bodywritings,
		
		InterestTopic.Gags,
		InterestTopic.Blindfolds,
		InterestTopic.BDSMRestraints,
		InterestTopic.ButtPlugs,
		InterestTopic.VaginalPlugs,
	]

func getTopicValue(_topicID, _pc):
	if(_topicID == InterestTopic.TallyMarks):
		if(_pc.hasTallymarks()):
			return 1.0
	if(_topicID == InterestTopic.Bodywritings):
		if(_pc.hasBodywritings()):
			return 1.0
			
	if(_topicID == InterestTopic.Gags):
		if(_pc.isGagged()):
			return 1.0
	if(_topicID == InterestTopic.Blindfolds):
		if(_pc.isBlindfolded()):
			return 1.0
	if(_topicID == InterestTopic.BDSMRestraints):
		if(_pc.hasBoundArms() || _pc.hasBlockedHands() || _pc.hasBoundLegs()):
			return 1.0
	if(_topicID == InterestTopic.ButtPlugs):
		if(_pc.getInventory().hasSlotEquipped(InventorySlot.Anal)):
			return 1.0
	if(_topicID == InterestTopic.VaginalPlugs):
		if(_pc.getInventory().hasSlotEquipped(InventorySlot.Vagina)):
			return 1.0

	return 0.0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.TallyMarks):
		return "tally marks"
	if(_topicID == InterestTopic.Bodywritings):
		return "body writings"
	
	if(_topicID == InterestTopic.Gags):
		return "gags"
	if(_topicID == InterestTopic.Blindfolds):
		return "blindfolds"
	if(_topicID == InterestTopic.BDSMRestraints):
		return "BDSM restraints"
	if(_topicID == InterestTopic.ButtPlugs):
		return "buttplugs"
	if(_topicID == InterestTopic.VaginalPlugs):
		return "vaginal plugs"

	
	return "error:"+str(_topicID)

func getAddsToFocus(_topicID, _focus) -> float:
	if(_topicID == InterestTopic.TallyMarks):
		if(_focus == LustFocus.Body):
			return 0.5
		if(_focus == LustFocus.Butt):
			return 1.0
	if(_topicID == InterestTopic.Bodywritings):
		if(_focus == LustFocus.Body):
			return 1.0
		if(_focus == LustFocus.Butt):
			return 0.5
	if(_topicID == InterestTopic.Gags):
		if(_focus == LustFocus.Body):
			return 0.25
	if(_topicID == InterestTopic.Blindfolds):
		if(_focus == LustFocus.Body):
			return 0.25
	if(_topicID == InterestTopic.BDSMRestraints):
		if(_focus == LustFocus.Body):
			return 1.0
	if(_topicID == InterestTopic.ButtPlugs):
		if(_focus == LustFocus.Butt):
			return 1.0
	if(_topicID == InterestTopic.VaginalPlugs):
		if(_focus == LustFocus.Crotch):
			return 1.0
	
	return 0.0
