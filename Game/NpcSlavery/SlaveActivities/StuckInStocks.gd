extends SlaveActivityBase

func _init():
	id = "StuckInStocks"
	
func getVisibleName():
	return "Stuck in stocks"

func onStart(_args = []):
	pass

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "{npc.name} is currently stuck in stocks so {npc.he} {npc.isAre} not here."

func getInteractActions():
	return [
		{
			name = "Stocks",
			desc = "Pay them a visit",
			sceneID = "MeScene",
			args = [],
			buttonChecks = [],
		}
	]
