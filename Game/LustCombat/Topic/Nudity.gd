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
		if(_pc.hasBodypart(BodypartSlot.Vagina) && !_pc.isBodypartCovered(BodypartSlot.Vagina)):
			return 1.0
	if(_topicID == InterestTopic.ExposedAnus):
		if(_pc.hasBodypart(BodypartSlot.Anus) && !_pc.isBodypartCovered(BodypartSlot.Anus)):
			return 1.0
	if(_topicID == InterestTopic.ExposedBreasts):
		if(_pc.hasBodypart(BodypartSlot.Breasts) && !_pc.isBodypartCovered(BodypartSlot.Breasts)):
			return 1.0
	if(_topicID == InterestTopic.ExposedCock):
		if(_pc.hasBodypart(BodypartSlot.Penis) && !_pc.isBodypartCovered(BodypartSlot.Penis)):
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

func getChatName(_topicID) -> String:
	if(_topicID == InterestTopic.FullyNaked):
		return "nudity"
	if(_topicID == InterestTopic.ExposedPussy):
		return "pussies"
	if(_topicID == InterestTopic.ExposedAnus):
		return "asses"
	if(_topicID == InterestTopic.ExposedBreasts):
		return "tits"
	if(_topicID == InterestTopic.ExposedCock):
		return "cocks"
	if(_topicID == InterestTopic.ExposedPanties):
		return "panties"
	if(_topicID == InterestTopic.ExposedBra):
		return "bras"
	
	return .getChatName(_topicID)

func getAddsToFocus(_topicID, _focus) -> float:
	if(_topicID == InterestTopic.FullyNaked):
		if(_focus == LustFocus.Body):
			return 1.0
	if(_topicID == InterestTopic.ExposedPussy):
		if(_focus == LustFocus.Crotch):
			return 1.0
	if(_topicID == InterestTopic.ExposedAnus):
		if(_focus == LustFocus.Butt):
			return 1.0
	if(_topicID == InterestTopic.ExposedBreasts):
		if(_focus == LustFocus.Breasts):
			return 1.0
	if(_topicID == InterestTopic.ExposedCock):
		if(_focus == LustFocus.Crotch):
			return 1.0
	if(_topicID == InterestTopic.ExposedPanties):
		if(_focus == LustFocus.Crotch):
			return 1.0
		if(_focus == LustFocus.Butt):
			return 1.0
	if(_topicID == InterestTopic.ExposedBra):
		if(_focus == LustFocus.Breasts):
			return 1.0
	
	return 0.0
