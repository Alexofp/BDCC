extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "Ch6TaviAllowSleepInCellScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		if (!getFlag("TaviModule.Ch6TaviSleepInPCCellFirstTime")):
			setFlag("TaviModule.Ch6TaviSleepInPCCellFirstTime", true)
			saynn("You've been Tavi's owner for quite some days now and so she learned to trust you more. Maybe it's time to ask if she would like to sleep in your cell with you.")

			saynn("[say=pc]Hey. Do you like sleeping in your cell?[/say]")

			saynn("Tavi looks around her dimly-lit allocated space. A small room made out of 4 cold metal walls with red accents everywhere, reminding about who Tavi is.")

			saynn("[say=tavi]"+str(taviSpeak("It's.. fine. I'm used to sleeping in cells.", "I think hell would have been more comfy for me. But I'm not in a hurry.", "It's.. fine. I'm used to sleeping in cells."))+"[/say]")

			saynn("She looks at you again with a curious gaze.")

			saynn("[say=tavi]Makes me wonder why are you asking that?[/say]")

			saynn("[say=pc]How does sleeping in my cell sound to you?[/say]")

			saynn("Tavi tilts her head slightly. And then smiles softly.")

			saynn("[say=tavi]"+str(taviSpeak("There is not a lot of space on these beds. But I can just be your blanket~.", "You sure you can handle my heat~? I'm one hot kitty.", "There is not a lot of space on these beds. Good thing cats can fit anywhere."))+"[/say]")

			saynn("She walks up closer to you and boops your nose with hers. A very intimate gesture.")

			saynn("[say=tavi]"+str(taviSpeak("Sure. If you give me permission, I will sleep with you. Or more~.", "Sure. Just give me permission and I will be all yours~.", "Sure. We can sleep together. Just let me know if you actually want that."))+"[/say]")

		else:
			saynn("You tell Tavi that you wanna discuss the idea of her sleeping in your cell.")

			if (getFlag("TaviModule.Ch6TaviAllowedToSleepInPCCell")):
				saynn("Currently, Tavi [b]will[/b] sleep in your cell during nights if she can.")

				if (getFlag("TaviModule.Ch6TaviAllowedToLewdPCDuringSleep")):
					saynn("Also, Tavi [b]will[/b] occasionally satisfy her heat using your body.")

				else:
					saynn("Tavi [b]will not[/b] try to satisfy her heat using your body.")

			else:
				saynn("Currently, Tavi [b]will not[/b] sleep in your cell during nights or satisfy her heat using your body.")

		addButton("Allow sleep", "Let Tavi sleep in your cell during nights", "toggle_sleep")
		addButton("Allow lewd", "Let Tavi occasionally satisfy her heat during the sleep with you", "toggle_lewd")
		addButton("Leave", "You discussed this enough", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "toggle_sleep"):
		setFlag("TaviModule.Ch6TaviAllowedToSleepInPCCell", !getFlag("TaviModule.Ch6TaviAllowedToSleepInPCCell"))
		if(!getFlag("TaviModule.Ch6TaviAllowedToSleepInPCCell")):
			setFlag("TaviModule.Ch6TaviAllowedToLewdPCDuringSleep", false)
		return

	if(_action == "toggle_lewd"):
		setFlag("TaviModule.Ch6TaviAllowedToLewdPCDuringSleep", !getFlag("TaviModule.Ch6TaviAllowedToLewdPCDuringSleep"))
		if(getFlag("TaviModule.Ch6TaviAllowedToLewdPCDuringSleep")):
			setFlag("TaviModule.Ch6TaviAllowedToSleepInPCCell", true)
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
