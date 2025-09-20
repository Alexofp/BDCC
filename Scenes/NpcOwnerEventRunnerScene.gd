extends SceneBase

var runner:NpcOwnerEventRunner = NpcOwnerEventRunner.new()

func _initScene(_args = []):
	runner.runEvent("TestEvent")
	runner.run()
	
func _init():
	sceneID = "NpcOwnerEventRunnerScene"

func _run():
	if(state == ""):
		saynn(runner.getFinalText())

		#addButton("Leave", "Job well done", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	#data["runner"] = runner.saveData()
	
	return data
	
func loadData(data):
	.loadData(data)
	
	#runner.loadData(SAVE.loadVar(data, "runner", {}))
