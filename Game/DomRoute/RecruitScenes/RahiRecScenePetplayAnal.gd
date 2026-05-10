extends RecruitSceneBase

var gentle = false
var mean = false

func _init():
	sceneID = "RahiRecScenePetplayAnal"

func _run():
	if(state == ""):
		addCharacter("rahi")
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours", npcBodyState={naked=true, leashedBy="pc"}})
		gentle = (c1 == 0)
		mean = (c1 == 2)
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You will need a particular item for this. You ask your team if they have something like this. And it looks like Ans has just the thing! He also gave you a tube of lube. Very good lube.")

		saynn("After getting everything, you enter Rahi's cell and grab her leash. She doesn't seem to resist as you bring her closer to the middle of the cell.")

		saynn("[say=pc]"+str(ch1("I really wanna trust you. You're gonna be a good puppy for me for a bit, okay?", "I will check how obedient you are. From now on, you're gonna act like a puppy. Until I say otherwise. Got it?", "You will act like a bitch in heat from now on. Do you understand that, slut?"))+"[/say]")

		saynn("Rahi blinks, confused, her ears go flat.")

		saynn("[say=rahi]Meow?.. She is a cat though..[/say]")

		saynn("Your grip on the leash tightens.")

		saynn("[say=pc]"+str(ch1("Yes, I know. But I wanna see how well you can do this. It's gonna be fun. Let's get those clothes off first, pets don't wear them, do they?", "I only see a puppy in front of me. A very strange puppy. Puppies usually don't wear clothes, do they?", "I don't care. You'll play the part or I'll make you. Now, mutts don't need clothes. Take them off."))+"[/say]")

		saynn("She hesitates.. but eventually her paws begin to unbutton her shirt. You just watch as she reveals her perky chest to her, her nips now catching the slight cold breeze that travels here. Shorts are next, she catches the waistband with her claws and slowly tugs down on its sides, letting the cloth slide down along her thighs, revealing her cute little pink flower.")

		saynn("[say=pc]"+str(ch1("Good. Precious. Now could you get on all fours for me?", "Mhm. Pups don't walk on two legs too.", "Get on all fours."))+"[/say]")

		saynn("Rahi rubs her snout.. and then slowly lowers herself in front of you, her tail tucks between her legs. When she does that, you present her with the mysterious item.. a large silicon buttplug, bigger than any normal ones.. smooth texture.. tapered.. with a flared base. Rahi's eyes go wide.")

		saynn("[say=rahi]..m-meow??..[/say]")

		saynn("[say=pc]"+str(ch1("Shh. This will help you feel like a proper puppy. Just relax for me, okay?", "Puppies don't get to question. They obey. Now hold still.", "Don't act so surprised, I will make it fit."))+"[/say]")

		addButton("Continue", "See what happens next", "lube_part")
	if(state == "lube_part"):
		playAnimation(StageScene.SexFisting, "tease", {pc="pc", npc="rahi", npcBodyState={naked=true, hard=true}})
		saynn("You get behind Rahi and squeeze a generous amount of lube onto your fingers. Rahi flinchs as your cool, slick digit presses against her tailhole. Her back arches a bit.")

		saynn("[say=rahi]Nn.. that's.. ah..[/say]")

		saynn("[say=pc]"+str(ch1("Why don't you bark for me instead?", "Quiet. Pups don't talk. They only bark.", "Bark, your slutty pet."))+"[/say]")

		saynn("[say=rahi]..r-ruff..[/say]")

		saynn("Rahi is tight. Very. You press your finger against the star and begin to slowly work it in.. gentle circles and prods.. stretching the ring. One finger slips inside. Rahi's claws show themselves as she scratches the floor.")

		saynn("A second finger joins soon after, stretching the hole a bit wider. Rahi's breath hitches, little whines escaping her throat. Her pussy lips are getting wet.. but you don't plan on offering them any stimulation. That's not the focus.")

		saynn("[say=rahi]..w-wuff.. ah..[/say]")

		saynn("You add a third finger. She moans, tail trembling. Then a fourth. Now you can really feel her star clenching around you. But you just keep stretching her out, sliding your digits inside and wiggling them while Rahi drops her chin and moans into the floor.")

		saynn("[say=pc]"+str(ch1("You're doing so well. Almost ready.", "There we go. Loose enough now.", "Pathetic. This little hole can take more."))+"[/say]")

		saynn("You pull your fingers out and pick up the plug. The tip presses against her stretched entrance. Rahi gasps as you begin to apply pressure on the base, making the toy slowly stretch the cat's rear hole further. She is clenching hard though.. preventing the full insertion.")

		saynn("[say=rahi]Ahh-h..[/say]")

		saynn("[say=pc]"+str(ch1("Just relax, little puppy. You need to relax.", "Quit clenching so much, puppy. I will work it in no matter what.", "Stop clenching, slut. This is not a cock."))+"[/say]")

		saynn("She huffs and pants, her body shivering as you continue to put pressure on her star.. until eventually the thick part of the buttplug manages to pop past the sphincter. Her whole body jolts, her pussy squirts a little.")

		saynn("[say=rahi]Nya-a-ahh..[/say]")

		saynn("[say=pc]"+str(ch1("There. Good puppy. Let's go for a walk now.", "Good. Much better. Now we're going for a walk.", "Enjoy it. We're going for a walk."))+"[/say]")

		saynn("You grab the leash and tug on it, inviting Rahi to follow. She stumbles forward, still on all fours, putting one paw forward after another, the plug now shifting inside her as she moves. A thin trail of arousal drips down her thigh.")

		addButton("Continue", "See what happens next", "walkies")
	if(state == "walkies"):
		aimCameraAndSetLocName("hideout_west_corridor")
		saynn("You lead Rahi out of her cell and just start walking around the corridor. Rahi's paws shuffle across the cold floor, little moans escaping her every so often, her tail curling low.")

		saynn("[say=rahi]Mmhh.. h-hh.. r-ruuff..[/say]")

		saynn("She is pretty slow so you decide against showing her to the crowd near the arena. Just some walkies around the hideout should be enough.")

		saynn("Occasionally she leans against the wall and starts shivering, her eyes closed.")

		saynn("[say=pc]"+str(ch1("You're doing so well. Just keep crawling, puppy.", "No stopping, just crawl.", "What part of being a bitch don't you understand? Crawl."))+"[/say]")

		saynn("She nods and continues to crawl after you, leaving a thin line of her arousal behind.")

		saynn("As you walk around, you eventually stumble upon a familiar face.")

		addButton("Continue", "See what happens next", "kait_encounter")
	if(state == "kait_encounter"):
		playAnimation(StageScene.Massage, "butt", {pc="kait", npc="rahi", npcBodyState={naked=true, hard=true}})
		addCharacter("kait")
		saynn("It's Kait, the snow leopard.")

		saynn("[say=kait]Aww, look at that puppy.[/say]")

		saynn("She takes note of how slow Rahi is and decides to circle her, quickly noticing the giant flared base of a plug sticking out of her tailhole.")

		saynn("[say=kait]Oh wow. I can see why she is struggling.[/say]")

		saynn("Before Rahi can react, Kait reaches down and gives the plug a gentle tug. Enough to make it move, revealing more of its thickness.. before the tight star swallows it again.")

		saynn("[say=rahi]Nhh..[/say]")

		saynn("Rahi's back arches, a quiet whine escaping her lips. Her pussy visibly pulses, squirting some more transparent juices.")

		saynn("[say=kait]Oh, she likes that. Let me help.[/say]")

		saynn("Kait's paw finds Rahi's wet slit and starts doing slow circles around her clit, playing with it. Rahi's legs tremble, her mouth hanging open, panting like a puppy.")

		saynn("[say=rahi]Ah.. w-woof.. ahh..[/say]")

		saynn("[say=kait]Good girl.[/say]")

		saynn("Kait gives one last tug on the plug, eliciting a loud squeak.. and then runs off.")

		saynn("[say=pc]"+str(ch1("See? You're being such a good puppy. Let's keep moving.", "You liked it? Good. Don't stop. Crawl. Now.", "You're leaking everywhere, slut. Move."))+"[/say]")

		saynn("You tug on the leash and Rahi resumes crawling, her hips swaying involuntarily.")

		saynn("Quite soon, you meet another person..")

		addButton("Continue", "See what happens next", "avy_encounter")
	if(state == "avy_encounter"):
		playAnimation(StageScene.Spanking, "fastonce", {pc="avy", npc="rahi", npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("hideout_middle")
		removeCharacter("kait")
		addCharacter("avy")
		saynn("It's Avy, she approaches you and Rahi.")

		saynn("[say=avy]Familiar face. Glad you found your place, cat.[/say]")

		saynn("She leans behind the feline and sees that giant buttplug.")

		saynn("[say=avy]Is that why you're squirming so much? Let me help.[/say]")

		saynn("A sudden smack echoes across the corridor as Avy spanks Rahi's exposed rear!")

		saynn("[say=rahi]YIP!..[/say]")

		saynn("Her tailhole pulses hard, revealing more of the plug for a second. Rahi's whole body convulses, a strangled moan escapes her..")

		saynn("[say=avy]Heh. What a slut. Keep the posture up.[/say]")

		saynn("Avy catches Rahi's tail and pulls up on it, making Rahi stick her ass out.. ass that she is quick to smack again.")

		saynn("Rahi's ass clenches around the plug again, her legs splaying, her pussy gushing..")

		saynn("[say=avy]Pathetic little mutt. Wanter another?[/say]")

		saynn("[say=rahi]P-please.. nnhh.. t-too much..[/say]")

		saynn("Avy grins and delivers three more spanks in rapid succession, her other paw still holding the tail. Rahi's butt now flushing red, the plug jiggling inside her with each impact. The poor cat is drooling now, her tongue lolling out.")

		saynn("[say=avy]There. Now she really knows her place.[/say]")

		saynn("[say=rahi]..r-ruuffff..[/say]")

		saynn("The fox pats the cat on the head and quickly disappears. All the while Rahi just flops onto the floor, panting, her red butt twitching, the plug still buried deep.")

		saynn("[say=pc]"+str(ch1("You took that well. Good puppy. Almost home.", "Look at it as an endurance test. We need strong people.", "Look at it as an endurance test. We don't need weak bitches."))+"[/say]")

		saynn("[say=rahi]Huff-f..[/say]")

		saynn("You tug on the leash. Rahi whimpers but obeys, crawling back on shaky legs.")

		addButton("Continue", "See what happens next", "back_to_cell")
	if(state == "back_to_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You bring Rahi back into the cell. She flops again, trembling, her pussy still dripping, tailhole stretched wide around the plug.")

		saynn("[say=pc]"+str(ch1("All done. Let's get that out of you. Easy now.", "I'm gonna pull it out now. Sit tight.", "Time to pull the plug. Sit tight."))+"[/say]")

		saynn("You kneel behind her and slowly pull on the plug's base. Rahi gasps and claws away at the floor as the bulb stretches her rim again.. until the plug finally slides out with a wet pop.")

		saynn("Her anal is left gaping open for a moment, revealing its slick darkness. The ring is slowly clenching and relaxing. A trickle of lube streams down from it.")

		saynn("[say=rahi]Nhh.. s-so.. s-stretched..[/say]")

		saynn("Eventually, it begins to close, shrinking back to a tight pink pucker. She is still panting, her rear end glowing.")

		if (success):
			saynn("It looks like she enjoyed it. Maybe.")

		else:
			saynn("Looking at it now.. perhaps you went too far.")

		saynn("You give Rahi a few strokes on her back before leashing her back to that pipe.")

		saynn("Then you step out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "lube_part"):
		processTime(5*60)

	if(_action == "walkies"):
		processTime(3*60)

	if(_action == "kait_encounter"):
		processTime(10*60)

	if(_action == "avy_encounter"):
		processTime(5*60)

	if(_action == "back_to_cell"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["gentle"] = gentle
	data["mean"] = mean

	return data

func loadData(data):
	.loadData(data)

	gentle = SAVE.loadVar(data, "gentle", false)
	mean = SAVE.loadVar(data, "mean", false)
