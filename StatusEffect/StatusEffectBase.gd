extends Node
class_name StatusEffectBase

var id = "badstatuseffect"
var isBattleOnly = false
var isSexEngineOnly = false
var character
var turns = -1

const IconColorRed = Color(0.7, 0.1, 0.1)
const IconColorGreen = Color(0.1, 0.7, 0.1)
const IconColorPurple = Color("#A001A0")
const IconColorDarkPurple = Color("#A001A0")
const IconColorBlue = Color(0.207843, 0.227451, 0.556863)
const IconColorWhite = Color.white
const IconColorGray = Color.gray
const IconColorYellow = Color.yellow

func _init():
	pass
	
func initArgs(_args = []):
	pass

func setCharacter(c):
	character = c
	
func processBattleTurn():
	pass

func processSexTurn():
	pass
	
func onSleeping():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Error bad"

func getEffectDesc():
	return "Let the developer know"

func getVisisbleDescription():
	var text = getEffectDesc()
	var buffs = getBuffs()
	if(buffs != null && (buffs is Array) && buffs.size() > 0):
		for buff in buffs:
			text += "\n" + "[color=#"+buff.getBuffColor().to_html(false)+"]" + buff.getVisibleDescription() + "[/color]"
	return text

func getEffectImage():
	return null

func getIconColor():
	return IconColorBlue

func combine(_newArgs = []):
	pass

func stop():
	if(!character):
		queue_free()
		return
	
	character.removeEffect(id)

func getAccuracyMod():
	return 0.0

func getDodgeMod():
	return 0.0
	
func getRecievedDamageMod(_damageType):
	return 0.0

func getDamageMultiplierMod(_damageType):
	return 0.0

func saveData():
	return {}
	
func loadData(_data):
	pass

func getBuffs():
	return []

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff
