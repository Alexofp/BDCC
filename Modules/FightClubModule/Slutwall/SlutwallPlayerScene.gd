extends SceneBase

var queueSize = 3

func _init():
	sceneID = "SlutwallPlayerScene"

func _initScene(_args = []):
	if(_args.size() > 0 && _args[0]):
		setState("trapped")
		if(_args.size() > 1):
			queueSize = _args[1]

func _run():
	if(state == ""):
		saynn("You are standing near a wall. But this wall isn't your ordinary wall. This one has.. holes.. in it.. a whole row of them, some are big enough to fit a person and others you can probably only fit an arm or a leg through..")

		saynn("It's clearly a slutwall, a place where inmates punish other inmates.. Or reward them, depending on what you're into.")

		saynn("Do you wanna willingly get into the slutwall? Inmates -will- use you if you do so.")

		addButton("Use me!", "Sounds fun", "get_into_wall")
		addButton("Abort", "Nope. You're not into free use", "endthescene")
	if(state == "get_into_wall"):
		playAnimation(StageScene.Slutwall, "idle", {bodyState={naked=true, hard=true}})
		saynn("You are kinda curious.. And begin asking inmates about how this wall works. And the more you do so, the more they get annoyed with you until they finally just grab you and forcibly shove you into one of the holes!")

		saynn("Your wrists and ankles get chained to the wall and your crotch is now on full display. Someone quickly scribbles \"Annoying slut! Free Use!\" near you. A queue of "+str(queueSize)+" inmates already begins to line up behind you..")

		saynn("Oops..")

		addButton("Continue", "See what happens next", "trapped")
	if(state == "trapped"):
		playAnimation(StageScene.Slutwall, "idle", {bodyState={naked=true, hard=true}})
		saynn("You're still stuck in the slutwall. There "+str("is" if queueSize == 1 else "are")+" "+str(queueSize)+" inmates left in the queue.")

		addButton("Continue", "See what happens next..", "generate_next")
	if(state == "isFree"):
		playAnimation(StageScene.Solo, "stand")
		saynn("After everyone had their turn at using your body, someone finally frees you!")

		saynn("Wow, it's probably better to avoid looking people in the eyes after all this..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_into_wall"):
		queueSize = RNG.randi_range(3,6)

	if(_action == "generate_next"):
		processTime(RNG.randi_range(2, 10)*60)
		if(queueSize <= 0):
			setState("isFree")
			return
		queueSize -= 1
		
		GM.pc.lustStateFullyUndress()
		var npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
		runScene("GenericSexScene", [npcID, "pc", SexType.SlutwallSex], "generic_sex_scene")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "generic_sex_scene"):
		if(RNG.chance(20)):
			GM.pc.addCredits(1)
			addMessage("Someone decided to put 1 credit into the tip box after using you")

func saveData():
	var data = .saveData()

	data["queueSize"] = queueSize

	return data

func loadData(data):
	.loadData(data)

	queueSize = SAVE.loadVar(data, "queueSize", 3)

func getDevCommentary():
	return "This scene was put together very quickly just so the player would have access to the slutwall. Otherwise the only way to see this stuff is Avy's final arena fight quest.\n\nDunno really how to expand it. This is just another one of those punishment scenes. But I can't come up with anything interesting x3. How does one add a progression system to the slutwall x3. You earn more the more you do it? Kinda eh. Maybe there could be unique scenes randomly happening that start a quest or something, dunno."

func hasDevCommentary():
	return true
