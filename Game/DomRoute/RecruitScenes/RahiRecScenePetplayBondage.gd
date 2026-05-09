extends RecruitSceneBase

var gentle = false
var mean = false

func _init():
	sceneID = "RahiRecScenePetplayBondage"

func _run():
	if(state == ""):
		addCharacter("rahi")
		aimCameraAndSetLocName("hideout_breakroom")
		gentle = (c1 == 0)
		mean = (c1 == 2)
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You will need a lot of things for this one.. But Kait and Ans have provided you with some fun toys. It's good to have a team.")

		saynn("You enter Rahi's cell and grab her leash. She doesn't seem to resist as you pull her closer to the exit.")

		saynn("[say=pc]"+str(ch1("I really wanna trust you. I'm going to put some things on you, okay? Just relax.", "Time to see how obedient you are. I will wear some things on you. And you will do as I say.", "You're gonna be our bitch. So I might as well dress you as one."))+"[/say]")

		saynn("Rahi blinks, her ears go flat. Her paws hold onto the tight leash.")

		saynn("[say=rahi]She.. she doesn't quite understand..[/say]")

		saynn("[say=pc]"+str(ch1("You don't need to. Just stand still for me. Let's get those clothes off first.", "Leave the thinking to me. Clothes off. Now.", "Shut up and strip. You're wasting time."))+"[/say]")

		saynn("She hesitates.. but eventually her paws begin to unbutton her shirt. You watch as she reveals her perky chest to you, her nips instantly catching the slight cold breeze. Shorts are next.. she catches the waistband with her claws and tugs down, letting the cloth slide along her thighs, revealing her cute little pink flower.")

		saynn("[say=pc]"+str(ch1("Good girl. Now kneel. We have a lot to put on you.", "Perfect. On your knees. And don't move. We have a lot to put on you.", "Mhm. Not get on your knees, you slutty pet. It's time to make you look like a proper pet."))+"[/say]")

		addButton("Continue", "See what happens next", "rahi_corset")
	if(state == "rahi_corset"):
		saynn("Rahi lowers herself, trembling a bit. You start with a corset, wrapping it around her waist and locking it tight. She gasps as her breath shortens.")

		saynn("[say=rahi]M-meow.. t-tight..[/say]")

		saynn("[say=pc]"+str(ch1("Shh, you'll get used to it. Breathe slowly.", "It's supposed to be tight. That's the point.", "Complain again and I will get it even tighter. Just obey, slut."))+"[/say]")

		saynn("Next.. are the limb restraints. You take her wrists and bend them toward her shoulders before putting and locking leather restraints that now hold her arms in that position. She can still move her arms.. but her forearms are now fixed.")

		saynn("Then it's time for the legs. They're a bit more awkward to get to.. but you just about manage, locking her ankles to her be near her butt with a similar type of restraint.")

		addButton("Continue", "See what happens next", "rahi_bitchsuit")
	if(state == "rahi_bitchsuit"):
		saynn("After you're done, Rahi is left standing on her elbows and knees. Her hands and rear paws are free.. but she can only really just wiggle her toes or move her digits a bit.")

		saynn("Rahi is clearly struggling with the bitchsuit, mewling softly as she almost topples.")

		saynn("[say=pc]"+str(ch1("Try to crawl. Move your limbs slowly. I'll help you balance.", "You don't walk. You crawl. Get used to it.", "Slutty pets like you will only crawl."))+"[/say]")

		saynn("The feline takes a few short steps. She looks kinda cute, swaying her butt like that.")

		saynn("But you're not done yet. The ballgag is next. You press the red rubber ball against her lips and wait until she opens her lips enough for you to slide it in. Then you buckle the strap behind her head.. tightly.")

		saynn("[say=rahi]Mmphh..[/say]")

		saynn("One of the things that you've gotten from the team.. is a short chain with two clamps on each end. Yes, you know just the place for it. You bring the thing down to her chest.. and pinch each of her nipples with the clamps, letting the chain dangle between them.")

		saynn("[say=rahi]Hhhk-! MMpphh..[/say]")

		saynn("Her body convulses, Rahi throws her head back and wiggles her chest, making the clamps pull on her sensitive spots more.")

		saynn("[say=pc]"+str(ch1("Deep breaths. The sting will fade into warmth soon.", "Learn to accept the pain, kitty cat.", "Cry all you want. It won't make me stop. I am making you my bitch."))+"[/say]")

		saynn("Rahi is panting into the gag while you produce a little vibrator.. a pink egg. You get behind her and tape it directly over her clit, pressing it firmly. Then you strap the remote around her upper thigh and turn the dial a few notches. The little bullet-shaped toy starts buzzing away.")

		saynn("[say=rahi]Mmm.. mmph..[/say]")

		saynn("[say=pc]"+str(ch1("This will help you feel good..", "Behave and you might even cum.", "If you don't obey, I will turn it off."))+"[/say]")

		saynn("Finally.. the blindfold. Rahi sees the tight black cloth and goes rigid. She then starts trying to clumsily back away from you, her big blue eyes full of fear, her tail spazzing in the air.")

		saynn("Seeing her try.. hearing her limb restraints clank against the floor.. It is honestly adorable.")

		addButton("Leash", "Pull on the leash", "add_blindfold")
	if(state == "add_blindfold"):
		saynn("You tug on the leash.. firmly.. making the kitty flop to her side with a muffled whimper. That's when you crouch near and begin tying the blindfold around her eyes, stealing her ability to see.")

		saynn("[say=pc]"+str(ch1("Shh, I've got you. You can't see, so just trust your other senses. Trust the leash.", "Now you truly have no choice but to obey. Trust my leash, pup.", "No sight. No voice. No movement. Perfect little bitch pup."))+"[/say]")

		saynn("This.. seems to be it. Rahi is now ready for some walkies. The space where the arena is.. might be too crowded.. and also too far away. But you can just walk her here, around the new hideout.")

		saynn("You help Rahi to get back onto her new paws.")

		saynn("[say=pc]"+str(ch1("Time for a short walk.", "We're going for a walk. Pups need their walkies.", "Let's get you out for some walkies, slut."))+"[/say]")

		addButton("Continue", "See what happens next", "corridor_bondage")
	if(state == "corridor_bondage"):
		saynn("You exit the cell. Rahi crawls on her elbows and knees, blindly following the leash. Each movement makes the clamps tug on her nips.. the vibrator still buzzing away at her sex. She is not exactly the fastest.. but she is clearly trying. You've only just noticed how blushy her face is, her cheeks are glowing red.")

		saynn("And so you walk your pup around the narrow maintenance corridor. There is still some trash around.. but you just pull on the leash each time Rahi is about to bump into something.")

		saynn("[say=pc]"+str(ch1("Good. You're such a good puppy.", "Keep moving your pawsies, little puppy.", "Keep up, bitch. You can move those paws faster than that."))+"[/say]")

		saynn("[say=rahi]R-ruff.. h-huff.. w-woof..[/say]")

		saynn("You follow the corridor.. until you walk into someone.")

		addButton("Continue", "See what happens next", "kait_meet")
	if(state == "kait_meet"):
		addCharacter("kait")
		saynn("[say=kait]Ohh. You really did go all out on her. Look at that puppy![/say]")

		saynn("Kait crouches near Rahi and starts giving her plenty of headpats and scritches.")

		saynn("[say=kait]I wanna tug on your cheeks, pretty girl~. Belly rubs?[/say]")

		saynn("Rahi woofs softly.. and flops onto the side as Kait gently pushes her. Your puppy wiggles her paws while the snow leopard is giving her many belly rubs too.")

		saynn("[say=kait]You're very damp down there too~. Aw-w. You clearly love it.[/say]")

		saynn("Kait reaches out towards the toy remote, increasing the power a few notches. Little muffled moans start escaping Rahi soon after, her body squirming as the buzzing near her clit gets more high-pitched.")

		saynn("[say=kait]There you go. That's your reward for being such a good puppy. There is more where that came from.. if you're gonna do things for us. You're gonna do things for us.. Right, puppy?[/say]")

		saynn("[say=rahi]W-woof..[/say]")

		saynn("[say=pc]"+str(ch1("Don't push her too much. I'm being very gentle with her.", "I think she will, yes.", "That slutty pup doesn't really have a choice."))+"[/say]")

		saynn("Kait helps Rahi to get up and then just lets you be.")

		saynn("You do some more walkies around the hideout.. until you run into Avy.")

		addButton("Continue", "See what happens next", "avy_encounter")
	if(state == "avy_encounter"):
		removeCharacter("kait")
		addCharacter("avy")
		saynn("Dark foxy approaches you two, a little smirk on her face.")

		saynn("[say=avy]I recognize that cat. Hm. What can I say.. I approve.[/say]")

		saynn("She crouches near panting, blushing Rahi.. and then flicks her snout.")

		saynn("[say=rahi]Mhh-..[/say]")

		saynn("[say=avy]What? Gonna bite me?[/say]")

		saynn("Avy reaches.. not to pat.. but to tighten the gag, the blindfold and the corset instead.")

		saynn("[say=avy]Good luck with that, mut.[/say]")

		saynn("Rahi is just drooling.. until Avy tugs on her nipple chain, forcing a loud gasp out of the poor kitty.")

		saynn("[say=avy]So sensitive~. Let me check something.[/say]")

		saynn("Foxy pulls on Rahi's tail.. and takes a look at her needy slit.. which is dripping juices quite a bit. Avy sets the remote to its maximum setting..")

		saynn("[say=rahi]MHHhh-h-h~..[/say]")

		saynn("[say=avy]Such a slut.. Bark for me.[/say]")

		saynn("Rahi sways left and right.. wigging her ass a lot. The buzzing is really loud, poor kitty is struggling to contain all the sudden pleasure. Her front paws give up first, making her face flop onto the floor, her ass sticking high up. More and more muffled moans begin escaping her..")

		saynn("[say=rahi]Mhh.. hhh-h.. w-woof.. MHhhh.. Mmmmhhh-.. r-ru.. rr-ruff..[/say]")

		saynn("[say=avy]Oh yeah? You wanna cum now? Pathetic. How about I..[/say]")

		saynn("Avy suddenly turns off the toy. And that really sends Rahi off. She flops onto her side and starts squirming, rubbing her legs together, whimpering into the darkness.")

		saynn("[say=avy]Yeah-h. There we go. If you wanna cum, you're gonna listen to our every word.[/say]")

		saynn("[say=pc]"+str(ch1("You're being way too mean, Avy. Chill.", "Yeah, I will make sure she listens. Will use a clicker if I have to.", "That bitch in heat is gonna do exactly what I tell her to do."))+"[/say]")

		saynn("Rahi's panting continues for quite a while longer.. while her body cools down, the feeling of orgasm fading away, leaving her bits sensitive.")

		saynn("Time to bring her back.")

		addButton("Continue", "See what happens next", "back_to_cell_bondage")
	if(state == "back_to_cell_bondage"):
		removeCharacter("avy")
		saynn("You bring Rahi back into the cell. After the last step, she just flops onto the floor, blindfolded and bound, small shivers running through her.")

		saynn("First, you remove the blindfold. Her eyes struggle to focus, pupils blown wide.")

		saynn("Then the ballgag. She coughs and swallows.")

		saynn("[say=rahi]W-woof..[/say]")

		saynn("A little moan escapes her when you peel the tape that holds the vibrator off. And a second moan when you pull off the clamps.")

		if (success):
			saynn("[say=pc]How was it?[/say]")

			saynn("[say=rahi]W-woof.. i-intense..[/say]")

			saynn("[say=pc]Gonna do what we tell you to do?[/say]")

			saynn("[say=rahi]W-woof..[/say]")

			saynn("Sounds like a yes.")

		else:
			saynn("[say=pc]How was it, kitty cat? I'm really sorry if I went too far.[/say]")

			saynn("[say=rahi]M-meow.. s-she could take more..[/say]")

			saynn("Huh.")

		saynn("You take your time, freeing each of her limbs. Then you leash her to the pipe again before grabbing all the toys and stepping outside.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "rahi_corset"):
		processTime(5*60)

	if(_action == "rahi_bitchsuit"):
		processTime(3*60)

	if(_action == "add_blindfold"):
		processTime(3*60)

	if(_action == "corridor_bondage"):
		processTime(5*60)

	if(_action == "kait_meet"):
		processTime(5*60)

	if(_action == "avy_encounter"):
		processTime(5*60)

	if(_action == "back_to_cell_bondage"):
		processTime(15*60)

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
