extends SceneBase

var isFirstTime = false
var shyness = 0.0
var pawslut = 0.0

func _init():
	sceneID = "articaS6CanteenTalkScene"

func _reactInit():
	isFirstTime = getFlag("ArticaModule.s6FirstTime", false)
	if(!isFirstTime):
		addCharacter("artica")
		setState("talk_menu")

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcAction="sit"})
		saynn("You do the usual, grabbing a prisoner's meal before heading for Artica's table.")

		saynn("She seems to be.. under the table? Well, her head is. Artica is still sitting on the bench, just bending very low, her hands seem to be doing something with her hind paws.")

		saynn("[say=pc]Hey there.[/say]")

		saynn("[say=artica]EEP![/say]")

		saynn("Bonk.")

		saynn("Poor fluff hits the back of her head on the table.")

		saynn("[say=pc]Oops. Didn't mean to startle you.[/say]")

		var didMassage = getFlag("ArticaModule.s5GaveMassage", false)
		if (didMassage):
			saynn("Artica sits up and rubs the back of her head.")

			saynn("[say=artica]It's okay..[/say]")

		else:
			saynn("Artica finishes taking off the elastic bandage and sits up, her hand rubs the back of her head.")

			saynn("[say=artica]It's okay..[/say]")

		saynn("She pulls up her hind paw and takes a look at the pawpads, probably to make sure they're alright.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "talk_menu"):
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcAction="sit"})
		saynn("You sit near Artica in the canteen.")

		shyness = getModule("ArticaModule").getShyness()
		pawslut = getModule("ArticaModule").getPawSlut()
		saynn("Shyness: "+str(getModule("ArticaModule").getShynessString())+"")

		if (pawslut  > 0.0):
			saynn(""+str(getModule("ArticaModule").getPawslutString())+"")

		if (shyness <= 0.0):
			saynn("Huh.. You notice that Artica is doing something under the table.")

		if (!getFlag("ArticaModule.s6AskedLeg")):
			addButton("How is leg", "Ask Artica how is her leg doing", "ask_leg")
		else:
			if (!getFlag("ArticaModule.s6AskedRisha")):
				addButton("Risha", "Ask if Risha is still bullying Artica", "ask_risha")
		if (!getFlag("ArticaModule.s6AskedRisha")):
			addButton("Paws", "Ask Artica if she has interest in paws", "ask_paws")
		addButton("Enough chat", "Time to go", "endthescene")
	if(state == "ask_leg"):
		saynn("[say=pc]How is your leg doing? Still hurting?[/say]")

		saynn("Artica idly rubs her ankle.")

		saynn("[say=artica]Mm.. It's doing better.. Thank you.[/say]")

		saynn("She rubs it a little more, her toes wiggling as she does that.")

		saynn("[say=artica]I guess working in the mine shafts isn't for me. Haha..[/say]")

		saynn("First time you heard her giggle. That's something.")

		addButton("Get used to it", "Tell her that she will get used to it", "leg_getused")
		addButton("Other ways", "Tell her that there are other ways to earn credits", "leg_otherways")
		addButton("Prostitution", "Tell her that she could start whoring herself out for credits instead", "leg_whore")
	if(state == "leg_getused"):
		saynn("[say=pc]You will get used to it, everyone does. Your muscles will become stronger, your paw pads will become harder, your fur will get dirtier.[/say]")

		saynn("Artica hears that and lowers her gaze, her ears droop, making the dream catcher dangle. She puts her hind paw onto the floor and strokes her tail instead.")

		saynn("[say=artica]Mm..[/say]")

		saynn("[say=pc]The only alternative seems to be what every lilac does. You know.. serving others.[/say]")

		saynn("You can hear the dream catcher dangling again.")

		saynn("[say=artica]Hm.m.. Yeah, seems so..[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "leg_otherways"):
		saynn("[say=pc]There are other ways to earn credits.[/say]")

		saynn("Artica's ears perk, she tilts her head a bit.")

		saynn("[say=pc]You can get some for.. providing value to others. Yeah, that's a good way to put it.[/say]")

		saynn("[say=artica]Value? I don't really have anything of value..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Happiness is valuable too.[/say]")

		saynn("Artica ooohs and then chrrrs at your response.")

		saynn("[say=artica]Ohh. Haha.[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "leg_whore"):
		saynn("[say=pc]If smashing through rocks is too hard, you can always just choose to bounce on hard cocks instead, prostitute your body away.[/say]")

		saynn("Artica grabs tightly onto her paw, rubbing the cyan beans as a way to focus on something else.")

		saynn("[say=artica]Oh.. Um.. mm.m.. I don't know if that's a good idea..[/say]")

		saynn("You smile and reach over the table to grab her chin and make her look at you.")

		saynn("[say=pc]You got a cute face, Artica.[/say]")

		saynn("She blushes, her ears drooping.")

		saynn("[say=pc]And a very fuckable body~.[/say]")

		saynn("[say=artica]Umm.. hh..h.. I.. I g-gue.. s-s..[/say]")

		saynn("So cute to see her struggle with this. Artica clearly wants to look away.. but she doesn't dare to defy your touch, instead just playing with her paw beans more.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "ask_risha"):
		saynn("[say=pc]Is that big cat still bullying you?[/say]")

		saynn("Artica shrugs and quickly looks around.")

		saynn("[say=artica]Doesn't look like..[/say]")

		saynn("[say=pc]Good, you let me know if she returns.[/say]")

		saynn("The girl nods subtly.")

		saynn("[say=artica]You make me feel like.. I'm your pet. Haha.[/say]")

		saynn("She can be a cheeky fluff when she wants to, huh.")

		addButton("Just protecting", "Tell Artica that you just can't watch the weak ones getting bullied", "risha_justprotect")
		addButton("Who knows..", "Tell Artica that anything can happen in this life", "risha_whoknows")
		addButton("You are", "Tell Artica that she can consider herself your pet already", "risha_youare")
	if(state == "risha_justprotect"):
		saynn("[say=pc]Just trying to protect the ones who can't do it themselves.[/say]")

		saynn("Artica looks at her clawed paws.")

		saynn("[say=artica]I just.. I don't think I can.. m-mm.. fight well?[/say]")

		saynn("[say=pc]I can teach you a move or two. You have claws, you have teeth.[/say]")

		saynn("She shows you her sharp fangs. Corners of her mouth are trembling a bit. She is whining quietly.")

		saynn("[say=artica]I-I.. don't know..[/say]")

		saynn("To be fair, blood wouldn't look well on her snow-white fur.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "risha_whoknows"):
		saynn("[say=pc]You never know where life will bring you, heh.[/say]")

		saynn("Artica nods and paws the table.")

		saynn("[say=artica]That's very true.. Sometimes you lose control.. lose yourself even..[/say]")

		saynn("She reaches for her dream catcher and rubs it gently.")

		saynn("[say=artica]Mm..m.. yeah.. hard to follow the flow.. if the river became nothing but ice..[/say]")

		saynn("[say=pc]I can just feel that you lived in a tribe before.[/say]")

		saynn("She smiles.")

		saynn("[say=artica]Haha.. Yeah, things were wild..[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "risha_youare"):
		saynn("[say=pc]Bark.[/say]")

		saynn("Artica tilts her head.")

		saynn("[say=artica]Mmm.. um?..[/say]")

		saynn("You repeat, with a strict voice and a stern look.")

		saynn("[say=pc]Bark for me, now.[/say]")

		saynn("[say=artica]Um.. y..yip?.. Yip-yip.p..[/say]")

		saynn("Not really barking.. but maybe that's how her species bark.")

		saynn("You reach over the table and grab her by the collar, pulling her head a little closer.")

		saynn("[say=pc]See, you are pretty much my pet already. If I so desire, you will be my pet, slut or just a slave. Right?[/say]")

		saynn("Artica eeps.. keeping her chin high, exposing more of her bright fluffy neck for you.")

		saynn("[say=artica]Mmm.. m.m.. I-I.. y-y.. ah..[/say]")

		saynn("[say=pc]What, gonna try to bite me~?[/say]")

		saynn("You see some obvious signs of fear in her green eyes. Poor fluff is shaking.")

		saynn("[say=artica]N-n.no..[/say]")

		saynn("Her shorts are bulging..")

		saynn("[say=pc]Yeah, you know better than that~. Relax. For some reason I feel like you will enjoy most of the things that I will do to you.[/say]")

		saynn("You let go of her collar and pat the girl instead.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "ask_paws"):
		saynn("[say=pc]You seem to have some interest in.. paws.[/say]")

		saynn("Artica tilts her head.")

		saynn("[say=artica]..Do I?..[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_leg"):
		setFlag("ArticaModule.s6AskedLeg", true)
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "ask_risha"):
		setFlag("ArticaModule.s6AskedRisha", true)
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "ask_paws"):
		setFlag("ArticaModule.s6AskedRisha", true)
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "leg_otherways"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "leg_whore"):
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.02)

	if(_action == "enough_talk"):
		processTime(10*60)
		setState("talk_menu")
		return

	if(_action == "risha_whoknows"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "risha_youare"):
		getModule("ArticaModule").removeShy(0.05)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirstTime"] = isFirstTime
	data["shyness"] = shyness
	data["pawslut"] = pawslut

	return data

func loadData(data):
	.loadData(data)

	isFirstTime = SAVE.loadVar(data, "isFirstTime", false)
	shyness = SAVE.loadVar(data, "shyness", 0.0)
	pawslut = SAVE.loadVar(data, "pawslut", 0.0)
