extends SceneBase

var fromPC = false

func _init():
	sceneID = "KaitPregCuddleScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		fromPC = getCharacter("kait").isPregnantFrom("pc")
		saynn("[say=pc]I wanna spend some time with you. Wanna cuddle?[/say]")

		saynn("[say=kait]Sounds good![/say]")

		saynn("You invite Kait to follow you.")

		addButton("Continue", "See what happens next", "pick_cuddle")
	if(state == "0"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water.")

		saynn("[say=kait]It's nice here..[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("[say=kait]It's an ugly prison. So any pocket of.. nature.. as fake as it might be.. is still gonna be standing out.[/say]")

		saynn("You put your chin on her shoulder.. and just caress her bumpy belly. She is purring quietly, leaning into you.")

		saynn("[say=pc]How are you feeling? About becoming a mother? For the first time too.. potentially.[/say]")

		saynn("[say=kait]I'm not.. a huge fan.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=kait]I don't know. It's scary I guess.[/say]")

		saynn("[say=pc]Shouldn't have gotten pregnant then.[/say]")

		saynn("[say=kait]Hah. You're very supportive. Sex is fun, you know? How can I say no to sex..[/say]")

		saynn("[say=pc]Condoms?[/say]")

		saynn("[say=kait]They're.. boring.. they make it less pleasurable too.[/say]")

		saynn("[say=pc]Pretty sure that's not true.[/say]")

		saynn("[say=kait]Well to me they do! I'd rather have an extra risk rather than have less pleasure. Don't deny me the fun of feeling warm stuff being pumped into me..[/say]")

		saynn("You chuckle.")

		saynn("[say=pc]I won't, I won't.[/say]")

		saynn("Some time passes.")

		saynn("[say=kait]I guess I'm afraid of.. the process. It's gonna be painful.[/say]")

		saynn("[say=pc]In the end, yes. But if we bring you to the nursery, they will help with that.[/say]")

		saynn("[say=kait]Nursery.. of course they have a nursery here..[/say]")

		saynn("[say=pc]It will be okay.[/say]")

		saynn("[say=kait]Alright..[/say]")

		saynn("You just spend the rest of the free time like that, cuddling each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water.")

		saynn("[say=pc]It's your second time being pregnant. How do you feel after the first one?[/say]")

		saynn("[say=kait]Well.. I mean.. giving birth was the most painful part of it.[/say]")

		saynn("[say=pc]Was it that bad?[/say]")

		saynn("[say=kait]They injected me with something so I didn't really feel much. I was more scared than pained I think.[/say]")

		saynn("[say=pc]And now you are a mother. Officially.[/say]")

		saynn("[say=kait]I am.. yeah.. Crazy to think about that.[/say]")

		saynn("[say=pc]How do you feel about being a mother?[/say]")

		saynn("[say=kait]It's weird. I didn't really care about that. I wanna escape this shitty place, not get rooted to it.[/say]")

		saynn("[say=pc]You don't wanna escape now?[/say]")

		saynn("[say=kait]Escaping is very much top priority. I hope that my kids.. shit, that's so weird to say.. I hope they get a better future.[/say]")

		saynn("[say=pc]Gonna abandon them?[/say]")

		saynn("[say=kait]Listen.. I don't fucking now.."+str(" They're your kids too, you know.." if fromPC else "")+"[/say]")

		saynn("You nod subtly.")

		saynn("You stay quiet, both of you, just watching the waterfall.")

		saynn("[say=kait]Thanks for.. not abandoning me.[/say]")

		saynn("[say=pc]Don't mention it.[/say]")

		saynn("[say=kait]I was always gonna be a bad mother. I wanna fuck shit up, not raise kids.[/say]")

		saynn("[say=pc]Is that why you're pregnant again?[/say]")

		saynn("[say=kait]Oh, shut your mouth. I'm pregnant because I like sex.. and I like you..[/say]")

		saynn("[say=pc]Maybe pulling out is an option then?[/say]")

		saynn("[say=kait]Mmm.. no~. It's not. Not with me.[/say]")

		saynn("[say=pc]Well.. if you like creampies.. get ready to be good at baking then.[/say]")

		saynn("[say=kait]That.. was a weird one.[/say]")

		saynn("[say=pc]Worth a try.[/say]")

		saynn("[say=kait]Maybe I'm a weird one.[/say]")

		saynn("You just spend the rest of the free time like that, cuddling each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		playAnimation(StageScene.SexChair, "tease", {pc="pc", npc="kait"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You bring Kait to the spot that has a nice artificial waterfall and a few benches dotted around. You use one of them for cuddling.")

		saynn("Kait is now in your hands, watching the running water.")

		saynn("[say=kait]You know what.. I wanna sit in your lap![/say]")

		saynn("And so she does, landing her soft butt on your legs and putting her paws on your shoulders.")

		saynn("[say=kait]I hope I'm not too heavy~.[/say]")

		saynn("She was light to begin with.. so even with a full belly she is still not too much for you.")

		saynn("[say=pc]You're fine. Little lap cat.[/say]")

		saynn("[say=kait]I'm anything but little. I'm quite.. round.. currently.[/say]")

		saynn("[say=pc]And how do you feel about that? Which pregnancy is it for you?[/say]")

		saynn("[say=kait]Third one.. of the ones that I counted.. pretty sure.[/say]")

		saynn("[say=pc]Some you didn't count?[/say]")

		saynn("[say=kait]I got here because of an 'unsolicited breeding' charge, you know..[/say]")

		saynn("[say=pc]So you were pregnant before the prison?[/say]")

		saynn("[say=kait]I.. don't know.. Listen, it's a weird story.. They.. the AlphaCorp people.. they might have ended my pregnancy early.. if I had one..[/say]")

		saynn("[say=pc]So you got bred?[/say]")

		saynn("[say=kait]I don't fucking know.. I know. It's fucked up. I don't know if I was pregnant or not. I don't know if they ended my pregnancy early. I was honestly too fucked-up to care at that point.. I can tell you what I know but you're gonna think that I'm a slut.[/say]")

		saynn("[say=pc]I promise I won't.[/say]")

		saynn("[say=kait]I seduced an AlphaCorp official to try to get off my home planet. We had some stuff.. that strong stuff that sends you into another dimension. And then.. maybe we fucked, maybe we didn't, maybe he bred me.. maybe he didn't.. but I woke up and I'm in front of a judge who says that I'm going away for 'unsolicited breeding'.[/say]")

		saynn("[say=pc]One hell of a night it was.[/say]")

		saynn("[say=kait]Yeah.. shit. So? Do you think I'm a slut?[/say]")

		saynn("[say=pc]Maybe a little.[/say]")

		saynn("[say=kait]Oh fuck you! Hah.[/say]")

		saynn("[say=pc]I'm not the one carrying the third litter.[/say]")

		saynn("[say=kait]I love fucking, okay?[/say]")

		saynn("[say=pc]Fucking? Or being bred?[/say]")

		saynn("[say=kait]Fucking.. I think.. I'd be an awful mother. Well.. I am an awful mother already. Shit.[/say]")

		saynn("[say=pc]If you like fucking, why not do something else rather than get creampied?[/say]")

		saynn("[say=kait]Like what?[/say]")

		saynn("[say=pc]Anal?[/say]")

		saynn("[say=kait]Anal? Anal.. Do I look like a buttslut to you?[/say]")

		saynn("[say=pc]Maybe a little.[/say]")

		saynn("[say=kait]I will smother you with my huge milky tits![/say]")

		saynn("[say=pc]You have a nice ass. I bet it can take some good dick.[/say]")

		saynn("[say=kait]Anal stuff takes more preparation.. With pussy you just rub it a bit and you're good to go..[/say]")

		saynn("[say=pc]Ah, so you have experience.[/say]")

		saynn("[say=kait]Shush, you![/say]")

		saynn("She makes you shush with a kiss on your lips.")

		saynn("[say=kait]Take this.[/say]")

		saynn("Another few kisses land on your cheeks and your neck.")

		saynn("[say=kait]And this.. and this..[/say]")

		saynn("[say=pc]You are so getting pregnant again after this litter.[/say]")

		saynn("[say=kait]Do it~.[/say]")

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

		saynn("[say=pc]You seem to be happy about it.[/say]")

		saynn("[say=kait]Yep~. I like having a big belly.. giving birth to new kittens or so..[/say]")

		saynn("[say=pc]You can't even interact with them.[/say]")

		saynn("[say=kait]Yeah.. but maybe that's for the best. I can get fucked as much as I want and I don't have to pay the price for it~.[/say]")

		saynn("[say=pc]You're right. You would be a bad mother.[/say]")

		saynn("[say=kait]Aw, buzzkill. Don't remind me of that, I already know it.[/say]")

		saynn("[say=pc]Giving life also comes with responsibility.[/say]")

		saynn("[say=kait]AlphaCorp seems to be fine with taking this responsibility. And so if I can put more strain on their medical facilities.. it only makes sense to abuse this.[/say]")

		saynn("[say=pc]It feels like you're justifying your actions.[/say]")

		saynn("[say=kait]I just love getting bred! Is that such a bad thing? I just want you to pump my needy puss with that thick virile cum.. please..[/say]")

		saynn("It hits you. You realize what is up with her.")

		saynn("[say=pc]How old are you?[/say]")

		saynn("[say=kait]Twenty. Why?[/say]")

		saynn("She is just.. very young. Young and a bit silly. Being here, in this prison, doesn't help either. She never had to actually nurture her kids.")

		saynn("[say=pc]We do have to get out of this place. As fast as possible. Before you get addicted to this.[/say]")

		saynn("[say=kait]Addicted to what? I can stop any time~. Condoms, pulling out or anal, so many ways.[/say]")

		saynn("[say=pc]Uh huh.[/say]")

		saynn("[say=kait]Do you want to stretch my tight little tailhole sometime~?[/say]")

		saynn("[say=pc]We will see. Let's just cuddle, Kait.[/say]")

		saynn("She gives you a smooch on the lips.")

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

		saynn("[say=pc]What makes you like breeding so much? Tell me, Kait.[/say]")

		saynn("[say=kait]I love the warm fuzzy feeling in my belly.. when I get fucked and stuffed full of cum.. I love the risk.. am I on my safe days? Or am in heat and about to get another litter pumped into me.. I love knots.. I love barbs.. I love flared cocks.. the human ones are fun too~.[/say]")

		saynn("[say=pc]You sure are one lusty snow leopard.[/say]")

		saynn("[say=kait]Is that bad~?[/say]")

		saynn("[say=pc]No. It's not bad.[/say]")

		saynn("[say=kait]Breed me all you want~. Get my tits all big and milky.. get my pussy dripping with that virile seed.. Cum inside me.. again and again.. to make sure that I'm pregnant for sure.. I don't wanna be able to walk straight the next day.[/say]")

		saynn("You pull her closer.. and kiss her. She kisses you back. Your hands explore each other's bodies.")

		saynn("You get a feeling that you heard and saw everything you could during these cuddles. Kait is now obsessed about pregnancy, she won't say anything different if you get her knocked up again.")

		saynn("And so you just spend the rest of the free time like that, cuddling and kissing each other.")

		saynn("After that, you return back to the hideout.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["fromPC"] = fromPC

	return data

func loadData(data):
	.loadData(data)

	fromPC = SAVE.loadVar(data, "fromPC", false)
