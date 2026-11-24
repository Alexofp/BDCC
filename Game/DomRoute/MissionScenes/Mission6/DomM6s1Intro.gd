extends SceneBase

func _init():
	sceneID = "DomM6s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		addCharacter("kait")
		addCharacter("avy")
		saynn("[say=kait]Alright. Is everyone ready? We're going to make a proper introduction to our future friendly engineer today.[/say]")

		saynn("[say=avy]Been born ready.[/say]")

		saynn("Kait looks at you. You respond with a nod.")

		saynn("[say=kait]Let's stick together. We're gonna grab Rahi and Ferri on the way there. The more of us are near him, the better.[/say]")

		saynn("[say=avy]The higher the risk we all get caught. What are you gonna do about other engineers near him?[/say]")

		saynn("[say=kait]I have a plan.[/say]")

		saynn("[say=avy]Ohhh. The bitch is so serious now. Major leagues.[/say]")

		saynn("[say=kait]Shush. Let's go.[/say]")

		addButton("Follow", "Go pay Alex Rynard a visit", "go_to_alex")
	if(state == "go_to_alex"):
		aimCameraAndSetLocName("eng_bay_corridor")
		addCharacter("rahi")
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="rahi"})
		saynn("You grab Ferri from your makeshift chemistry lab. It looks like she has made more progress on it. She grabs a bunch of strange vials with herself.")

		saynn("Then you get Rahi. She is not exactly a fighter but she could create a distraction if need to.")

		saynn("Together, you ride the elevator down to the mining floor. You enter the engineering bay.. and stop near the entrance to the workshop.")

		saynn("[say=kait]Alright. Rahi, see the orange foxy in the corner?[/say]")

		saynn("[say=rahi]Yes, meow..[/say]")

		saynn("[say=kait]He has a datapad. That needs to be changed.[/say]")

		saynn("[say=rahi]Got it..[/say]")

		saynn("You all stay.. while the brown feline steps inside the workshop.")

		addButton("Continue", "See what happens next", "rahi_approaches_foxy")
	if(state == "rahi_approaches_foxy"):
		setCharacters(["rahi", "alexrynard"])
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="alexrynard"})
		aimCameraAndSetLocName("eng_workshop")
		saynn("The workshop isn't fully empty.. but there are enough engineers here all the time.")

		saynn("Rahi starts to randomly wander the place, walking from one workbench to another. She is trying to be in Alex's view.. but the fox pays zero attention to her. He is too busy working on his toys.")

		saynn("Her eyes scan the guy and quickly find the most likely location for that datapad. His belt has a sizable rectangular leather pouch. It'd be perfect for it.")

		saynn("After a bit of deliberation.. Rahi decides to switch tactics.")

		addButton("Continue", "See what happens next", "rahi_flops")
	if(state == "rahi_flops"):
		playAnimation(StageScene.Duo, "defeat", {pc="rahi", npc="alexrynard"})
		saynn("Rahi walks past Alex's workbench.. and then trips on its corner!")

		saynn("She flails her arms.. and flops onto the floor with a soft thud. A painful noise leaves her maw.")

		saynn("[say=rahi]Ouch.. ow..[/say]")

		saynn("Alex finally pulls his gaze away from his work.")

		saynn("[say=alexrynard]Broke something?[/say]")

		saynn("[say=rahi]..probably.. not..[/say]")

		saynn("She then tries to get up.. and yelps, hitting the floor again, hissing in the process.")

		saynn("[say=rahi]Ow!.. Her hind paw..[/say]")

		saynn("Rahi's big sad eyes look up at the foxy.")

		saynn("Alex looks down at her, his face expression nothing but neutral.")

		saynn("[say=alexrynard]Only one paw? Good. Can still crawl to the medbay then.[/say]")

		saynn("Rahi hears that.. and huffs.")

		saynn("[say=rahi]A little help would be nice..[/say]")

		saynn("Alex returns gaze back to his bench, his hands picking up the tools while he speaks to her with a calm tone.")

		saynn("[say=alexrynard]You can do it, I believe in you.[/say]")

		saynn("Rahi is still on the floor.")

		saynn("She is clearly not getting any help from the dude anytime soon.")

		saynn("After some time, she does just get up on all fours.. threes.. and proceeds to crawl away.")

		addButton("Continue", "See what happens next", "rahi_gets_caught")
	if(state == "rahi_gets_caught"):
		playAnimation(StageScene.Duo, "defeat", {pc="rahi", npc="alexrynard", flipNPC=true})
		saynn("Or so it seemed at first. Rahi is quick to turn and crawl around the bench when Alex isn't looking her way anymore.")

		saynn("She approaches the foxy from behind. Out of sight from him and others.")

		saynn("Rahi crawls up to the foxy.. and reaches her paw towards his belt. She finds the pouch.. her digits carefully unlock the buckle.. and sneak inside.. then grab onto the corner of the datapad.")

		saynn("She starts pulling it out.")

		saynn("[say=alexrynard]Leave it where it is, inmate.[/say]")

		saynn("[say=kait]Shit.[/say]")

		saynn("[say=avy]Wait.[/say]")

		saynn("Rahi gasps, her ears perk high. Her reached out wrist got caught by Alex's fast hand.")

		saynn("[say=alexrynard]I know a thief when I see one. Let go while you can.[/say]")

		saynn("The feline's expression changes to a more upset one.")

		saynn("[say=rahi]What if she doesn't?[/say]")

		saynn("[say=alexrynard]I will fry your neck.[/say]")

		saynn("Rahi watches his other hand.. it's resting on the shock remote.")

		saynn("[say=kait]Rahi is fucked.[/say]")

		saynn("[say=avy]No, she isn't. Do you need the pad for something?[/say]")

		saynn("[say=kait]No. We just need Alex to not have it.[/say]")

		saynn("[say=avy]Alright, watch.[/say]")

		saynn("Avy gets Rahi's attention with a little wave. She then shows herself holding an invisible stick.. before snapping it in half.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_to_alex"):
		processTime(10*60)

	setState(_action)
