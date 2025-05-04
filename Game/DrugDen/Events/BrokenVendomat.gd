extends DrugDenEventBase

var timesUsed:int = 0
var useCost:int = 1

func _init():
	id = "BrokenVendomat"

func onSpawn(_drugDen):
	useCost = RNG.randi_range(1, 3)

func getMaxPerFloor() -> int:
	return 1

func getCooldown() -> int:
	return RNG.randi_range(2, 3)

func getStartCooldown() -> int:
	return RNG.randi_range(1, 3)

func getInteractInfo() -> Dictionary:
	return {
		text = "You found a broken vendomat machine! It seems to be still accepting credits..\n\nPrice: "+str(useCost)+"\nItem: UNKN??ERr..or??!",
		actions = [
			{
				id = "pay",
				name = "Pay "+str(useCost)+" credit"+("s" if useCost != 1 else ""),
				desc = "Pay "+str(useCost)+" credit"+("s" if useCost != 1 else "")+" and see if you will get anything.",
				args = [],
				disabled = GM.pc.getCredits() < useCost,
			},
		],
	}

func doInteract(_actionID:String, _args:Array = []) -> Dictionary:
	GM.pc.addCredits(-useCost)
	
	timesUsed += 1
	
	var didBreak:bool = false
	if(timesUsed >= 3):
		var breakChance:float = sqrt(timesUsed)*10.0
		if(RNG.chance(breakChance)):
			didBreak = true
	
	var theText:String = "You let the vendomat take "+str(useCost)+" credit"+("s" if useCost != 1 else "")+" from you.."
	
	var theLoot = {
		"": 10.0,
		"appleitem": 1.0,
		"painkillers": 0.5,
		"AnaphrodisiacPill": 1.0,
		"EnergyDrink": 1.0,
		"restraintkey": 0.5,
		"TFPill": 0.2,
		"BreederPill": 0.1,
		"HeatPill": 0.1,
		"StunBaton": 0.2,
		"Shiv": 0.1,
	}
	
	var itemResult:String = RNG.pickWeightedDict(theLoot)
	
	if(itemResult == "" || GlobalRegistry.getItemRef(itemResult) == null):
		theText += "\n\nAfter some time, the vendomat spews out.. Nothing.. It doesn't give you anything."
	else:
		var theItem:ItemBase = GlobalRegistry.createItem(itemResult)
		GM.pc.getInventory().addItem(theItem)
		theText += "\n\nAfter some time, the vendomat spews out.. [b]"+theItem.getAStackName()+"[/b]! Yay."
	
	if(didBreak):
		theText += "\n\nThe light inside the machine fades.. It doesn't seem to be working anymore."
	
	return {text=theText, ended=didBreak}
	

func getMapIcon():
	return RoomStuff.RoomSprite.IMPORTANT

func saveData() -> Dictionary:
	return {
		timesUsed = timesUsed,
	}

func loadData(_data:Dictionary):
	timesUsed = SAVE.loadVar(_data, "timesUsed", 0)
