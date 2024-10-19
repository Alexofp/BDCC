extends SceneBase

var canEscape = true

func _init():
	sceneID = "TryStocksScene"

func _reactInit():
	if(RNG.chance(50)):
		canEscape = false

func _run():
	if(state == ""):
		saynn("You take a look at the stocks in the middle of the platform. They don’t seem to be locked, you can freely lift the top part. Your curious mind wonders how you would look in them. You place your head in the middle slot and stick your hands into two other holes. You have to stay bent forward.")

		saynn("It feels kinda nice actually but you think that staying like this for long would be quite uncomfortable.")

		# (if okay)
		if(canEscape):
			saynn("You free yourself and stand up.")
			
			addButton("Leave", "Nice", "endthescene")

		# (if not okay)
		else:
			saynn("You try to free yourself but one accidental motion makes the top part close and lock itself on you. You seem to be stuck. Oh no. You try to struggle but it doesn’t give.")
			
			addButton("Oops", "Oh no", "getCaptured")
		


func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "getCaptured"):
		#runScene("StocksPunishmentScene")
		endScene()
		GM.main.IS.startInteraction("InStocks", {inmate="pc"})
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["canEscape"] = canEscape
	
	return data
	
func loadData(data):
	.loadData(data)
	
	canEscape = SAVE.loadVar(data, "canEscape", false)

func supportsShowingPawns() -> bool:
	return true
