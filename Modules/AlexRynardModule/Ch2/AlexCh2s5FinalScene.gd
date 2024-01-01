extends SceneBase

var tellChoice = ""
var didAny = false
var didPunishAvy = false
var didPunchedCap = false
var didHugEliza = false

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
		saynn("Somehow, you manage to reach your inmate cell and drop your tired body onto the bed. The whole trip felt like a dream.")

		saynn("The lights go out.. You close your eyes.. Nothing matters..")

		addButton("Continue", "See what happens next", "next_day_alex")
	if(state == "next_day_alex"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Less than a second later, you open your eyes. Ow, the bright lights of the prison make you squint a lot. How long have you been sleeping..")

		saynn("You get up and quickly make your bed. Better go check if..")

		saynn("[say=alexrynard]Hey..[/say]")

		saynn("Huh? It's his voice.. Are you still dreaming?")

		addButton("Turn around", "See who it is", "alex_comes_in")
	if(state == "alex_comes_in"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You turn around and see Alex near the entrance of your cell.. standing like nothing happened. You rub your eyes.. he is still there.")

		saynn("[say=pc]Am I going insane..[/say]")

		saynn("Alex smiles seeing your confusion.")

		saynn("[say=alexrynard]Cryopod helped with the recovery. It's me..[/say]")

		saynn("Both of you are standing motionless.. It suddenly became so quiet that you can hear the motors in his spine working.")

		addButton("Continue", "See what happens next", "alex_hugs_pc")
	if(state == "alex_hugs_pc"):
		playAnimation(StageScene.Hugging, "hug", {npc="alexrynard"})
		saynn("Suddenly, Alex rushes up to you and wraps his hands around your body, hugging you as tightly as he can without breaking your ribs.")

		saynn("[say=alexrynard]Thank you.. I was close to giving up on everything.. In fact, I did give up.. I just wasn't strong enough to end it.[/say]")

		saynn("Tears start streaming down his cheeks, the foxy is nuzzling your face..")

		saynn("[say=alexrynard]You pulled me out of that hell. I'm sorry for what I said.[/say]")

		saynn("You never saw him so.. emotional. The guy usually keeps everything inside him.")

		addButton("Hug back", "Hug the foxy back", "alex_hug_back")
		addButton("Kiss", "Kiss the foxy", "alex_kiss_back")
		addButton("Kneel before", "Kneel before the foxy", "alex_kneel_before")
	if(state == "alex_kneel_before"):
		playAnimation(StageScene.Duo, "kneel", {npc="alexrynard"})
		saynn("You escape his embrace and kneel before the foxy instead. His tears.. only stream more.")

		saynn("[say=pc]I would do this again if I had to, Sir.[/say]")

		saynn("He reaches his hand out to pat you and gently scritch behind the ears.")

		saynn("[say=alexrynard]Let's hope you won't ever have to.. Good {pc.boy}..[/say]")

		saynn("You nuzzle his hand and smile, your gaze directed up at him.")

		saynn("[say=pc]Thank you, Sir. Hope the prosthetic works fine.[/say]")

		saynn("[say=alexrynard]It does.. Better than it ever did.. Can't thank you enough.[/say]")

		saynn("[say=pc]Just keep calling me a good {pc.boy}..[/say]")

		saynn("He chuckles through tears.. and pats you more.")

		saynn("[say=alexrynard]Get up, good {pc.boy}.[/say]")

		saynn("(( This is where Alex's content officially ends, thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "alex_after_hug")
	if(state == "alex_kiss_back"):
		playAnimation(StageScene.Hugging, "kiss", {npc="alexrynard"})
		saynn("Rather than hugging the foxy back, you carefully remove the tears from his cheeks.. before kissing him.. deeply.")

		saynn("[say=alexrynard]Wow..[/say]")

		saynn("[say=pc]Shush..[/say]")

		saynn("He indeed shuts up and starts trading kisses with you, his hands sliding over your back.. while yours feel his metal one.")

		saynn("After a series of passionate kisses, you just continue hugging, your foreheads touching.")

		saynn("[say=pc]Glad you're okay, foxy.[/say]")

		saynn("[say=alexrynard]Thanks to you..[/say]")

		saynn("[say=pc]Did I teach myself how to fix things~?[/say]")

		saynn("[say=alexrynard]I guess I helped a little.. But you did everything.[/say]")

		saynn("[say=pc]I will bap you.[/say]")

		saynn("You probably should stop hugging each other before you get glued. It just feels too good to see him kinda happy.")

		saynn("(( This is where Alex's content officially ends, thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "alex_after_hug")
	if(state == "alex_hug_back"):
		saynn("You wrap your arms around the foxy and hug him back, resting your chin on his shoulder.")

		saynn("[say=pc]I'm glad you're okay. Don't know what I would do without you.[/say]")

		saynn("He chuckles through the tears.")

		saynn("[say=alexrynard]Your life would just continue, I didn't contribute that much.[/say]")

		saynn("[say=pc]Pretty sure you're wrong, silly fox.[/say]")

		saynn("[say=alexrynard]Excuse you, I think you meant sly.[/say]")

		saynn("[say=pc]I meant what I meant~.[/say]")

		saynn("You probably should stop hugging each other before you get glued. It just feels too good to see him kinda happy.")

		saynn("(( This is where Alex's content officially ends, thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "alex_after_hug")
	if(state == "alex_after_hug"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("After that nice gesture.. It's time to figure out what to do next.")

		saynn("[say=pc]What.. now..[/say]")

		saynn("[say=alexrynard]I thought about leaving this station for good this time. But nah, I'd rather be close to the people that I like.[/say]")

		saynn("He pats you on the shoulder.")

		saynn("[say=alexrynard]You're still my apprentice.. but also a best friend.[/say]")

		saynn("[say=pc]I can still work with you?[/say]")

		saynn("[say=alexrynard]I don't think they will assign any big tasks to me for a while.[/say]")

		saynn("Alex rubs his chin.")

		saynn("[say=alexrynard]But I think we got some.. unfinished business.. to attend to. What should we do?[/say]")

		saynn("Looks like you can do everything one after another or neither.")

		addButton("Punish Avy", "Track down Avy and punish her!", "punish_avy")
		addButton("Punch captain", "Go punch the captain for no obvious reason", "punch_captain")
		addButton("Hug Eliza", "Go hug Eliza for everything that she did", "hug_eliza")
		addButton("No business", "It's fine", "enough_bus")
	if(state == "pickWhatDo"):
		saynn("What should you do next?")

		if (!didPunishAvy):
			addButton("Punish Avy", "Track down Avy and punish her!", "punish_avy")
		else:
			addDisabledButton("Punish Avy", "You already did this")
		if (!didPunchedCap):
			addButton("Punch captain", "Go punch the captain for no obvious reason", "punch_captain")
		else:
			addDisabledButton("Punch captain", "You already did this")
		if (!didHugEliza):
			addButton("Hug Eliza", "Go hug Eliza for everything that she did", "hug_eliza")
		else:
			addDisabledButton("Hug Eliza", "You already did this")
		addButton("Enough", "This is enough loose ends tied up", "enough_bus")
	if(state == "punish_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("[say=pc]Can we punish that dark fox who attacked us?[/say]")

		saynn("Alex hums and quickly checks his datapad.")

		saynn("[say=alexrynard]Yeah, let's go track her down.[/say]")

		addButton("Follow", "See where Alex brings you", "avy_find")
	if(state == "avy_find"):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="avy"})
		aimCameraAndSetLocName("yard_westCorridor")
		saynn("It didn't take long, you catch Avy while she is heading towards the gym area for whatever reason.")

		saynn("You block her path. She stops as your gazes collide.")

		saynn("[say=avy]Huh.[/say]")

		saynn("[say=alexrynard]Surprised?[/say]")

		saynn("[say=avy]Disappointed. I should have stepped on you harder.[/say]")

		saynn("Avy raises one of her fists.. while the second starts sneakily reaching for something..")

		saynn("[say=alexrynard]You tried.[/say]")

		saynn("Avy pulls out a syringe.. at the same time as Alex pulls out his shock remote.")

		addButton("Continue", "See what happens next", "avy_drops")
	if(state == "avy_drops"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npcAction="defeat", npc="avy"})
		saynn("Avy drops to her knees as a powerful shock rocks through her body, causing her to drop the syringe.")

		saynn("Alex keeps holding the button down while slowly approaching Avy.")

		saynn("[say=avy]RGH-hH!..[/say]")

		saynn("Her hands are gripping onto her collar, desperately trying to take it off while the shocks drain her stamina in an instant.")

		saynn("Alex picks up the syringe with a strange drug and finally lifts the finger.")

		saynn("[say=alexrynard]Where are you getting this anyway?[/say]")

		saynn("[say=avy]Ghr-r-r.. Fuck you, spineless.[/say]")

		saynn("Alex cuffs Avy's hands and then clips a leash to her collar.")

		saynn("[say=alexrynard]Uh huh.[/say]")

		addButton("Continue", "See what happens next", "avy_woodenhorse")
	if(state == "avy_woodenhorse"):
		playAnimation(StageScene.WoodenHorseSolo, "lightstruggle", {pc="avy", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("main_punishment_spot")
		saynn("Avy growls and pulls on the leash.. but Alex easily overpowers her and brings her to the main platform with all the stocks and such. He undresses her with your help and throws her onto the wooden horse.")

		saynn("Alex slowly lowers her until her ass and her cock start feeling the sharp edge being pressed against them.")

		saynn("[say=avy]You t-think this will break me?[/say]")

		saynn("Alex shrugs while watching Avy squirm from the pain, dragging her butt back and forth.")

		saynn("[say=alexrynard]It sure won't help with your reputation, little pain slut.[/say]")

		saynn("Avy realizes that her cock is looking quite hard from the friction.. all the while the little crowd is already gathering around her.")


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

	if(_action == "next_day_alex"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		processTime(5*60*60)

	if(_action == "alex_after_hug"):
		processTime(3*60)

	if(_action == "punish_avy"):
		didPunishAvy = true
		didAny = true

	if(_action == "punch_captain"):
		didPunchedCap = true
		didAny = true

	if(_action == "hug_eliza"):
		didHugEliza = true
		didAny = true

	if(_action == "avy_find"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["tellChoice"] = tellChoice
	data["didAny"] = didAny
	data["didPunishAvy"] = didPunishAvy
	data["didPunchedCap"] = didPunchedCap
	data["didHugEliza"] = didHugEliza

	return data

func loadData(data):
	.loadData(data)

	tellChoice = SAVE.loadVar(data, "tellChoice", "")
	didAny = SAVE.loadVar(data, "didAny", false)
	didPunishAvy = SAVE.loadVar(data, "didPunishAvy", false)
	didPunchedCap = SAVE.loadVar(data, "didPunchedCap", false)
	didHugEliza = SAVE.loadVar(data, "didHugEliza", false)
