extends StatusEffectBase

var marks = {}
var totalAmount = 0

func addMark(zone):
	if(zone == null):
		return
	zone = str(zone)
	if(!marks.has(zone)):
		marks[zone] = 0
	marks[zone] += 1
	totalAmount += 1

func getBestZone(zonelist):
	if(zonelist.size() == 0):
		return null
	
	var possible = []
	for zone in zonelist:
		zone = str(zone)
		var currentAmount = 0
		if(marks.has(zone)):
			currentAmount = marks[zone]
		
		var value:float = 1.0
		if(currentAmount >= 1 && currentAmount < 20):
			value = 1000.0 / float(currentAmount)
		possible.append([zone, value])
	return RNG.pickWeightedPairs(possible)

func _init():
	id = StatusEffect.HasTallyMarks
	isBattleOnly = false
	
func initArgs(_args = []):
	if(_args.size() == 1):
		if((_args[0]) is int):
			addMark(_args[0])
		if((_args[0]) is Array):
			addMark(getBestZone(_args[0]))

func getEffectName():
	return "Tally marks"

func getEffectDesc():
	var text = "Your tally marks:"
	for zone in marks:
		var zoneName = BodyWritingsZone.getZoneVisibleName(int(zone))
		var amount = marks[zone]
		var amountString = BodyWritings.getTallyMarksString(amount)
		
		text += "\n"+zoneName+": "+amountString
	return text

func getEffectImage():
	return "res://Images/StatusEffects/tallymarks.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	if(_args.size() == 1):
		if((_args[0]) is int):
			addMark(_args[0])
		if((_args[0]) is Array):
			addMark(getBestZone(_args[0]))

func getBuffs():
	if(character.hasPerk(Perk.BDSMTallyMarks)):
		return [
			buff(Buff.LustDamageBuff, [Util.mini(1 * totalAmount, 50)])
		]
	return []

func saveData():
	return {
		"marks": marks,
		"totalAmount": totalAmount,
	}
	
func loadData(_data):
	marks = SAVE.loadVar(_data, "marks", {})
	totalAmount = SAVE.loadVar(_data, "totalAmount", 0)
