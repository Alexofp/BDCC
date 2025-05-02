extends SceneBase

func _init():
	sceneID = "Eliza7EndingScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("No point in pushing this back any further. Might as well tell her, see what happens.")

		saynn("[say=pc]Hey, I think the database now has entries for each of the drugs that are floating around in the prison.[/say]")

		saynn("Eliza's eyes open wider, showing off the sparks that are in them.")

		saynn("[say=eliza]Oh, do they?[/say]")

		saynn("She pulls out her datapad and quickly swipes through some menus.")

		saynn("[say=eliza]Shit, you're right. They're all fully tested too.[/say]")

		saynn("A little smile is tugging at her lips as she studies the data.. but not for long.")

		saynn("[say=elizaMom]I never taught you to swear, dear.[/say]")

		saynn("That voice came from behind you..")

		addButton("Continue", "See what happens next", "mom_comes_in")
	if(state == "mom_comes_in"):
		addCharacter("elizaMom")
		playAnimation(StageScene.Duo, "stand", {pc="elizaMom", npc="eliza"})
		saynn("You step aside as soon as you notice the familiar figure, accompanied by the two familiar armed guards exit the elevator. Scarlet's gaze pushes you further away from the counter, into the shadow..")

		saynn("[say=eliza]Oh, hey mom. Haven't left yet?[/say]")

		saynn("She smiles politely, her tone laced with a subtle mischief.")

		saynn("Scarlet's lips curve into a cool, measured smile as she crosses her arms.")

		saynn("[say=elizaMom]Just wanted to see my daughter again, I finally finished discussing all the current issues with the captain.[/say]")

		saynn("A flicker of determination sparks in Eliza's eyes.")

		saynn("[say=eliza]That's great, I wanna show you something.[/say]")

		saynn("In a burst of energy, she slips from behind the counter and disappears behind the wall. Moments later, she reappears at the open door, holding a datapad, presenting it proudly.")

		saynn("[say=eliza]Look, we solved the prison's drug problem![/say]")

		saynn("Eliza's voice sounds proud and exciting.")

		saynn("[say=elizaMom]Did you really?[/say]")

		saynn("Scarlet grabs the offered datapad and begins swiping through the data.")

		saynn("[say=elizaMom]Hm.[/say]")

		saynn("[say=eliza]Yeah, we found and tested each of the drugs that were floating around in the prison.[/say]")

		saynn("Scarlet's answer is sharp, her expression strict.")

		saynn("[say=elizaMom]And that solved it?[/say]")

		saynn("The question sends an ice-cold wave through Eliza, making her start mumbling something incoherent before she finally gets her thoughts together.")

		saynn("[say=eliza]Well.. uh.. we now know exactly what we're dealing with, down to the molecular structure. There is nothing super dangerous, every effect can be reversed. With all that info, it will be a breeze for the guards to find and destroy the contraband![/say]")

		saynn("Scarlet's gaze remains fixed on the datapad as she murmurs a quiet..")

		saynn("[say=elizaMom]Right. Hm.[/say]")

		saynn("Scarlet stays quiet, her eyes idly reading the data, her face expressionless.. Occasionally, she darts a look into a random direction.. occasionally that direction is yours. You don't back away further though, you played a huge part in this.")

		saynn("[say=elizaMom]I'm certainly glad you managed to avoid endangering yourself. You have maybe grown, my dear girl. But I think the drug problem isn't solved until it's fully solved.[/say]")

		saynn("Eliza lowers her gaze, her paw scratching the back of her head.")

		saynn("[say=eliza]Hah? It is solved..[/say]")

		saynn("Scarlet shakes her head slowly.")

		saynn("[say=elizaMom]It will only be solved once every trace of these drugs is eliminated. And something tells me.. this will never realistically happen.[/say]")

		saynn("The piercing gaze is making Eliza extremely uncomfortable. Scarlet is not wrong..")

		saynn("[say=elizaMom]Still, you proved that you know your way around a lab. What's left to do here, it's not up to you anymore.[/say]")

		saynn("A spark of hope appears in Eliza's eyes.. Scarlet's tone is shifting into something more soft and tender.")

		saynn("[say=elizaMom]So I wanna take you back with me.[/say]")

		saynn("[say=eliza]Does that mean..?[/say]")

		saynn("Scarlet nods, giving Eliza the datapad back and stepping closer until the distance between them seems to vanish.")

		saynn("[say=elizaMom]I would love to have you in my lab, sweetheart. You are so incredibly smart.[/say]")

		saynn("A genuine smile breaks over Eliza's blushing face.")

		saynn("[say=eliza]Yay.[/say]")

		saynn("Hearing these words is probably a dream come true for the feline. Makes you feel warm inside too.")

		saynn("[say=elizaMom]Seeing what you did here, I really could use an assistant like you. So, you can go start packing your things.[/say]")

		saynn("For a moment, everything hangs in the balance. But then something about Eliza changes, her eyes widen a little. She takes a pause and then repeats slowly.")

		saynn("[say=eliza]Assistant?..[/say]")

		saynn("[say=elizaMom]Yes, we'd be working together.[/say]")

		saynn("Eliza blinks.. many times, uncertainty flashing across her face.")

		saynn("[say=elizaMom]Something is wrong? Isn't that what you wanted?[/say]")

		saynn("Another pause only fuels the tension. You're not sure if something is wrong.. but not everything is right.. definitely.")

		saynn("[say=eliza]I.. kinda like our lab..[/say]")

		saynn("Eliza hesitates, her voice trailing off.")

		saynn("Scarlet's expression turns serious.")

		saynn("[say=elizaMom]Excuse me? Am I hearing you correctly?[/say]")

		saynn("[say=eliza]I.. I don't know.[/say]")

		saynn("Eliza stammers, looking away. It's rare that you see her like this.")

		saynn("[say=elizaMom]Eliza? Sweetie? What's wrong?[/say]")

		saynn("[say=eliza]I..[/say]")

		saynn("Eliza fails to get the words out, her voice trembling. Scarlet reaches her hand out gently, grabbing her daughter's paw.")

		saynn("[say=elizaMom]I'm not gonna get angry at you. Right now I'm just curious.. How can your current lab setup be better than what we have at home?[/say]")

		saynn("[say=eliza]Well.. it's not. The equipment we have is much worse.[/say]")

		saynn("Eliza's paw holds her mother's hand tightly. A hint of smile returns on Scarlet's face.")

		saynn("[say=elizaMom]Obviously. So if you wanna help me push science forward, you should come with me.[/say]")

		saynn("Eliza hesitates again.")

		saynn("[say=eliza]Right.. well..[/say]")

		saynn("Scarlet raises a brow curiously.")

		saynn("[say=elizaMom]Something is holding you here.[/say]")

		saynn("[say=eliza]Maybe..[/say]")

		saynn("Scarlet sighs softly.")

		saynn("[say=elizaMom]Look.. I know that we're not always on the best terms. We had our.. disagreements. Maybe we should start to stop being afraid of being honest with each other?[/say]")

		saynn("Eliza's eyes meet Scarlet's, causing the blush to deepen.")

		saynn("[say=eliza]Hm..[/say]")

		saynn("[say=elizaMom]I can be first. It might seem like a punishment that I sent you here.. and I certainly worded it like that back then. I was pretty loud.[/say]")

		saynn("Her tender tone is making Eliza's ears turn down.")

		saynn("[say=elizaMom]Real reason is.. I was busy back then, with a very important project. I just had no time to look after you. Which is why I was very angry. I was angry at myself. My fears came true, I failed to protect you.[/say]")

		saynn("Scarlet's voice cracks slightly with the weight of old regrets.")

		saynn("[say=elizaMom]That project is over. I'm free, for now at least. We can join efforts. I'd rather your skills not be wasted.. here.. in this place.[/say]")

		saynn("Her gaze jumps at you for a second.")

		saynn("[say=elizaMom]Now.. please.. sweetheart.. I love you more than anyone. If you want to stay.. Perhaps you can stay. But can I maybe know what powers your decision? Let me know if I'm asking for too much.[/say]")

		saynn("The words are making Eliza's eyes become all watery.")

		addButton("Continue", "See what happens next", "eliza_pause")
	if(state == "eliza_pause"):
		saynn("Eliza stays silent for a bit, her gaze shifting to you for a brief moment.. maybe seeking an answer in your silent support.. before returning to her mother.")

		saynn("[say=eliza]I like the freedom..[/say]")

		saynn("She finally says something in a soft, uncertain tone.")

		saynn("[say=elizaMom]Freedom? But you are in a prison, sweetie.[/say]")

		saynn("Eliza nods slowly.")

		saynn("[say=eliza]Freedom of being able to work on what I wanna work on. You would never allow me to work on what I'm working on right now..[/say]")

		saynn("Scarlet laughs gently.")

		saynn("[say=elizaMom]Fair point. If you want some more of my honesty, that is part of the reason why I wanna take you back with me. But, entertain this, I also thought that you wanted to push science forward?[/say]")

		saynn("[say=eliza]I thought so too.. I was confused for quite a while here myself.[/say]")

		saynn("Eliza looks at you, smiling.")

		saynn("[say=eliza]But maybe the answer was right there. Maybe I just wanna have fun.. doing things that I wanna do.. with people that I like.[/say]")

		saynn("Scarlet follows her daughter's stare.. until it collides with yours. She judges you at first.")

		saynn("[say=eliza]Even though I'm stuck in a prison, surrounded by criminals, working with old equipment.. You know, mom, I think I'm happy here.[/say]")

		saynn("They're still holding hands. Eliza's clawed digits gently interlock with her mother's.")

		saynn("[say=eliza]You wanna protect me.. but I think I don't need protection anymore. Khm..[/say]")

		saynn("Everyone in the room clears their throats for some reason while Eliza cringes for just a second. But she manages to pull herself back.")

		saynn("[say=eliza]I think I can protect myself now, yeah. And I also got someone that will help~.[/say]")

		saynn("Eliza looks at you and smiles.")

		saynn("[say=eliza]If all that fails, well, such is life, I'm ready to receive the consequences of my own actions. I think that's.. good?[/say]")

		saynn("A warm smile shines on Scarlet's kind face.")

		saynn("[say=elizaMom]I guess my little girl did really grow up. All while I wasn't looking..[/say]")

		saynn("[say=eliza]Hah.. mom..[/say]")

		addButton("Continue", "See what happens next", "they_hug")
	if(state == "they_hug"):
		playAnimation(StageScene.Hug, "hug", {pc="elizaMom", npc="eliza"})
		saynn("And so they embrace each other warmly. Eliza wraps her arms around her mouth and rests her lowered chin on Scarlet's chest.")

		saynn("[say=eliza]I love you, mom.. Sorry that I did so much dumb stuff..[/say]")

		saynn("[say=elizaMom]It's okay. Pretty sure you got that from me, my sweetie.[/say]")

		saynn("Their reunion makes the whole room seem brighter than it already is. Even Scarlet's quick glance at you doesn't seem so.. arrogant.. anymore.")

		saynn("Elize smiles while tears run down her cheeks.")

		saynn("[say=elizaMom]I understand it now. Sorry for being so push-y. It's up to you how you want to live your life.[/say]")

		saynn("[say=eliza]Thank you.. you're the best, mom.. w-wait..[/say]")

		saynn("Eliza ends the hug prematurely.. before bending over the counter and grabbing something.")

		saynn("She presents Scarlet.. the mug.. a glued together one that still says 'best mom'.")

		saynn("[say=eliza]I still have it.. Maybe you want it now?[/say]")

		saynn("[say=elizaMom]I noticed it last time, but wasn't sure if it was the one. I didn't look at it that well last time.[/say]")

		saynn("Scarlet carefully grabs the offered mug and inspects it.")

		saynn("[say=elizaMom]You glued it piece by piece. That is so impressive, it probably took you forever.[/say]")

		saynn("[say=eliza]Yeah.. but it was worth it. Been my favourite mug since then. You can have it, if you want.[/say]")

		saynn("Scarlet chuckles softly.")

		saynn("[say=elizaMom]I can't accept it, it's yours.[/say]")

		saynn("[say=eliza]But it was a gift for you. It was a gift for the best mom.[/say]")

		saynn("Scarlet hums.")

		saynn("[say=elizaMom]Maybe you will be the best mom~. Unless you are already.[/say]")

		saynn("[say=eliza]Haha.. ha.. khm.[/say]")

		saynn("Scarlet raises a brow.")

		saynn("[say=elizaMom]Here is an idea, I will send you a new mug. Then you can send me this one, I'd love to have it. But I don't wanna steal your coffee addiction in the meantime.[/say]")

		saynn("[say=eliza]That works![/say]")

		saynn("They hug each other again. There are some inmates gathering in the lobby.. but they're okay with waiting it seems.. especially with two armed guards being around.")

		saynn("Scarlet smooches her daughter on the cheek.")

		saynn("[say=elizaMom]Sadly, I think I just got news that my flight is getting delayed by a few days~.[/say]")

		saynn("[say=eliza]Hah. That's so unfortunate. Looks like we will have to spend more time together.[/say]")

		saynn("[say=elizaMom]Indeed we are. We will find something to do together, right?[/say]")

		saynn("[say=eliza]Chemistry, you're thinking?[/say]")

		saynn("Scarlet does a playful nod.")

		saynn("[say=elizaMom]Nothing but chemistry.[/say]")

		saynn("They hug it out for a little longer.. but then Scarlet turns her attention towards you.")

		saynn("[say=elizaMom]Excuse me, sweetie.[/say]")

		saynn("She ends the hug.. and steps towards you, with kind intentions, hopefully..")

		addButton("Continue", "See what happens next", "scarlet_pc_talk")
	if(state == "scarlet_pc_talk"):
		playAnimation(StageScene.Duo, "stand", {npc="elizaMom"})
		saynn("Scarlet approaches you.")

		saynn("[say=elizaMom]Excuse me for my.. manners.[/say]")

		saynn("Her stare is still authoritative.. but she doesn't sound too intimidating.. Her guards are quite scary though.")

		saynn("[say=pc]It's understandable. I'm glad you have found a common language with your daughter.[/say]")

		saynn("[say=elizaMom]Yeah, she is a good girl. Does what she wants.. but that runs in the bloodline.[/say]")

		saynn("Gotta say something nice..")

		saynn("[say=pc]It's an honor to be her assistant.[/say]")

		saynn("[say=elizaMom]Hah. Thank you for helping Eliza. I'm almost jealous of your position.[/say]")

		saynn("Her eyes pick out your collar. Makes you wanna say something snarky.")

		saynn("[say=pc]You can always murder someone and end up here. Maybe you will like it.[/say]")

		saynn("[say=elizaMom]It's a little too extreme for me. I'm an old-school girl. Although, I probably earned a life-sentence or two already.[/say]")

		saynn("Awkward silence settles in.. but then Scarlet chuckles.")

		saynn("[say=elizaMom]Hah. Gotta push science forward somehow, huh? Ain't that right, sweetie?[/say]")

		saynn("[say=eliza]Who will do it if not us, crazy gals?[/say]")

		saynn("You can see where she got that trait from..")

		saynn("[say=elizaMom]Now, if you two excuse me..[/say]")

		saynn("[say=eliza]See you, mom![/say]")

		saynn("[say=elizaMom]Ain't leaving yet.[/say]")

		addButton("Continue", "See what happens next", "eliza_outro")
	if(state == "eliza_outro"):
		removeCharacter("elizaMom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("While Scarlet and her guards head off somewhere, Eliza Quinn approaches you next, her paw quickly swiping off the left-over tears.")

		saynn("[say=eliza]That went.. pretty good.[/say]")

		saynn("[say=pc]All things considered.[/say]")

		saynn("[say=eliza]You're gonna have to endure me for a little longer~.[/say]")

		saynn("[say=pc]Oh no, I'm gonna have to swallow more random pills?[/say]")

		saynn("She chuckles.. and then gives you a quick hug and a smooch on the cheek.")

		saynn("[say=eliza]Up to you~. Just know that you're the best assistant that I ever had.[/say]")

		saynn("[say=pc]That's sweet, thank you.[/say]")

		saynn("[say=eliza]Without you, I'd be in my mother's lab right now. Doing what I need to do. But not doing what I want to do.[/say]")

		saynn("[say=pc]Maybe you'd be happy?[/say]")

		saynn("It was her dream after all..")

		saynn("[say=eliza]Maybe. But this way, I can lend my leash to someone on my own terms, you know~.[/say]")

		saynn("She winks and sticks the tip of her tongue out at you.")

		saynn("[say=eliza]And now, let's try to enjoy living the rest of our lives.[/say]")

		saynn("You nod.")

		saynn("And just like that, Eliza returns to her spot behind the counter. She pours herself some coffee into her 'best mom' mug.. and starts sipping the life juice. A cute, soft moan escapes her maw, together with a small steam cloud.")

		saynn("[say=eliza]That's hot..[/say]")

		saynn("Makes you smile.")

		saynn("(( This is where Eliza's dedicated content ends. Thank you for playing <3 ))")
		addButton("Continue", "You saw how it ends", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "mom_comes_in"):
		processTime(3*60)

	if(_action == "eliza_pause"):
		processTime(3*60)

	if(_action == "they_hug"):
		processTime(5*60)

	if(_action == "scarlet_pc_talk"):
		processTime(3*60)

	if(_action == "eliza_outro"):
		processTime(3*60)
		addExperienceToPlayer(500)

	setState(_action)
