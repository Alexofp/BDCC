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
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
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
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
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
		addButton("Get kinky", "Show a list of lewd stuff that you can try to do", "get_kinky_menu")
		addButton("Enough chat", "Time to go", "endthescene")
	if(state == "get_kinky_menu"):
		if (shyness > 0.6):
			saynn("Artica is still quite shy. Doing some kinky things with her should help her to open up.")

		else:
			saynn("Your actions seem to help Artica to open up. What do you want to do with her?")

		addButton("Check beans", "Make sure Artica's hind leg is still alright", "kinky_checkbeans")
		addButton("Force her", "Enough beating around the bush. Enough trying to be kind. Time to force Artica out of her comfort zone", "do_force_her")
		addButton("Back", "Go to the previous menu", "")
	if(state == "kinky_checkbeans"):
		playAnimation(StageScene.CheckPaw, "tease", {pc="artica", npc="pc"})
		saynn("You get up and crouch near Artica's bench.")

		if (shyness > 0.6):
			saynn("[say=artica]Umm.m..[/say]")

			saynn("[say=pc]I wanna make sure your paw is alright.[/say]")

			saynn("[say=artica]But..but.. It's okay now..[/say]")

			saynn("[say=pc]I just wanna make sure, okay?[/say]")

			saynn("She pulls her leg up and holds her chin low, her gaze shaky, her paws shift nervously.")

			saynn("[say=artica]Mm.m.. okay..[/say]")

		else:
			saynn("[say=artica]What do you want to do..[/say]")

			saynn("[say=pc]Nothing much, just to check your paw.[/say]")

			saynn("She pulls her leg up onto the bench, her paws travel along it.")

			saynn("[say=artica]Mm.m.. sure..[/say]")

		saynn("What do you want to focus on?")

		addButton("Ankle", "Make sure her ankle is alright", "kinky_checkpaw_ankle")
		if (shyness > 0.5):
			addDisabledButton("Beans", "Artica is too shy to do this")
		else:
			addButton("Beans", "Give her cyan beans a few rubs", "kinky_checkpaw_beans")
		if (pawslut < 0.2):
			addDisabledButton("Lick beans", "Artica's is not into paws enough yet")
		else:
			addButton("Lick beans", "Give her beans some treatment with your tongue", "kinky_checkpaw_lick")
	if(state == "kinky_checkpaw_ankle"):
		playAnimation(StageScene.CheckPaw, "check", {pc="artica", npc="pc"})
		saynn("While still crouching, you reach your left hand out, waiting for Artica to do the next move.")

		saynn("The girl looks around the canteen. The place is always busy.. but all of the inmates seem to be focussed on filling their bellies with anything remotely edible.. So Artica nods and then carefully lands her hind paw onto your offered palm.")

		saynn("Fluffy.. You do a quick visual check, inspecting her paw from most angles while she watches you do that. Everything seems to be okay.")

		saynn("[say=pc]I'm gonna warm your muscles a bit.[/say]")

		if (shyness > 0.4):
			saynn("[say=artica]O..ok.kay..[/say]")

		else:
			saynn("[say=artica]Okay.. You c-can do more than that.. if you w-want..[/say]")

		saynn("Your left hand keeps supporting her ankle while the second one starts traveling along it, following the curve, your digits combing her short white fur.")

		saynn("Instinctively or not, she starts curling her toes from that. You can feel the tension in her paw.. tension that you proceed to dissipate with your touches and rubs.")

		saynn("You don't dare to go lower, just focussing on kneading her ankle, your digits digging into her fur a bit.")

		saynn("[say=pc]Feels nice, doesn't it?[/say]")

		if (shyness > 0.4):
			saynn("[say=artica]Nn.. n..nyes?..[/say]")

			saynn("Nyes? What kind of answer is that.")

			saynn("[say=pc]I will take that as a yes.[/say]")

		else:
			saynn("[say=artica]It does..[/say]")

			saynn("[say=pc]I'm glad.[/say]")

		saynn("You continue doing that for a bit longer, making sure Artica's hind paw is properly warmed up.")

		saynn("[say=pc]Now the other one.[/say]")

		if (shyness > 0.4):
			saynn("[say=artica]Oh.. um.. m-m..m.. It wa-.. wasn't.. I.. I don-..[/say]")

			saynn("[say=pc]Hm? You think the other leg shouldn't be warmed up?[/say]")

			saynn("She blushes and starts swaying subtly on the bench, her tail curling around her waist, her hands struggling to find a resting place, sliding over her thighs. She doesn't seem to be pulling her hind paw away though.")

			saynn("[say=artica]M-maybe?.. It s-should.. m-mm.. y.yes..[/say]")

		else:
			saynn("[say=artica]Oh.. um.. o-okay..[/say]")

			saynn("Didn't take long to persuade her. Seems like your efforts are paying off.")

		saynn("You carefully place her hind paw onto the floor and reach your left hand out again, waiting for her to raise her other leg and then slowly lower it onto your palm.")

		saynn("And so you start rubbing her second hind paw, your digits exploring the fur and giving her ankle a little massage.")

		saynn("As you remove the tension, you notice her toes sprawling wide.. on both paws actually.. Artica's breathing gets a little deeper. Time flies..")

		saynn("[say=pc]There you go. Good as new.[/say]")

		saynn("[say=artica]Oh.. R-right.. Thank you..[/say]")

		saynn("You place her hind paw onto the floor and nod.")

		addButton("Continue", "See what happens next", "")
	if(state == "kinky_checkpaw_beans"):
		playAnimation(StageScene.CheckPaw, "beans", {pc="artica", npc="pc"})
		saynn("You reach your left hand out, waiting for Artica to do the next move. She does, trusting you with her hind paw that she lands onto your palm.")

		saynn("You start off by sliding your free hand along her ankle, following her fur direction.. until you reach the bottom part.. the paw itself.")

		saynn("Your digits teasingly brush over the main paw pad.. making the girl sway to the side a little.. her lips parted as she was trying to say something.")

		saynn("[say=artica]..a..am-m..[/say]")

		saynn("[say=pc]Just relax, it will feel good.[/say]")

		saynn("[say=artica]Okay.. yes-s..[/say]")

		saynn("You trace the outline cyan pad.. that kinda looks like a little bumpy heart.. before moving on to other ones and tracing them too, making the girl squirm subtly, her toes curling around your digits.")

		saynn("The texture on those beans is a little rough.. kinda like a dog's snout.. it feels nice to knead them and watch the girl react.")

		saynn("[say=artica]Am.. ah.. h-h.. mm-m.. nnn.n..[/say]")

		saynn("Her other hind paw keeps shifting around on the floor.. so after kneading this one plenty, you decide to switch and grab the other one!")

		saynn("[say=artica]E..eep..[/say]")

		saynn("She instinctively tries to free it.. but you hold it firmly with one hand while the second lands on the beans and starts caressing them. Gentle rubs and pokes make the fluff melt, more cute noises escape her maw.")

		saynn("[say=artica]N.n-n.. ah-h.. hah..[/say]")

		saynn("[say=pc]You're enjoying this, aren't you? Don't be shy.[/say]")

		saynn("The girl is panting softly, her cheeks blush red. You feel like you already know the answer.")

		saynn("[say=artica]M-maybe.. ahh-h..[/say]")

		saynn("You smile and just keep giving her beans a little massage, being careful to avoid the claws.")

		saynn("After the second paw is properly teased, you lower it gently onto the floor.")

		saynn("[say=pc]There we go.[/say]")

		saynn("[say=artica]T-thankies..[/say]")

		if (pawslut > 0.4):
			saynn("She seems to be getting interested in paws, huh..")

		addButton("Continue", "See what happens next", "")
		if (pawslut > 0.4):
			addButton("Switch?", "Maybe she will want to do the same with you", "kinky_checkpaw_switch")
		else:
			addDisabledButton("Switch?", "Artica is not interested in paws enough yet")
	if(state == "kinky_checkpaw_switch"):
		playAnimation(StageScene.CheckPaw, "beans", {pc="pc", npc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		#var pawsname = ("feet" if (!isDigi  && !isHoofs) else ("paws" if isDigi else "hoofs"))
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		saynn("Seeing that Artica seems to like this.. you wonder if she would be down to try to do it herself.")

		saynn("[say=pc]Wanna switch?[/say]")

		saynn("The blushing fluff tilts her head.")

		saynn("[say=artica]Switch?..[/say]")

		saynn("You get up and place your "+str(pawname)+" onto the bench. Artica blinks many times, her eyes starting at it.")

		saynn("[say=artica]I.. I'm n-not.. s-sure..[/say]")

		saynn("You don't hear a no.")

		saynn("[say=pc]Not gonna force you. That's okay if you don't..[/say]")

		saynn("[say=artica]I can t-try..[/say]")

		saynn("Hah. You switch places. Artica crouches in front of you, for once, and carefully lifts your left "+str(pawname)+". She inspects it from up close.. her eyes seem to be showing a lot of interest. She bites her lips.. before parting her maw wide and seemingly trying to fit your..")

		saynn("[say=pc]You don't have to eat it, silly.[/say]")

		saynn("The fluff blushes deeply and nuzzles your leg quickly before pulling away.")

		saynn("[say=artica]Oh.. s-sorry..[/say]")

		saynn("She snaps out of it and proceeds to instead gently rub your "+str(pawname)+" with her hands, her clawed digits caressing it.")

		saynn("When someone else's hand does this.. It tickles a lot.. you can see why Artica was squirming back then.")

		saynn("[say=artica]Is that.. okay?[/say]")

		saynn("[say=pc]Yeah, just don't do it too fast.[/say]")

		saynn("Artica nods and keeps kneading and rubbing your "+str(pawname)+", switching to the other one after some time.")

		saynn("Her touches are certainly becoming less shy as the time passes. Looks like the fluff is learning fast..")

		saynn("[say=pc]Good job, Artica.[/say]")

		saynn("She chrrrs happily.")

		addButton("Continue", "See what happens next", "")
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

	if(_action == "kinky_checkbeans"):
		processTime(3*60)
		#getModule("ArticaModule").removeShy(0.03)
		#getModule("ArticaModule").addPawslut(0.03)

	if(_action == "kinky_checkpaw_ankle"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "kinky_checkpaw_beans"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.03)

	if(_action == "kinky_checkpaw_lick"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.06)

	if(_action == "kinky_checkpaw_switch"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.06)

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
