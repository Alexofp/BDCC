extends Object
class_name BodyWritings



static func getTallyMarksString(amount: int) -> String:
	var result = []
	while(amount >= 5):
		result.append("[s]||||[/s]")
		amount -= 5
	if(amount > 0):
		var s = ""
		for _i in range(amount):
			s += "|"
		result.append(s)
	return Util.join(result, " ")

static func getWritingInfo(writingID):
	if(!BodyWritingsDB.database.has(writingID)):
		return null
	return BodyWritingsDB.database[writingID]

static func getWritingText(writingID):
	if(!BodyWritingsDB.database.has(writingID)):
		return "error:BadWritingID:"+str(writingID)
	return BodyWritingsDB.database[writingID]["text"]

static func getRandomWritingID():
	var allIds = BodyWritingsDB.database.keys()
	allIds.shuffle()
	for id in allIds:
		var data = getWritingInfo(id)
		if(data.has(BodyWritingsDB.DBZoneWhitelist) && data[BodyWritingsDB.DBZoneWhitelist].size() > 0):
			continue
		return id
	
	return null

static func getRandomWritingIDForZone(zone, randomChance = 20):
	var allIds = BodyWritingsDB.database.keys()
	allIds.shuffle()
	var randomOnes = []
	var priorityOnes = []
	
	for id in allIds:
		var data = getWritingInfo(id)
		if(data.has(BodyWritingsDB.DBZoneWhitelist) && data[BodyWritingsDB.DBZoneWhitelist].size() > 0):
			if(data[BodyWritingsDB.DBZoneWhitelist].has(zone)):
				priorityOnes.append(id)
			continue
		randomOnes.append(id)
	
	randomChance = max(randomChance, (5-priorityOnes.size())*20)
	if(priorityOnes.size() == 0 || RNG.chance(randomChance)):
		return RNG.pick(randomOnes)
	
	return RNG.pick(priorityOnes)
