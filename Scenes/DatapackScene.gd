extends "res://Scenes/SceneBase.gd"
class_name DatapackSceneBase

var datapackID = ""
var datapackSceneID = ""
var datapack:Datapack
var datapackScene:DatapackScene
var codeContex:DatapackSceneCodeContext

func _init():
	sceneID = "DatapackScene"

func setDatapackAndSceneIDs(newDatapackID, newSceneID):
	datapackID = newDatapackID
	datapackSceneID = newSceneID
	
	datapack = GlobalRegistry.getDatapack(datapackID)
	if(!datapack):
		return
	datapackScene = datapack.getScene(datapackSceneID)
	if(!datapackScene):
		return
	
	codeContex = DatapackSceneCodeContext.new()
	codeContex.setScene(self)
	codeContex.setDatapack(datapack)
	codeContex.setDatapackScene(datapackScene)

func _initScene(_args = []):
	pass

func _reactInit():
	if(datapackScene == null):
		return
	for charAlias in datapackScene.chars:
		var charEntry = datapackScene.chars[charAlias]
		
		if(charEntry["start"]):
			addCharacter(charEntry["realid"], charEntry["variant"].split("-", false))

func resolveCustomCharacterName(_charID):
	if(datapackScene != null && datapackScene.chars.has(_charID)):
		return datapackScene.chars[_charID]["realid"]
	return null

func _run():
	if(datapack == null || datapackScene == null):
		saynn("[color=red]Error[/color] Sorry, datapack or scene from this datapack no longer exists")
		addButton("Close", "Close this scene", "endthescene")
		return
	
	if(codeContex):
		codeContex.run()

func _react(_action: String, _args):
	if(codeContex && codeContex.react(_action, _args)):
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(codeContex):
		codeContex.reactSceneEnd(_tag, _result)

func getSceneCreator():
	if(datapack == null):
		return .getSceneCreator()
	return datapack.author

func getDevCommentary():
	if(datapackScene == null):
		return .getDevCommentary()
	return datapackScene.devcomment

func saveData():
	var data = .saveData()
	
	data["datapackID"] = datapackID
	data["datapackSceneID"] = datapackSceneID
	data["codeContex"] = codeContex.saveData() if codeContex else {}

	return data
	
func loadData(data):
	.loadData(data)
	
	datapackID = SAVE.loadVar(data, "datapackID", "")
	datapackSceneID = SAVE.loadVar(data, "datapackSceneID", "")

	datapack = GlobalRegistry.getDatapack(datapackID)
	datapackScene = null
	if(datapack):
		datapackScene = datapack.getScene(datapackSceneID)
	if(!datapackScene):
		return

	codeContex = DatapackSceneCodeContext.new()
	codeContex.setScene(self)
	codeContex.setDatapack(datapack)
	codeContex.setDatapackScene(datapackScene)
	codeContex.loadData(SAVE.loadVar(data, "codeContex", {}))

func supportsShowingPawns() -> bool:
	return true
