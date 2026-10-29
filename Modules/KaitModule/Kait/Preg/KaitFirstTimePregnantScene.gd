extends SceneBase

var fromPC = false

func _init():
	sceneID = "KaitFirstTimePregnantScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		fromPC = getCharacter("kait").isPregnantFrom("pc")
		saynn("You get approached by Kait. She walks up slowly, tail low, one paw resting on her belly.")

		saynn("[say=kait]Hey..[/say]")

		saynn("[say=pc]What's up, Kait?[/say]")

		saynn("She shifts her weight from one rear paw to the other.")

		saynn("[say=kait]You know what's up.. Look at me.[/say]")

		saynn("[say=pc]Yeah? You got a rounder belly. Been eating well?[/say]")

		saynn("Her tail flicks, her eyes flash.")

		saynn("[say=kait]No, dummy! I'm pregnant.."+str(" from you.. pretty sure.." if fromPC else "")+"[/say]")

		if (!fromPC):
			saynn("[say=pc]Congrats. But it wasn't me."+str(" I don't even have a way to do that." if !GM.pc.hasReachablePenis() else "")+"[/say]")

			saynn("She crosses her arms and looks away.")

			saynn("[say=kait]I know it wasn't you! But you might be responsible for it! You used a cum-loaded strapon on me that one time..[/say]")

			saynn("[say=pc]Does that make me a father suddenly?[/say]")

			saynn("Her tail curls around her leg, her ears go flat with her head.")

			saynn("[say=kait]Yes. Well.. No.. I don't know, okay?! You're still responsible.. in a way.[/say]")

		else:
			saynn("[say=pc]Congrats. I bred you. Now you are gonna be a mother.[/say]")

			saynn("She blinks. Her ears perk up.. and then droop.. her tail curls around her leg.")

			saynn("[say=kait]Thanks.. I expected a bit more maybe..[/say]")

		saynn("[say=pc]What do you want me to do?[/say]")

		saynn("She hugs her belly and looks down at the floor.")

		saynn("[say=kait]Anything you want.. look after me more.. I don't know.. I'm nervous a bit.[/say]")

		saynn("[say=pc]Is this your first time?[/say]")

		saynn("She scratches her cheek and tugs on her collar.")

		saynn("[say=kait]I don't.. remember.[/say]")

		saynn("[say=pc]What do you mean you don't remember?[/say]")

		saynn("She throws her paws up.")

		saynn("[say=kait]I wasn't keeping track before, alright?! But now I will..[/say]")

		saynn("She hugs herself again and waits.")

		addButton("Embrace", "Give Kait a warm embrace and tell her that everything is gonna be alright", "embrace_kait")
		addButton("No time", "Give Kait a cold response", "cold_response")
	if(state == "cold_response"):
		playAnimation(StageScene.Grope, "tease", {pc="kait", npc="pc"})
		saynn("[say=pc]It's great news, Kait. But we gotta focus on our main goal, escaping this place.[/say]")

		saynn("Her tail puffs up.")

		saynn("[say=kait]You got me pregnant.. potentially.. and this is all you have to say?![/say]")

		saynn("[say=pc]You are gonna be a great mother, Kait. I might breed you again in the future. And then more. Get used to it.[/say]")

		saynn("She pouts, tail wagging annoyed, her paws are under her belly, supporting.")

		saynn("[say=kait]Huff..[/say]")

		saynn("[say=pc]Kait. You are a lilac. You are a sex toy. A slut.[/say]")

		saynn("She turns her head away.")

		saynn("[say=kait]I'm not a slut..[/say]")

		saynn("[say=pc]Uh huh. Focus, Kait.[/say]")

		saynn("[say=kait]Fine..[/say]")

		saynn("And so she leaves you be.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "embrace_kait"):
		playAnimation(StageScene.GropeBehind, "idle", {pc="kait", npc="pc"})
		saynn("[say=pc]Come here, kitty cat.[/say]")

		saynn("She steps closer. You put your arms around her and gently embrace her from behind. Your hands land on her belly and caress it, through the cloth. She leans back into you a little.")

		saynn("You whisper into her ear.")

		saynn("[say=pc]Things are gonna be alright. I'm near. So don't be nervous, okay?[/say]")

		saynn("She nods slowly, her tail wraps around your leg now.")

		saynn("[say=kait]Okay.[/say]")

		saynn("[say=pc]Inmates aren't allowed to have children for obvious reasons. So they will be taken away. The prison will worry about them.[/say]")

		saynn("She puts her paws over yours on her belly.")

		saynn("[say=kait]Makes sense..[/say]")

		saynn("[say=pc]We just have to be careful for now. Maybe don't go out on any missions for now.[/say]")

		saynn("Her ears perk.")

		saynn("[say=kait]Escaping is way more important.[/say]")

		saynn("[say=pc]It can wait.[/say]")

		saynn("You nuzzle her cheek.. and hear a quiet purr coming back. She relaxes against you.")

		saynn("You spend some time like this. Her breathing slows, gets calmer.")

		saynn("[say=kait]Thank you. I feel better.[/say]")

		saynn("[say=pc]Good. Now let's focus.[/say]")

		saynn("She steps away and nods.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "embrace_kait"):
		setFlag("KaitModule.ftpembrace", true)
		addMessage("You can do special pregnancy-related interactions with Kait if you approach her.")

	if(_action == "cold_response"):
		setFlag("KaitModule.ftpembrace", false)

	setState(_action)

func saveData():
	var data = .saveData()

	data["fromPC"] = fromPC

	return data

func loadData(data):
	.loadData(data)

	fromPC = SAVE.loadVar(data, "fromPC", false)
