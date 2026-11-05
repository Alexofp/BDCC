extends SceneBase

var fromPC = false
var howManyBirths = 0
var bornChildAmount = 0
var bornString = ""

func _init():
	sceneID = "KaitHelpGiveBirthScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Grope, "tease", {pc="kait", npc="pc"})
		fromPC = getCharacter("kait").isPregnantFrom("pc")
		howManyBirths = getFlag("KaitModule.kaitGaveBirths", 0)
		if (howManyBirths <= 0):
			saynn("[say=kait]Hey.. uh.. I think it's happening.[/say]")

			saynn("Kait has her paws on her big round belly, blinking a lot.")

			saynn("You're quick to run up to her, holding her arm, offering support.")

			saynn("[say=pc]It's okay. Let's go down to the medical wing. Slowly.[/say]")

			saynn("[say=kait]I'm nervous.. It's my.. I think it's my first..[/say]")

			saynn("[say=pc]You're a strong kitty, you can do this.[/say]")

			saynn("It takes quite some time to reach the main elevator. Kait leans on you heavily, her breath coming in short, nervous huffs. Her fluffy tail is tucked low.")

			saynn("[say=kait]Hah.. wow.. it's really coming..[/say]")

			saynn("[say=pc]Just keep breathing. One step at a time.[/say]")

			saynn("She is trying to be brave but you can see the fear in her eyes.")

		elif (howManyBirths == 1):
			saynn("[say=kait]Oh. Oh no. Not again. Not now.[/say]")

			saynn("Kait grabs your arm, her claws digging in just a little. Her other paw is on her huge belly..")

			saynn("[say=pc]Hey, hey. It's okay. You've done this before I think.[/say]")

			saynn("[say=kait]Yes! But last time I didn't know how it would feel. Now I know what's coming. That's worse![/say]")

			saynn("You start walking her towards the hideout exit. Slowly.")

			saynn("[say=kait]The first time was supposed to be scary. That's not fair.[/say]")

			saynn("[say=pc]Life's not fair. Come on, strong kitty.[/say]")

			saynn("She grumbles the whole way, but she keeps walking, holding onto her belly. Her tail flicks with nervous energy.")

			saynn("[say=kait]I have a plan this time. I'm gonna be calm. Kait is gonna be cool. Kait is not gonna scream.[/say]")

			saynn("[say=pc]Sounds good.[/say]")

			saynn("Something twitches in Kait's belly.")

			saynn("[say=kait]AHH![/say]")

		elif (howManyBirths == 2):
			saynn("Kait is glancing down at her huge belly.")

			saynn("[say=kait]Well. Here we go again![/say]")

			saynn("[say=pc]You okay?[/say]")

			saynn("[say=kait]Yeah. I think I'm ready to give birth.[/say]")

			saynn("With your help, she starts walking towards the hideout exit. She starts waddling toward the door before you even offer your arm.")

			saynn("[say=kait]I think I'm getting used to it. Maybe I can reach the nursery myself.[/say]")

			saynn("[say=pc]No, you can not.[/say]")

			saynn("[say=kait]Hah.. You're right. Thanks for caring for me.[/say]")

			saynn("She leans on you a lot, stepping slowly.")

			saynn("[say=kait]I just don't wanna rely on others.[/say]")

			saynn("[say=pc]It's an honor.[/say]")

			saynn("She chuckles at that, but her ears perk up a little.")

		elif (howManyBirths == 3):
			saynn("Kait is standing a little hunched. One paw is braced against the nearest wall, the other on her belly.")

			saynn("[say=kait]Okay. Okay okay okay. It's time.[/say]")

			saynn("[say=pc]You sure?[/say]")

			saynn("[say=kait]Very sure. I know this feeling by now..[/say]")

			saynn("She pushes off the wall and takes your arm before you can even offer it. Her steps are slow but steady, like she's done this a hundred times.")

			saynn("[say=kait]I've got a system now. Breathe in and out. Full focus..[/say]")

			saynn("[say=pc]Sounds solid.[/say]")

			saynn("[say=kait]No need to rush.. I'm an experienced mother..[/say]")

			saynn("She waddles beside you, tail swishing in a slow, practiced rhythm.")

			saynn("[say=kait]Just gotta let my body.. do its thing..[/say]")

			saynn("[say=pc]Not now, preferably.[/say]")

			saynn("[say=kait]Hah. Of course.[/say]")

			saynn("She smiles, soft and genuine.")

		elif (howManyBirths == 4):
			saynn("Kait is holding onto her big belly.")

			saynn("[say=kait]Mmm. Yep. That's the feeling.[/say]")

			saynn("[say=pc]Time to go?[/say]")

			saynn("[say=kait]Time to go.[/say]")

			saynn("She holds up her arms at you, making grabby paws.")

			saynn("[say=kait]Carry me?[/say]")

			saynn("[say=pc]You can walk.[/say]")

			saynn("[say=kait]I can. But I don't want to.[/say]")

			saynn("She grins, that bratty cat.")

			saynn("[say=kait]At least help me walk there![/say]")

			saynn("Of course you were gonna help her. She leans on you, but there's a bounce in her step.")

			saynn("[say=kait]You know what's funny? I used to be scared of this. Like, really scared. Now it's just.. fun kinda.[/say]")

			saynn("[say=pc]Fun?[/say]")

			saynn("[say=kait]Yeah! Kait makes kittens~. It's what I do. It's what I'm good at.[/say]")

			saynn("She pats her belly proudly.")

			saynn("[say=kait]These are gonna be cute. I can feel it.[/say]")

		else:
			saynn("Kait is holding onto her huge belly.")

			saynn("[say=kait]I'm ready to give birth~.[/say]")

			saynn("[say=pc]You're cheerful, as always.[/say]")

			saynn("[say=kait]Why wouldn't I be? This is the best part![/say]")

			saynn("She waddles over and holds onto your arm, pressing close.")

			saynn("[say=kait]Been waiting for this.[/say]")

			saynn("[say=pc]You're excited to give birth?[/say]")

			saynn("[say=kait]Mmhm! The pushing, the breathing, the whole thing. It's like.. a workout. But the best kind.[/say]")

			saynn("She bites her lip, her cheeks blushing a bit.")

			saynn("[say=kait]And when they let me spend some time with my kids.. Best feeling in the whole world. Better than any heist.[/say]")

			saynn("[say=pc]You're really into this.[/say]")

			saynn("[say=kait]Well, you helped me become who I am~. You're to blame.[/say]")

			saynn("She squeezes your arm, her eyes bright.")

			saynn("[say=kait]Come on. We can walk a little faster~.[/say]")

		addButton("Medical", "See what's gonna happen there", "in_medical")
	if(state == "in_medical"):
		aimCameraAndSetLocName("medical_nursery")
		var theMission3Out:String = GM.main.MS.getSpecificFlag("Mission3", "nurse", "")
		addCharacter("nurse")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="nurse"})
		saynn("The elevator doors slide open with a screech, revealing the bright lobby of the medical wing. You avoid the counters and go straight for the nursery.")

		saynn("Inside, a nurse is standing behind a desk. When she sees you two, she is quick to get up and approach you.")

		if (howManyBirths <= 0):
			if (theMission3Out != ""):
				saynn("[say=nurse]Oh.. it's..[/say]")

				saynn("She clearly recognized you.")

				saynn("[say=kait]I know, it's us. C'mon, help me.. before I give birth right here.[/say]")

				saynn("[say=nurse]Right.. of course. Let's get everything prepared.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter, sorry..[/say]")

			else:
				saynn("[say=nurse]Inmate? Came to give birth?[/say]")

				saynn("[say=kait]No.. just wanted to play dominoes with someone..[/say]")

				saynn("The nurse squints.")

				saynn("[say=kait]Of course I fucking wanna give birth! What else does it look like..[/say]")

				saynn("[say=nurse]Right. Let's get everything prepared.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter.[/say]")

			saynn("Fair enough. You will have to wait. Kait's head peeks out.")

			saynn("[say=kait]You will wait for me?..[/say]")

			saynn("[say=pc]Of course, Kait. Stay strong.[/say]")

			saynn("[say=kait]Hah.. easy to say.. ow..[/say]")

			saynn("The nurse is quick to help Kait.")

			saynn("And you.. you take a seat on some bench in here and just wait.")

		elif (howManyBirths == 1):
			if (theMission3Out != ""):
				saynn("[say=nurse]Miss Kait? Second time already?[/say]")

				saynn("She clearly recognized her.")

				saynn("[say=kait]Yeah-yeah-yeah, just help me.. I'd rather not give birth on your desk.[/say]")

				saynn("[say=nurse]Right.. of course. Let's get everything prepared.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter, sorry..[/say]")

			else:
				saynn("[say=nurse]Inmate? Came to give birth again?[/say]")

				saynn("[say=kait]Yeah, there are still some left after the first time..[/say]")

				saynn("The nurse squints.")

				saynn("[say=kait]I'm fucking with you, it's a new litter! Help me already.[/say]")

				saynn("[say=nurse]Right. Let's get everything prepared.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter.[/say]")

			saynn("Fair enough. You will have to wait. Kait's head peeks out.")

			saynn("[say=kait]You will wait for me?..[/say]")

			saynn("[say=pc]Of course, Kait. You can do this.[/say]")

			saynn("[say=kait]Hah.. hopefully it's gonna go easier now.. ow.. it's happening..[/say]")

			saynn("The nurse is quick to help Kait and pull her away.")

			saynn("And you.. you take a seat on some bench in here and just wait.")

		elif (howManyBirths == 2):
			if (theMission3Out != ""):
				saynn("[say=nurse]Miss Kait? Oh wow, you're a fast breeder.[/say]")

				saynn("She clearly recognized her.")

				saynn("[say=kait]Thanks.. I will take that as a compliment. Now help me with this belly?[/say]")

				saynn("[say=nurse]Right.. of course. Let's get everything prepared.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter, sorry..[/say]")

			else:
				saynn("[say=nurse]Inmate? I recognize you from the last two times.[/say]")

				saynn("[say=kait]Yeah, just can't get enough of it, keep coming back. Do you have a cock by any chance?[/say]")

				saynn("The nurse squints.")

				saynn("[say=kait]I'm fucking with you.. not literally. Help me already.[/say]")

				saynn("[say=nurse]Right. Let's get everything prepared.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter.[/say]")

			saynn("Fair enough. You will have to wait. Kait's head peeks out.")

			saynn("[say=kait]You will wait for me?..[/say]")

			saynn("[say=pc]Of course, Kait. But I'm pretty sure you've got this.[/say]")

			saynn("[say=kait]Yeah.. this is one thing I'm good at apparently..[/say]")

			saynn("The nurse is quick to pull Kait away.")

			saynn("And you.. you take a seat on some bench in here and just wait.")

		elif (howManyBirths == 3):
			if (theMission3Out != ""):
				saynn("[say=nurse]Miss Kait? You are one of our best breeders. Was wondering when you'd return.[/say]")

				saynn("She clearly recognized her.")

				saynn("[say=kait]It's not a fast process, you know! Getting knocked up takes a while.[/say]")

				saynn("[say=nurse]Right.. of course. I've prepared everything already.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter, sorry..[/say]")

			else:
				saynn("[say=nurse]Welcome. Came with another pregnancy?[/say]")

				saynn("[say=kait]Wow, don't make me feel ashamed. I'm more than just a breeding bitch.. wait.. I'm not a bitch.[/say]")

				saynn("The nurse squints.")

				saynn("[say=kait]Don't just stand there. Help me already.[/say]")

				saynn("[say=nurse]Right. I've prepared everything already.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter.[/say]")

			saynn("Fair enough. You will have to wait. Kait's head peeks out.")

			saynn("[say=kait]I'm about to be a mother again! How many times was it?[/say]")

			saynn("[say=pc]Don't worry about it, Kait. Just focus on your body.[/say]")

			saynn("[say=kait]Yeah.. it feels good actually..[/say]")

			saynn("The nurse is quick to pull Kait away.")

			saynn("And you.. you take a seat on some bench in here and just wait.")

		elif (howManyBirths == 4):
			if (theMission3Out != ""):
				saynn("[say=nurse]Welcome, Miss Kait. Come inside, I've already prepared everything.[/say]")

				saynn("She clearly recognized her.")

				saynn("[say=kait]Come inside? Shouldn't you at least offer me dinner first~?[/say]")

				saynn("[say=nurse]Maybe after. Please follow me.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter, sorry..[/say]")

			else:
				saynn("[say=nurse]Welcome, inmate. Come inside, I've already prepared everything.[/say]")

				saynn("[say=kait]Come inside? Shouldn't you at least offer me dinner first~?[/say]")

				saynn("The nurse squints.")

				saynn("[say=kait]I'm fucking with you! C'mon, let's get this bread.[/say]")

				saynn("[say=nurse]Right. Sure. Follow me.[/say]")

				saynn("The nurse helps Kait to get inside, past some staff-only doors. She stops you though.")

				saynn("[say=nurse]You can't enter.[/say]")

			saynn("Fair enough. You will have to wait. Kait's head peeks out.")

			saynn("[say=kait]I'm about to be a mother again! How many times was it?[/say]")

			saynn("[say=pc]Don't worry about it, Kait. Just focus on your body.[/say]")

			saynn("[say=kait]Yeah.. it feels great actually..[/say]")

			saynn("The nurse is quick to pull Kait away.")

			saynn("And you.. you take a seat on some bench in here and just wait.")

		else:
			if (theMission3Out != ""):
				saynn("[say=nurse]Miss Kait? Always a pleasure. Everything is ready.[/say]")

				saynn("She recognized her. Not surprising, Kait has been here many times by now.")

			else:
				saynn("[say=nurse]Welcome. Everything is ready for you, inmate.[/say]")

				saynn("Such a nice service.")

			saynn("The nurse helps Kait to get inside, past some staff-only doors. You know it well that you're not allowed to follow so you stay in the nursery lobby and just wait.")

		addButton("Wait", "See what happens next", "do_birth")
	if(state == "do_birth"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="kait", bodyState={naked=true}})
		if (bornChildAmount == 1):
			saynn("Kait gave birth to a kid!")

		else:
			saynn("Kait gave birth to "+str(bornChildAmount)+" kids!")

		saynn(""+str(bornString)+"")

		addButton("Continue", "See what happens next", "return_hug")
	if(state == "return_hug"):
		playAnimation(StageScene.Hug, "hug", {npc="kait"})
		saynn("Time passes.. you've been pacing around the small waiting area for a while now.")

		saynn("Finally, the staff-only doors open!")

		if (howManyBirths <= 0):
			saynn("Kait steps out, the same nurse is helping her. Kait's big round belly is gone. She is exhausted.. but she is also beaming!")

			saynn("When she sees you, she rushes to hug you.")

			saynn("[say=pc]Easy, Kait. How did it go?[/say]")

			saynn("[say=kait]Hah. I did it![/say]")

			saynn("She purrs a lot, nuzzling your face.")

			saynn("[say=kait]I'm a mom now! A very tired mom..[/say]")

			saynn("[say=pc]Good job, Kait.[/say]")

			if (bornChildAmount == 1):
				saynn("[say=kait]They only allowed me a few minutes with my kid.. I saw my spots on their fur![/say]")

			else:
				saynn("[say=kait]They only allowed me a few minutes with my kids.. I saw my spots on their fur![/say]")

			saynn("Well, at least she got some time with them.")

			saynn("You chat a little more about the whole process. But then it was time to go back.")

		elif (howManyBirths == 1):
			saynn("Kait steps out, the same nurse is helping her. Kait's big round belly is gone. She is exhausted.. but she is also beaming!")

			saynn("When she sees you, she smiles.")

			saynn("[say=kait]You didn't leave me.[/say]")

			saynn("[say=pc]Why would I?[/say]")

			saynn("She rushes to you and goes for a hug.")

			saynn("[say=kait]My second time being a mother! Does that mean I'm a grand mother?[/say]")

			saynn("[say=pc]No, you silly.[/say]")

			saynn("[say=kait]Hah. Sorry, my brain is scrambled after whatever they injected me with.[/say]")

			saynn("She chuckles softly.")

			if (bornChildAmount == 1):
				saynn("[say=kait]They let me hold my kid for a bit. So cute to see my exact spots on my child~.[/say]")

			else:
				saynn("[say=kait]They let me hold my kids for a bit. So cute to see my exact spots on my offspring~.[/say]")

			saynn("You give her a pat.")

			saynn("[say=kait]It doesn't get old. Seeing them. Holding them.[/say]")

			saynn("[say=pc]Cherish those memories.[/say]")

			saynn("[say=kait]Yeah..[/say]")

			saynn("She pushes off you gently, stretching her arms.")

			saynn("[say=kait]Come on. Let's go back. I need to chill. And eat something. And chill more.[/say]")

		elif (howManyBirths == 2):
			saynn("Kait steps out, the same nurse is helping her. Kait's big round belly is gone. She is exhausted.. but she is also beaming!")

			saynn("When she sees you, she goes in for a hug, already purring.")

			saynn("[say=kait]I'm a mom! For the.. third time.. I think![/say]")

			saynn("[say=pc]Good job, Kait. Proud of you.[/say]")

			saynn("You wrap your hands around her and embrace her.")

			if (bornChildAmount == 1):
				saynn("[say=kait]They let me hold my kid for a bit. They had my eyes! I saw it![/say]")

			else:
				saynn("[say=kait]They let me hold my kids for a bit. It's so nice, some of them have my eyes.. some have my snout.. some share my fur colors..[/say]")

			saynn("You give her a pat.")

			saynn("[say=kait]It doesn't get old. Seeing them. Holding them.[/say]")

			saynn("[say=pc]Cherish those memories.[/say]")

			saynn("[say=kait]I should..[/say]")

			saynn("She pushes off you gently, stretching her arms.")

			saynn("[say=kait]Come on. Let's go back now.[/say]")

		elif (howManyBirths == 3):
			saynn("Kait steps out, the same nurse is helping her. Kait's big round belly is gone. She is exhausted.. but she is also beaming!")

			saynn("When she sees you, she goes in for a hug, already purring.")

			saynn("[say=kait]I'm a mom! Kait is a mother yet again![/say]")

			saynn("[say=pc]Good job, Kait. Proud of you.[/say]")

			saynn("You wrap your hands around her and embrace her.")

			if (bornChildAmount == 1):
				saynn("[say=kait]They let me hold my kid for a bit. They had my eyes! I saw it![/say]")

			else:
				saynn("[say=kait]They let me hold my kids for a bit. It's so nice, some of them have my eyes.. some have my snout.. some share my fur colors..[/say]")

			saynn("You give her a pat.")

			saynn("[say=kait]It doesn't get old. I love seeing and holding them.[/say]")

			saynn("[say=pc]Cherish those memories.[/say]")

			saynn("[say=kait]Or I can get pregnant to experience it all again~.[/say]")

			saynn("She pushes off you gently, stretching her arms.")

			saynn("[say=kait]Come on. Let's go back now.[/say]")

		elif (howManyBirths == 4):
			saynn("Kait steps out, the same nurse is helping her. Kait's big round belly is gone. She is exhausted.. but she is also beaming! She is holding something.")

			saynn("When she sees you, she goes in for a hug, already purring.")

			saynn("[say=kait]I'm such a good mom, the nurse even gave me an apple![/say]")

			saynn("[say=pc]Nice. Proud of you.[/say]")

			saynn("You wrap your hands around her and embrace her.")

			if (bornChildAmount == 1):
				saynn("[say=kait]They let me hold my kid for a bit. It doesn't get old. I love seeing and holding them.[/say]")

			else:
				saynn("[say=kait]They let me hold my kids for a bit. It doesn't get old. I love seeing and holding them.[/say]")

			saynn("You give her a pat.")

			saynn("[say=pc]Cherish those memories.[/say]")

			saynn("[say=kait]Or I can get pregnant to experience it all again~.[/say]")

			saynn("She pushes off you gently, stretching her arms.")

			saynn("[say=kait]Come on. Let's go back now.[/say]")

		else:
			saynn("Kait steps out, no longer pregnant. She looks happy.")

			saynn("When she sees you, she goes in for a hug, already purring.")

			saynn("[say=kait]Now I'm ready to be bred again~.[/say]")

			saynn("You wrap your hands around her and embrace her.")

			if (bornChildAmount == 1):
				saynn("[say=kait]They let me hold my kid for a bit. It doesn't get old. I love seeing and holding them.[/say]")

			else:
				saynn("[say=kait]They let me hold my kids for a bit. It doesn't get old. I love seeing and holding them.[/say]")

			saynn("You give her a pat, she nuzzles your face.")

			saynn("[say=pc]Good. If you're feeling okay, we can go back now.[/say]")

			saynn("She stretches and nods.")

			saynn("[say=kait]Sure. I feel great~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_medical"):
		processTime(20*60)

	if(_action == "do_birth"):
		processTime(35*60)
		var bornChilds = getCharacter("kait").giveBirth()
		bornChildAmount = bornChilds.size()
		bornString = GM.CS.getChildBirthInfoString(bornChilds)
		increaseFlag("KaitModule.kaitGaveBirthsNearPC")

	setState(_action)

func saveData():
	var data = .saveData()

	data["fromPC"] = fromPC
	data["howManyBirths"] = howManyBirths
	data["bornChildAmount"] = bornChildAmount
	data["bornString"] = bornString

	return data

func loadData(data):
	.loadData(data)

	fromPC = SAVE.loadVar(data, "fromPC", false)
	howManyBirths = SAVE.loadVar(data, "howManyBirths", 0)
	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)
	bornString = SAVE.loadVar(data, "bornString", "")
