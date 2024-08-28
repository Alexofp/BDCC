extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "UnconToStocksScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})

		saynn("While you are.. sleeping soundly.. someone has approached you.. and began dragging you off somewhere..")
		
		addButton("Continue", "See what happens next..", "do_drag_pc_off")
	
	if(state == "do_drag_pc_off"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.Stocks, "idle", {pc="pc"})
		
		saynn("After a less-than-comfy sleeping experience, you finally open your eyes.. and realize that you are somewhere else..")

		saynn("In fact.. you know exactly where you are.. on a main punishment platform.. stuck inside stocks..")

		addButton("Oh no..", "Time to get out..", "start_stocks")


func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "start_stocks"):
		endScene()
		GM.main.IS.startInteraction("InStocks", {inmate="pc"})
		return
	
	if(_action == "do_drag_pc_off"):
		GM.pc.setLocation("main_punishment_spot")
		processTime(RNG.randi_range(120, 300)*60)

			
	
	setState(_action)

