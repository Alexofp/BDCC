extends Reference
class_name GameExtenderSystem

var registeredExtenders = {}

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

func saveData():
	var data = {}
	
	var extendersData = {}
	if(registeredExtenders.has(ExtendGame.saveLoadData)):
		for gameExtender in registeredExtenders[ExtendGame.saveLoadData]:
			var extenderData = gameExtender.saveData()
			if(extenderData != null):
				extendersData[gameExtender.id] = extenderData
		
	data["extendersData"] = extendersData
	return data

func loadData(data):
	var extendersData = SAVE.loadVar(data, "extendersData", {})
	
	for extenderId in extendersData:
		var gameExtender = GlobalRegistry.getGameExtender(extenderId)
		if(gameExtender == null):
			continue
		var extenderData = SAVE.loadVar(extendersData, extenderId, {})
		
		gameExtender.loadData(extenderData)
		
