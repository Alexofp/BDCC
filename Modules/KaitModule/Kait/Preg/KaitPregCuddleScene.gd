extends SceneBase

var fromPC = false
var howManyBirths = 0

func _init():
	sceneID = "KaitPregCuddleScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		fromPC = getCharacter("kait").isPregnantFrom("pc")
		howManyBirths = getFlag("KaitModule.kaitGaveBirths", 0)
		saynn("[say=pc]I wanna spend some time with you. Wanna cuddle?[/say]")

		saynn("[say=kait]Sounds good![/say]")

		saynn("You invite Kait to follow you.")

		if (howManyBirths > 5):
			saynn("Kait gave birth "+str(howManyBirths)+" times. Which scene variation do you want to see?")

			addButton("First time", "The first time Kait got pregnant", "0")
			addButton("Second time", "The second time Kait got pregnant", "1")
			addButton("Third time", "The third time Kait got pregnant", "2")
			addButton("Fourth time", "The fourth time Kait got pregnant", "3")
			addButton("Fifth time", "The fifth time Kait got pregnant", "4")
		else:
			addButton("Continue", "See what happens next", "pick_cuddle")
	if(state == "0"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water. It's soft sound is filling the air.")

		saynn("[say=kait]It's nice here..[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("[say=kait]It's an ugly prison. So any pocket of.. nature.. as fake as it might be.. is still gonna be standing out.[/say]")

		saynn("You put your chin on her shoulder and wrap your arms around her. Your hands find her bumpy belly and start to caress it in slow circles. She is purring quietly, leaning into you.")

		saynn("[say=pc]How are you feeling? About becoming a mother? For the first time too.. potentially.[/say]")

		saynn("Her paws rest on top of yours.")

		saynn("[say=kait]I'm not.. a huge fan.. actually.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("She shifts slightly, her ear flicking.")

		saynn("[say=kait]I don't know. It's scary I guess.[/say]")

		saynn("[say=pc]Shouldn't have gotten pregnant then.[/say]")

		saynn("She turns her head to give you a look. You respond by rubbing her belly more, making her shiver.")

		saynn("[say=kait]Hah. You're very supportive. Sex is fun, you know? How can I say no to sex..[/say]")

		saynn("[say=pc]Condoms?[/say]")

		saynn("[say=kait]They're.. boring.. they make it less pleasurable too.[/say]")

		saynn("[say=pc]Pretty sure that's not true.[/say]")

		saynn("She huffs and wiggles against you, her fluffy tail flicking.")

		saynn("[say=kait]Well to me they do! I'd rather have an extra risk rather than have less pleasure. Don't deny me the fun of feeling warm stuff being pumped into me..[/say]")

		saynn("You chuckle.")

		saynn("[say=pc]I won't, I won't.[/say]")

		saynn("Some time passes. You feel her belly rise and fall with each breath.")

		saynn("[say=kait]I guess I'm afraid of.. the process. It's gonna be painful.[/say]")

		saynn("[say=pc]It might be, yeah. But if we bring you to the nursery, they will help with that.[/say]")

		saynn("[say=kait]Nursery.. of course they have a nursery here..[/say]")

		saynn("[say=pc]It will be okay.[/say]")

		saynn("[say=kait]Alright..[/say]")

		saynn("She nuzzles her head against your neck, still purring softly.")

		saynn("[say=kait]You're warm..[/say]")

		saynn("[say=pc]So are you.[/say]")

		saynn("You just spend the rest of the free time like that, cuddling each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water. It's sound has a nice calming effect.")

		saynn("[say=pc]Second time being pregnant? How do you feel after the first one?[/say]")

		saynn("[say=kait]Well.. I mean.. giving birth was the most painful part.[/say]")

		saynn("[say=pc]Was it that bad?[/say]")

		saynn("She leans her head back against your shoulder. You stroke her hair, your fingers raking through the short dark strands.")

		saynn("[say=kait]They injected me with something so I didn't really feel much. I was more scared than pained I think.[/say]")

		saynn("[say=pc]And now you are a mother. Officially.[/say]")

		saynn("[say=kait]I am.. yeah.. Crazy to think about that.[/say]")

		saynn("[say=pc]How do you feel about that?[/say]")

		saynn("She places her paws on her belly, looking down at it. You cover her paws with your hands, squeezing gently.")

		saynn("[say=kait]It's weird. I didn't really care about that. I wanna escape this shitty place, not get rooted to it.[/say]")

		saynn("[say=pc]You don't wanna escape now?[/say]")

		saynn("[say=kait]Escaping is very much top priority. I hope that my kids.. shit, that's so weird to say.. I hope they get a better future.[/say]")

		saynn("[say=pc]Gonna abandon them?[/say]")

		saynn("She squirms a little in your embrace.")

		saynn("[say=kait]Listen.. I don't fucking now.."+str(" They're your kids too, you know.." if fromPC else "")+"[/say]")

		saynn("You nod subtly.")

		saynn("You stay quiet, both of you, just watching the waterfall. You reach up and give her shoulders some rubs. She melts into your touch, a low purr starting in her chest.")

		saynn("[say=kait]Thanks for.. not abandoning me.[/say]")

		saynn("[say=pc]Don't mention it.[/say]")

		saynn("[say=kait]I was always gonna be a bad mother. I wanna fuck shit up, not raise kids.[/say]")

		saynn("[say=pc]Is that why you're pregnant again?[/say]")

		saynn("She elbows you softly.")

		saynn("[say=kait]Oh, shut your mouth. I'm pregnant because I like sex.. and I like you..[/say]")

		saynn("[say=pc]Maybe pulling out is an option then?[/say]")

		saynn("[say=kait]Mmm.. no~. It's not. Not with me.[/say]")

		saynn("She turns her head to give you a playful look.")

		saynn("[say=pc]Well.. if you like creampies.. get ready to be good at baking then.[/say]")

		saynn("She hums, trying to understand your words.")

		saynn("[say=kait]That.. was a weird one.[/say]")

		saynn("[say=pc]Worth a try.[/say]")

		saynn("[say=kait]Maybe I'm a weird one.[/say]")

		saynn("Aren't we all weird? A deaf question falls onto silent ears.")

		saynn("You just spend the rest of the free time like that, cuddling each other.")

		saynn("After that, you return back to the hideout. Time well spent.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		playAnimation(StageScene.SexChair, "tease", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water.")

		saynn("[say=kait]You know what.. I wanna sit in your lap![/say]")

		saynn("And so she does, landing her soft butt on your legs and putting her paws on your shoulders, facing you now.")

		saynn("[say=kait]I hope I'm not too heavy~.[/say]")

		saynn("She was light to begin with.. so even with a full belly she is still not too much for you.")

		saynn("[say=pc]You're fine. Little lap cat.[/say]")

		saynn("[say=kait]I'm anything but little. I'm quite.. round.. currently.[/say]")

		saynn("She unbuttons her shirt from below, a proud little smile on her face.")

		saynn("[say=pc]And how do you feel about that? Which pregnancy is it for you?[/say]")

		saynn("[say=kait]Third one.. of the ones that I counted.. pretty sure.[/say]")

		saynn("You raise a brow.")

		saynn("[say=pc]Some you didn't count?[/say]")

		saynn("[say=kait]I got here because of an 'unsolicited breeding' charge, you know..[/say]")

		saynn("[say=pc]So you were pregnant before the prison? You have kids outside?[/say]")

		saynn("She looks away, her ears flattening with her head. She is clearly not too comfortable talking about this.")

		saynn("[say=kait]No.. no kids.. I.. don't know.. Listen, it's a weird story.. They.. the AlphaCorp people.. they might have ended my pregnancy early.. if I had one..[/say]")

		saynn("You start to gently knead her sides, your fingers sneaking under her shirt to dig into her soft fur.")

		saynn("[say=pc]But you did get pregnant?[/say]")

		saynn("[say=kait]I don't fucking know.. I know. It's fucked up. I don't know if I was pregnant or not. I don't know if they ended my pregnancy early. I was honestly too fucked-up to care at that point.. I can tell you what I know but you're gonna think that I'm a slut.[/say]")

		saynn("She avoids any eye contact, her paws tighten slightly on your shoulders.")

		saynn("[say=pc]I promise I won't.[/say]")

		saynn("She sighs.")

		saynn("[say=kait]I seduced an AlphaCorp official to try to get off my home planet. We had some stuff.. that strong stuff that sends you into another dimension. And then.. maybe we fucked, maybe we didn't.. but I woke up and I'm in front of a judge who says that I'm going away for 'unsolicited breeding'.[/say]")

		saynn("[say=pc]One hell of a night it was.[/say]")

		saynn("[say=kait]Yeah.. shit. So? Do you think I'm a slut?[/say]")

		saynn("[say=pc]Maybe a little.[/say]")

		saynn("[say=kait]Oh fuck you! Hah.[/say]")

		saynn("She swats at your chest playfully. When she tries to do it again, you catch her paw. She blushes.")

		saynn("[say=pc]I'm not the one carrying the third litter.[/say]")

		saynn("[say=kait]I love fucking, okay?[/say]")

		saynn("[say=pc]Fucking? Or being bred?[/say]")

		saynn("Another sigh.")

		saynn("[say=kait]Fucking.. I think.. I'd be an awful mother. Well.. I am an awful mother already. Shit.[/say]")

		saynn("[say=pc]If you like fucking, why not do something else rather than get creampied?[/say]")

		saynn("[say=kait]Like what?[/say]")

		saynn("[say=pc]Anal?[/say]")

		saynn("[say=kait]Anal? Anal.. Do I look like a buttslut to you?[/say]")

		saynn("[say=pc]Maybe a little.[/say]")

		saynn("[say=kait]I will smother you with my huge milky tits![/say]")

		saynn("Not the worst way to die. But some would disagree.")

		saynn("[say=pc]You have a nice ass. I bet it can take some good dick.[/say]")

		saynn("[say=kait]Anal stuff takes more preparation.. With pussy you just rub it a bit and you're good to go..[/say]")

		saynn("[say=pc]Ah, so you have experience.[/say]")

		saynn("[say=kait]Shush, you![/say]")

		saynn("She makes you shush with a kiss on your lips. Your hands get under her shirt and caress the fur of her sides.")

		saynn("[say=kait]Take this.[/say]")

		saynn("Another few kisses land on your cheeks and your neck.")

		saynn("[say=kait]And this.. and this..[/say]")

		saynn("[say=pc]You are so getting pregnant again after this litter.[/say]")

		saynn("[say=kait]Don't threaten me with a good time~.[/say]")

		saynn("You just spend the rest of the free time like that, cuddling and kissing each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3"):
		playAnimation(StageScene.SexChair, "tease", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water.")

		saynn("[say=kait]I like your lap.[/say]")

		saynn("And so she does, landing her soft butt on your legs and putting her paws on your shoulders. She was light to begin with.. so even with a full belly she is still not too much for you.")

		saynn("[say=kait]I'm pregnant again, lookies.[/say]")

		saynn("She arches her back, emphasizing her round mound and bigger breasts. The fabric of her shirt is having to stretch to contain her.")

		saynn("[say=pc]You seem to be happy about it.[/say]")

		saynn("[say=kait]Yep~. I like having a big belly.. Can't wait to be giving birth to new kittens or so..[/say]")

		saynn("[say=pc]Too bad you can't even interact with them.[/say]")

		saynn("[say=kait]Yeah.. but maybe that's for the best. I can get fucked as much as I want and I don't have to pay the price for it~.[/say]")

		saynn("The way she talks about it.. doesn't sit right with you.")

		saynn("[say=pc]You're right. You would be a bad mother.[/say]")

		saynn("She pouts. You kiss her frown away.")

		saynn("[say=kait]Aw, buzzkill. Don't remind me of that, I already know it.[/say]")

		saynn("[say=pc]Giving life also comes with responsibility.[/say]")

		saynn("She rolls her eyes.")

		saynn("[say=kait]AlphaCorp seems to be fine with taking this responsibility. And so if I can put more strain on their medical facilities.. it only makes sense to abuse this.[/say]")

		saynn("[say=pc]It feels like you're justifying your reckless actions.[/say]")

		saynn("She leans closer, her warm breath touching against your ear.")

		saynn("[say=kait]I just love getting bred! Is that such a bad thing? I just want you to pump my needy puss with that thick virile cum.. please..[/say]")

		saynn("It hits you. You realize what is up with her.")

		saynn("[say=pc]How old are you?[/say]")

		saynn("[say=kait]Twenty. Roughly. Why?[/say]")

		saynn("She is just.. very young. Young and a bit silly. Being here, in this prison, doesn't help either. She never had to actually nurture her kids.")

		saynn("[say=pc]We do have to get out of this place. As fast as possible. Before you get addicted to this.[/say]")

		saynn("[say=kait]Addicted to what? I can stop any time~. Condoms, pulling out or anal, so many ways.[/say]")

		saynn("[say=pc]Uh huh.[/say]")

		saynn("[say=kait]Do you want to stretch my tight little tailhole sometime~?[/say]")

		saynn("She wiggles her rear against your lap.")

		saynn("[say=pc]We will see. Let's just cuddle, Kait.[/say]")

		saynn("She gives you a smooch on the lips. You hold her close.")

		saynn("[say=kait]You're cute. I love your lap.[/say]")

		saynn("You just spend the rest of the free time like that, cuddling and kissing each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4"):
		playAnimation(StageScene.SexLotus, "tease", {pc="kait", npc="pc"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water.")

		saynn("[say=pc]So many times you got bred.[/say]")

		saynn("[say=kait]Yeah~. I lost count by now. Maybe carrying a litter is my true purpose in life.[/say]")

		saynn("[say=pc]What about escaping this place?[/say]")

		saynn("[say=kait]This place is the obstacle. We have to overcome it, of course.[/say]")

		saynn("[say=pc]Good. I was getting afraid that you were gonna give up.[/say]")

		saynn("[say=kait]No-no. We make the captain our bitch. We escape. But after that.. breeding for days~.[/say]")

		saynn("She nuzzles into your neck, purring loudly.")

		saynn("[say=pc]What makes you like breeding so much? Tell me, Kait.[/say]")

		saynn("[say=kait]I love the warm fuzzy feeling in my belly.. when I get fucked and stuffed full of cum..[/say]")

		saynn("She shivers against you.")

		saynn("[say=kait]I love the risk.. am I on my safe days? Or am in heat and about to get another litter pumped into me.. I love knots.. I love barbs.. I love flared cocks.. the human ones are fun too~.[/say]")

		saynn("[say=pc]You sure are one lusty snow leopard.[/say]")

		saynn("[say=kait]Is that bad~?[/say]")

		saynn("[say=pc]No. It's not bad.[/say]")

		saynn("[say=kait]Breed me all you want~. Get my tits all big and milky..[/say]")

		saynn("She takes your hand and places it on her chest. You can feel the slight swell, the warmth.")

		saynn("[say=kait]Get my pussy dripping with that virile seed.. Cum inside me.. again and again.. to make sure that I'm pregnant for sure.. I don't wanna be able to walk straight the next day.[/say]")

		saynn("You pull her closer.. and kiss her. She kisses you back, her paws cupping your face. Your hands explore her body, caressing her curves. You can feel the heat radiating from her, one hand slides down her belly, dipping lower, feeling the damp warmth between her legs through her shorts.")

		saynn("You get a feeling that you heard and saw everything you could during these cuddles. Kait is now obsessed about pregnancy, she won't say anything different if you get her knocked up again.")

		saynn("And so you just spend the rest of the free time like that, cuddling and kissing each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_cuddle"):
		if(howManyBirths >= 5):
			setState("5")
		elif(howManyBirths <= 0):
			setState("0")
		else:
			setState(str(int(howManyBirths)))
		processTime(30*60)
		setFlag("KaitModule.kaitDidCuddle", true)

	setState(_action)

func saveData():
	var data = .saveData()

	data["fromPC"] = fromPC
	data["howManyBirths"] = howManyBirths

	return data

func loadData(data):
	.loadData(data)

	fromPC = SAVE.loadVar(data, "fromPC", false)
	howManyBirths = SAVE.loadVar(data, "howManyBirths", 0)
