extends "res://Scenes/SceneBase.gd"

var howMuchMilked = 10.0

func _init():
	sceneID = "ForcedChastityScene3"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		addCharacter("eliza")
		
	if(state == ""):
		saynn("For some reason the pillow isn’t as soft as you remember it. In fact, there is no pillow under your head at all. You open your eyes and realize that you’re in this strange dark room again with wooden floors and fancy furniture.")

		saynn("Your hands are cuffed together with chains connected to the ceiling, same as the previous times. You notice Eliza sitting in one of the comfy chairs and watching you, empty mug in her hand.")

		saynn("[say=eliza]Surprised?[/say]")

		saynn("You shake your head. At this point you have given up trying to cover your nudity, you let the doctor watch between your legs freely.")

		saynn("[say=eliza]That’s a habit forming in your head. Wonder if you will miss me when this is all over.[/say]")

		addButton("What now", "Ask her about her plans", "what_now")

	if(state == "what_now"):
		playAnimation(StageScene.HangingSexFuckmachine, "tease", {bodyState={naked=true}})
		
		saynn("[say=pc]What are you gonna do? Check my cage? It’s still there.[/say]")

		saynn("Eliza chuckles and reaches out to grab something from the small round table.")

		saynn("[say=eliza]Oh, I’m well aware. That’s not why we’re here.[/say]")

		saynn("That something appears to be some kind of remote. Not the kind that sends shocks but something else. For some reason Eleza keeps looking between your legs. As she presses a button, you hear some mechanical noise behind you.")

		saynn("[say=pc]Huh?[/say]")

		saynn("You can’t really see what’s happening there but you sure feel it. A pre-lubed rubber dildo spreads your {pc.thick} buttcheeks and prods your star gently. It’s cold so you clench instantly before glancing at Eliza.")

		saynn("[say=eliza]I thought we could try something bigger. Since the last time was a bit anticlimactic. You know..[/say]")

		saynn("And before you could voice your opinion about that decision, Eliza presses another on the remote, causing the dildo to put even more pressure on your {pc.analStretch} anus.")

		# (Options are Clench, Let it in)

		addButton("Clench", "Try to avoid your ass being penetrated", "clench")
		addButton("Let it in", "You don’t wanna fight it", "let_it_in")


	if(state == "clench"):
		saynn("You gather all your strength and clench your butt, fighting the dildo of a fuckmachine. You hear its motors whirling more and more as it tries to penetrate your cute ass. The doctor notices you gritting your teeth and smiles.")

		saynn("[say=eliza]You look adorable. It doesn’t hurt to try, maybe you will like it. Otherwise it will look like I stole something from you without giving back. And that’s unfair, isn’t it?[/say]")

		saynn("You’d be happy to answer her but the machine under her control is relentless, very soon you begin to feel exhausted, your kegel muscles relax enough for the rubber tip to stretch your star open!")

		saynn("You let out a stifled noise as the dildo invades your ass, Eliza holds the button until about half of it is inside you. It’s angled perfectly to hit your prostate, your member instantly produces a drop of pre that drips down your cage.")

		saynn("[say=pc]Nghh-h..[/say]")

		saynn("[say=eliza]Good~. You will get used to this. You have no choice but to.[/say]")

		saynn("You breathe heavily and look down at the floor.")
		
		addButton("Continue", "See what happens next", "continue")


	if(state == "let_it_in"):
		saynn("Instead of trying to clench, you focus on relaxing your muscles. The machine’s motors whirl slightly louder until the rubber dildo manages to stretch your {pc.analStretch} star enough to slide inside. The doctor sees your lusty eyes and smiles.")

		saynn("[say=eliza]Good~. You’re getting used to this. It’s the right choice.[/say]")

		saynn("Eliza holds the button until about half of the rubber shaft is inside you. It’s angled perfectly to hit your prostate. You let out a passionate noise while your member produces a drop of pre that drips down your cage.")

		saynn("[say=pc]Nghh-h..[/say]")

		saynn("You breathe heavily and look down at the floor.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.HangingSexFuckmachine, "sex", {bodyState={naked=true}})
		
		saynn("Doctor Quinn lets you get used to the sensations before pressing a different button. A button that makes the dildo slide in and out of your butt on its own. The machine whirls happily while you’re being fucked by it! Your inner walls easily are being stretched easily by the lubed tip that finds your prostate and hammers at it.")

		saynn("Very soon your whole body starts to shiver and squirm, it’s not the same pleasure as from stroking your dick, it’s much more unique. Stimulating your prostate causes it to generate its secret, so much of it that your dick feels like you’re about to cum any second. And that feeling keeps rising and rising the more the machine pounds your butt..")

		saynn("All the while Eliza just watches you and your cage leaking a huge amount of pre. She bites her lip and has her legs crossed.")

		saynn("[say=eliza]Wonder how long will you endure this~[/say]")

		saynn("Not for long if she keeps it up. You hear another button press that makes the fuckmachine more aggressive. So much so that your butt makes occasional wet noises, the force is enough to push your forward slightly before meeting you with another thrust on your way back. The feeling of pressure inside your cage keeps rising and rising.. but then it starts fading away again! Oh no.")

		saynn("It’s like your prostate has had enough and is becoming less sensitive. The pleasurable feeling goes away, replaced with discomfort of something big stretching your ass. Strong waves wash over your body, causing it to desperately try to push the dildo out. You squirm more but not because you like it, you just can’t help but not to.")

		saynn("[say=pc]H-hgh.. That’s enough.. I don’t like it[/say]")

		saynn("Eliza squints at you and keeps her paw on the mug. She gets up and walks up to you.")

		saynn("[say=eliza]Hm.. Are you sure, though.. Would be a shame to lose another session.[/say]")

		saynn("She caresses your cheek with her paw and then cups your balls, gently playing with them while the machine keeps pounding your ass.")

		saynn("[say=eliza]I think you’re very close, cutie. You just need to relax and let it happen, clenching will only make it worse..[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.HangingSexFuckmachine, "fast", {pcCum=true, bodyState={naked=true}})
		
		saynn("Eliza brings her maw to your ear and purrs into it, her voice becomes very intimate.")

		saynn("[say=eliza]Focus on it, on being fucked by a huge veiny dick. Forget everything else.. Your cage, your body, me.. focus on the sensations of your prostate being smashed each time this member slides inside you.. You are taking dick inside you.. And it feels good.. forget anything else..[/say]")

		saynn("From that point she just smiles while watching your blushing face, her gaze mixed with her words makes you instantly feel more subby. You try not to think about how you look.. but only how you feel..")

		saynn("The machine keeps fucking you relentlessly. The rubber member slides in and out of your stretched hole with ease.. Yes, there is some discomfort, some pain even.. But the thought.. the thought that you’re being fucked.. by a dick that reaches your pleasure point.. that’s very arousing..")

		saynn("You find yourself moaning subtly.. The dick inside your cage is trying to get hard again.. The pressure inside it is rising.. You feel like you’re about to cum.. A few moans escape from your lips as you’re getting pushed over the peak.")

		saynn("You arch your back and let out more passionate noises while your caged dick starts to leak {pc.cum}, a few weak strings shoot out of it. Eliza sees that you’re cumming and holds the mug under your cage, purring while collecting your seed. Each thrust of the dildo forces more and more of your {pc.cum} out of your balls, you can’t stop squirming and panting heavily while the machine milks your prostate hard.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your totally neglected pussy drips with juices as well, maybe you don’t need it too.")

		saynn("[say=eliza]See~. I knew you got it in you. Big enough cock and you’re cumming hands-free on me~. Enjoy the new possibilities.[/say]")

		saynn("She switched the machine to slow but powerful thrusts. More {pc.cum} keeps flowing out of your caged member while your pleasure spot is being pushed. And Eliza tries to collect most of it.")

		saynn("Eventually your wet orgasm dies down. Doctor turns off the machine completely and lets you rest. And rest you need, you keep panting and trying to catch more air with your mouth. The rubber dildo slowly gets retracted out of your stretched butt, letting it gape for a bit before you clench enough to close it.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		
		saynn("[say=eliza]So? Did you like it~? You know what, don’t even answer, I know that you did and you can’t convince me otherwise, I have the proof here~.[/say]")

		saynn("She proudly shows you her mug with the words ‘best mom’ on it that has your {pc.cum} in it. All the while you slowly come to senses. That afterglow feeling returns.. And this time it’s so much stronger.. you feel light.. but also weak.. at the same time. You look at the cup and don’t even care that it’s kinda gross.")

		saynn("[say=eliza]Speaking of. Wanna taste your product? C’mon, you went this far, might as well~.[/say]")

		# (Options are Drink, Refuse)

		addButton("Drink", "Taste your cum", "drink")
		addButton("Refuse", "You really don’t wanna drink it", "refuse")

	if(state == "drink"):
		saynn("The idea sounds hot, you part your lips and reach for the cup. Eliza moves it up to your face and starts tilting it until the sticky {pc.cum} starts oozing inside your mouth. So humiliating.. But also arousing.. Your own seed lands on your tongue and slowly flows deeper until you swallow it.. And then more and more.. Eliza holds your head tilted up until the mug is empty.")

		saynn("[say=eliza]Good job~. Really getting into that role now. The role of a bottom. A person who’s full job is satisfying someone else, pleasing them. And this sure pleases me.[/say]")

		saynn("She offers you a pat on the head after you’re finished and then puts the cup away.")

		saynn("[say=eliza]If you ever want to be milked more, I’m your girl~. Ever thought why cheese here is so good?[/say]")
		
		addButton("Continue", "See what happens next", "continue3")

	if(state == "refuse"):
		saynn("You shake your head and refuse. Eliza sees it and smiles, seeing your embarrassed cheeks.")

		saynn("[say=eliza]No? Oh well. I know it might feel humiliating but it’s so hot. And people like watching hot stuff.[/say]")

		saynn("She licks the contents of the cup teasingly and then puts it away.")

		saynn("[say=eliza]If you ever want to be milked more, I’m your girl~. Ever thought why cheese here is so good?[/say]")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		saynn("After that crazy journey, Eliza lets you rest a bit more. She scratches her chin.")

		saynn("[say=eliza]Well, this session is over. But I have the last question for you.[/say]")

		saynn("Her voice sounds so cunning, she plays with your empty balls some more.")

		saynn("[say=eliza]Who do you want to fuck you next time~?[/say]")

		saynn("That’s one hell of a question. You raise your brow at her.")

		saynn("[say=eliza]I’m serious~. Machines are great but I think you need to experience someone’s personal touch. Could be a girl. I’m a girl and I made you cum, didn’t I~? I’m waiting.[/say]")

		# (Options are Eliza, Risha, Rahi, Tavi, Nova)
		addButton("Eliza", "Pick the doctor", "pick", ["eliza"])
		addButton("Risha", "Pick the guard lynx herm", "pick", ["risha"])
		if(getFlag("RahiModule.Rahi_Introduced")):
			addButton("Rahi", "Pick the shy brown kitty", "pick", ["rahi"])
		else:
			addDisabledButton("Rahi", "You haven't met Rahi")
		if(getFlag("TaviModule.Tavi_IntroducedTo")):
			addButton("Tavi", "Pick the purple tall cat", "pick", ["tavi"])
		else:
			addDisabledButton("Tavi", "You haven't met Tavi")
		if(getFlag("NovaModule.Nova_SawPC") || getFlag("NovaModule.Nova_Introduced")):
			addButton("Nova", "Pick the guard husky herm", "pick", ["nova"])
		else:
			addDisabledButton("Nova", "You haven't met Nova")

	if(state == "pick"):
		saynn("You tell her the name of who you wanna be fucked by.")
		
		var pickedPerson = getFlag("MedicalModule.Chastity_FirstChosenPerson", "eliza")
		# (if Eliza)
		if(pickedPerson == "eliza"):
			saynn("[say=eliza]Ohh, you want more of me? Sure~. That’s a safe choice but I appreciate that you enjoy my company.[/say]")

		# (if Risha)
		if(pickedPerson == "risha"):
			saynn("[say=eliza]Risha, huh? Well, she does have a cock. Can’t say that I like her but I will see what I can do.[/say]")

		# (if Rahi)
		if(pickedPerson == "rahi"):
			saynn("[say=eliza]The cute brown kitty? Yeah, I know her. Name is Rahi. We did some tests on her to try to help her but some mental disorders just can’t be helped. I will see if she will be up for this though.[/say]")

		# (Tavi)
		if(pickedPerson == "tavi"):
			saynn("[say=eliza]Tavi? You serious? I mean, she is friendly and all. I would say she is too friendly though, something about her is off. But I will grab her.[/say]")

		# (Nova)
		if(pickedPerson == "nova"):
			saynn("[say=eliza]Oh, you want Nova? Yeah, I could arrange that~. She will be perfect for this.[/say]")

		saynn("Eliza makes a note in her datapad and then unchains your arms. She gives you your clothes and guides you out.")

		saynn("[say=eliza]Let’s go~.[/say]")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("You walk out into the medical corridor and look around. The afterglow is still so strong.. You feel like you’ve run a marathon.. but with your ass..")

		saynn("[say=eliza]See you soon~.[/say]")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(_action in ["continue3", "continue", "continue4", "what_now"]):
		processTime(5*60)
	
	if(_action == "continue1"):
		howMuchMilked = GM.pc.milkSeed()
		GM.pc.orgasmFrom("eliza")
		
	if(_action == "continue"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 25)
	
	if(_action in ["clench", "let_it_in"]):
		processTime(5*60)
		setFlag("MedicalModule.Chastity_Event3Choice1", _action)
	
	if(_action in ["drink", "refuse"]):
		processTime(5*60)
		setFlag("MedicalModule.Chastity_Event3Choice2", _action)

	if(_action == "drink"):
		var thebodypart = GM.pc.getBodypart(BodypartSlot.Head)
		if(thebodypart != null):
			thebodypart.addFluidOrifice(GM.pc.getFluidType(FluidSource.Penis), howMuchMilked, GM.pc.getFluidDNA(FluidSource.Penis))
		
	if(_action == "pick"):
		setFlag("MedicalModule.Chastity_FirstChosenPerson", _args[0])

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["howMuchMilked"] = howMuchMilked
	
	return data
	
func loadData(data):
	.loadData(data)
	
	howMuchMilked = SAVE.loadVar(data, "howMuchMilked", 10.0)

func getDevCommentary():
	return "The fuckmachine was fun to animate x3. It's called a fully rigged object, that's why I can move it so fluently and even bend the tip. I want more objects like that but they do take a whiiiile to set up. I have to draw it, put it into blender, rig it up, animate it. Then there is lots of godot stuff like assigning materials, creating scenes. Yeah, takes a while. But hopefully it was worth it for these scenes ^^\n\nOh yeah, this scene also the first time you get to choose who fucks you in the next scene. Why are there no male characters there? I just didn't have the time, man.. These 5 took all the time I had x3. There is only so much time I can spend on optional scenes. It's not a smart time investment. Although I should probably just make these scenes replayable at some point.."

func hasDevCommentary():
	return true
