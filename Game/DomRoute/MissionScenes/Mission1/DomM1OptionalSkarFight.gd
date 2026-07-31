extends SceneBase

var isVag = false

func _init():
	sceneID = "DomM1OptionalSkarFight"

func _run():
	if(state == ""):
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="skar"})
		saynn("You boldly walk towards the guard who is protecting the big office.")

		saynn("It doesn't take long before he takes note of you. His prosthetic arm is quick to reach for his weapon.")

		saynn("[say=skar]You're not supposed to be here.[/say]")

		saynn("[say=pc]You look bored. Thought I'd offer you some company.[/say]")

		saynn("You spread your arms, a gesture of peace. The guy lowers his gaze a bit, his mechanical jaw moving as he speaks, sprinkling noises of servos into his speech.")

		saynn("[say=skar]Do I look like I need company?[/say]")

		saynn("[say=pc]Yeah, you look bored.[/say]")

		saynn("He raises a brow.")

		saynn("[say=skar]Why shouldn't I just fry your neck right now?[/say]")

		saynn("[say=pc]Because that would be the boring option.[/say]")

		saynn("He stays quiet for some time.")

		saynn("[say=skar]Alright, let's have some fun then.[/say]")

		saynn("Looks like it's a fight!")

		addButton("Fight", "Start the fight", "dom_start_fight")
	if(state == "lost_fight"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("solitary_cell")
		saynn("You've lost the fight!")

		saynn("[say=skar]You might have to work on your technique more.[/say]")

		saynn("And so the guy just throws you into solitary after that.")

		saynn("You didn't get any records printed. Looks like you will have to do it all again.")

		saynn("At least you entertained the guard for a bit.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")
	if(state == "won_fight"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="skar"})
		saynn("Miraculously, you've won the fight! The guard is down on the floor, unable to continue fighting.")

		saynn("[say=skar]Ugh.. You won't be able to get to the captain anyway, you know?[/say]")

		saynn("Yeah, looks like this guy is protecting the captain's office. That's nice. But the doors are indeed closed. That's not as nice.")

		addButton("Just leave", "Leave the guard be", "just_leave")
		addButtonWithChecks("Ride (vaginal)", "Might as well ride his cock now!", "start_vag_ride", [], [[ButtonChecks.HasReachableVagina]])
		addButton("Ride (anal)", "Might as well ride his cock now!", "start_anal_ride")
		addButtonWithChecks("Fuck him", "Rail his ass!", "start_fuck_him", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "just_leave"):
		playAnimation(StageScene.Solo, "stand")
		saynn("[say=pc]Oh well, enjoy your boring life then.[/say]")

		saynn("He tilts his head slightly, watching as you step out of the room.")

		addButton("Continue", "See what happens next", "endsceneposourselves")
	if(state == "start_sex_ride"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Who said I wanted to get to the captain? I just wanted to have some fun with you.[/say]")

		saynn("You straddle the guy before he can ever get up, pinning him into the cold floor again. Your hands begin stripping the pieces of his armor. At some point it becomes hard to distinguish them from his mechanical bodyparts.")

		saynn("[say=skar]You're getting yourself into some big trouble.[/say]")

		saynn("[say=pc]What? You're gonna abandon your post and come find me later? Sounds fun.[/say]")

		saynn("[say=skar]Mh.[/say]")

		saynn("After some time, you finally got to his briefs! Pulling them off reveals his sheath. At least his cock isn't made out of cold metal.")

		saynn("[say=skar]Just go grab a lilac, I'm not a fucktoy.[/say]")

		saynn("[say=pc]Shush, fucktoy.[/say]")

		saynn("You rub his sheath, causing his member to slowly start sliding out. The red pointy tip is first, a lonely drop of his pre already shining at the top.")

		saynn("The guy doesn't seem to resist as you get him nice and hard, gently stroking his cock until you see the full length of his red rocket.")

		saynn("Then.. you position yourself over him, your "+str("slick pussy lips" if isVag else "needy anal ring")+" already brushing against the tip of his cock. He sucks in a sharp breath.. the servos whirring softly. You're just teasing him at first, letting his tip prod your entrance.. before eventually pulling away. His hips twitch involuntarily.")

		saynn("[say=skar]Rubber?[/say]")

		saynn("[say=pc]Shut the fuck up.[/say]")

		if (!isVag):
			saynn("You do use some of his pre-cum as lube though, massaging it into your tailhole..")

		addButton("Continue", "See what happens next", "sex_ride")
	if(state == "sex_ride"):
		playAnimation(StageScene.SexCowgirlAmazon, "sex", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Slowly, you begin to sink down along his length, inch by inch. His cock feels hot.. the tip stretching you perfectly, his veins brushing against your sensitive walls.")

		saynn("[say=skar]Nnh..[/say]")

		saynn("He is twitching inside you, kinda cute. The base of his member isn't as fat at the moment so you manage to get most of his length inside. That's when you start riding him, bringing yourself up and down, his pre coating your "+str("pussy while your juices are coating his dick in return" if isVag else "inner walls")+".")

		saynn("Now that you're moving, it gives you some time to check his body out. Anywhere you look.. there are old unhealed wounds.. scars if you will. His arms and his jaw are the obvious exceptions.. but even they got quite scratched up.")

		saynn("[say=pc]You have a nice cock.[/say]")

		saynn("[say=skar]Thanks..[/say]")

		saynn("He grunts as your "+str("pussy" if isVag else "ass")+" clenches around him. You keep rocking your hips back and forth , letting him feel every part of it. The shaft stimulates your pleasure spot"+str(" while the tip gives your organic barricade an occasional kiss" if isVag else " pretty well")+".")

		saynn("He's getting harder. Thicker. The base of his cock begins to swell.. his knot growing as you ride him.")

		addButton("Faster", "Ride him faster", "ride_faster")
	if(state == "ride_faster"):
		playAnimation(StageScene.SexCowgirlAmazon, "fast", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pick up the pace, your thighs smacking against his hips, the sound echoing off the walls.")

		saynn("[say=skar]Nhh.. fuck.[/say]")

		saynn("He tilts his head back, the mechanical jaw hangs slightly open, a low pant escaping him.")

		saynn("Now you're bouncing on him! His cock slides in and out, slick"+str(" with your juices" if isVag else " and twitching")+". The knot is fully formed now.. a thick orb that slaps against your entrance, too fat to fit inside.")

		saynn("[say=skar]You're not gonna fit it..[/say]")

		saynn("You're close..")

		addButton("Get knotted", "Make him cum inside you!", "get_knotted")
		addButton("Pull out", "Make him cum outside", "pull_out_ride")
	if(state == "get_knotted"):
		playAnimation(StageScene.SexCowgirlAmazon, "inside", {pc="skar", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Watch me.[/say]")

		saynn("You slam down.. hard.")

		saynn("The knot puts more and more pressure on your "+str("pussy" if isVag else "anal")+" entrance.. until it suddenly pops past your "+str("folds" if isVag else "{pc.analStretch} star")+" and gets lodged inside you! Both of you groan at the same time.. him from the sudden tightness.. and you from the feeling of getting stretched so much.")

		saynn("[say=skar]Agh..[/say]")

		saynn("[say=pc]Oh fuck..[/say]")

		saynn("His hips buck upward, driving himself deeper. The knot isn't letting either of you pull away now. His whole body tenses.. his cock pulsing inside you..")

		saynn("And then.. it happens. Thick, hot spurts of cum flood your "+str("pussy, pumping your womb full of it" if isVag else "ass, pumping your nethers full of it")+". He grunts hard, his hips jerking with each spasm, his mechanical arms scratching the floor.")

		saynn("[say=pc]Yes.. breed me, you fuck..[/say]")

		saynn("Your own orgasm overwhelms you, passionate moans escaping you while your "+str("pussy" if isVag else "inner")+" walls are clenching hard around his knotted cock, milking his twitching balls dry..")

		saynn("You keep riding him through it all.. going after every last drop..")

		saynn("When he finally stops twitching, you're both left panting. He starts up at you, his prosthetic eyes are half-shut.")

		saynn("[say=skar]You're insane..[/say]")

		saynn("[say=pc]And you're a good fucktoy.[/say]")

		saynn("You try to lift yourself.. but the knot is still swollen. You're stuck.")

		saynn("[say=skar]Told you.[/say]")

		saynn("He doesn't sound too annoyed even. Almost amused.")

		saynn("[say=pc]We're just gonna wait until you deflate.[/say]")

		saynn("[say=skar]Or until someone spots us.[/say]")

		saynn("Wait, you realize that you don't have a lot of time actually. Failing your mission because you got stuck on some guard's cock.. that sounds kinda funny.. but it's not something that you want to happen.")

		addButton("Continue", "See what happens next", "try_get_off_knot")
	if(state == "try_get_off_knot"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You give him a few minutes.. but he is still hard. So you go for the other option.")

		saynn("You start trying to get up.. putting more and more strength into it.")

		saynn("[say=skar]Nhh.. too soon.[/say]")

		saynn("[say=pc]Shush. I got places to be.[/say]")

		saynn("Your whole body shivers as that knot is stretching you out again..")

		saynn("And eventually, the thing manages to slide out with a satisfying wet pop.")

		saynn("[say=pc]Ah.. there we fucking go.[/say]")

		saynn("Your pussy stays gaping for a bit longer.. some of his seed gushing out.")

		saynn("[say=pc]So messy. You will clean it up, got it?[/say]")

		saynn("[say=skar]What am I, some kind of maid?[/say]")

		saynn("[say=pc]No, you're a fucktoy.[/say]")

		saynn("[say=skar]That answers your question.[/say]")

		saynn("He's looking a bit more.. lively.. now. Good for him.")

		saynn("You get up and prepare to leave.")

		addButton("Continue", "See what happens next", "endsceneposourselves")
	if(state == "pull_out_ride"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="skar", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You feel his cock throbbing inside you, that knot plapping against your "+str("folds" if isVag else "{pc.analStretch} star")+"..")

		saynn("You keep riding him.. until the point of no return. And just when his balls start to tense up, that's when you lift yourself off him completely, his cock slipping out of your wet "+str("pussy" if isVag else "tailhole")+" with a slick sound..")

		saynn("[say=skar]Fuck..[/say]")

		saynn("The guy groans, his whole body squirming underneath you. Your digits find his shaft and wrap around it.. just holding the throbbing length as it starts shooting ropes of thick cum! One after another, splattering across his stomach.")

		saynn("Your own orgasm catches up with you, your "+str("pussy" if isVag else "anal ring")+" pulsing around the cock that's not there anymore, your moans follow closely after his every noise..")

		saynn("His own seed pools on his scared belly, his knot begins to slowly deflate now that he is spent, he shaft still twitching in your grip.")

		saynn("Both of you are left panting.")

		saynn("[say=pc]Mmhh.. what a mess you made.[/say]")

		saynn("[say=skar]I don't think I'm the one who should be blamed..[/say]")

		saynn("[say=pc]For having such a hot body? No, you're very responsible for this.[/say]")

		saynn("You wipe your hand on his armor, leaving a sticky trail across the metal.")

		saynn("[say=skar]..rude.[/say]")

		saynn("He looks a bit more lively after this.")

		saynn("You realize that you're on a timer.. so you quickly get up.")

		saynn("[say=pc]Thanks for the fun, enjoy cleaning it up. I gotta go.[/say]")

		saynn("[say=skar]Yeah, yeah..[/say]")

		saynn("He doesn't stop you as you step over him and head towards the exit.")

		addButton("Continue", "See what happens next", "endsceneposourselves")
	if(state == "start_fuck_him"):
		playAnimation(StageScene.SexBehind, "tease", {pc="pc", npc="skar", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Who said I wanted to get to the captain? I just wanted to have some fun with you.[/say]")

		saynn("You push the guy onto his belly and pin him into the cold floor. Your hands begin stripping the pieces of his armor. At some point it becomes hard to distinguish them from his mechanical bodyparts.")

		saynn("[say=skar]You're getting yourself into some big trouble.[/say]")

		saynn("[say=pc]What? You're gonna abandon your post and come find me? Sounds fun.[/say]")

		saynn("[say=skar]Mh.[/say]")

		saynn("After some time, you finally got to his briefs! Pulling them off reveals his tight-looking tailhole. At least that part isn't made out of cold metal. His sheath is quite normal too.. quite nice even.")

		saynn("You run your fingers along the strong curves of his ass, feeling the wolf get tense beneath you. His tail twitches, brushing against your wrist.")

		saynn("[say=skar]You're really gonna do this?[/say]")

		saynn("[say=pc]We will see how your body responds.[/say]")

		saynn("You loom over his rear.. and let a bead of your saliva land directly on his star, making him shiver.")

		saynn("[say=skar]Hh..[/say]")

		saynn("Then.. you press a thumb against his tailhole. It's tight, resisting quite a lot. Skar lets out a low grunt as you keep prodding it, his muscles eventually giving way, letting your digit sink into his warm depths.")

		saynn("[say=skar]Nnh..[/say]")

		saynn("He is hot inside. You work your thumb in circles, loosening him up. His breathing gets heavier, his mechanical jaw producing a whirling noise.")

		saynn("You begin to see something.. his sheath is twitching. A red tip emerges at first.. but then more of his shaft follows too, his canine member gradually getting harder..")

		saynn("[say=pc]Looks like someone is enjoying this.[/say]")

		saynn("[say=skar]Pff..[/say]")

		saynn("You reach beneath him and wrap your digits around his half-erect cock, catching the lonely drops of precum from its pointy tip.")

		saynn("He shudders as you bring those digits back to his tailhole and work a few of them in, his own precum working as a lube, letting you stretch him out more.")

		saynn("[say=skar]F-fuck..[/say]")

		saynn("Your own cock is hard and ready by now. You coat it with the rest of his precum, gliding your digits over it a few times.")

		saynn("Then.. you position yourself behind him, the tip of your {pc.penis} pressing against his slick entrance. Slowly, you push forward.")

		saynn("[say=skar]G-ghh..[/say]")

		saynn("Inch by inch.. his tailhole stretches open, the tip of your member burying itself in him.. His tight inner walls grip you hard. His muscles all tense up.. you can hear it in his prosthetic arms.")

		addButton("Continue", "See what happens next", "fuck_him_sex")
	if(state == "fuck_him_sex"):
		playAnimation(StageScene.SexBehind, "sex", {pc="pc", npc="skar", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Eventually, you manage to get most of your length down that guard's ass. He is panting now, his body trembling. You can feel him clenching as his cock has fully emerged.. brushing against the floor.")

		saynn("[say=pc]Just relax, be a good fucktoy.[/say]")

		saynn("You start moving, doing slow thrusts, pulling almost all the way out before sinking back in. Skar grunts with each push, his inner walls hugging your member tightly.")

		saynn("[say=skar]Nnhh..[/say]")

		saynn("The guy grunts as your cock finds his little pleasure spot.. You angle yourself a little better and proceed to focus on it, giving it little strokes with your shaft. Skar's legs shiver, his cock pulsing subtly from it all, his tip dripping pre onto the floor, forming a small puddle.")

		saynn("[say=pc]You like that, don't you?[/say]")

		saynn("[say=skar]What does it look like?.. hh..[/say]")

		saynn("He is so shy.")

		addButton("Faster", "Rail his ass harder!", "fuck_him_fast")
	if(state == "fuck_him_fast"):
		playAnimation(StageScene.SexBehind, "fast", {pc="pc", npc="skar", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As the guy's tailhole gets more slick and needy, you quicken your pace, letting the sound of skin slapping against skin echo around the room. With each thrust, you drive your {pc.penis} deep, hammering away at his prostate, making him squirm.")

		saynn("[say=skar]Ghh.. hh.. mh..[/say]")

		saynn("His knot is swelling, trapped between his belly and the cold floor. Too bad he can't knot anyone.")

		saynn("[say=skar]..f-fuck.. ah..[/say]")

		saynn("The poor guy can't contain his noises.. moans escaping him as you rail his ass.. harder and faster. His prostate gets all nice and swollen.. making hammering away at it easy.")

		saynn("[say=skar]I.. I can't.. I'm g-gonna..[/say]")

		saynn("You're close too.")

		addButton("Cum inside", "Breed his ass!", "fuck_him_cum")
	if(state == "fuck_him_cum"):
		playAnimation(StageScene.SexBehind, "inside", {pc="pc", npc="skar", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("When you push him over the edge, his whole body locks up. His cock starts twitching violently.. and then it happens. Rope after rope of his seed sprays onto the floor beneath him, his cock pulsing as his balls get drained by that prostate orgasm. His ass clamps down on your cock hard..")

		saynn("[say=skar]Ahh-h.. f-f..ah.. f-fuck..[/say]")

		saynn("That is when you drive yourself balls-deep one final time, burying your {pc.penis} as far as it will go. You grunt as thick spurts of your {pc.cum} begin flooding his insides. Skar moans as you pump him full of your stuff, his overstimulated body shaking.")

		saynn("[say=skar]Agh.. hh..[/say]")

		saynn("After getting his insides painted.. you just stay inside him, your bodies rubbing against each other, both of you left panting.")

		saynn("[say=pc]Good little fucktoy.[/say]")

		saynn("He can only make muffled moans in response.. his tailhole still trying to milk you.")

		addButton("Pull out", "Pull your cock out!", "fuck_him_after")
	if(state == "fuck_him_after"):
		playAnimation(StageScene.SexBehind, "tease", {pc="pc", npc="skar", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You realize that you're on a timer so you really gotta go now.")

		saynn("You pull out and watch as the guard's tailhole gapes slightly. A thick dribble of your {pc.cum} follows, trickling down his fur.")

		saynn("The guy just stays still on the floor, his own member slowly retreating back into its sheath. So much mess.")

		saynn("[say=pc]Thanks for the fun. I hope you will clean it all up, I gotta run.[/say]")

		saynn("You get up and prepare to leave.")

		saynn("[say=skar]Yeah..[/say]")

		saynn("You step over him and rush back into the corridor!")

		addButton("Continue", "See what happens next", "endsceneposourselves")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "dom_start_fight"):
		runScene("FightScene", ["skar"], "skarFight")
		return

	if(_action == "stopthemission"):
		processTime(60*60*3)
		endScene()
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.MS.failCurrentMission()

	if(_action == "trymissionagain"):
		endScene()
		GM.main.MS.restartCurrentMission()
		return

	if(_action == "start_vag_ride"):
		GM.main.MS.setFlag("skarOutcome", "ridevag")
		isVag = true
		setState("start_sex_ride")
		return

	if(_action == "start_anal_ride"):
		GM.main.MS.setFlag("skarOutcome", "rideanal")
		isVag = false
		setState("start_sex_ride")
		return

	if(_action == "start_fuck_him"):
		GM.main.MS.setFlag("skarOutcome", "fuckhim")

	if(_action == "endsceneposourselves"):
		GM.pc.setLocation("cd_last_intersection")
		endScene()
		return

	if(_action == "sex_ride"):
		processTime(5*60)

	if(_action == "ride_faster"):
		processTime(3*60)

	if(_action == "get_knotted"):
		if(isVag):
			GM.pc.gotVaginaFuckedBy("skar")
			GM.pc.cummedInVaginaBy("skar")
			GM.main.MS.setFlag("skarOutcome", "ridevag")
		else:
			GM.pc.gotAnusFuckedBy("skar")
			GM.pc.cummedInAnusBy("skar")
			GM.main.MS.setFlag("skarOutcome", "rideanal")
		GM.pc.orgasmFrom("skar")

	if(_action == "pull_out_ride"):
		if(isVag):
			GM.pc.gotVaginaFuckedBy("skar")
			GM.main.MS.setFlag("skarOutcome", "ridevagout")
		else:
			GM.pc.gotAnusFuckedBy("skar")
			GM.main.MS.setFlag("skarOutcome", "rideanalout")
		GM.pc.orgasmFrom("skar")

	if(_action == "try_get_off_knot"):
		processTime(3*60)

	if(_action == "fuck_him_sex"):
		processTime(5*60)

	if(_action == "fuck_him_fast"):
		processTime(5*60)

	if(_action == "fuck_him_cum"):
		processTime(3*60)
		getCharacter("skar").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("skar")

	if(_action == "fuck_him_after"):
		processTime(3*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "skarFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			GM.main.MS.setFlag("skarOutcome", "won")
			setFlag("SlaveAuctionModule.firstTimeDom", true)
			setState("won_fight")
			addExperienceToPlayer(50)
		else:
			GM.main.MS.setFlag("skarOutcome", "lost")
			setState("lost_fight")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["isVag"] = isVag

	return data

func loadData(data):
	.loadData(data)

	isVag = SAVE.loadVar(data, "isVag", false)
