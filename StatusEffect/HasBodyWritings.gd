extends StatusEffectBase

var writings:Dictionary = {}
var permWritings:Dictionary = {}

func getNormalAmount() -> int:
	var result:int = 0
	for allZone in writings:
		result += writings[allZone].size()
	return result
	
func getPermanentAmount() -> int:
	var result:int = 0
	for allZone in permWritings:
		result += permWritings[allZone].size()
	return result
	
func getAmount() -> int:
	return getNormalAmount() + getPermanentAmount()

func hasNormalWritingID(_writingID:String) -> bool:
	for allZone in writings:
		if(writings[allZone].has(_writingID)):
			return true
	return false

func hasPermanentWritingID(_writingID:String) -> bool:
	for allZone in permWritings:
		if(permWritings[allZone].has(_writingID)):
			return true
	return false

func hasWritingID(_writingID:String) -> bool:
	return hasNormalWritingID(_writingID) || hasPermanentWritingID(_writingID)

func hasPermanentWritingIDAtZone(zone, writingID:String) -> bool:
	zone = str(zone)
	if(permWritings.has(zone) && permWritings[zone].has(writingID)):
		return true
	return false

func addWriting(zone, writingID):
	zone = str(zone)
	if(writings.has(zone) && writings[zone].has(writingID)):
		return
	if(permWritings.has(zone) && permWritings[zone].has(writingID)):
		return
	
	if(!writings.has(zone)):
		writings[zone] = []
	writings[zone].append(writingID)

func addPermanentWriting(zone, writingID):
	zone = str(zone)
	if(permWritings.has(zone) && permWritings[zone].has(writingID)):
		return
	
	if(!permWritings.has(zone)):
		permWritings[zone] = []
	permWritings[zone].append(writingID)

func removeWritings(nonPermanent:bool = true, permanent:bool = false):
	if(nonPermanent):
		writings.clear()
	if(permanent):
		permWritings.clear()
	checkShouldStop()

func checkShouldStop():
	if(writings.empty() && permWritings.empty()):
		stop()

func _init():
	id = StatusEffect.HasBodyWritings
	isBattleOnly = false
	
func initArgs(_args = []):
	var isPermanent:bool = _args[2] if _args.size() > 2 else false
	if(!isPermanent):
		addWriting(_args[0], _args[1])
	else:
		addPermanentWriting(_args[0], _args[1])

func getEffectName():
	return "Body writings"

func getEffectDesc():
	var text = "Someone wrote these on you"
	for zoneInt in BodyWritingsZone.ALL:
		var zone:String = str(zoneInt)
		var writingsNames:Array = []
		if(permWritings.has(zone)):
			for writingID in permWritings[zone]:
				var data = BodyWritings.getWritingInfo(writingID)
				writingsNames.append("[b][i]\""+data[BodyWritingsDB.DBText]+"\"[/i][/b]")
		if(writings.has(zone)):
			for writingID in writings[zone]:
				var data = BodyWritings.getWritingInfo(writingID)
				writingsNames.append("[i]'"+data[BodyWritingsDB.DBText]+"'[/i]")
		
		if(!writingsNames.empty()):
			var zoneName:String = BodyWritingsZone.getZoneVisibleName(int(zone))
			text += "\n"+Util.humanReadableList(writingsNames)+" on your "+zoneName
		#text += "\n"+zoneName+": "+Util.humanReadableList(writingsNames)
	return text

func getEffectImage():
	return "res://Images/StatusEffects/bodywritings.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	var isPermanent:bool = _args[2] if _args.size() > 2 else false
	if(!isPermanent):
		addWriting(_args[0], _args[1])
	else:
		addPermanentWriting(_args[0], _args[1])

#var writingsData:Dictionary = {
#	BodyWritingsZone.ThighLeft: [
#		["Fuck me", false],
#		["Make me cum", false],
#	],
#	BodyWritingsZone.ThighRight: [
#		["Free use", false],
#	],
#}
func getDollData() -> Dictionary:
	var result:Dictionary = {}
	
	for allZoneStr in permWritings:
		var allZone:int = int(allZoneStr)
		result[allZone] = []
		var theAr:Array = result[allZone]
		for writingID in permWritings[allZoneStr]:
			var writingText:String = BodyWritings.getWritingText(writingID)
			theAr.append([writingText, true])
	for allZoneStr in writings:
		var allZone:int = int(allZoneStr)
		if(!result.has(allZone)):
			result[allZone] = []
		var theAr:Array = result[allZone]
		for writingID in writings[allZoneStr]:
			var writingText:String = BodyWritings.getWritingText(writingID)
			theAr.append([writingText, false])
	return result

func saveData():
	return {
		"writings": writings,
		"permWritings": permWritings,
	}
	
func loadData(_data):
	writings = SAVE.loadVar(_data, "writings", {})
	permWritings = SAVE.loadVar(_data, "permWritings", {})
