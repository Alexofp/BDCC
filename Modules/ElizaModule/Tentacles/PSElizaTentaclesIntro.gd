extends SceneBase

var slaveryVariant = false
var isEgged = false

func _init():
	sceneID = "PSElizaTentaclesIntro"

func _run():
	if(state == ""):
		isEgged = GM.pc.isEggStuffed()
		saynn("You open your eyes.. and immediately feel that something is different. No, it's not the ceiling of your cell, that's for sure.")

		saynn("A scent.. you can smell an expensive perfume.")

		addButton("Look around", "See what's happening", "eliza_intro")
	if(state == "eliza_intro"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		saynn("You turn your head and blink.")

		saynn("The feline doctor is sitting on a chair, near your bed. Her legs are crossed, her emerald eyes are watching you. It's doctor Quinn..")

		saynn("[say=eliza]I was starting to think I'd have to poke you.[/say]")

		saynn("You sit up quickly.. and then get up in a hurry. Something tells you she didn't come here for a friendly chat.")

		saynn("Your quick reaction makes her smile.. She uncrosses her legs.. and crosses them the other way.")

		saynn("[say=eliza]If I needed you for something, you'd already be in the medical~.[/say]")

		saynn("That's probably fair. Still, she certainly has a reason behind why she is here.")

		saynn("[say=eliza]Did you enjoy your little adventure?[/say]")

		saynn("[say=pc]Adventure?[/say]")

		saynn("She nods and fixes her glasses before pulling up some files on her datapad.")

		saynn("[say=eliza]Yes, your last escape attempt. I thought that you were just pregnant when you.. arrived.. the other day. I saw the round belly and didn't even bother to check.[/say]")

		if (isEgged):
			saynn("Your hand instinctively lands on your belly.. a belly that is still very round.")

		elif (GM.pc.isVisiblyPregnant()):
			saynn("Your hand instinctively lands on your belly.. a belly that is still round.. but for a different reason.")

		else:
			saynn("Your hand instinctively lands on your belly.. a belly that is currently flat actually.")

		saynn("[say=eliza]I had nothing better to do today so I decided to check your x-ray. I was surprised. Pleasantly surprised~.[/say]")

		addButton("Continue", "See what happens next", "eliza_stands")
	if(state == "eliza_stands"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("The feline stands up, smooths her skirt.. and steps closer to you.")

		if (isEgged):
			saynn("[say=eliza]You're stuffed. Full of tentacle eggs. Aren't you, patient~?[/say]")

		else:
			saynn("[say=eliza]You're stuffed.. Well.. you WERE stuffed.. full of tentacle eggs. weren't you, patient~? I hope you kept some of them~.[/say]")

		saynn("It's hard to hide the blush.")

		saynn("[say=pc]Where are you heading with this?[/say]")

		saynn("She eyes your round belly and licks her lips.")

		saynn("[say=eliza]I.. I think I have a great use for them~.[/say]")

		saynn("[say=pc]Use?[/say]")

		saynn("She nods and traces her clawed digit over your chin, ending it with a boop on your nose.")

		saynn("[say=eliza]Yes. Bring me some. When you can. Don't make me wait though~.[/say]")

		saynn("[say=pc]Why would I do that? I can just eat them instead of all the slop that we, inmates, get here.[/say]")

		saynn("[say=eliza]Eventually you will run out of them.. But I.. I can.. Well.. You will just have to bring me those eggies to find out~. As many as you can. Trust me, you won't regret it.[/say]")

		saynn("She touches her own lips with two digits.. then brings them to yours. A little indirect kiss. Then she starts heading towards the exit, swaying her hips.")

		saynn("[say=eliza]Right now I'm running dangerously low on caffeine. I hope you know where to find me.[/say]")

		saynn("You nod.. and watch her disappear.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_intro"):
		processTime(5*60)

	if(_action == "eliza_stands"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["slaveryVariant"] = slaveryVariant
	data["isEgged"] = isEgged

	return data

func loadData(data):
	.loadData(data)

	slaveryVariant = SAVE.loadVar(data, "slaveryVariant", false)
	isEgged = SAVE.loadVar(data, "isEgged", false)
