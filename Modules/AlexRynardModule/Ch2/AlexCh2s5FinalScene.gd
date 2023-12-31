extends SceneBase

var tellChoice = ""

func _init():
	sceneID = "AlexCh2s5FinalScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You lean in closer to Eliza.")

		saynn("[say=pc]I have the parts.[/say]")

		saynn("Her ears perk instantly.")

		saynn("[say=eliza]You do? Then we shouldn't wait any longer..[/say]")

		saynn("Eliza taps a few times on her datapad. Then she gets up and opens one of the staff-only doors for you.")

		saynn("[say=eliza]Let's go, I told the nurses to start preparing Alex for the operation.[/say]")

		saynn("For some reason, your legs shiver slightly..")

		addButton("Follow", "See what happens next", "alex_in_room")
	if(state == "alex_in_room"):
		aimCameraAndSetLocName("med_researchlab")
		saynn("Eliza brings you to the operating theater, a big room that is divided into two with a wide window. The main room has an advanced medical table in the middle of it.. one that is designed to aid with surgery. But there are also other pieces of equipment here.")

		saynn("Nurses are hard at work, cleaning every surface and every tool.")

		saynn("Eliza points at the sink.")

		saynn("[say=eliza]Wash your hands.[/say]")

		saynn("[say=pc]I don't really plan to..[/say]")

		saynn("[say=eliza]And the parts that you brought.[/say]")

		saynn("Yeah, fair enough. You take your time, thoroughly washing your hands, face and all the various mechanical parts.")

		saynn("[say=pc]Here.[/say]")

		saynn("[say=eliza]Thank you. You might have to help, you have the most experience fixing tech here. The plan is.. the surgeon will carefully disconnect the prosthetic and give it to you to fix. After you're done.. he will put it back in.[/say]")

		saynn("Wow.. That sounds scary. Eliza hands you her datapad.")

		saynn("[say=eliza]Here is the documentation for Alex's model. Just follow the datasheet.[/say]")

		saynn("It doesn't seem that complicated. Just a bunch of motors that are connected to the main board. And yet, there are probably many ways to fuck it up..")

		saynn("[say=pc]I will.. try.[/say]")

		saynn("A few seconds later, the doors open and two nurses bring a medical stretcher with Alex on it. The foxy seems to be sedated already, his eyes closed..")

		saynn("The surgeon enters the room soon after.. His surgical mask and head cap hides most of his face.. but you're pretty sure you have never seen him before.")

		saynn("[say=eliza]Good luck.[/say]")

		saynn("Eliza exits the operating theater and steps into the observation room that's behind the big window.")

		saynn("[sayMale]Alright, people, let's do it.[/sayMale]")

		saynn("Here goes nothing..")

		addButton("Watch", "See what happens with Alex", "alex_gets_healed")
	if(state == "alex_gets_healed"):
		playAnimation(StageScene.Solo, "stand")
		saynn("The nurses help to put Alex onto the table belly-down, giving the surgeon full access to his back and the broken prosthetic spine that he has. They then make all the last required preparations.. Alex gets connected to the machine that starts monitoring his vitals.. beep.. beep..")

		saynn("You carefully lay down the parts that you have found on a little metal table that already had a bunch of repair tools on it.. Doubts begin to creep into your mind.. Did you get enough?.. Will these even work? You can only wait to find out.")

		saynn("The surgeon starts by observing Alex's back before drawing a few lines on it with a marker.")

		saynn("[sayMale]Scalpel.[/sayMale]")

		saynn("There it goes.. He starts cutting away some of the flesh around the prosthetic, trying to get to the actual bones underneath. His cuts cause bleeding that the nurses quickly remove with artery forceps.")

		saynn("After looking inside, the surgeon switches his attention to you.")

		saynn("[sayMale]The bones have mended with the prosthetic in a few places.[/sayMale]")

		saynn("Oh no. That doesn't sound good.")

		saynn("[say=pc]Does that mean you can't take it out?[/say]")

		saynn("[sayMale]I can.. but I suggest you to look away if your stomach is weak.[/sayMale]")

		saynn("He looks at one of the nurses.")

		saynn("[sayMale]Bonesaw.[/sayMale]")

		saynn("Oh fuck. Yeah, better not to focus on what's happening. The surgeon begins cutting through literal bone, trying to remove any physical connection with the prosthetic. Even the noises are.. sickening. You try your best to just focus on the beeps.. beep.. beep..")

		saynn("Time passes.. The surgeon keeps asking for different tools while the nurses are keeping everything clean.")

		saynn("[sayMale]There. Hand this to the inmate.[/sayMale]")

		saynn("And so.. this is it.. Alex's prosthetic spine.. in your hands. There is no blood or bone on it, everything is clean.")

		addButton("Fix it", "Try to fix his back", "try_fix_back")
	if(state == "try_fix_back"):
		saynn("Your arms shake.. You're not sure if you can do it.")

		saynn("[sayMale]Alex only has a few hours, c'mon.[/sayMale]")

		saynn("Right.. Alex..")

		saynn("You start by disassembling the spine to its very core, the electric board that every wire is connected to. Most of the wiring is busted anyway, best to replace it fully..")

		saynn("Some of the motors are broken too.. so you use the ones from the parts that you brought instead. Luckily a lot of the tech seems to share some of the common components.")

		saynn("You follow the datasheet to the teeth, making sure each wire is connected to the right pin on the board and the motor. You don't even realize it.. but you are 100% focussed on the task.")

		saynn("A few of the metal parts got bent heavily.. so you unbend them to the best of your ability while replacing the most damaged pieces with new ones that you have nearby.")

		saynn("You find a power source and temporarily power the main board.. Motors kick into action instantly, straightening the prosthetic into the correct-looking smooth line while producing a familiar sounding whirr. Good.. But it's not the time to celebrate, not even close.")

		saynn("The main organic links seem to be.. oxidized.. from being exposed to the air for too long. You grab a piece of sandpaper and begin to carefully sand them off.. making them shiny. These are the parts that are connected to the spinal cord itself so it's extremely important to check them. You remove all the other rust that you see while you're at it.")

		saynn("After about an hour that felt like a few seconds, the job was done.. Is this it?.. Did you fix it? You can only guess..")

		saynn("You quickly wash off any dust and dry the prosthetic.. before handing it back to the surgeon. They sure trust you a lot.. while you're not even sure if you trust yourself by this point.")

		addButton("Continue", "See what happens next", "return_the_prosthetic")
	if(state == "return_the_prosthetic"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("The surgeon carefully takes the prosthetic spine from your hands.")

		saynn("[sayMale]Okay, you can leave the room now.[/sayMale]")

		saynn("You exit the operating theater and join Eliza in the observation room. Her eyes seem to be watery.")

		saynn("[say=eliza]You did good.. very..[/say]")

		saynn("[say=pc]Thanks..[/say]")

		saynn("The surgeon behind the window proceeds to carefully attach the prosthetic back to Alex's spine.. The view is.. gross.. but you don't even care by this point.")

		saynn("[say=pc]I might have made it worse.[/say]")

		saynn("[say=eliza]That's impossible by this point. It's only up from here.[/say]")

		saynn("Only now you realize how exhausted you are. Your eyes begin to want to close on their own..")

		saynn("[say=eliza]Feel free to go take a nap, I think we got it from here.[/say]")

		saynn("[say=pc]I will watch.[/say]")

		saynn("She shrugs.")

		saynn("[say=eliza]What made you want to help him anyway? I mean like.. before all of this.[/say]")

		addButton("Good guy", "Alex seemed like a good guy", "tell_eliza")
		addButton("Credits", "You were looking for work", "tell_eliza")
		addButton("Sex", "You just wanted to fuck", "tell_eliza")
		addButton("BDSM", "Alex seemed quite kinky", "tell_eliza")
		addButton("No reason", "You had time to spare", "tell_eliza")
	if(state == "tell_eliza"):
		if (tellChoice == "gg"):
			saynn("[say=pc]I don't know. Alex seemed like a good guy that had some very rough things happen to him.[/say]")

			saynn("Eliza raises a brow.")

			saynn("[say=eliza]Huh. You have a good eye, I will give you that. I thought he was meanie at first..[/say]")

		elif (tellChoice == "creds"):
			saynn("[say=pc]I kinda just wanted to get some extra credits.[/say]")

			saynn("Eliza raises a brow.")

			saynn("[say=eliza]Huh. And yet, you're here.[/say]")

		elif (tellChoice == "sex"):
			saynn("[say=pc]I just wanted to.. fuck.[/say]")

			saynn("Eliza raises a brow.")

			saynn("[say=eliza]There is a lot of that around here. Makes me wonder why you focussed on him.[/say]")

		elif (tellChoice == "bdsm"):
			saynn("[say=pc]Alex knows how to do bdsm properly.[/say]")

			saynn("Eliza raises a brow.")

			saynn("[say=eliza]Oh, really? Interesting.. I usually just do it by heart..[/say]")

		else:
			saynn("[say=pc]No reason. I had some spare time and just decided to help him.[/say]")

			saynn("Eliza raises a brow.")

			saynn("[say=eliza]Well, it looks like you have a very kind heart since you're still here.[/say]")

		saynn("[say=pc]And what made you help him?[/say]")

		saynn("Eliza looks away and rubs her nose.")

		saynn("[say=eliza]Oh well.. I think we share some things in common.[/say]")

		saynn("[say=pc]Like what?[/say]")

		saynn("[say=eliza]We both like science.. different fields of it. I'm more of a biology expert while he seems pretty good at engineering and stuff..[/say]")

		saynn("[say=pc]Maybe you should combine your efforts and see what happens?[/say]")

		saynn("Eliza tilts her head slightly.")

		saynn("[say=eliza]Huh. Bioengineering is a very promising field, that is true.. I just don't know if I have the time. I'm already busy with so much research..[/say]")

		saynn("Eliza looks at Alex through the window.")

		saynn("[say=eliza]I might have an idea for a good project though..[/say]")

		saynn("You catch yourself yawning more and more. Wow, this little operation has completely drained you. And yet, you stay and make sure everything goes smoothly.")

		saynn("After quite some time, you notice the surgeon finally proceeding to cauterize everything.")

		saynn("[say=eliza]This should be it.. Alex needs lots of rest now.[/say]")

		saynn("That makes sense..")

		saynn("[say=pc]I guess I will check on him tomorrow then..[/say]")

		saynn("[say=eliza]Good idea.[/say]")

		addButton("Leave", "Time to go", "start_leave")
	if(state == "start_leave"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("med_lobbynw")
		saynn("You return to the medical lobby. Your tiredness is threatening to make you kiss the floor.. better go take a nap now.")

		addButton("Cell", "Return to your cell", "go_sleep")
	if(state == "go_sleep"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		playAnimation(StageScene.Sleeping, "sleep")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "alex_in_room"):
		processTime(30*60)
		GM.pc.removeAllRestraints()

	if(_action == "alex_gets_healed"):
		processTime(60*60)

	if(_action == "try_fix_back"):
		processTime(60*60)

	if(_action == "return_the_prosthetic"):
		processTime(30*60)

	if(_action == "tell_eliza"):
		tellChoice = ""

	if(_action == "go_sleep"):
		GM.main.processTimeUntil(23*60*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["tellChoice"] = tellChoice

	return data

func loadData(data):
	.loadData(data)

	tellChoice = SAVE.loadVar(data, "tellChoice", "")
