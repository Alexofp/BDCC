extends StatusEffectBase

var writings = {}

func getAmount():
	var result = 0
	for allZone in writings:
		result += writings[allZone].size()
	return result

func addWriting(zone, writingID):
	zone = str(zone)
	for allZone in writings:
		if(writings[allZone].has(writingID)):
			return
	
	if(!writings.has(zone)):
		writings[zone] = []
	writings[zone].append(writingID)

func _init():
	id = StatusEffect.HasBodyWritings
	isBattleOnly = false
	
func initArgs(_args = []):
	addWriting(_args[0], _args[1])

func getEffectName():
	return "Body writings"

func getEffectDesc():
	var text = "Someone wrote these on you"
	for zone in writings:
		var writingsNames = []
		for writingID in writings[zone]:
			var data = BodyWritings.getWritingInfo(writingID)
			writingsNames.append("'[i]"+data[BodyWritingsDB.DBText]+"[/i]'")
		
		var zoneName = BodyWritingsZone.getZoneVisibleName(int(zone))
		
		text += "\n"+Util.humanReadableList(writingsNames)+" on your "+zoneName
		#text += "\n"+zoneName+": "+Util.humanReadableList(writingsNames)
	return text

func getEffectImage():
	return "res://Images/StatusEffects/bodywritings.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	addWriting(_args[0], _args[1])

func saveData():
	return {
		"writings": writings,
	}
	
func loadData(_data):
	writings = SAVE.loadVar(_data, "writings", {})
