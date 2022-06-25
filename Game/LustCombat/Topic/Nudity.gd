extends TopicBase

func _init():
	handles_ids = [
		InterestTopic.FullyNaked,
		InterestTopic.ExposedPussy,
		InterestTopic.ExposedAnus,
		InterestTopic.ExposedBreasts,
		InterestTopic.ExposedCock,
		InterestTopic.ExposedPanties,
		InterestTopic.ExposedBra,
	]

func getTopicValue(_topicID, _pc):
	if(_topicID == InterestTopic.FullyNaked):
		if(_pc.isFullyNaked()):
			return 1.0
	if(_topicID == InterestTopic.ExposedPussy):
		if(!_pc.isBodypartCovered(BodypartSlot.Vagina)):
			return 1.0
	if(_topicID == InterestTopic.ExposedAnus):
		if(!_pc.isBodypartCovered(BodypartSlot.Anus)):
			return 1.0
	if(_topicID == InterestTopic.ExposedBreasts):
		if(!_pc.isBodypartCovered(BodypartSlot.Breasts)):
			return 1.0
	if(_topicID == InterestTopic.ExposedCock):
		if(!_pc.isBodypartCovered(BodypartSlot.Penis)):
			return 1.0
	if(_topicID == InterestTopic.ExposedPanties):
		if(!_pc.isInventorySlotBlocked(InventorySlot.UnderwearBottom) && _pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			return 1.0
	if(_topicID == InterestTopic.ExposedBra):
		if(!_pc.isInventorySlotBlocked(InventorySlot.UnderwearTop) && _pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearTop)):
			return 1.0
	
	return 0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.FullyNaked):
		return "complete nudity"
	if(_topicID == InterestTopic.ExposedPussy):
		return "naked pussy"
	if(_topicID == InterestTopic.ExposedAnus):
		return "exposed anus"
	if(_topicID == InterestTopic.ExposedBreasts):
		return "naked breasts"
	if(_topicID == InterestTopic.ExposedCock):
		return "exposed cock"
	if(_topicID == InterestTopic.ExposedPanties):
		return "panties"
	if(_topicID == InterestTopic.ExposedBra):
		return "bras"

	
	return "error:"+str(_topicID)

func getTeaseValue(_topicID, _teaseType):
	if(_teaseType == TeaseType.Body):
		if(_topicID in [InterestTopic.FullyNaked, InterestTopic.ExposedBreasts, InterestTopic.ExposedBra]):
			return 1.0
	if(_teaseType == TeaseType.Crotch):
		if(_topicID in [InterestTopic.ExposedPussy, InterestTopic.ExposedCock, InterestTopic.ExposedPanties]):
			return 1.0
	if(_teaseType == TeaseType.Butt):
		if(_topicID in [InterestTopic.ExposedAnus, InterestTopic.ExposedPanties]):
			return 1.0
	return 0.0
