extends Reference
class_name GameExtender

var id = "error"

func register(_GES:GameExtenderSystem):
	pass


func pcUpdateNonBattleEffects(_pc:Player):
	pass

func pcProcessBattleTurn(_pc:Player):
	pass

func pcBeforeFightStarted(_pc:Player):
	pass

func pcAfterFightEnded(_pc:Player):
	pass

func pcProcessTime(_pc:Player, _seconds):
	pass

func pcHoursPassed(_pc:Player, _hours):
	pass
	

func npcUpdateNonBattleEffects(_npc:Character):
	pass

func npcProcessBattleTurn(_npc:Character):
	pass

func npcBeforeFightStarted(_npc:Character):
	pass

func npcAfterFightEnded(_npc:Character):
	pass

func npcProcessTime(_npc:Character, _seconds):
	pass

func npcHoursPassed(_npc:Character, _hours):
	pass


func saveData():
	pass

func loadData(_data):
	pass
