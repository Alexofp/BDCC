extends SceneBase

var hasNeuro = false
var slaveID = ""

func _init():
	sceneID = "PSPCTentaclesPunish"

func _initScene(_args = []):
	slaveID = _args[0]
	addCharacter(slaveID)

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return slaveID

func _run():
	if(state == ""):
		aimCameraAndSetLocName(GM.pc.getLocation())
		addCharacter("PCTentacles")
		hasNeuro = getFlag("ElizaModule.tent_neurolink", false)
		playAnimation(StageScene.TentaclesGrope, "tease", {pc=slaveID, plant=true})
		saynn("You bring {slave.name} into your cell.. and then suddenly shove {slave.him} towards {pcTentacles}, your personal horny cell plant.")

		saynn("The tendrils are quick to wrap around {slave.his} waist and ankles, preventing {slave.him} from escaping..")

		saynn("The fun is about to begin.")

		addButton("Continue", "Let the tentacles have fun with that person on their own", "start_slave_sex")
		if (hasNeuro):
			addButton("Neuro-Link", "Use the Neuro-Link device to control the tentacles while they're having fun with that person", "start_slave_sex_neuro")
		else:
			addDisabledButton("Neuro-Link", "You need to unlock and create a Neuro-Link device in the bio-lab first..")
	if(state == "after_sex_slave"):
		saynn("After that sex, you grab {slave.name} and invite {slave.him} out of your cell..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_slave_sex"):
		getCharacter("PCTentacles").prepareForSex()
		runScene("GenericSexScene", ["PCTentacles", slaveID, SexType.TentaclesSex, {}], "tentaclesSexSlave")
		setState("after_sex_slave")
		return

	if(_action == "start_slave_sex_neuro"):
		getCharacter("PCTentacles").prepareForSex()
		runScene("GenericSexScene", ["PCTentacles", slaveID, SexType.TentaclesSex, {SexMod.PCControlsDoms:true}], "tentaclesSexSlaveNeuro")
		setState("after_sex_slave")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["hasNeuro"] = hasNeuro
	data["slaveID"] = slaveID

	return data

func loadData(data):
	.loadData(data)

	hasNeuro = SAVE.loadVar(data, "hasNeuro", false)
	slaveID = SAVE.loadVar(data, "slaveID", "")
