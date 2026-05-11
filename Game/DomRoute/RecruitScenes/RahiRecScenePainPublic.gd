extends RecruitSceneBase

var gentle = false
var mean = false

func _init():
	sceneID = "RahiRecScenePainPublic"

func _run():
	if(state == ""):
		addCharacter("rahi")
		gentle = (c1 == 0)
		mean = (c1 == 2)
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You will need some things for what you are about to do. You ask Kait and Ans.. and luckily they have it! Perks of having a team.")

		saynn("After that, you enter Rahi's cell and grab her leash before bringing her closer to the middle of the cell.")

		saynn("[say=pc]"+str(ch1("Our team only needs brave people. I'm going to test your pain tolerance. Trust me, okay?", "Our team only needs brave people. So I'm gonna test how well you handle pain. Understand?", "Our team has no place for cowards. I'm gonna test how well you handle pain. Understand?"))+"[/say]")

		saynn("Rahi blinks and then swallows audibly.")

		saynn("[say=rahi]She.. she is not sure..[/say]")

		saynn("You increase the grip on the leash.")

		saynn("[say=pc]"+str(ch1("I won't do anything that you can't handle. I will be gentle. Now, let's get those clothes off..", "You will have to trust me, kitty cat. Now, clothes off.", "Too bad, if you're not a painslut yet, you will have to become one. Strip. Everything. Or I'll tear them off myself."))+"[/say]")

		saynn("You watch as her paws begin to unbutton her shirt. She reveals her perky chest to you, her nips catching the slight cold breeze. Her shorts are next, she uses her claws to catch the waistband and tug down on it, revealing her cute little pink flower.")

		saynn("Rahi stands still as you begin to circle her slowly, your digits tracing her waist, her spine, her shoulder.. before reaching towards her chest to pinch a nipple. Rahi gasps, her back arching.")

		saynn("[say=rahi]Ah.. m-meow..[/say]")

		saynn("Before she can even fully recover, you reach around and spank one of her butt cheeks, sending a loud smack to echo around the cell. Then you spank the other cheek. Rahi yelps, her tail curling up.")

		saynn("[say=pc]"+str(ch1("Shh, you're doing beautifully.", "Too much? I bet you can take more.", "You'll take twenty more if I feel like it."))+"[/say]")

		saynn("Your hand slides between her legs, fingers finding her clit. At first, you just play with it, flicking the sensitive bean left and right.. before squeezing it between your digits.. not hard.. but enough to make her whimper.")

		saynn("[say=rahi]..mmh-..[/say]")

		saynn("Your free hand reaches behind her, scritching the area at the base of her tail, causing Rahi's knees to wobble. Looks like that's a sensitive spot.")

		saynn("[say=rahi]Ah.h..[/say]")

		saynn("You pull your hand away from her clit and spank her butt again, making the feline produce noises of pain again.")

		saynn("[say=rahi]Ah.. p-please.. she is sorry..[/say]")

		saynn("[say=pc]"+str(ch1("Nothing to be sorry about. This is just training. Now let's go for a walk.", "It's okay, kitty. Just try to endure. Let's switch the scenery.", "We're just getting started, little paintoy."))+"[/say]")

		addButton("Continue", "See what happens next", "near_arena")
	if(state == "near_arena"):
		aimCameraAndSetLocName("fight_corner_ne")
		saynn("You lead Rahi out of the secret hideout and towards the roaring crowd of the arena. There is a juicy fight happening at the moment so they aren't paying that much attention to their surroundings. Rahi's paws shuffle across the cold floor, her tail covering her privates, her chin low. She tries to avoid pulling any attention.")

		saynn("You stop a few meters away from most people.. and produce a little item. It's a cat tail whip.. a slender flexible rod that splits into many short ropes with knots at their ends. Rahi's eyes go wide.")

		saynn("[say=rahi]Oh.. uh.. maybe it's not..[/say]")

		saynn("[say=pc]"+str(ch1("I will be gentle. Please show me your butt.", "Butt or breasts, it's your choice. Butt is less painful.", "You're getting whipped, kitty. Question is how much."))+"[/say]")

		saynn("Rahi trembles.. but nods. She turns around, planting her rear paws firmly and presenting her rear to you.. No reason to waste any more time.")

		saynn("Crack! The first strike lands across her buttocks, making Rahi jump and yelp. You didn't even put that much effort into it, this was mostly from her anxiety.")

		saynn("Crack! Another, just below the first. This one did hurt a bit, Rahi is whimpering quietly. A few heads are turning, you seem to be catching some glimpses from the crowd.")

		saynn("[say=rahi]Hnn.. ah..![/say]")

		saynn("[say=pc]"+str(ch1("Be a good kitty and turn around.", "Turn around, please.", "Turn around, little slut."))+"[/say]")

		saynn("Rahi obeys.. but as soon as you raise the whip, she is quick to cover up her chest.")

		saynn("[say=pc]"+str(ch1("If I'm asking for too much, just let me know, kitty. Otherwise.. please?", "Rahi, please, I don't wanna hit your hands. It will hurt like hell.", "I give you three seconds before I smack your hands."))+"[/say]")

		saynn("[say=rahi]M-meow..[/say]")

		saynn("She slowly reveals her chest to you again, her stiff nips bobbing up and down from her panting softly.")

		saynn("You adjust your aim.. and let the many ropes land sting all over her breasts. Rahi cries out as her nips get caught by some of the impact.")

		saynn("[say=rahi]Ahh..[/say]")

		saynn("And so you continue, stepping around the feline. Her butt receives a few more strikes, causing lots of little red stripes to start showing up. Rahi squirms in place.. her paws really want to cover her butt up.. but she is smart enough to not do that.")

		saynn("More and more inmates begin to watch the show. You hear some cheering happening.. directed toward you.")

		saynn("You target her breasts again.. two quick flicks that make her jolt. Then you crouch, aim between her legs, and deliver a single strike directly to her exposed pussy. You didn't put any strength into that one.. but it was still sharp.")

		saynn("Rahi throws her head back and screams, her whole body convulses, her legs shaking. You notice a shiny wetness coating her inner thighs.")

		saynn("[say=rahi]S-she.. hh.. ahh.. c-can't..[/say]")

		saynn("The crowd really likes the show, people are pointing at the poor squirming kitty.")

		saynn("[say=pc]"+str(ch1("Almost done. You've been very brave. Just a bit more?", "They're watching you. Just a bit more and we can go back.", "They're enjoying your suffering, slut. Wave your tail for them."))+"[/say]")

		saynn("You whip her breasts a few more times, trying to be gentle, spreading the impacts, causing more and more red stripes all over her. Rahi's nips look way more red now.. just like her sensitive flower.")

		saynn("[say=rahi]Mmh.. t-too much..[/say]")

		saynn("You see some tears gathering. Looks like she had enough indeed.")

		saynn("[say=pc]"+str(ch1("All right. Let's get you back.", "That's enough then. Follow.", "Alright, you've satisfied the crowd."))+"[/say]")

		saynn("You grab her leash again and invite her to follow. Rahi tries to cover herself.. but she hisses the moment she tries herself.. anywhere.")

		saynn("[say=rahi]..ow.. ow..[/say]")

		addButton("Continue", "See what happens next", "back_to_cell")
	if(state == "back_to_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={leashedBy="pc", naked=true}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You bring Rahi back into the cell. The chain is tied around the pipe again. She is still painting, tears streaking down her face. Her whole body shivers.")

		saynn("You knew that something like this would happen so you asked for a cooling gel.. the thing says that it has aloe and something numbing.. good enough. You approach the kitty and begin applying it gently to her butt.. her breasts.. the sensitive spot between her legs. Rahi flinches at first.. but then sighs as the sting starts to fade.")

		saynn("[say=rahi]T-thank you..[/say]")

		saynn("[say=pc]"+str(ch1("Of course. You did wonderfully.", "You earned it, kitty.", "Don't thank me. Just remember who you are."))+"[/say]")

		saynn("You finish applying the gel and step back.")

		saynn("[say=rahi]That.. was too much.. the whole thing..[/say]")

		saynn("Yeah, looks like she is not a fan of this.")

		saynn("You step out of the cell to see what Kait thinks..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_arena"):
		processTime(3*60)

	if(_action == "back_to_cell"):
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
