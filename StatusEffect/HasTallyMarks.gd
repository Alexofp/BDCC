extends StatusEffectBase

var marks = {}

func addMark(zone):
	if(!marks.has(zone)):
		marks[zone] = 0
	marks[zone] += 1

func _init():
	id = StatusEffect.HasTallyMarks
	isBattleOnly = false
	
func initArgs(_args = []):
	addMark(_args[0])

func getEffectName():
	return "Tally marks"

func getEffectDesc():
	var text = "Your tally marks:"
	for zone in marks:
		var zoneName = BodyWritingsZone.getZoneVisibleName(zone)
		var amount = marks[zone]
		var amountString = BodyWritings.getTallyMarksString(amount)
		
		text += "\n"+zoneName+": "+amountString
	return text

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/tallymarks.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	addMark(_args[0])

func saveData():
	return {
		"marks": marks,
	}
	
func loadData(_data):
	marks = SAVE.loadVar(_data, "marks", {})
