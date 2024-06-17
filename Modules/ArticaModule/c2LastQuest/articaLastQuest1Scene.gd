extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaLastQuest1Scene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("You approach Artica. Something feels different.. like you're being watched. You look around and don't find anything suspicious. Oh well.. You decide to direct your full attention to the girl.")

		saynn("[say=pc]Hey, Artica.[/say]")

		saynn("[say=artica]Hey-heys.[/say]")

		saynn("She was such a shy fluff when you first found her. But now look at her, being all happy, wiggling her"+str(" naked" if isNaked else "")+" butt around near you. Her eyes are sparkling with multiple kinds of.. energy.")

		saynn("Some things just never change though. As you establish direct contact, the girl quickly moves her gaze away, her cheeks gaining a soft red tint to them."+str(" Her paws are proudly caressing her big pregnant belly.." if getCharacter("artica").isVisiblyPregnant() else "")+"")

		saynn("[say=artica]Want s-something?..[/say]")

		saynn("[say=pc]Just staring. Blatantly.[/say]")

		saynn("She chuckles and bites her lip, presenting herself from different angles, bending and cupping her"+str(" milky" if getCharacter("artica").canBeMilked() else " perky")+" breasts, swaying and wiggling her fluffy butt at you"+str(", her locked useless cock always out and visible to you" if (isCaged && isNaked) else "")+".")

		saynn("[say=artica]You can stare.. or not just stare.. haha..[/say]")

		saynn("[say=pc]I can do a lot of things.[/say]")

		saynn("You reach your hand and grab her collar, gently pulling her closer, her cyan eyes staring at your lips..")

		saynn("[say=pc]Right?[/say]")

		saynn("The fluff is trembling ever so slightly in your hands.. her cheeks blushing more..")

		saynn("[say=artica]Y..yes..[/say]")

		saynn("Your free hand lands on her waist and caresses it possesively"+str(", already sliding into her shorts and.." if !isNaked else ", already sliding close to her inner thighs and..")+"")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "hurt", {npc="risha"})
		addCharacter("artica", ["sad"])
		saynn("..before you feel someone yanking on your collar, pulling you away from your prey..")

		saynn("[say=risha]Ha. Found ya.[/say]")

		saynn("You turn around and see that big lynx, the one who was parading Artica during her intake. The guard bends to the side, admiring the"+str(" naked" if isNaked else "")+" aroused fluff near you.")

		saynn("[say=risha]I see that you found your place, slut. I'm happy for you.[/say]")

		saynn("You block the view for that guard and shove her back a little.")

		saynn("[say=pc]The fuck do you want, cat? Looking for a fight?[/say]")

		saynn("[say=risha]Ehh. I prefer to fuck. Although, combining the two is even better~. Ever heard of a struggle-cuddle?[/say]")

		saynn("You clench your fists, your eyes narrowing.")

		saynn("[say=risha]So scary, wow. You think I called her a slut for nothing~?[/say]")

		saynn("Huh? The heck is she talking about. Risha sees your confusion and smiles.")

		saynn("[say=risha]Did she even tell you about her crimes? What did she do to end up here?[/say]")

		saynn("You struggle to remember it.. something about.. resisting AlphaCorp.. but what exactly.. you don't know..")

		saynn("[say=risha]Ohhh~. I guess she didn't.[/say]")

		saynn("[say=artica]Um..[/say]")

		saynn("[say=risha]I can tell if you want. She is not a lilac for nothing, you know. It's all in her files..[/say]")

		saynn("[say=artica]H-hey.. um..[/say]")

		saynn("[say=risha]Artica is a slut. And she always was, from day zero. From way before that. I bet she was spreading legs left and right. How quickly did she do that for you? Ohh, it took some time, didn't it~? I guess she was pretending to be shy or something~. Or maybe she just didn't like your face..[/say]")

		saynn("You don't even know what to think. Is she lying? She must be.. But Artica is wearing lilac colors.. which means her crimes are of a sexual nature..")

		saynn("[say=risha]You don't trust me, do you~?[/say]")

		saynn("She pulls out a datapad.. with a very cracked screen.. almost like someone sat on it..")

		saynn("[say=risha]I have proof here. Wanna see it?[/say]")

		saynn("[say=artica]Eep.. where is..[/say]")

		saynn("Something is happening behind you.. but you're gonna deal with that later.")

		saynn("[say=risha]So?[/say]")

		saynn("[say=pc]What's the catch?[/say]")

		saynn("She shrugs.")

		saynn("[say=risha]No catch. She lied to you. So I thought.. might as well be a good girl for once and fix the injustice~.[/say]")

		addButton("See proof", "Might as well..", "see_some_truth")
		addButton("Refuse", "It's all lies anyway..", "stay_ignorant")
	if(state == "see_some_truth"):
		saynn("[say=pc]Alright.[/say]")

		saynn("[say=risha]Mmm? Is that a yes, bitch?[/say]")

		saynn("[say=pc]Sure, whatever, show it already.[/say]")

		saynn("Risha's smile becomes more smug. She flips the datapad so you can see everything.. and then starts scrolling through Artica's files..")

		saynn("You see pictures.. a lot of them.. in each one.. Artica.. striking various poses.. while being completely naked. Her paws are usually close to her crotch, sometimes stroking her hard cock.. or spreading her ass.. squeezing her tits.")

		saynn("These photos were done outside of the prison for sure. Artica is not wearing a collar.. she is not wearing anything.. And you also see big buildings in the background of most of these.. and the sky. Wow.. sky. You don't even realize how much you miss it.")

		saynn("[say=pc]So?[/say]")

		saynn("[say=risha]So? You want something even more spicy? Here.[/say]")

		saynn("She shows you some kind of security recording where naked Artica runs into frame.. and starts masturbating wildly. Her fur has something written on it with a black marker.. but the resolution is too low to see it properly.. you do see her cock in all of its glorious details though..")

		saynn("The video then cuts to showing Artica covered in cum..")

		saynn("[say=risha]Such a hungry cum slut.. wow..[/say]")

		saynn("You can't deny.. She was way more.. timid with you. At least, at first.")

		saynn("Risha shows you more videos.. of some kind of public events.. where Artica suddenly rushes into the frame, all naked and horny.")

		saynn("She sure did some kinky stuff..")

		saynn("One of the files that Risha scrolls through contained some info about her.. It says that Artica was charged with a heavy case of Public Indecency. And that she is gonna serve her punishment in BDCC.")

		saynn("[say=risha]How many people have fucked her tight pussy I wonder.. Judging from all of this juicy stuff..[/say]")

		saynn("[say=pc]And that's all? I get it, you can stop already.[/say]")

		saynn("Risha smiles and puts the cracked datapad away.")

		saynn("[say=risha]See~. I'm not a lier. Unlike some. I guess you have some questions for her now, I won't distract you any more~.[/say]")

		saynn("Risha smooches the air, doing a loud lip-smack.. and then walks away, leaving you and Artica alone.")

		saynn("It's interesting..")

		addButton("Artica", "Ask her some things", "ask_fluff")
	if(state == "stay_ignorant"):
		saynn("[say=pc]You know what.. Fuck off.[/say]")

		saynn("Risha's smile only becomes more smug. She scrolls something on her datapad.. for a very long time.")

		saynn("[say=risha]Oh wow, look at that..[/say]")

		saynn("She scrolls and scrolls.")

		saynn("[say=risha]So.. naughty. Mmm~.[/say]")

		saynn("She sees your annoyed expression and finally puts the datapad away.")

		saynn("[say=risha]What? Still think that I'm lying? Or you just don't care? Don't care that Artica has lovers that she didn't tell you about? How many people have fucked her tight pussy I wonder.. And you just don't care? Maybe you like it~? I think there is a word for that~.[/say]")

		saynn("[say=pc]I'm thinking that you're doing this for a purpose.[/say]")

		saynn("[say=risha]Pfffff-f. See if I care. Whatever, stay ignorant~. Maybe you will understand it one day.[/say]")

		saynn("Risha smooches the air, doing a loud lip-smack.. and then walks away, leaving you and Artica alone. What a bitch.")

		saynn("Time to see if Artica is okay.")

		addButton("Artica", "Ask her some things", "ask_fluff")
	if(state == "ask_fluff"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("You turn towards Artica.. and find her in a state of distress.. understandably.")

		if (getFlag("ArticaModule.lastQuestSawPorn")):
			saynn("[say=pc]Is that true? You're here because of your slutty behaviour, Artica?[/say]")

		else:
			saynn("[say=pc]You're okay, Artica? Let's ignore whatever that guard said.[/say]")

		saynn("[say=artica]I.. I.. didn't.. I.. can.. I.. um.. I don't know..[/say]")

		saynn("She is stuttering so much. Way more than usual.")

		if (getFlag("ArticaModule.lastQuestSawPorn")):
			saynn("[say=pc]What's there to know?[/say]")

		else:
			saynn("[say=pc]Relax, please.[/say]")

		saynn("[say=artica]I can.. um.. ex.. ex-x.. p..[/say]")

		saynn("[say=pc]Explain?[/say]")

		saynn("You don't know how to feel. On one hand.. who cares.. Artica could fuck with anyone she wants. But why was she acting like a shy inexperienced girl then? Was it really because of how you look or act.. or is there some kind of dark reason?")

		saynn("Tears stream down Artica's cheeks.. She is crying. You never saw her cry before..")

		saynn("[say=artica]s-someone.. s-s..[/say]")

		saynn("[say=pc]What? Calm down already, Artica. We can talk peacefully. I'm not mad.[/say]")

		saynn("You notice her rubbing her ear.. but only one of them.. strange. You only see a small hole going through it, clearly from some piercing.. wait..")

		saynn("[say=pc]Is your dream catcher missing?[/say]")

		saynn("You swear that it was there just a minute ago.. So much is happening at the same time. You try to push your other thoughts away for now..")

		saynn("[say=artica]Y-yeah.. It's.. the l-last link that I have with my tribe and family.. n-no.. h-had..[/say]")

		saynn("The realization begins to settle in.. Artica whines quietly..")

		saynn("[say=pc]What happened to it?[/say]")

		saynn("[say=artica]S-so..s-someone.. s-s.. stole..[/say]")

		saynn("Someone stole it, huh.. Right when you were arguing with that big cat..")

		saynn("[say=pc]Did you see them?[/say]")

		saynn("Artica shakes her head.")

		saynn("[say=artica]It w-was just.. g-gone..[/say]")

		saynn("Could be anywhere. You look around.. there are some onlookers, some of them probably saw something. You doubt that you will get much info out of them though.. without some convincing.")

		addButton("Comfort", "Try to cheer Artica up", "do_comfort")
		addButton("Ask to explain", "You're not planning to do anything for her until she explains herself", "no_trust")
	if(state == "no_trust"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("[say=pc]After everything that happened, I hope you can excuse me if I don't trust your words.[/say]")

		saynn("Artica wipes her tears.. but more appear.")

		saynn("[say=artica]I'm s-s.sorry.. I c-can explain..[/say]")

		saynn("[say=pc]Yeah, that'd be nice.[/say]")

		saynn("She looks at you with her big sorry eyes.. sniffing a lot..")

		saynn("[say=artica]Um.. I.. d-don't.. k-know.. w-where to start..[/say]")

		saynn("[say=pc]From the beginning.[/say]")

		saynn("She parts her lips.. but no words come out. Artica is just shaking more and more.. She is clearly not in a state to tell you anything.")

		saynn("[say=pc]Alright, relax. Calm down. I will look for your dreamcatcher but I can't promise anything.[/say]")

		saynn("The fluff nods-nods.. She lowers her head low, her ears flicking.. but without making any noise this time..")

		saynn("[say=artica]S-sorry..[/say]")

		saynn("She heads towards her cell, unable to endure being out in public anymore. Her paw is rubbing her ear constantly..")

		saynn("At some point she stumbles and falls. Ow. So you decide to help her get to her cell.")

		saynn("After that.. It was time to see if anyone here saw anything.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_comfort"):
		playAnimation(StageScene.Hug, "hug", {pc="pc", npc="artica"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("You offer Artica a warm hug. You can feel her stress through all the random twitches that her body is doing..")

		saynn("[say=pc]I will find it, Artica. Even if I will have to beat up every inmate of this prison.[/say]")

		saynn("She nods subtly.")

		saynn("[say=artica]S-sorry..[/say]")

		saynn("[say=pc]Don't be. You're gonna be okay for now?[/say]")

		saynn("She shrugs.")

		saynn("[say=artica]I w-will be.. hiding in my c-cell..[/say]")

		saynn("[say=pc]You do that, try to stay calm.[/say]")

		saynn("You end the hug, allowing Artica to start heading towards her cell. Her paw is rubbing her ear constantly..")

		saynn("At some point she stumbles and falls. Ow. So you decide to help her get to her cell.")

		saynn("After that.. It was time to see if anyone here saw anything.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sudden_risha"):
		processTime(3*60)
		setFlag("ArticaModule.articaLostDreamcatcher", true)
		getCharacter("artica").updateBodyparts()

	if(_action == "see_some_truth"):
		processTime(3*60)
		setFlag("ArticaModule.lastQuestSawPorn", true)

	if(_action == "stay_ignorant"):
		processTime(3*60)
		setFlag("ArticaModule.lastQuestSawPorn", false)

	if(_action == "ask_fluff"):
		processTime(3*60)

	if(_action == "do_comfort"):
		addMessage("New task added!")

	if(_action == "no_trust"):
		addMessage("New task added!")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
