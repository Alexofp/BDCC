extends SceneBase

var isKnocked = false
var isFucked = false
var isBeaten = false

func _init():
	sceneID = "WakingUpAfterFirstAvyBattleScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Sleeping, "idle")
		saynn("So.. dark.. it's blinding..")

		saynn("At least you're not dead yet.. wishful thinking, right? Naaah, you're not ready to give up that easily.")

		saynn("In any case, might as well just rest and see where this life brings you next.")

		addButton("Continue", "See what pain will you have to endure next", "wakey_wakey")
	if(state == "wakey_wakey"):
		addCharacter("eliza")
		playAnimation(StageScene.GivingBirth, "idle", {bodyState={naked=true}})
		aimCameraAndSetLocName("medical_hospitalwards")
		saynn("Your head.. hurts.. which makes you extremely happy for some reason. But that.. beeping noise.. is so annoying.. beep.. beep.. beep..")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence! AlphaCorp hopes that you are enjoying your stay here.")

		saynn("You slowly open your eyes and notice.. that you're completely naked. Wait.. are those.. tentacles?.. penetrating your holes?.. You squint a little and realize that they're just plastic tubes that go from some medical machine to your nostrils. False alarm..")

		saynn("[say=eliza]Oh, you're up. Morning, patient. Don't move too much.. or I will have to put a straitjacket on you, hehe.[/say]")

		saynn("The headache makes it hard but you make your best effort to look around anyways. The white bright sterile walls remind you of the medical wing instantly. Standing near the bed is a friendly-looking feline with fur of pastel colors, wearing a labcoat and seemingly just reading some things from her datapad.")

		saynn("You can roughly guess where you are. But how and why is still a great question.")

		saynn("[say=pc]How did..[/say]")

		if (isBeaten):
			saynn("[say=eliza]Tsh-h.. Let me do the talking here. Doctor Quinn in case you don't remember. Let me see..[/say]")

			saynn("She swipes through some screens and then tilts her head slightly.")

			saynn("[say=eliza]Huh, wow. Is that an xray or a jigsaw puzzle? Oh, look. It says here that you died, patient.[/say]")

			saynn("Doctor directs her gaze at you and how you're still breathing.")

			saynn("[say=eliza]But we resurrected you. You're the reason we had to use the cryopod for its intended purpose - to freeze biological processes. Gave us some much-needed time to stitch your limbs back together.[/say]")

			saynn("The feline smiles warmly.")

			saynn("[say=eliza]Hopefully we didn't mess up. That would be an awkward first toilet visit. Insurance will cover it I'm sure~.[/say]")

		elif (isFucked):
			saynn("[say=eliza]Tsh-h.. Let me do the talking here. Doctor Quinn in case you don't remember. Let me see..[/say]")

			saynn("She swipes through some screens and then tilts her head slightly.")

			saynn("[say=eliza]Huh, wow. That's a fancy vase. Wait, I'm wrong, that's an xray of your crotch actually. It seems you got stretched down there a little past your limits. Quite the feat I must say.[/say]")

			saynn("The doctor directs her gaze at you, her expression a mix of concern and amusement.")

			saynn("[say=eliza]But don't worry, one trip to the cryo and your bits are now almost brand new. I'm more concerned about the small concussion that you received. Did you fall off your bed yesterday?[/say]")

			saynn("The feline smiles warmly.")

			saynn("[say=eliza]Hopefully we didn't mess up. Would be awkward to hear you bark suddenly~. You will be fine-e-e. Just remember, bigger toys doesn't mean better toys.[/say]")

		else:
			saynn("[say=eliza]Tsh-h.. Let me do the talking here. Doctor Quinn in case you don't remember. Let me see..[/say]")

			saynn("She swipes through some screens and then tilts her head slightly.")

			saynn("[say=eliza]Huh, it seems.. you had a concussion. A good one. It's as if your brain wanted to explore new dimensions. Oh, look. It says here that you died, patient.[/say]")

			saynn("Doctor directs her gaze at you and how you're still breathing.")

			saynn("[say=eliza]But we resurrected you. You're the reason we had to use the cryopod for its intended purpose - to freeze biological processes. Gave us some much-needed time to put your skull pieces back together.[/say]")

			saynn("The feline smiles warmly.")

			saynn("[say=eliza]Hopefully we didn't mess up. Would be awkward to hear you bark suddenly~. You will be fine-e-e. Just remember, no more headbutting concrete walls for a while, okay?[/say]")

		saynn("What is she.. talking about.. You try to frown but tensing your face muscles just makes the white noise in your head louder.")

		saynn("[say=eliza]Tshh.. Stay like that, patient. I think you will need at least one more day here in this bed. I will go get some good painkillers.[/say]")

		saynn("The feline leaves your room, letting you.. rest. You put your head on the pillow and close your eyes..")

		saynn("You wonder if you should even tell that doctor about Avy.. beep.. beep.. beep..")

		addButton("Continue", "See what happens next", "a_new_day")
	if(state == "a_new_day"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence!")

		saynn("It's the second day of you being here. And you feel.. fine? Better than before, that's for sure.")

		saynn("You open your eyes and notice that you're not connected to the annoying beeping machine anymore. And your belongings lay before you on the bed. Time to put everything back where it was.")

		saynn("Doctor Quinn walks in and slowly approaches you, datapad in her paws.")

		saynn("[say=pc]Am I free to go?[/say]")

		saynn("[say=eliza]Yeah, sure. After you explain why one of the inmates has carried your half-dead body through half of the prison. Half half half.[/say]")

		saynn("Shit. Wait. Inmate?")

		saynn("[say=pc]What inmate?[/say]")

		saynn("Doctor raises a brow.")

		saynn("[say=eliza]How about a deal? You tell me and I tell you.[/say]")

		saynn("You sigh and look around, avoiding eye contact.")

		saynn("[say=pc]I got into a fight, okay? And I lost. Simple as that.[/say]")

		saynn("The feline furrows her brows and swipes through some screens on her datapad.")

		saynn("[say=eliza]Explains the DNA of one of the high-security inmates that we found on you.[/say]")

		if (isFucked):
			saynn("The feline coughs many times for some reason.")

			saynn("[say=eliza]A lot of it.. khm..[/say]")

		saynn("Well, might as well tell her more.")

		saynn("[say=pc]Yeah. The bitch got drugs that made her stronger. Without them she is nothing.[/say]")

		saynn("The feline hums loudly. You can see a confused expression on her face.")

		saynn("[say=eliza]But, those aren't allowed for inmates. For obvious reasons.. And the only staff member who is using them is..[/say]")

		saynn("She swiftly swipes through more screens, then types something on a holo-keyboard.")

		saynn("[say=eliza]Is Risha. She needs them to not lose her gains or whatever she said.[/say]")

		saynn("Doctor Quinn scratches her chin.")

		saynn("[say=eliza]And that inmate.. I wouldn't be surprised if they are stealing the drugs from Risha. That.. cat.. has bigger holes in her pockets than the inmate pockets after her.[/say]")

		addButton("Who saved me", "Time for her to answer", "ask_about_kait")
	if(state == "ask_about_kait"):
		saynn("[say=pc]That's great and all. But who was that inmate who.. saved me.[/say]")

		saynn("Doctor Quinn is still frowning, clearly focused on something else.")

		saynn("[say=eliza]Huh? Some lilac, a snow leopard I think. She will have to clean the blood trail now. Anyway.[/say]")

		saynn("The feline looks at you, her eyes shine like she is excited.")

		saynn("[say=eliza]I have a great proposition for you.[/say]")

		saynn("You already don't like where this is going.")

		saynn("[say=pc]Why would I do..[/say]")

		saynn("[say=eliza]You wanna teach that inmate a great lesson about why drugs are bad?[/say]")

		saynn("Huh. This does sound interesting now.")

		saynn("[say=pc]How?[/say]")

		saynn("[say=eliza]The plan is simple. We make a drug. The best drug. The most powerful aphrodisiac that was developed. By yours truly, by the way.[/say]")

		saynn("Doctor bites her lip.")

		saynn("[say=eliza]And when Risha comes to me for her muscle stimulants, oops, I will accidentally give her the wrong ones, how silly of me.[/say]")

		saynn("The feline smiles.")

		saynn("[say=pc]And then I go fight that inmate again?[/say]")

		saynn("[say=eliza]Precisely. Just wait a little so that the inmate has the time to steal the drugs.[/say]")

		saynn("[say=pc]And why would you help me like that?[/say]")

		saynn("The feline looks up at the ceiling.")

		saynn("[say=eliza]Let's just say that I have my reasons, patient. The only thing is..[/say]")

		saynn("Doctor Quinn gets a little sad, flicking through the menus of her datapad.")

		saynn("[say=eliza]I'm missing a component for that drug. A plant. It's the key part of the recipe.[/say]")

		saynn("[say=pc]Can't you, like, order it?[/say]")

		saynn("[say=eliza]It will take a while. Logistics, bureaucracy, I hate it all. I just wanna.. experiment. Not be a paper slave.[/say]")

		saynn("The feline scratches her chin again.")

		saynn("[say=eliza]The plant grows in the green houses, here, on this station. Would you, maybe, go get it for me? I'd like to keep this one.. off the books.[/say]")

		saynn("Hum. What choice do you have anyway? If you don't get her this plant, Avy will just keep using that drug and win every arena fight. You gotta teach her for what she's done..")

		saynn("[say=pc]I will see what I can do.[/say]")

		saynn("Doctor's face lights up.")

		saynn("[say=eliza]Great. It's.. glowing and it's pink. Can't miss it. Now, let's get you out of here.[/say]")

		saynn("She produces a chain leash and already reaches to attach it to your collar.")

		saynn("[say=pc]Is this really needed?[/say]")

		saynn("The feline nods playfully and clips the leash before offering you to follow.")

		saynn("[say=eliza]Just a standard procedure, patient~.[/say]")

		addButton("Continue", "See where she will bring you", "follow_eliza")
	if(state == "follow_eliza"):
		aimCameraAndSetLocName("med_lobbyne")
		GM.pc.setLocation("med_lobbyne")
		saynn("The feline brings you out into the medical lobby before detaching the leash.")

		saynn("[say=eliza]Well, good luck. I'm always here, behind the counter.[/say]")

		saynn("You nod. Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "wakey_wakey"):
		isKnocked = getFlag("FightClubModule.GotKnockedOutByAvy", false)
		isFucked = getFlag("FightClubModule.GotFuckedByAvy", false)
		isBeaten = getFlag("FightClubModule.GotDestroyedByAvy", false)
		
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		GM.pc.afterCryopodTreatment()
		processTime(60*60*2)

	if(_action == "a_new_day"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()

	if(_action == "ask_about_kait"):
		processTime(3*60)
		setFlag("FightClubModule.GotTaskToStealPlant", true)
		addMessage("New task added!")

	if(_action == "follow_eliza"):
		runScene("ParadedOnALeashScene", ["eliza", "medical_hospitalwards", "med_lobbyne", []])

	setState(_action)

func saveData():
	var data = .saveData()

	data["isKnocked"] = isKnocked
	data["isFucked"] = isFucked
	data["isBeaten"] = isBeaten

	return data

func loadData(data):
	.loadData(data)

	isKnocked = SAVE.loadVar(data, "isKnocked", false)
	isFucked = SAVE.loadVar(data, "isFucked", false)
	isBeaten = SAVE.loadVar(data, "isBeaten", false)

func getDevCommentary():
	return "This is just a glue scene, yeah. But still, I think it's kinda nice. It does some world building, shows Eliza's character and also hints at some interesting stuff. Is Avy actually stealing those drugs? Well, what do you think? :p"

func hasDevCommentary():
	return true
