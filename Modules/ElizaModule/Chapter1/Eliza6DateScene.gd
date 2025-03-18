extends SceneBase

var isWine = false

func _init():
	sceneID = "Eliza6DateScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza's shift has ended.. which means.. It's time to meet her.")

		saynn("You find her behind the counter, putting her mug and the laptop away, preparing for something.")

		saynn("[say=eliza]Oh, hey. I'm almost ready.[/say]")

		saynn("She leaves your view.. just to step out of one of the staff-only doors about a minute later.")

		saynn("[say=eliza]Are you ready, my assistant?[/say]")

		saynn("[say=pc]Depends.[/say]")

		saynn("She smiles, her hand is holding a chain..")

		saynn("[say=eliza]I won't use it more than I have to. Unless you will ask~.[/say]")

		saynn("Well, it makes sense for prisons to have at least some safety measures. Worst case, it's just a padded room..")

		addButton("Continue", "See what happens next", "get_leashed")
	if(state == "get_leashed"):
		aimCameraAndSetLocName("cd_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("Eliza reaches and attached a chain leash to your collar with a satisfying click. Running away is not an option anymore.")

		saynn("[say=eliza]There we go, let's go chill![/say]")

		saynn("She guides you towards the elevator, gently tugging on the leash, inviting you to follow.")

		saynn("As you join her inside, she presses her badge against some panel and selects the floor that you haven't really seen to be picked that much.. the top floor.")

		saynn("Doors shut and the elevator begins to move up with an annoying screech.")

		saynn("[say=eliza]Just act casual.[/say]")

		saynn("Makes you wonder why she said that.")

		saynn("But the reason becomes clear quite soon.")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="risha"})
		aimCameraAndSetLocName("cd_near_elevator")
		saynn("As soon as you step out, you're pretty much instantly greeted by some guards.. and they're not exactly happy to see you. One of the guards looks particularly annoyed, a tall and buff lynx. She steps out and blocks the path.")

		saynn("[say=risha]Look what we have here. I see intruders. Should I just shoot you on sight? Or give a few seconds to explain yourself first?[/say]")

		saynn("Eliza meets her glare with some strict eyes.")

		saynn("[say=eliza]Risha.. The only thing you are shooting is cum out of that useless cock of yours.[/say]")

		saynn("Risha's nostrils flare.. she proudly grabs onto her armored crotch plate, emphasizing her.. virility. Her voice drips with smug amusement.")

		saynn("[say=risha]Oh, is the bitch jealous, huh~? I can give you a litter or two, just beg me nicely.[/say]")

		saynn("Eliza rolls her eyes.")

		saynn("[say=eliza]Hard pass. You can't even fuck someone without making it look like a bloodshed.[/say]")

		saynn("[say=risha]That's just how cat dicks work, I thought you knew your biology~.[/say]")

		saynn("[say=eliza]I also know chemistry. Want a prescription for a limp dick drug? Your ass is in the way, move it, please.[/say]")

		saynn("[say=risha]I will put my ass anywhere I want, sugar. Like on your face.[/say]")

		saynn("[say=eliza]The only reason why your ass can still be here is because I can't be bothered to report it.[/say]")

		saynn("[say=risha]I'm so scared, wow.[/say]")

		saynn("Feels like you're about to witness a catfight.. But then Risha leans to the side.. and sees you.")

		saynn("[say=risha]Inmates aren't allowed to be here. Feels like it's you who should be reported here.[/say]")

		saynn("[say=eliza]That's my assistant. It's under my full responsibility. Now back off, Risha.[/say]")

		saynn("The staff here is so friendly with each other..")

		saynn("[say=risha]Assistant? Looks like a fucktoy to me.[/say]")

		saynn("[say=eliza]Everything looks like a fucktoy to you, your brain is running on cum.[/say]")

		saynn("[say=risha]That ain't true! For example, you look like a bitchtoy to me instead.[/say]")

		saynn("Eliza furrows her brows and tries to walk past.. but Risha bumps her back.")

		saynn("[say=risha]Nope.[/say]")

		saynn("[say=eliza]Alright, I will be reporting you to the captain now then.[/say]")

		saynn("Eliza turns around and starts heading back to the elevator. Risha growls.")

		saynn("[say=risha]Fine, fine, you softie. Just say please and you may pass.[/say]")

		saynn("[say=eliza]Please go screw yourself, Risha.[/say]")

		saynn("[say=risha]Love you too, sugar. Mwah.[/say]")

		saynn("Risha sends you and Eliza an air kiss.. and finally steps aside.")

		saynn("Eliza rolls her eyes.. and steps past.")

		addButton("Continue", "See what happens next", "near_staff_bar")
	if(state == "in_staff_bar"):
		removeCharacter("risha")
		aimCameraAndSetLocName("cd_corridor5")
		playAnimation(StageScene.Duo, "walk", {npc="eliza", bodyState={leashedBy="eliza"}, npcAction="walk", flipNPC=true})
		saynn("While following Eliza through these corridors.. you can't help but notice the stark contrast between them and what the inmates get. Pristine, polished floors.. soft hum of the fancy overhead lights.. slick, clean walls that occasionally have paintings on them. The style is cold and corporate.. but anything is better than ugly concrete and metal.")

		saynn("[say=eliza]We got unlucky today, Risha is a real nightmare.[/say]")

		saynn("[say=pc]I saw it, looks like you're not exactly friendly with each other.[/say]")

		saynn("[say=eliza]That lynx.. is an animal, I don't really have any other words to describe her.[/say]")

		saynn("You've been stopped a few more times by the guards.. but they just let Eliza go without much problem as soon as she tells them who you are.")

		saynn("[say=pc]Animal?[/say]")

		saynn("[say=eliza]She is part of the reason I don't have much free time to work in the lab myself. She just always brings me more broken inmates. If you can subdue her, go for it, I'd be happy. Otherwise, just stay away.[/say]")

		saynn("You chuckle softly.")

		saynn("[say=pc]Makes sense.[/say]")

		saynn("[say=eliza]Eh, forget about her. Let's try to relax. That's the bar over there.[/say]")

		addButton("Bar", "Step inside", "in_bar")
	if(state == "in_bar"):
		aimCameraAndSetLocName("cd_office3")
		setLocationName("Staff bar")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("You step inside the bar.. and are met with a different, contrasting environment yet again.")

		saynn("The star of the room is obviously a long counter made out of some fancy red wood. It has some bar stools near it, with a few staff members sitting on them, chilling and doing drinks.")

		saynn("The lighting is dim yet warm, casting soft shadows that create an inviting.. almost intimate atmosphere. The walls are also made fancy with that same red wood trims and tasteful art.")

		saynn("[say=eliza]Let's go get a table. What do you want me to get for you, wine or just some orange juice?[/say]")

		saynn("She makes that question with a playful arch of her eyebrow. Wine? She is offering you something other than normal water? Wow.")

		addButton("Wine", "Choose the wine", "choose_wine")
		addButton("Juice", "Choose the orange juice", "choose_juice")
	if(state == "choose_wine"):
		playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc="eliza"})
		if (isWine):
			saynn("[say=pc]Wine sounds good.[/say]")

			saynn("[say=eliza]Good choice~.[/say]")

		else:
			saynn("[say=pc]Juice sounds good. I'd rather keep a clean mind.[/say]")

			saynn("[say=eliza]That will be impossible no matter what~.[/say]")

		saynn("Eliza brings you to one of the tables.. and clips the leash to one of the hooks on it. Huh. Makes you wonder why these tables have them.")

		if (isWine):
			saynn("[say=eliza]I will go source us a bottle.[/say]")

		else:
			saynn("[say=eliza]I will go get me a bottle.. and juice for you~.[/say]")

		saynn("While she is gone, you settle in, planting your butt on the comfy chair. Ambience here is nice.. occasional clink of glasses.. low murmur of conversion.. At least somewhere in this prison, there seems to be peace.")

		saynn("The more you think about it.. The softness in her voice, the subtle smile on her lips.. this bar that she brought you in.. the leash? Huh.")

		if (isWine):
			saynn("Soon enough, Eliza comes back, holding a bottle of wine and two glasses. She places one on your side and pours some of the velvety dark-purple wine into it.")

			saynn("She does the same for herself.. and just relaxes in her chair.")

		else:
			pass
		saynn("[say=eliza]Ooh.. finally. It's my favourite time. Time to rest.[/say]")

		saynn("[say=pc]You earned it.[/say]")

		saynn("Little smile illuminates her expression. She sips some of the wine and lets out a breathy sigh.. almost a moan."+str(" You take a sip too.. the fruity taste is so good, you can barely contain it.." if isWine else " You take a sip too.. the taste is so good, you can barely contain it..")+"")

		saynn("[say=eliza]It wouldn't feel so good.. if the rest didn't suck so much, hah. I guess I'm a masochist.[/say]")

		saynn("[say=pc]You're saying that you love pain?[/say]")

		saynn("Little smile turns into a smug one.")

		saynn("[say=eliza]Pain.. can be fun. It all depends on the situation. World isn't simple. But it's logical. And that's what I like about it.[/say]")

		saynn("[say=pc]It's like a cardboard box.[/say]")

		saynn("[say=eliza]You remember, yeah~.[/say]")

		saynn("[say=pc]Cardboard boxes are pretty fragile.[/say]")

		saynn("[say=eliza]Well, I'm not hurting the box. I'm just testing it.. exploring its reactions. Or do you think I'm one of those 'bad guys'?[/say]")

		saynn("It looks like she actually expects an honest answer to this one..")

		addButton("Good girl", "Tell her she is a good girl", "say1_goodgirl")
		addButton("Naughty girl", "Tell her she is a bad and naughty girl", "say1_badgirl")
	if(state == "say1_badgirl"):
		saynn("[say=pc]I think you're being on the naughty side quite often.[/say]")

		saynn("[say=eliza]Hah, you might be right~. Maybe you're even being a little too soft with me. Because I can be a real mean bitch sometimes~.[/say]")

		saynn("[say=pc]Do you like being treated like a bitch?[/say]")

		saynn("[say=eliza]I'm a doctor, I treat others~.[/say]")

		saynn("You might need something against a burn that she just caused to you.")

		saynn("[say=eliza]But you know, my mom would agree with you.[/say]")

		saynn("[say=pc]You're not on the best terms?[/say]")

		saynn("[say=eliza]It's a.. it's a whole thing.[/say]")

		saynn("[say=pc]We got time. I got ears"+str(" and some wine" if isWine else " and some juice")+".[/say]")

		saynn("[say=eliza]Hah. I'm not sure I trust you enough with that, my assistant.[/say]")

		saynn("She holds a little pause while staring at the wine bottle. A bottle that is still far from being empty.")

		saynn("[say=eliza]Not yet, at least~.[/say]")

		addButton("Continue", "See what happens next", "chat2")
	if(state == "say1_goodgirl"):
		saynn("[say=pc]I think you're a good girl. Incredibly smart too.[/say]")

		saynn("[say=eliza]Aw, you're making me blush, hah. You're just saying it because you don't wanna ruin the mood.[/say]")

		saynn("[say=pc]Well, I mean it.[/say]")

		saynn("[say=eliza]If my mom was here, she would start a fight with you~.[/say]")

		saynn("[say=pc]You're not on the best terms?[/say]")

		saynn("[say=eliza]It's a.. it's a whole thing.[/say]")

		saynn("[say=pc]We got time. I got ears"+str(" and some wine" if isWine else " and some juice")+".[/say]")

		saynn("[say=eliza]Hah. I'm not sure I trust you enough with that, my assistant.[/say]")

		saynn("She holds a little pause while staring at the wine bottle. A bottle that is still far from being empty.")

		saynn("[say=eliza]Not yet, at least~.[/say]")

		addButton("Continue", "See what happens next", "chat2")
	if(state == "chat2"):
		saynn("[say=pc]Keep your secrets.[/say]")

		saynn("[say=eliza]I very much will, until the bitter end.[/say]")

		saynn("She takes a sip.. emptying her glass.")

		var drugDenLevel = getFlag("DrugDenModule.HighestDrugDenLevel", 0)

		saynn("[say=eliza]You helped me to make some amazing discoveries in the lab. Oh yeah, I'm wondering, have you tried exploring that drug den yet?[/say]")

		if (drugDenLevel <= 0):
			saynn("[say=pc]Well.. uhh..[/say]")

			saynn("[say=eliza]I see. I thought I'm the pussy here~. There could be some drug samples there that we haven't found yet.[/say]")

			saynn("[say=pc]I will run into them one day anyway. I don't have to go down there, it feels risky.[/say]")

			saynn("[say=eliza]Fair. But if you get stuck with the research, the option is always there. Isn't having options nice~?[/say]")

		elif (drugDenLevel <= 3):
			saynn("[say=pc]Well.. uhh.. a little bit?[/say]")

			saynn("[say=eliza]A little bit?[/say]")

			saynn("Better be honest probably.")

			saynn("[say=pc]I didn't get very far. I really don't like those junkies, why not just get rid of them.[/say]")

			saynn("[say=eliza]Science isn't really about getting rid of things. We do help to upkeep the balance sometimes but that's about it. What we mostly do is.. research.[/say]")

			saynn("[say=pc]It's a strange way to research.[/say]")

			saynn("[say=eliza]You're exploring wild nature~. It's the best way to research. There could be some drug samples there that we haven't found yet.[/say]")

			saynn("[say=pc]I will run into them one day anyway. I don't have to go down there, it feels risky.[/say]")

			saynn("[say=eliza]Fair. But if you get stuck with the research, the option is always there. Isn't having options nice~?[/say]")

		elif (drugDenLevel <= 6):
			saynn("[say=pc]I did, actually. I didn't get too far yet, it's a dangerous place.[/say]")

			saynn("[say=eliza]Nature can be dangerous, it's true.[/say]")

			saynn("[say=pc]You're calling that drug den nature?[/say]")

			saynn("[say=eliza]It's a form of nature. A naturally-formed drug den. It wouldn't appear if there weren't perfect conditions for it.[/say]")

			saynn("That's one way to look at things..")

			saynn("[say=eliza]You're exploring wild nature~. It's the best way to research. There could be some drug samples there that we haven't found yet.[/say]")

			saynn("[say=pc]Yeah, I saw some make-shift lab equipment there.[/say]")

			saynn("[say=eliza]Fascinating. I don't regret not telling the guards about it. Because it gave us this option. Isn't having options nice~?[/say]")

		else:
			saynn("[say=pc]I did, actually. Got pretty far too, the thing has many levels to it. I'm not sure it even ever ends.[/say]")

			saynn("[say=eliza]Wow, really? That sounds extremely interesting. Our prison certainly doesn't have an unlimited amount of levels to it. Maybe something down there is affecting your perception?[/say]")

			saynn("[say=pc]It does smell like.. drugs.. down there.[/say]")

			saynn("[say=eliza]Maybe. Still. I don't regret not telling the guards about it. Because it gave us this option. Isn't having options nice~?[/say]")

		saynn("While she is busy, filling the glasses again, a question comes to your mind. A question that is related to her words.")

		saynn("[say=pc]After we discover all of the drugs that the inmates have been making here, what will you do?[/say]")

		saynn("[say=eliza]I will show our findings to my mother. And then.. something will probably happen. I don't know what.[/say]")

		saynn("[say=pc]What are you hoping will happen?[/say]")

		saynn("Her sharp feline tongue catches some more wine from the glass.")

		saynn("[say=eliza]Well.. I never wanted to be here. Imagine.. ugh.. I don't know if I should talk about it.[/say]")

		saynn("[say=pc]You're hoping she will take you back into her lab.[/say]")

		saynn("[say=eliza]Mhm.. It's a good lab.. Well, it was. Not until I accidentally mixed water and potassium.. whole tanks of it.[/say]")

		saynn("[say=pc]Sounds like you shouldn't have?[/say]")

		saynn("[say=eliza]Hah. What I remember is.. a giant fire.. but it wasn't red. It had a lilac tint to it. Looked beautiful. For a few seconds that I saw it. I will never forget it. Felt like I was staring directly into.. the deep science.[/say]")

		saynn("[say=pc]What happened then?[/say]")

		saynn("[say=eliza]..boom. What happened then is a big boom. So big that it threw me against the wall. That was fun. Wheeee.[/say]")

		saynn("[say=eliza]..dad had to risk his life to get an unconscious me out from under the fire. That wasn't.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_leashed"):
		processTime(3*60)

	if(_action == "sudden_risha"):
		processTime(3*60)

	if(_action == "near_staff_bar"):
		processTime(5*60)

	if(_action == "in_bar"):
		processTime(3*60)

	if(_action == "choose_wine"):
		processTime(5*60)
		isWine=true

	if(_action == "choose_juice"):
		processTime(5*60)
		isWine=false
		setState("choose_wine")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["isWine"] = isWine

	return data

func loadData(data):
	.loadData(data)

	isWine = SAVE.loadVar(data, "isWine", false)
