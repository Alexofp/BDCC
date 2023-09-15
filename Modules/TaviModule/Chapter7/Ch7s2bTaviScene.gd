extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var npc1id = ""
var npc2id = ""

func _init():
	sceneID = "Ch7s2bTaviScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc1"):
		return npc1id
	if(_charID == "npc2"):
		return npc2id

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You taught Tavi everything she needs to know. Which means.. there is no point putting it off any longer. You call her and she walks up to you, her feline eyes look"+str(" eternally lusty" if isCorrupt else " kind")+".")

		saynn("[say=pc]It's time. I will need your help to do this, Tavi.[/say]")

		if (isCorrupt):
			saynn("Almost instantly, a wide smile appears on her face, her sharp fangs on display, her pointy horns glowing.")

			saynn("[say=tavi]I thought you would never ask~. What's the plan? I'm sure it will change once we start. But you know~.[/say]")

		else:
			saynn("A cute little smile appears on her face. Tavi carefully moves her hair out of the way and straightens her posture.")

			saynn("[say=tavi]I'm glad you didn't give up, owner. Even when they broke me. What's the plan?[/say]")

		saynn("[say=pc]We go in. We deal with everyone who stands in our path. We call Syndicate. We get out.[/say]")

		saynn("Tavi hums.")

		saynn("[say=tavi]The simpler the plan, the less can go wrong~. Let's do this.[/say]")

		if (isVirgin && !getFlag("TaviModule.Ch6TaviRegrewHymen, false") && GM.pc.hasReachablePenis()):
			if (isCorrupt):
				saynn("Tavi was about to follow you but then she had a change of mind, her clawed paw landing on your shoulder.")

				saynn("[say=tavi]Actually. You know, this could be our last time together.[/say]")

				saynn("Huh?")

				saynn("[say=pc]You think we shouldn't do it?[/say]")

				saynn("Tavi shakes her head. And then cleans close to your ear before breathing warmly into it.")

				saynn("[say=tavi]You know.. You protected my virginity so well~. Not a single time you fucked my wet pussy. Even when I was needy and hungry for your cock..[/say]")

				saynn("Tavi's paws travel over your {pc.masc} body while her voice reverberates in your head with dark undertones. And it drives you mad.. All of your thoughts become lewd, your {pc.penis} getting hard instantly..")

				saynn("[say=tavi]But it's time to change that. That hymen between my legs.. that seal must be broken. Torn to pieces.. By your cock.. In the most rough way possible.[/say]")

				saynn("She purrs softly.")

				saynn("[say=tavi]Destroy my purity. Steal my last sign of innocence. Fuck me raw, owner~. I want your cock inside me. Don't make me beg~.[/say]")

				saynn("The mission can probably wait a few.. hours.. Right? This is your last chance after all..")

				addButton("Fuck Tavi", "Take Tavi's virginity", "virginity_rough")
				addButton("Nah", "You'd rather not", "virginity_deny")
			else:
				saynn("Tavi was about to follow you but then she had a change of mind, her paw landing on your shoulder.")

				saynn("[say=tavi]Hey.. Before we.. I wanna tell you something.[/say]")

				saynn("You turn around and see Tavi being quite puzzled all of the sudden.")

				saynn("[say=pc]What's up, Tavi?[/say]")

				saynn("She struggles to pick the right words, stammering instead.")

				saynn("[say=tavi]It's.. it's about..[/say]")

				saynn("Your hand lands on her arm and strokes it gently. Tavi's cheeks blush. She looks so.. vulnerable.")

				saynn("[say=tavi]It's about my.. innocence. I wanna thank you.[/say]")

				saynn("You raise a brow.")

				saynn("[say=pc]Uh. What for?[/say]")

				saynn("She pouts.")

				saynn("[say=tavi]You know what for.. I was a slutty lusty bitch in heat. And you never took advantage of that. You helped me keep my virginity.[/say]")

				saynn("[say=pc]Well, you're welcome Tavi. I didn't wanna steal it against your will. It was probably valuable to you since you somehow managed to keep it throughout all of this.[/say]")

				saynn("She scratches herself behind her head and looks down.")

				saynn("[say=tavi]Yeah.. about that..[/say]")

				saynn("Tavi struggles to pick the right words again. She really thinks about it.. about what she wants to say.")

				saynn("[say=tavi]I.. I want you to breed me.[/say]")

				saynn("Wow. What a bombshell.")

				saynn("[say=tavi]I mean.. I want you to fuck me.. I mean..[/say]")

				saynn("You grab Tavi's shoulders and gently knead them.")

				saynn("[say=pc]I get it. You want me to take your virginity.[/say]")

				saynn("Her cheeks blush brightly, illuminating the dimly lit cell with a subtle green glow.")

				saynn("[say=tavi]Yes.. If everything goes wrong, this could be our last time together.. You know?..[/say]")

				saynn("The mission can probably wait a few.. hours.. Right? This is your last chance after all..")

				addButton("Fuck Tavi", "Take Tavi's virginity", "virginity_gentle")
				addButton("Nah", "You'd rather not", "virginity_deny")
		else:
			addButton("Step out", "Meet with Tavi near the checkpoint", "near_checkpoint")
	if(state == "virginity_deny"):
		if (isCorrupt):
			saynn("[say=pc]It's okay. I want you to stay a virgin, Tavi.[/say]")

			saynn("She pouts and crosses her arms.")

			saynn("[say=tavi]Why?[/say]")

			saynn("Now it's your turn to lean to her and whisper into her ear.")

			saynn("[say=pc]Because you belong to me, slut. And so it's for me to decide if and when you will lose your virginity. Understand?[/say]")

			saynn("Tavi bites her lip as she hears your authoritative voice.")

			saynn("[say=tavi]Of course, owner. My cunt is yours to unseal anytime.. Or to keep sealed forever.. Even if that's cruel..[/say]")

			saynn("You smack Tavi's ass, making her purr.")

			saynn("[say=pc]Good whore. Now let's go.[/say]")

			saynn("She nods and eagerly follows.")

		else:
			playAnimation(StageScene.Hug, "hug", {npc="tavi"})
			saynn("You hug Tavi.")

			saynn("[say=pc]It's okay, Tavi. I want you to stay the way you are. Pure.[/say]")

			saynn("She smiles softly and nuzzles your shoulder.")

			saynn("[say=tavi]Okay..[/say]")

			saynn("[say=pc]I'm sure we will be fine. And free. Let's focus on that.[/say]")

			saynn("She nods.")

			saynn("[say=tavi]Of course. We can do it.[/say]")

			saynn("Tavi follows you eagerly.")

		addButton("Step out", "Meet with Tavi near the checkpoint", "near_checkpoint")
	if(state == "virginity_rough"):
		playAnimation(StageScene.Choking, "tease", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("Yeah.. Now is the perfect time to do this.")

		saynn("You grab Tavi's neck and tilt your head slightly while looking her in the eyes. Your other hand pulls your {pc.penis} out.")

		saynn("[say=pc]Show me your virgin cunt, slut.[/say]")

		saynn("Tavi gasps softly.. but then gets quite excited. Her clawed palms quickly unbutton her shirt and then urgently pull down her shorts, putting her juicy tits and her slick slit on full display.")

		saynn("[say=tavi]Here is what you asked, owner~.[/say]")

		saynn("You squeeze that neck harder, causing Tavi to open her mouth and pull her chin high, a silent noise escapes her throat.")

		saynn("[say=pc]I'm not asking, whore. I'm taking.[/say]")

		saynn("She nods subtly, unable to say a word. Which is exactly how you want it.")

		saynn("You align yourself with her pussy and then grab her leg, raising it high, giving you full access to her crotch. Your shaft rubs against her slick green folds, catching some of her arousal. Each time you try to put pressure on Tavi's untapped love tunnel, all of her muscles tense up, her hymen stopping you. But not for long..")

		addButton("Thrust inside", "Do it", "rough_steal")
	if(state == "rough_steal"):
		playAnimation(StageScene.Choking, "inside", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You align yourself a little better, your member keeping her folds spread as you start to stretch her pussy hole, it's tip putting pressure on the girl's virginity.. Before you roughly thrust your hips forward, finally tearing through and [b]stealing Tavi's virginity[/b].")

		saynn("[say=tavi]H-h.. hh~..[/say]")

		saynn("She lets out another gasp that you silent by choking her. Tavi's pussy starts dripping green glowing blood onto the floor as you slide inside her, letting her slit get used to its first ever cock. The more you steal her oxygen, the more her inner walls clench around your cock, making you eager to keep going.. All the while you keep looking into her lusty eyes.")

		saynn("[say=pc]Your cunt is mine. Mine to fuck. Mine to use and abuse.[/say]")

		saynn("She drools while you say that, quickly getting weaker and weaker.. But it feels so good.")

		addButton("Fuck her", "Start fucking Tavi raw", "rough_fuck")
	if(state == "rough_fuck"):
		playAnimation(StageScene.Choking, "sex", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You relax your choking hand enough to let Tavi grab at least some air as you start to fuck her, your motions forceful and relentless. Quiet stifled moans escape from the feline as her pussy gets pounded so roughly.. and so passionately.")

		saynn("[say=pc]So tight. Shame I didn't do this earlier.[/say]")

		saynn("Her paws hold onto your hand. She doesn't try to pry it off, just using it for support. Her whole body is already shivering, her limited breaths sounding ragged.")

		saynn("And soon enough, the feline arches her back more as her first vaginal orgasm takes over, making her eyes roll up and her tongue drool more, her slick pussy walls clenching even tighter around you.")

		saynn("[say=tavi]Nh-h-h h-h..[/say]")

		saynn("[say=pc]Cumming already? What a fucktoy. Nghrh..[/say]")

		addButton("Faster", "Fuck her faster", "rough_faster")
	if(state == "rough_faster"):
		playAnimation(StageScene.Choking, "fast", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You only rail her pussy harder and faster as she is cumming, pushing through her resistance. Your cock overstimulating her not-so-virgin folds to the point of her bleeding slit suddenly squirting, releasing a fountain of juices.")

		saynn("[say=pc]You are loving it. Loving being my cocksleeve.[/say]")

		saynn("[say=tavi]Nh-h!.. Hh!..[/say]")

		saynn("Cell smells of sex already, the air vibrates with the sound of your hips slapping against her thighs. Your thrusts are so deep, you reach her cervix, causing a bump to appear on her belly on each apex.")

		saynn("Her cunt feels good.. too good to pull out. Time to creampie your pet.")

		addButton("Cum inside", "Breed Tavi", "rough_cum")
	if(state == "rough_cum"):
		playAnimation(StageScene.Choking, "inside", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You ram your cock balls deep into Tavi's stretched cunt, breaking into her womb and causing her to orgasm again. Her pussy clenches around your shaft so hard, you can't hold back anymore.")

		saynn("Your {pc.penis} throbs as it starts shooting thick spurts of {pc.cum} directly into her babymaker, filling it to the brim. Your hand around her hand loosens as your own climax makes you feel weaker.")

		saynn("[say=tavi]Yes-s.. Kgh.. Breed your stupid horny pet.. Ah.. Drain those balls..[/say]")

		saynn("[say=pc]Fuck.. yes..[/say]")

		saynn("After you spill your load into her.. Tavi starts to smile.")

		saynn("[say=tavi]Another round~?[/say]")

		addButton("Continue", "See what happens next", "rough_otherfuck")
	if(state == "rough_otherfuck"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You spend the next hour fucking Tavi in various positions.. Pounding her pussy raw, making up for all the missed opportunities.")

		saynn("Obviously you orgasm inside, your balls struggling to produce enough of your seed before you stuff it into Tavi's pulsing lovehole.")

		saynn("Each time you orgasm, you feel a little weaker. But your sex drive doesn't go away, it only gets ignited more.")

		addButton("Continue", "See what happens next", "rough_otherfuck2")
	if(state == "rough_otherfuck2"):
		playAnimation(StageScene.SexReverseCowgirl, "fast", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Even when you are too exhausted to continue fucking her, Tavi finds a way to make you hard and then starts riding you with her slick dripping pussy, moaning passionately in the process.")

		saynn("And your orgasms keep coming and coming, your balls getting drained by that insatiable kitty as she only seems to be getting more eager from this.")

		saynn("After a few more of those, the idea of falling asleep suddenly starts to become quite appealing.. Tavi literally fucks you until you lose consciousness.. Breeding her pussy for the last time felt still as good though..")

		addButton("Continue", "See what happens next", "rough_afterfuck")
	if(state == "rough_afterfuck"):
		playAnimation(StageScene.Sleeping, "idle", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("As you open your eyes, you find yourself lying on Tavi's bed with her being your cuddle-blanket. She is purring quietly while resting on your chest.")

		saynn("You realize that a few hours have passed since your fun time. Your hands carefully stroke Tavi's back.")

		saynn("[say=tavi]Murr-r~?..[/say]")

		saynn("[say=pc]Fine-e. Maybe some other time..[/say]")

		saynn("You continue resting together for a while. The captain can wait a few hours.. He won't be able to avoid his fate forever.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "near_checkpoint"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("And here you are. Standing before the checkpoint. Tavi is standing by your side.")

		saynn("You don't have any laser rifles or shiny armor to protect yourself. Just your fists and bodies and a strong desire to get out of this place. Or maybe you just wanna make the captain pay for what he did? Does it matter in the end? Not really.")

		saynn("Will they be ready? Maybe. But it won't stop you. Tavi will help you make it clean and smooth.")

		saynn("Checkpoint.. Elevator.. Command deck.. Captain's office. Should be easy.")

		addButton("Checkpoint", "Walk through the main entrance", "checkpoint_firstguard")
func taviSpeak(corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return corruptSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "virginity_rough"):
		processTime(3*60)

	if(_action == "virginity_gentle"):
		processTime(3*60)

	if(_action == "near_checkpoint"):
		processTime(3*60)

	if(_action == "rough_steal"):
		processTime(2*60)
		setFlag("TaviModule.TaviIsNotVirgin", true)
		setFlag("TaviModule.Ch7TaviTookVirginityBeforeMission", true)

	if(_action == "rough_fuck"):
		processTime(5*60)

	if(_action == "rough_faster"):
		processTime(3*60)

	if(_action == "rough_cum"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 60)
		GM.pc.addStamina(-50)

	if(_action == "rough_otherfuck"):
		processTime(20*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addStamina(-50)

	if(_action == "rough_otherfuck2"):
		processTime(20*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addStamina(-50)

	if(_action == "rough_afterfuck"):
		processTime(3*60*60)
		GM.pc.addPain(-600)
		GM.pc.addStamina(600)

	if(_action == "checkpoint_firstguard"):
		processTime(2*60)
		npc1id = GuardGenerator.new().generate({NpcGen.Level: 30, NpcGen.Temporary: true})
		npc2id = GuardGenerator.new().generate({NpcGen.Level: 30, NpcGen.Temporary: true})
		addCharacter(npc1id)
		addCharacter(npc2id)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["npc1id"] = npc1id
	data["npc2id"] = npc2id

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	npc1id = SAVE.loadVar(data, "npc1id", "")
	npc2id = SAVE.loadVar(data, "npc2id", "")
