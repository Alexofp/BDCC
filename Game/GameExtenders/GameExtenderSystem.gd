extends Reference
class_name GameExtenderSystem

var registeredExtenders:Dictionary = {}

func register(gameExtender, hook):
	if(!registeredExtenders.has(hook)):
		registeredExtenders[hook] = []
	
	registeredExtenders[hook].append(gameExtender)

func registerAll():
	registeredExtenders.clear()
	
	var gameExtenders = GlobalRegistry.getGameExtenders()
	for gameExtenderID in gameExtenders:
		gameExtenders[gameExtenderID].register(self)

func callGameExtenders(hook, _args = []):
	if(!registeredExtenders.has(hook)):
		return
	
	if(!ExtendGame.enumToFunctionName.has(hook)):
		return
	var functionName = ExtendGame.enumToFunctionName[hook]
	
	for gameExtender in registeredExtenders[hook]:
		gameExtender.callv(functionName, _args)

func reregisterExtender(_id:String, _recreate:bool = true, _callNewGameStart:bool = true):
	var theExtender = GlobalRegistry.getGameExtender(_id)
	if(!theExtender):
		return
	
	for theHook in registeredExtenders: # Find all extender hook entries and remove them
		var theExtenders:Array = registeredExtenders[theHook]
		theExtenders.erase(theExtender)
		
	if(_recreate):
		GlobalRegistry.recreateGameExtender(_id)
		theExtender = GlobalRegistry.getGameExtender(_id)
	if(!theExtender):
		return
	theExtender.register(self)
	if(_callNewGameStart):
		theExtender.onNewGameOrLoadStart()

func recreateExtendersOnLoad(): # Gets called twice if loading the game, sorry
	for _id in GlobalRegistry.gameExtenders.keys():
		var theExtender = GlobalRegistry.getGameExtender(_id)
		if(theExtender.recreateExtenderOnLoad):
			reregisterExtender(_id)
		else:
			theExtender.onNewGameOrLoadStart()

func saveData() -> Dictionary:
	var data:Dictionary = {}
	
	var extendersData = {}
	if(registeredExtenders.has(ExtendGame.saveLoadData)):
		for gameExtender in registeredExtenders[ExtendGame.saveLoadData]:
			var extenderData = gameExtender.saveData()
			if(extenderData != null):
				extendersData[gameExtender.id] = extenderData
		
	data["extendersData"] = extendersData
	return data

func loadData(data:Dictionary):
	recreateExtendersOnLoad()
	
	var extendersData:Dictionary = SAVE.loadVar(data, "extendersData", {})
	
	for extenderId in extendersData:
		var gameExtender = GlobalRegistry.getGameExtender(extenderId)
		if(gameExtender == null):
			continue
		var extenderData = SAVE.loadVar(extendersData, extenderId, {})
		
		gameExtender.loadData(extenderData)
		
