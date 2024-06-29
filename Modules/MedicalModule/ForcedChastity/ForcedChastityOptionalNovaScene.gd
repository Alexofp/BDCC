extends "res://Scenes/SceneBase.gd"

var isGoodGirl = false
var isBadGirl = false
var isFuckYou = false

func _init():
	sceneID = "ForcedChastityOptionalNovaScene"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("You open your eyes and realize that this is that day again. Dimly-lit room, fancy furniture, an iron hook that your wrists are cuffed to. Looking down you see your own permanent cage. You can’t hide it, you might be kinda excited.")

		saynn("You hear footsteps..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("nova")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="nova", npc="eliza"})
		
		saynn("[say=nova]..well enough, thanks.[/say]")

		saynn("[say=eliza]I’m glad. Feel free to come get a checkup sometimes.[/say]")

		saynn("[say=nova]You know, I’d rather avoid doctors since..[/say]")

		saynn("Nova and Eliza enter the room. The husky guard instantly spots you being chained up in the middle of the room.")

		saynn("[say=nova]Oh, nevermind that. Would you look at this cutie?[/say]")

		saynn("[say=eliza]Yeah, that’s the one.[/say]")

		saynn("Nova stares at you and your cage.")

		saynn("[say=nova]I remember you. Glad they decided to keep you like that~.[/say]")

		saynn("Her comment is so humiliating it makes you blush and avoid both their gazes.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		addCharacter("nova", ["naked"])
		playAnimation(StageScene.HangingDuo, "idle", {npc="nova", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Nova approaches you and reaches out to scritch you behind the ears while you’re so helplessly positioned with all your private bits on display, including the cute metal cage on your dick.")

		saynn("[say=nova]So what am I allowed to do with this precious cutie pie?[/say]")

		saynn("[say=eliza]This patient is going through an experimental obedience training program. We’re testing how much limiting one's ability to receive penile orgasms leads to better behavior.[/say]")

		saynn("Nova chuckles and reaches out for your cage, tugging on it slightly and also checking out its locking mechanism.")

		saynn("[say=nova]Sounds a lot like you’re training buttsluts~.[/say]")

		saynn("Eliza pouts while you are forced to blush more.")

		saynn("[say=eliza]No, the entire process is scienti..[/say]")

		saynn("[say=nova]Relax~. I like the view of a locked clitty. Unless it’s mine of course~.[/say]")

		saynn("Nova brings up her wrist computer and turns off her active armor before proceeding to take off the pieces. Underneath all the metal and kevlar plates is a slick bodysuit that has a hidden zipper on it, Nova undoes it just enough to expose her sheath with a peeking canine shaft and a pussy slit hiding behind her fluffy orbs. She catches your sneaky gaze.")

		saynn("[say=nova]Don’t be ashamed, you look adorable. All you need is some training and you’re gonna be a perfect slutty girl.[/say]")

		saynn("Nova’s member is leaving its sheath and already looming over your cage, only the deflated knot is taking its time to appear. The husky teasingly rubs her shaft against yours, her pointy tip leaking precum that is slipping past your chastity and mixing in with yours.")

		saynn("[say=nova]So. You’re gonna be a good girl for me~?[/say]")

		# (Options are Good girl, Bad girl, Fuck you)

		# (Choice sets a variable)

		addButton("Good girl", "Admit that you’re, in fact, a good girl", "good_girl")
		addButton("Bad girl", "You’re a very bad girl and you’re proud of that fact", "bad_girl")
		addButton("Fuck you", "You really don’t like being called like that", "fuck_you")


	if(state == "good_girl"):
		isGoodGirl = true
		
		saynn("[say=pc]I’m gonna be a good girl..[/say]")

		saynn("Nove hears your soft voice and puts on a smug grin, her paw reaches out for your cage again and rubs it. You don’t feel a thing..")

		saynn("[say=nova]That’s a good choice~. Despite their locked clits, good girls are the only girls that get to cum~. Right, sweetie?[/say]")

		saynn("You nod subtly. Nova doesn’t react so you nod more. But she still ignores your attempts at non-verbal communication.")

		saynn("[say=pc]Huff.. Only good girls cum, yes..[/say]")

		saynn("This time Nova acknowledges you and strokes her cock some more to make it leak more pre onto your locked clit.")

		saynn("[say=nova]Sweet~.[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "bad_girl"):
		isBadGirl = true
		
		saynn("[say=pc]What if I’m a bad girl?[/say]")

		saynn("Nova hears your bratty tone and puts on a smug grin, her paw reaches out for your cage again and rubs it. You don’t feel a thing..")

		saynn("[say=nova]That’s an acceptable choice~. Just bear in mind, only good girls are the girls that get to cum~. Your clitty being locked is to make sure you don’t cheat~.[/say]")

		saynn("Well that’s just unfair. You fill your cheeks with air, pouting, while Nova plays with your cage more.")

		saynn("[say=pc]I will cum anytime and any way I want![/say]")

		saynn("[say=nova]No you won’t~[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "fuck_you"):
		isFuckYou = true
		
		saynn("[say=pc]Don’t call me that, fuck you![/say]")

		saynn("Nova raises a brow, her smile looks slightly more cold, her paw reaches out for your cage again and squeezes it. Luckily, you don’t feel a thing..")

		saynn("[say=nova]You look like a girl to me, sweetie. A very naughty bad girl that has forgotten her place.[/say]")

		saynn("You grit your teeth and soon Nova reaches out to grab a stun baton from her belt.")

		saynn("[say=nova]A bad slut I would say. Begging to be punished. You’d rather be fucked with a pain stick, right? I can turn it on during the last second before your orgasm, is that what your silly head wants?[/say]")

		saynn("That sounds incredibly painful, who would do such a thing? You growl at her words but then shake your head.")

		saynn("[say=nova]Don’t make me torture such a cutie. Obeying is so much more fun~.[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.HangingSex, "tease", {npc="nova", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Nova slowly walks around you and positions herself behind, her paw gives your {pc.thick} butt a firm smack, sending it to bounce.")

		saynn("[say=nova]Well then, time to breed a cutie.[/say]")

		saynn("She traps her canine member between your buttcheeks and starts sliding it up and down, hotdogging your ass, you feel a warm drop of precum landing on your star. Nova slowly angles herself, trying to make her pointy tip find your tailhole and stretch without guiding it. You feel her succeeding but you’re dry down there, making full penetration pretty much impossible. It sure is arousing though.")

		saynn("[say=nova]Hmm, let me check how wet you are, slut~.[/say]")

		saynn("Nova reaches her paw out and lands it on your cage again, finding that you’ve been producing precum for the last few minutes already. The husky smiles and catches some of it onto her paw before spreading it over her length and rubbing the rest into your {pc.analStretch} fuckhole.")

		saynn("[say=nova]So cute~. Now try to relax and let mommy take it from you.[/say]")

		saynn("You can’t help it, your butthole instinctively clenches while Nova tries to shove her cock inside. But eventually she finds a good moment and just thrusts forward, forcing your hole wide open. A muffled noise escapes from your lips, you have a dickgirl’s dick inside you.")

		# (if good girl)
		if(isGoodGirl):
			saynn("[say=nova]Such a good girl indeed~.[/say]")

		# (if bad girl)
		if(isBadGirl):
			saynn("[say=nova]You’re pretty willing for a bad girl. Maybe you’re just very bratty~.[/say]")

		# (if fuck you)
		if(isFuckYou):
			saynn("[say=nova]Look, you said fuck me but I’m fucking you now~.[/say]")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		playAnimation(StageScene.HangingSex, "sex", {npc="nova", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Nova lets you get used to her cock before trying to pull it out. The pointy canine tip of a cock almost leaves your butt before Nova thrusts inside again, with a perfect angle to hit your pleasure spot and make you curl your toes.")

		saynn("She quickly picks up the pace, pounding your slutty ass while holding her paws on your hips. Very soon you begin to drop more muffled noises of pleasure, your own cock desperately failing at getting hard.")

		saynn("[say=nova]Oh yeah, that’s a butt worth breeding for sure~.[/say]")

		saynn("She leans in and reaches for your {pc.breasts} with one paw, teasing your perky nipples while rocking her hips, her husky tail actively wagging behind her.")

		# (if good girl)
		if(isGoodGirl):
			saynn("[say=nova]And since you proved to be such a good girl, I will let you cum~. Just warn me.[/say]")

			saynn("[say=pc]hh-h.. yes.. of course.[/say]")

		# (if bad girl)
		if(isBadGirl):
			saynn("[say=nova]It’s not too late to change your mind, cutie~. But you must warn me before you cum.[/say]")

		# (if fuck you)
		if(isFuckYou):
			saynn("[say=nova]You’ve been so naughty that I don’t know if I should let you cum at all. But you can try asking.[/say]")

		saynn("Nova picks up the pace even more, pounding you so fast that her balls smack against yours. Her knot starts to inflate and doesn’t fit inside you anymore. She tugs on your nipple so much that you part your lips and let out a passionate noise. You feel like you’re gonna cum but you can’t, you need something big to happen..")

		# (Options are Beg to cum and Demand)

		addButton("Beg to cum", "Warn Nova that you’re about to cum and really want to", "beg_to_cum")
		addButton("Demand", "Tell her that you must cum", "demand")


	if(state == "beg_to_cum"):
		playAnimation(StageScene.HangingSex, "fast", {npc="nova", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("[say=pc]Please, I’m very close! I wanna cum! I’m a good girl, I will do anything![/say]")

		saynn("Nova lets out a playful growl.")

		# (if good girl)
		if(isGoodGirl):
			saynn("[say=nova]Well then, let’s see how much you can handle.[/say]")

		# (if bad girl)
		if(isBadGirl):
			saynn("[say=nova]Oh, you’re not a bad girl anymore~? Good.[/say]")

		# (if fuck you)
		if(isFuckYou):
			saynn("[say=nova]What happened to your old attitude~? Guess my cock does wonders to sluts like you.[/say]")

		saynn("She starts pounding your ass hard, her knot slapping against your star until suddenly slipping inside, tying you two together. Sharp sensations rock through your body, sending it to squirm, Nova’s cock is fully inside you! The meaty orb is pressing on the prostate, causing your cock to suddenly start shooting weak lines of {pc.cum}.")

		saynn("Your clenching brings Nova over the edge real fast. You hear her grunt as her canine cock starts pumping your ass full of her seed. So much that your belly receives a cute little bump while the knot keeps most of it from spilling out.")

		saynn("[say=nova]There.. we go. Ohh, you’re enjoying yourself a little too much over here~.[/say]")

		saynn("You can’t even say a word, your mind is blanking from all the pleasure, there is a constant weak flow of {pc.cum} as her orb continues to massage your p-spot.")

		saynn("You’re stuck together for quite a while. At least ten minutes.")

		saynn("[say=eliza]Did you really have to knot {pc.him}? Time is limited.[/say]")

		saynn("[say=nova]No but do you want your experiment to succeed~?[/say]")

		addButton("Continue", "Cum Cum Cum..", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.HangingSex, "tease", {npc="nova", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Finally the knot deflates enough for Nova to yank her cock out, leaving your gaping used hole to leak sticky stuff.")

		saynn("[say=nova]Keep at it and you’re gonna become a great knot slut.[/say]")

		saynn("She slaps your butt again, causing your butt to gush cum.")

		saynn("And with that, Nova grabs her things and leaves, leaving you alone with Eliza and all the mess. Doctor gets up and snaps her fingers in front of your face.")

		saynn("[say=eliza]You with me, patient? Heh. You should see your face.[/say]")

		saynn("She begins to uncuff you and carefully sets you down onto the floor. Your legs don’t wanna listen though, you barely find the wall to hold onto while Eliza guides you out the room.")

		saynn("[say=eliza]Well, go get some rest. See you around~.[/say]")

		# (scene ends)
		addButton("Continue", "That was something", "endthescene")

	if(state == "demand"):
		playAnimation(StageScene.HangingSex, "fast", {npc="nova", npcCum=true, bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("[say=pc]Don’t stop, I need it. I must cum now.. I really want to.[/say]")

		saynn("Nova lets out a playful growl.")

		# (if good girl)
		if(isGoodGirl):
			saynn("[say=nova]You telling me what I should do now? Big mistake~.[/say]")

		# (if bad girl)
		if(isBadGirl):
			saynn("[say=nova]But you’re a bad girl~.[/say]")

		# (if fuck you)
		if(isFuckYou):
			saynn("[say=nova]What happened to your old attitude, slut~?[/say]")

		saynn("She starts pounding your ass hard, her knot slapping against your star but she intentionally keeps herself from knotting you. It feels really-really good, you feel like your prostate is full and just needs one huge squeeze but Nova is relentless.")

		saynn("Your desperate clenching brings Nova over the edge real fast though, you hear her grunt as her canine cock starts pumping your ass full of her seed. So much that your belly receives a cute little bump.")

		saynn("[say=nova]There.. we go. Think about your behavior with my seed up your butt.[/say]")

		saynn("Even though you didn’t receive a wet orgasm, your mind is blanking from all the pleasure, there is a constant weak flow of precum and prostate juices coming from your locked up dick. Nova waits until her balls are dry before yanking her cock out, letting your hole to gape and leak her seed.")

		addButton("Continue", "See what happens next", "afterdemand")
	if(state == "afterdemand"):
		playAnimation(StageScene.HangingSex, "tease", {npc="nova", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Nova slaps your butt again, causing your butt to gush cum.")

		saynn("[say=nova]You are a great fucktoy though, sweetie. Hope you learned your lesson.[/say]")

		saynn("And with that, Nova grabs her things and leaves, leaving you alone with Eliza and all the mess. Doctor gets up and snaps her fingers in front of your face.")

		saynn("[say=eliza]Doing alright, patient? You look spaced out.[/say]")

		saynn("She begins to uncuff you and carefully sets you down onto the floor. Your legs don’t wanna listen though, you barely find the wall to hold onto while Eliza guides you out the room.")

		saynn("[say=eliza]Well, go get some rest now. See you around~.[/say]")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "beg_to_cum"):
		GM.pc.cummedInAnusBy("nova")
		GM.pc.orgasmFrom("nova")
		GM.pc.gotAnusFuckedBy("nova")
	
	if(_action == "continue4"):
		processTime(RNG.randi_range(3,8)*60)
		GM.pc.gotAnusFuckedBy("nova")

	if(_action == "demand"):
		GM.pc.cummedInAnusBy("nova")
		GM.pc.addLust(100)
		GM.pc.gotAnusFuckedBy("nova")

	if(_action == "endthescene"):
		GM.pc.setLocation("medical_nearconfessionary")
		endScene()
		return
		
	if(_action in ["fuck_you", "demand"]):
		increaseFlag("MedicalModule.Chastity_OptionalBadBehavourCounter")
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["isGoodGirl"] = isGoodGirl
	data["isBadGirl"] = isBadGirl
	data["isFuckYou"] = isFuckYou
	
	return data
	
func loadData(data):
	.loadData(data)
	
	isGoodGirl = SAVE.loadVar(data, "isGoodGirl", false)
	isBadGirl = SAVE.loadVar(data, "isBadGirl", false)
	isFuckYou = SAVE.loadVar(data, "isFuckYou", false)

func getDevCommentary():
	return "Nova's optional scene is probably the most.. sissification-like. Why? Well, why not x3. Might as well explore that concept a little bit. And Nova fits for that role pretty well."

func hasDevCommentary():
	return true
