extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var conditionSlot := CrotchSlotVar.new()
var bodySlot := CrotchSlotCalls.new()

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(conditionSlot.isEmpty()):
		throwError(_contex, "Condition can't be empty")
		return false
	
	var failsafe:int = 0
	var failsafeTimer:int = Time.get_ticks_msec()
	
	var whileValue = conditionSlot.getValue(_contex)
	if(_contex.hadAnError()):
		_contex.resetErrored()
		return false
	if(_contex.shouldReturn()):
		return true
	
	while(whileValue):
		for block in bodySlot.getBlocks():
			block.execute(_contex)
			if(_contex.hadAnError()):
				_contex.resetErrored()
			if(_contex.shouldReturn()):
				return true
			if(_contex.shouldBreak()):
				return true
			if(_contex.shouldContinue()):
				break
		
		failsafe += 1
		if(failsafe > 10 && Time.get_ticks_msec() > (failsafeTimer + 10000)): # 10 seconds timeout, must do at least 10 cycles
			throwError(_contex, "Infinite While loop detected")
			return false
		
		whileValue = conditionSlot.getValue(_contex)
		if(_contex.hadAnError()):
			return false
	return true

func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "WHILE",
		},
		{
			type = "slot",
			id = "conditionSlot",
			slot = conditionSlot,
			slotType = CrotchBlocks.LOGIC,
		},
		{
			type = "label",
			text = "DO",
		},
		{
			type = "slot_list",
			id = "bodySlot",
			slot = bodySlot,
		},
	]

func getSlot(_id):
	if(_id == "conditionSlot"):
		return conditionSlot
	if(_id == "bodySlot"):
		return bodySlot

func getVisualBlockTheme():
	return themeControl
