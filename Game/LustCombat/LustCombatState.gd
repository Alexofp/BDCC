extends Reference
class_name LustCombatState

var character: WeakRef
var inBattle = false

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)
	
func getActions():
	var result = []
	result.append(		{
			id = "MovePantiesAside",
		})
	
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var newActions = item.getLustActions()
			if(newActions != null):
				for newAction in newActions:
					result.append({
						"id": newAction,
						"item": item.getUniqueID(),
						"itemName": item.getVisibleName(),
					})
	
	return result
	
func isInBattle():
	return inBattle

func enteredBattle():
	inBattle = true

func exitedBattle():
	inBattle = false

func doAction(_action):
	pass
