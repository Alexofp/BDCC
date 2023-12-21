extends SceneBase

var howManyTimes = 0

func _init():
	sceneID = "AlexCh2s3Scene"

func _initScene(_args = []):
	addCharacter("alexrynard")
	howManyTimes = getFlag("AlexRynardModule.ch2s3SceneNum", 0)
	
	if(howManyTimes == 0):
		setState("time1")
		increaseFlag("AlexRynardModule.ch2s3SceneNum")
		return

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "time1"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Helping him is the least you can do after everything. You sit nearby and proceed to work, fixing broken datapads and shock remotes.")

		saynn("Alex sits quietly for some time. But then he leans close to you and puts his hand on your shoulder.")

		saynn("[say=alexrynard]Thank you.[/say]")

		saynn("[say=pc]Don't mention it.[/say]")

		saynn("[say=alexrynard]Try and stop me.[/say]")

		saynn("He chuckles and returns to work.")

		saynn("Time flies. For some reason both of you seem to be working faster than before. What used to take you hours now just takes about thirty minutes to do. Could be that you just got more skilled at this.")

		addButton("Continue", "See what happens next", "after_work_check")
	if(state == "toolate"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("Eventually the station's lights begin to dim down, signaling the end of the work day.")

		saynn("Alex hands you the credits for the work.")

		saynn("[say=alexrynard]Good job. We could do something together if you want. Or we can just go our merry ways, that's fine too.[/say]")

		addButton("Just go", "Just go", "endthescene")
		addButton("Trust exercises", "Might as well get a little bit kinky", "start_trust")
	if(state == "aftersomefixing"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("After a few hours of work, it's time to take a break.")

		saynn("Alex hands you the credits for what you have already done.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You return to the usual grind. Alex does the same. It's so much easier to work together, having someone nearby helps you to focus. It helps him too it seems.")

		saynn("[say=pc]How.. is your back doing?[/say]")

		saynn("[say=alexrynard]Same as before.[/say]")

		saynn("[say=pc]Does it break often?[/say]")

		saynn("[say=alexrynard]It's.. fine. Does what its supposed to do. I don't want to be mean to the creators. It allows me to walk after all.[/say]")

		saynn("You nod. The room stays quiet for some time.")

		saynn("[say=alexrynard]But it's pretty shit. And it was shit even back then.[/say]")

		saynn("[say=pc]Think you would have been able to do a better job?[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Back then.. I'd say yes, I would have created something a hundred times better. But not now. I'm not putting my inventions anywhere near my body anymore. Got enough scars.[/say]")

		saynn("[say=pc]Looks like you don't trust yourself.[/say]")

		saynn("He smiles.")

		saynn("[say=alexrynard]You're right, I trust you more.[/say]")

		saynn("You don't even realize.. but you worked through most of what's left of the piles of broken devices without even realizing it.")

		saynn("[say=pc]We're almost done![/say]")

		saynn("[say=alexrynard]Huh. Let's not rush ourselves. Or bad things will happen.[/say]")

		saynn("That's fair.")

		addButton("Continue", "See what happens next", "after_work_check")
	if(state == "time3"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Inspired, you continue fixing the rest of the datapads and broken remotes. You feel like you know each component by heart by now.")

		saynn("You count how many devices are left.. about 9? Wow. Each one takes about an hour to fix.. so it looks like you will just need one more session after this!")

		saynn("[say=alexrynard]They will bring more.. for sure.[/say]")

		saynn("[say=pc]What if you're wrong?[/say]")

		saynn("[say=alexrynard]You can't imagine how much I want to be wrong.[/say]")

		saynn("You decide to shut up and work-work-work!")

		addButton("Continue", "See what happens next", "after_work_check")
	if(state == "time4"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("No extra devices were brought.. so you only have two more to fix each!")

		saynn("[say=alexrynard]No rush, please.[/say]")

		saynn("[say=pc]What, you don't even know what you're gonna do with all the free time?[/say]")

		saynn("[say=alexrynard]Pff. Of course I know.[/say]")

		saynn("You try to pace yourself.. but it's hard to hide the excitement.. even if you do realize that this might not be the end.")

		addButton("Continue", "See what happens next", "time4_done")
	if(state == "time4_done"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("And so.. you tighten up the last screw.. and pop the rear panel back on.. Done. Truly done. No one has brought any new stuff. And all of the backlog is done. Empty. Completed.")

		saynn("Alex seems to be done too.. your stares meet.")

		saynn("[say=pc]So.. What now?[/say]")

		saynn("The workbench is unnaturally empty. So weird.")

		saynn("[say=alexrynard]Um..[/say]")

		saynn("[say=pc]Didn't you want to go talk with the captain?[/say]")

		saynn("[say=alexrynard]Yeah. But I'm tired. I will do it tomorrow. For now.. how about some rest?[/say]")

		saynn("Sounds good.")

		saynn("[say=alexrynard]Nothing kinky, I promise. Just rest.[/say]")

		addButton("Follow", "See what happens next", "time3_gofollow")
	if(state == "time3_gofollow"):
		aimCameraAndSetLocName("eng_workshop")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("Alex brings you to the staff break room. A very familiar room by now.")

		saynn("Both of you pop open a soda can each. Refreshing.. especially when it's free.")

		saynn("[say=alexrynard]I will search for something to watch. Just drop yourself onto the sofa.[/say]")

		addButton("Sure", "Just do it", "time3_rest_sure")
		addButton("Yes Sir", "Say this", "time3_rest_yessir")
	if(state == "time3_rest_sure"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("You take a seat on a sofa that has no right to be this soft. Maybe you're just too used to the inmate furniture being extremely stiff by now..")

		saynn("The TV shows digital static while Alex is going through random cardboard boxes, searching.")

		saynn("[say=alexrynard]There is gotta be something..[/say]")

		saynn("[say=pc]What are you looking for?[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_work_check"):
		processTime(RNG.randi_range(3,5) * 60 * 60)
		GM.pc.addCredits(2)
		addMessage("You received 2 credits")
		
		if(GM.main.isVeryLate()):
			setState("toolate")
		else:
			setState("aftersomefixing")
		return

	if(_action == "start_trust"):
		endScene()
		runScene("AlexTrustExercisesMenuScene")
		return

	if(_action == "time4_done"):
		processTime(60*60*2)
		addExperienceToPlayer(100)
		GM.pc.addCredits(10)
		addMessage("You received 10 credits!")

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
