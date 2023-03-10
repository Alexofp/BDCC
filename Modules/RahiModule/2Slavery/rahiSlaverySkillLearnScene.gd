extends SceneBase

func _init():
	sceneID = "rahiSlaverySkillLearnScene"

func _initScene(_args = []):
	setState(_args[0])

func _reactInit():
	addCharacter("rahi")

func _run():
	if(state == ""):
		saynn("Shouldn't see this")

	if(state == "rahiSkillSex"):
		saynn("[say=pc]Hey kitty, how good are you at sex?[/say]")

		saynn("Rahi tilts her head down and blushes, her paws holding her tail.")

		saynn("[say=rahi]Um.. She usually.. just lets you..[/say]")

		saynn("[say=pc]I'm gonna teach you more ways to pleasure me. With your mouth, tongue, hands, tits. But also more ways to apply your pussy, of course. Understand?[/say]")

		saynn("Poor kitty is ready to burn to ash with how hard her cheeks are blushing. She nods slightly though.")

		saynn("[say=pc]I can't hear you.[/say]")

		saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

		saynn("[say=pc]Good.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillAnal"):
		saynn("[say=pc]Ever tried anal, kitty?[/say]")

		saynn("Kitty gets confused by your sudden question. Her cheeks instantly become red.")

		saynn("[say=rahi]Uhh..[/say]")

		saynn("[say=pc]Yes or no?[/say]")

		saynn("[say=rahi]Umm.. do f-fingers count?..[/say]")

		saynn("[say=pc]Alright, I'm gonna start training your butt from now on.[/say]")

		saynn("Poor kitty tilts her head down and holds her paws on her rear.")

		saynn("[say=rahi]Is that really..[/say]")

		saynn("[say=pc]You're gonna be turned into a buttslut if I so desire. Understand?[/say]")

		saynn("Rahi nods slightly, giving off quite a submissive look.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillMasochist"):
		saynn("[say=pc]Come here, kitty.[/say]")

		saynn("Rahi slowly walks up to you.")

		saynn("[say=rahi]Yes, {rahiMaster}?..[/say]")

		saynn("Your hand suddenly delivers a good smack on the girl's butt. Kitty yelps from the impact, covering her rear with her paws.")

		saynn("[say=rahi]Ow.. sorry, sorry..[/say]")

		saynn("She puts on a guilty expression.")

		saynn("[say=pc]You didn't do anything wrong.[/say]")

		saynn("[say=rahi]Then why..[/say]")

		saynn("[say=pc]Pain can be fun, kitty. I want to see if you can learn to enjoy it.[/say]")

		saynn("[say=rahi]But pain.. pain is always painful..[/say]")

		saynn("You chuckle softly and headpat the kitty.")

		saynn("[say=pc]Pain is just a signal in your brain. But the brain can be rewired.[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("Rahi tilts her head slightly but leans into your hand at the same time.")

		saynn("[say=pc]You can learn to enjoy it. Well, it's not like you have a choice. I'm gonna spank your butt again. Because I like you. Understand? Paws off.[/say]")

		saynn("The poor kitty deliberates a bit in her head but then finally decides to commit, pulling away her paws. And as she does that, you instantly slap her butt again, sending it to bounce even, causing Kitty to produce a stifled noise.")

		saynn("[say=rahi]Y-yes, {rahiMaster}..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillExhibit"):
		saynn("[say=pc]Do you like being naked, kitty?[/say]")

		saynn("[say=rahi]Umm.. Depends?[/say]")

		saynn("You pull the feline towards you and then stand behind her. You rotate her so she is looking towards the reinforced window out of this cell. Behind it is the general block. A few inmates can be seen wandering around.")

		saynn("[say=pc]I mean this.[/say]")

		saynn("Your hands slide up to the girl's shirt and begin unbuttoning it, one at the time, slowly uncovering more of her girly chest. Kitty realizes what you're doing and blushes hard, her paws reach out to try and stop yours.")

		saynn("[say=rahi]no-o-o..[/say]")

		saynn("But you don't listen to her and her futile resistance, you shoo her paws away and continue unbuttoning the shirt before slowly opening it up, revealing Rahi's {rahi.breasts} to anyone who's lucky to look past the window.")

		saynn("Rahi's cheeks glow red. She tries to cover herself but you become more authoritative, slapping her paws away.")

		saynn("[say=pc]If I want you to be naked, you will be naked. Understand?[/say]")

		saynn("The feline huffs but lets you keep her chest undressed.")

		saynn("[say=pc]Can't hear you, slave.[/say]")

		saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

		saynn("You kiss the feline's shoulder and close her shirt before stepping away, letting her quickly button up the shirt.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillPetplay"):
		saynn("[say=pc]Hey kitty.[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("[say=pc]Meow indeed. Tell me. Would you like to be.. actually treated like a pet kitty?[/say]")

		saynn("Rahi tilts her head slightly. Then she realizes what your words mean and glances away, hiding her embracement.")

		saynn("[say=pc]Meow meow? Should I ask again?[/say]")

		saynn("[say=rahi]She would like to maybe try.. yes.. meow-meow..[/say]")

		saynn("You giggle softly, it was kinda obvious that this feline would like it. But would she be able to get into a role?")

		saynn("[say=pc]Well then, I will begin training you to be my meow-meow.[/say]")

		saynn("A subtle purring can be heard.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillDominance"):
		saynn("[say=pc]Ever tried to dominate someone, kitty?[/say]")

		saynn("[say=rahi]Dominate?..[/say]")

		saynn("[say=pc]You know, make them call you by your title. Make them kneel and stuff. Exactly like what I'm doing to you. But with you behind the wheel.[/say]")

		saynn("Kitty looks you into the eyes and shakes her head.")

		saynn("[say=pc]Wanna try?[/say]")

		saynn("[say=rahi]Um.. she wouldn't know how.. where to start..[/say]")

		saynn("You chuckle softly.")

		saynn("[say=pc]It comes from your heart, kitty. Try to order me to do something.[/say]")

		saynn("Rahi stays silent for a few seconds, trying to remember something.")

		saynn("[say=rahi]Um.. get on your knees? You.. fucking.. slut?[/say]")

		saynn("The kitty's got a naughty mouth. Even if the tone isn't exactly intimidating. You can feel a slight aura of dominance around her.")

		saynn("[say=pc]Make me~[/say]")

		saynn("But that simple phrase confuses kitty beyond belief, she loses any bits of dominance she might have had and covers her red face with her paws.")

		saynn("[say=pc]Aw. I will teach you what I know, don't worry.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillProstitution"):
		saynn("[say=pc]Hey, kitty. I wanna tell you something.[/say]")

		saynn("Rahi walks up to you and straightens herself, paws by her sides.")

		saynn("[say=rahi]What is it, {rahiMaster}?..[/say]")

		saynn("[say=pc]I wanna try to.. profit off of you.[/say]")

		saynn("Her pupils increase in size.")

		saynn("[say=rahi]M-meow?..[/say]")

		saynn("[say=pc]Yeah, I think you would make a great whore, you know. Cute body, lots of passion but not much temper, great pussy and ass.[/say]")

		saynn("Kitty looks down at the floor, her ears lower themselves.")

		saynn("[say=rahi]You want her to.. have sex.. with others?..[/say]")

		saynn("[say=pc]I mean, that would be part of it, yes. You have any objections?[/say]")

		saynn("Kitty shakes her head slightly.")

		saynn("[say=rahi]No, {rahiMaster}.. She can try selling her body.. for credits..[/say]")

		saynn("[say=pc]Great.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rahiSkillWatersports"):
		saynn("[say=pc]Kitty, I wanna start teaching you something. It's.. humiliating. But. I think it could be fun for both of us.[/say]")

		saynn("Rahi looks at you, slightly concerned.")

		saynn("[say=rahi]Yes, {rahiMaster}?.. What do you wanna teach her..[/say]")

		saynn("[say=pc]Swallowing urine. I want to train you into a piss toilet, kitty.[/say]")

		saynn("Her eyes open wide.")

		saynn("[say=rahi]Um.. Isn't that.. gross?..[/say]")

		saynn("[say=pc]Maybe. But it's also quite hot to watch. A slave that is so devoted to her master that she is ready to drink {pc.his} piss, no matter how gross it tastes and smells.[/say]")

		saynn("Rahi's cheeks turn red. She doesn't answer.")

		saynn("[say=pc]Well, you don't have a choice I'm afraid. You will have to get used to it.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
