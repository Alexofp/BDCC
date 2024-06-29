extends "res://Scenes/SceneBase.gd"

var howMuchMilked = 10.0

func _init():
	sceneID = "ForcedChastityOptionalElizaScene"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("You open your eyes and realize that this is that day again. Dimly-lit room, fancy furniture, an iron hook that your wrists are cuffed to. Looking down you see your own permanent cage. You can’t hide it, you might be kinda excited.")

		saynn("You hear familiar footsteps..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("eliza")
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		
		saynn("Eliza walks in with the usual coffee mug in her paw. She sees you and stops to admire your body and the obvious restraint locked around your member.")

		saynn("[say=eliza]Just can’t get enough of this view.[/say]")

		saynn("She sips some life juice and sets the mug on the little round table.")

		saynn("[say=eliza]So you have chosen me. And I’m curious.[/say]")

		saynn("Doctor puts on her cunning smile before approaching you, her paw lands on your chin and scritches gently. Her voice switches to a much softer tone.")

		saynn("[say=eliza]Why~?[/say]")

		# (Options are Beautiful, Assertive, Familiar, Had no choice)

		addButton("Beautiful", "Tell her that she is nice", "beautiful")
		addButton("Assertive", "Tell her that you like the way she handles you", "assertive")
		addButton("Familiar", "Tell her that you got used to her being around", "familiar")
		addButton("Had no choice", "Tell you that you had no choice", "had_no_choice")


	if(state == "beautiful"):
		saynn("[say=pc]Because you’re a beautiful woman.[/say]")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]Well thank you, I think you will enjoy today’s session very much then.[/say]")

		saynn("She pulls her paw away and is about to turn away but then looks at you again.")

		saynn("[say=eliza]If there was someone else in my shoes, much less beautiful, you wouldn’t like it?[/say]")

		saynn("That's one tough question.")

		saynn("[say=pc]Things would be different..[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]Good thing I’m not wearing any shoes~.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "assertive"):
		saynn("[say=pc]I like how assertive you are. Taking what you want.[/say]")

		saynn("Her smile widens as she keeps scritching you under the chin.")

		saynn("[say=eliza]Wanna know the secret?[/say]")

		saynn("You nod subtly.")

		saynn("[say=eliza]You do, don’t you? Well, show how much you wanna know it by obeying and maybe you will find out~.[/say]")

		saynn("What a tease.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "familiar"):
		saynn("[say=pc]I just.. got used to this? To you? Can’t say I loved how it all started but it grew on me.[/say]")

		saynn("Eliza stares directly into your eyes, being silent for a few seconds as she tries to drill through you with her gaze.")

		saynn("[say=eliza]That’s..[/say]")

		saynn("Some more seconds pass.")

		saynn("[say=eliza]That’s exactly what I was looking for.[/say]")

		saynn("She offers you a cute little smile.")

		saynn("[say=eliza]You know. This started just as a little experiment. But it grew on me too.[/say]")

		saynn("Doctor leans in to give you a little kiss on the nose.")
		
		addButton("Continue", "See what happens next", "continue1")


	if(state == "had_no_choice"):
		saynn("[say=pc]I didn’t have much of a choice, you know.[/say]")

		saynn("Doctor’s cunning smile shines brightly, she tilts her head slightly while scritching your chin more. With her claw this time.")

		saynn("[say=eliza]I will give you a choice, don’t worry. The biggest choice of your life~. You will just have to wait a little longer.[/say]")

		saynn("She leans in closer and shows off her sharp fangs.")

		saynn("[say=eliza]Can’t stop now after all you and I went through together, can we~?[/say]")

		saynn("You open your mouth to say something but Eliza holds a paw up to your lips.")

		saynn("[say=eliza]Just trust me on this one.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		addCharacter("eliza", ["naked"])
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}, npcBodyState={underwear=true}})
		
		saynn("Eliza takes a few steps away from you and starts undressing. She starts with her lab coat, dropping it on the fancy chair and exposing her sleeveless top and a knee length shirt. Her back is turned towards you so you only see her beautiful pastel-colored fur and the back side of her black bra as she takes off her top. That messes with her ponytail so she quickly fixes it with another band before giving you a glance without turning around fully.")

		saynn("[say=eliza]Hope you’re as excited as I am~.[/say]")

		saynn("She sways her girly hips slightly as she sneaks two digits under her skirt and proceeds to pull it down. The first thing that gets exposed is her gorgeous black garter that is connected to her transparent tights and has a fancy lace pattern on it. Then you see her black panties that are of the same style, the whole set fits and compliments her curves really well.")

		saynn("After being in just her sexy underwear, Eliza turns out and lets you take a look at her from all angles. The beauty of her long feline legs is emphasized by the tights that she is wearing. The black cloth contrasts with her fur but doesn’t overshadow it. You can’t deny that she came prepared.")

		saynn("[say=eliza]Hey there~[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		saynn("She walks up to you again, taking her time and making sure to sway her behind in a very feminine way. Her paw lands on your torso and then begins tracing your body while Eliza steps around you.")

		saynn("[say=eliza]I never fuck anyone.[/say]")

		saynn("Her paw brushes over your {pc.breasts} too, giving each your nipple some attention while Eliza gently nuzzles your cheek. She starts purring into your ear.")

		saynn("[say=eliza]You know what I do?[/say]")

		saynn("Her paw slides down your {pc.masc} curves and lands on your cage, her digits rubbing the metal before reaching for your balls and softly groping them. She playfully bites your ear before breathing warmly into it.")

		saynn("[say=eliza]I make love.[/say]")

		addButton("Continue", "See what happens next", "giveelizastrapon")

	if(state == "giveelizastrapon"):
		# (add strapon)

		saynn("She licks the same ear that she has bit before pulling away from you and jugging towards the sofa. The sofa that has some kind of crate on it. Eliza opens it, revealing that its contents consist of all sorts of sex toys, strapons and tubes of lube. Quite an impressive selection.")

		saynn("[say=eliza]Hmm.. This one.[/say]")

		saynn("Eliza grabs one of the strapons, the one that isn’t designed to rearrange your insides but to make love. She quickly secures it around her crotch and grabs a tube of lube.")

		saynn("[say=eliza]I’m gonna peg you with this. And you’re gonna love it~.[/say]")

		saynn("You feel some pressure behind your cage already just hearing those words. But before Eliza approaches you, she grabs the small round table and moves it near your legs. She then places an empty glass on it, right under your cage.")

		saynn("[say=eliza]I can’t, I just love milking too much~[/say]")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.HangingSex, "sex", {npc="eliza", bodyState={naked=true}, npcBodyState={underwear=true}})
		
		saynn("Half-naked Eliza finally takes a spot behind you. She grabs some of the lube onto her digits and begins rubbing it into your star. The sudden sensations make you clench and shake a little. But her touch is soft and soothing, very soon you relax enough for her to slip a digit inside and lube you up there too.")

		saynn("[say=eliza]I will stop if it hurts.[/say]")

		saynn("She aligns the tip of the rubber strapon against your tailhole and starts to teasingly rub it, doing little circular motions until she feels it slipping past your star on its own. She is truly being gentle with you, her paw moving to your hips and thighs, caressing them while she slowly lets the rubber shaft explore your deeper. It quickly found the prostate and applied some pressure on it, causing you to arch your back and produce a noise.")

		saynn("Eliza purrs seeing that has found your spot, she kisses your shoulder while moving her hips back and forth at a very slow pace, almost pulling out before going slightly deeper each time, stretching your hole out like that.")

		saynn("[say=eliza]Make sure to show me how much you like it~.[/say]")

		saynn("You don’t even have to show it on purpose, her stimulating your pleasure spot causes you to start dripping precum into that glass under your cage. Eliza feels your clenching around the rubber toy and slowly picks up the pace. Very soon you find yourself panting deeply.")

		saynn("Doctor Quinn leans closer and lets you feel the fabric of her bra as she pegs your {pc.analStretch} butt. She keeps purring into your ear while thrusting inside you, so lewd. The room smells of sex.")

		saynn("[say=eliza]A little faster~?[/say]")

		addButton("Yes", "Well, why stop now", "yes")

	if(state == "yes"):
		playAnimation(StageScene.HangingSex, "fast", {npc="eliza", bodyState={naked=true}, npcBodyState={underwear=true}})
		
		saynn("You part your lips to say something but instead just throw your head back and moan. And that was enough for Eliza to grab onto your {pc.thick} butt harder and start rocking her hips at a faster pace.")

		saynn("Each thrust leads to her smashing your little pleasure spot. Your prostate slowly inflates and becomes more sensitive as you are being pegged. The glass slowly gets filled with more and more of your precum. You’re completely helpless under her onslaught and you love it. You love how much passion Eliza puts into pounding your butt. The more you focus on this feeling of being pegged, the more pleasurable it becomes. At some point you can’t stop moaning, you rattle the chains as you are getting very close or so it seems. The stimulation you get from this is unlike any kind of vanilla sex.")

		saynn("[say=eliza]Cum for me, like a good patient~.[/say]")

		saynn("The pressure in your cage is at its max, you feel her strapon slowly sending you over the edge..")

		addButton("Cum", "Might as well..", "cum")

	if(state == "cum"):
		playAnimation(StageScene.HangingSex, "tease", {npc="eliza", pcCum=true, bodyState={naked=true}, npcBodyState={underwear=true}})
		
		saynn("You keep your mouth open as you produce long passionate noises of love, your whole body starts trying to squirm around the doctor's fake cock as it milks your prostate. Your dick starts leaking {pc.cum} each time she thrusts her hips. And the more she does it, the bigger the flow. Cumming hands free is always so strange, it goes against nature in every way. But it also feels so right, why would we have a spot that makes us feel good and not use it for our pleasure.")

		saynn("The glass is about half full when Eliza stops moving her hips. The afterglow feeling is already making your legs feel weak. You pant and produce weak soft moans while Eliza rubs against you. She also reaches out to grab the glass.")

		saynn("[say=eliza]Very good, look at you~. Wanna have a taste?[/say]")

		addButton("Nod", "Drink your own seed", "nod")
		addButton("Shake head", "You’d rather not", "shake_head")

	if(state == "nod"):
		saynn("You nod and stick your tongue out. Eliza brings the glass to your mouth and tilts it, letting the sticky hot substance ooze down and land onto your tongue. You start swallowing it and eagerly reaching out for more, the taste of your own {pc.cum} is so arousing.")

		saynn("[say=eliza]Yeah~. That’s the best way to get used to this.[/say]")

		addButton("Continue", "See what happens next", "continue5")

	if(state == "shake_head"):
		saynn("You shake your head, refusing to do this humiliating task. Eliza giggles softly.")

		saynn("[say=eliza]That’s fair. Well, I will store it. We have an entire system for this~[/say]")

		addButton("Continue", "See what happens next", "continue5")

	if(state == "continue5"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true}})
		
		saynn("Eliza slowly pulls out of your butt, letting your tailhole to close all neatly. Then she takes a spot in front of you before pulling your chin in for a kiss. For quite a deep kiss in fact, she manages to slip her rough feline tongue inside your mouth and start playing with yours, exchanging saliva.")

		saynn("Then she puts the table back to its spot and takes off her strapon.")

		saynn("[say=eliza]Well, hope you liked it~.[/say]")

		saynn("She starts putting on her clothes back.")

		saynn("[say=eliza]I sure did. Sometimes I even think this is better than my old job.[/say]")

		saynn("She puts on her lab coat and unchains you from the ceiling. The afterglow keeps your whole body barely standing.")

		saynn("[say=eliza]Easy there~. I still need you for my research.[/say]")

		addButton("Leave", "Time to go", "leave")

	if(state == "leave"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		
		saynn("Eliza brings you out into the corridor and scratches you behind the head.")

		saynn("[say=eliza]See you in five days~.[/say]")

		saynn("And just like that, she leaves you be.")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "giveelizastrapon"):
		var eliza = getCharacter("eliza")
		eliza.getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)
		eliza.getInventory().removeItemFromSlot(InventorySlot.Body)
		eliza.getInventory().equipItem(GlobalRegistry.createItem("Strapon"))

	if(_action == "continue5"):
		getCharacter("eliza").resetEquipment()

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "cum"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 20)
		howMuchMilked = GM.pc.milkSeed()
		GM.pc.orgasmFrom("eliza")

	if(_action == "nod"):
		var thebodypart = GM.pc.getBodypart(BodypartSlot.Head)
		if(thebodypart != null):
			thebodypart.addFluidOrifice(GM.pc.getFluidType(FluidSource.Penis), howMuchMilked, GM.pc.getFluidDNA(FluidSource.Penis))
		
	if(_action in ["had_no_choice", "shake_head"]):
		increaseFlag("MedicalModule.Chastity_OptionalBadBehavourCounter")

	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["howMuchMilked"] = howMuchMilked
	
	return data
	
func loadData(data):
	.loadData(data)
	
	howMuchMilked = SAVE.loadVar(data, "howMuchMilked", 10.0)

func getDevCommentary():
	return "I thought the idea of drinking your own cum is kinda cute x3. That's why I used it two times even, heh. But basically I just needed something extra for Eliza to do and couldn't come up with anything interesting x3"

func hasDevCommentary():
	return true
