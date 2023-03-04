extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiRewardPetScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(2*60)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("[say=pc]Stand still.[/say]")

		saynn("[say=rahi]Yes, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		saynn("Rahi tilts her head down while you reach your hand out towards her head. The feline is clearly being cautious.")

		saynn("But she shouldn't have worried, you plop your hand between her ears, giving the feline a good headpat. Kitty offers you a soft smile.")

		if (deserved):
			saynn("[say=rahi]Thank you.. She wants to be the best kitty for you, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		else:
			saynn("[say=rahi]Why are you.. Thank you.. She doesn't deserve it..[/say]")

		saynn("Kitty seemed to like that.")

		addButton("End", "Enough patting for now", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
