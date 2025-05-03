extends SceneBase

var isFirst = true
var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingSeedHandScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		if (isFirst):
			saynn("The feline seems to be filling out some reports, barely paying any attention now.")

			saynn("[say=pc]Hey. I want to donate my seed, how do I do that?[/say]")

			saynn("Without even pulling her gaze away from the paper, she pulls out a little plastic container and places it on the counter.")

			saynn("[say=eliza]Do your thing into this and bring it back. Don't do it in front of me though, they won't accept sticky reports again.[/say]")

			saynn("Huh. You grab the container and inspect it.")

			saynn("[say=pc]What if it's not enough?[/say]")

			saynn("Eliza raises a brow and takes a good look at you, her bored expression quickly changing. She leans in and swipes the container back.")

			saynn("[say=eliza]Actually, you know.. I think I have some time to do it properly.[/say]")

			saynn("She puts the reports away and gets up.")

			saynn("[say=eliza]Follow me, inmate.[/say]")

		else:
			saynn("You tell Eliza that you need to be seed-milked.")

			saynn("She nods and invites you to follow her.")

		addButton("Follow", "See where she will bring you", "in_heaven")
	if(state == "in_heaven"):
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		saynn("Doctor brings you into a special room. It seems to have pipes going across its ceiling that connect massive fluid tanks to the stalls.")

		saynn("Eliza picks the stall that doesn't have any equipment in it..")

		saynn("[say=eliza]I will need access to your.. you know.[/say]")

		saynn("You expose your {pc.penis}, as ordered by the feline.")

		saynn("Eliza quickly brings a chair, her gaze lingers on your member a bit too long..")

		saynn("[say=eliza]Mmhm.. Let's begin. Just stand still for me, okay?[/say]")

		saynn("You nod. Standing still doesn't sound so hard.")

		addButton("Stand", "Let her do all the work", "do_stand")
	if(state == "do_stand"):
		playAnimation(StageScene.Grope, "stroke", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true}})
		saynn("Eliza places a packaged condom on the chair for now and approaches you, her eyes focus on your member. One of her paws carefully reaches out and takes a hold of it. With slow, delicate touches, her clawed digits begin to trace along your length. Her soft touches are quite.. arousing.")

		saynn("Her gaze returns to watching you as she begins a gentle, teasing stroke, her paw sliding along your shaft, getting it all nice and ready. You feel blood flowing down to it, a little drop of pre already shining at the tip.")

		saynn("The feline tilts her head slightly and offers you a small smile.. while her fingertips glide and caress each ridge, feeling each vein.. it makes your member twitch softly in response. She really got an expert touch for sure.. Your lips part ever so slightly as your breathing gets a bit deeper.")

		saynn("After getting you ready, her digits quickly swipe off any precum beads that were hanging from the sensitive tip of your cock.. it made you squirm a bit.")

		saynn("[say=eliza]Sorry~. Pre-ejaculate holds little value, might as well get rid of it.[/say]")

		saynn("She reaches for the condom wrapper and swiftly opens it with her fangs. She then stretches it slightly with her digits and starts putting it on you. The rubber ring is neatly hugging your girth as she carefully slides it along the length.. her touch making your cock twitch subtly.")

		saynn("Once your member has been wrapped up, she guides you to sit on the chair.")

		addButton("Take a seat", "Let her do all the work", "taking_a_seat")
	if(state == "taking_a_seat"):
		playAnimation(StageScene.ChairOral, "stroke", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, condom=true}})
		saynn("After you sit down on the chair, Eliza lowers herself to her knees in front of you, her gaze is fixed on you.. her expression is a mixture of professional intent.. with some playful desire thrown in.")

		saynn("[say=eliza]Let's see.[/say]")

		saynn("Her paw returns to your member, digits wrapping around it as she resumes the stroking with renewed focus. And this time, her strokes are much quicker.. firm, confident, and insistent. Her paw establishes a perfect rhythm, stroking your cock with a speed that makes your toes curl already..")

		saynn("[say=pc]Mmh..[/say]")

		saynn("Little grunts escape you, your hard shaft responding to her every touch, pulsating and twitching in her grasp.. the head leaking more pre into the bell-shaped tip of the latex condom.")

		saynn("Eliza focuses her gaze on your member as she intensifies the stroking even further.. making you really grip that chair. You're breathing deeply as you feel a powerful surge building.. a pressure deep within that cannot be held back.. not anymore..")

		saynn("[say=pc]Ghm.. gh-..[/say]")

		saynn("You grunt as your {pc.penis} starts throbbing under her touch.. Thick, hot spunk shoots from its tip, stuffing the condom to its brim. Eliza's rhythmic, unrelenting stroking continues even then.. milking your twitching balls to their very last drop.. until you feel completely spent.")

		saynn("[say=eliza]Good.[/say]")

		saynn("Nothing leaks out.. every bit of your seed is collected with clinical precision.")

		addButton("Continue", "See what happens next", "process_milk")
	if(state == "process_milk"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		GM.pc.setLocation("med_nearmilking")
		saynn("Finally, with a satisfied smile, Eliza gently ties off the end of the condom and carefully pulls it off.. while your member starts to get soft.")

		saynn("[say=eliza]Thank you for your humble donation~. Please come again.[/say]")

		saynn("Her voice has a hint of playfulness.")

		saynn("[say=eliza]You've been very good.[/say]")

		saynn("Seeing her on her knees in front of you like that.. holding a full condom.. kinda cute.")

		saynn("She gets up and shows you the way out.")

		saynn("[say=eliza]If you excuse me, I gotta get your donation processed and all the required paperwork filled in. I trust that you will find a way back to the lobby.[/say]")

		saynn("You nod and step out of the room..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_heaven"):
		processTime(3*60)

	if(_action == "do_stand"):
		processTime(3*60)

	if(_action == "taking_a_seat"):
		processTime(3*60)

	if(_action == "process_milk"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("eliza")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirst"] = isFirst
	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	isFirst = SAVE.loadVar(data, "isFirst", true)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
