extends Object
class_name CrotchUtil

static func getAllBlocks(firstElement):
	var toCheck:Array = [firstElement]
	
	var result:Dictionary = {}
	
	while(!toCheck.empty()):
		var nextElement = toCheck.front()
		toCheck.pop_front()
		
		if(nextElement == null):
			continue
		if(nextElement is CodeBlockBase):
			result[nextElement] = true
			for templateLine in nextElement.getTemplate():
				if(templateLine["type"] in ["slot", "slot_list"]):
					toCheck.append(nextElement.getSlot(templateLine["id"]))
		elif(nextElement is CrotchSlotCalls):
			toCheck.append_array(nextElement.getBlocks())
		elif(nextElement is CrotchSlotVar):
			toCheck.append(nextElement.getBlock())
	
	return result
