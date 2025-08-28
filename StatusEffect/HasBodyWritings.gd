extends StatusEffectBase

var writings:Dictionary = {}
var permWritings:Dictionary = {}

func getAmount():
	var result = 0
	for allZone in writings:
		result += writings[allZone].size()
	for allZone in permWritings:
		result += permWritings[allZone].size()
	return result

func addWriting(zone, writingID):
	zone = str(zone)
	for allZone in writings:
		if(writings[allZone].has(writingID)):
			return
	
	if(!writings.has(zone)):
		writings[zone] = []
	writings[zone].append(writingID)

func addPermanentWriting(zone, writingID):
	zone = str(zone)
	for allZone in permWritings:
		if(permWritings[allZone].has(writingID)):
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

func saveData():
	return {
		"writings": writings,
		"permWritings": permWritings,
	}
	
func loadData(_data):
	writings = SAVE.loadVar(_data, "writings", {})
	permWritings = SAVE.loadVar(_data, "permWritings", {})
