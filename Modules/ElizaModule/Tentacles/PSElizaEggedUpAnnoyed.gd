extends SceneBase

func _init():
	sceneID = "PSElizaEggedUpAnnoyed"

func _run():
	if(state == ""):
		addCharacter("eliza")
		addCharacter("PCTentacles")
		saynn("Another day in a paradise..")

		saynn("[say=eliza]{pc.name}!![/say]")

		saynn("Something feels different..")

		saynn("[say=eliza]Look what you did to me![/say]")

		saynn("Yeah.. maybe it's the voice.")

		saynn("Time to get up..")

		addButton("Continue", "See what happens next", "eliza_rushes_in")
	if(state == "eliza_rushes_in"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You get up and watch Eliza waddle into your cell, her tail swaying behind her in quick, jerky swipes.")

		saynn("She is holding onto her pregnant-looking belly.. and she is also doing her best to stay away from the tentacles in your cell. The curious tips are watching her with great interest.")

		saynn("[say=pc]I don't think it was me who gave you the belly.[/say]")

		saynn("One of her paw stops holding her belly and whips out a shock remote instead, her clawed digit threatening to start pressing scary buttons.")

		saynn("[say=eliza]Does that clear your memory up?[/say]")

		addButton("It fits you", "Tell her that she looks cute like that", "say_cute")
		addButton("You wanted it", "Tell Eliza that she was practically begging for it to happen", "say_wanted")
	if(state == "say_cute"):
		saynn("You nod and raise your hands slightly.")

		saynn("[say=pc]Yep. But this belly does fit you.[/say]")

		saynn("She squints, her digit brushing against the button.")

		saynn("[say=eliza]Oh yeah? Does it?[/say]")

		saynn("You slightly raise your chin instinctively.")

		saynn("[say=pc]Yeah. You look very cute like that.[/say]")

		saynn("She growls softly, her whole body tensing up.. including her inner muscles.")

		saynn("[say=eliza]I'm sure you will look cuter when on the floor.[/say]")

		saynn("Eliza was about to press the button.. but then she suddenly drops the remote, her eyes going wide, her tail going stiff like a spear.")

		saynn("[say=eliza]..oh.. ah.. oh shit..[/say]")

		saynn("Eliza grabs onto her belly, about to collapse.")

		addButton("Catch her", "Catch the feline before she falls", "do_catch")
	if(state == "say_wanted"):
		saynn("You raise your hands a bit.")

		saynn("[say=pc]The way you were acting, you were practically begging for it. I knew that you wanted it. I just helped to give you the push that you needed.[/say]")

		saynn("She furrows her brows and shows her fangs.. but ends up just rolling her eyes.")

		saynn("[say=eliza]Hmpff.. There is a small chance that you're not wrong. But I certainly didn't want to be stuffed full of weird eggs! That wasn't part of the plan![/say]")

		saynn("You take one careful step forward and gently brush your hand over her hidden belly. She doesn't seem to mind.")

		saynn("[say=pc]It was your idea to begin with, you knew the risk.[/say]")

		saynn("[say=eliza]I guess I did. I tried to.. push them out..[/say]")

		saynn("Her cheeks blush.")

		saynn("[say=pc]And?[/say]")

		saynn("[say=eliza]They just don't wanna come out.. Look..[/say]")

		saynn("She visibly starts to push, tensing her muscles. Moments later, she gasps, her tail going stiff like a spear.")

		saynn("[say=eliza]..oh.. ah.. oh shit..[/say]")

		saynn("Eliza grabs onto her belly, about to collapse.")

		addButton("Catch her", "Catch the feline before she falls", "do_catch")
	if(state == "do_catch"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="eliza", bodyState={}, npcBodyState={exposedCrotch=true}})
		saynn("You catch Eliza as her legs begin to shake and help her to gently land onto the floor.")

		saynn("The tentacles, concerned with what's happening, reach out towards her.")

		saynn("[say=pc]Help undress her.[/say]")

		saynn("The tips nod and reach out towards Eliza's clothing. They start by helping to get her arms out of the labcoat.. then they pull her blouse off and help get her skirt down.")

		saynn("[say=eliza]Ah.. mmh.. I can feel them.. ugh.. f-fuck me..[/say]")

		saynn("[say=pc]Maybe later.[/say]")

		saynn("Her belly is twitching.. something is moving inside her.. for sure.")

		saynn("The bra can stay.. but the panties have to go. You grab onto her fancy lace underwear and slip them off, exposing her wet-looking slit. Her horny scent instantly fills the cell.")

		saynn("[say=pc]You can push now.[/say]")

		saynn("A hot moan escapes the girl's lips.")

		saynn("[say=eliza]Ahh-h~..[/say]")

		saynn("Her pussy is twitching visibly..")

		addButton("Continue", "See what happens next", "egg_birth")
	if(state == "egg_birth"):
		playAnimation(StageScene.EggLaying, "15", {pc="eliza", bodyState={exposedCrotch=true}})
		saynn("Eliza's body tenses again, her back arching hard. Her claws dig into the concrete as another moan escapes her.")

		saynn("[say=eliza]Mhh.. ahh..[/say]")

		saynn("Her stomach contracts visibly, something moving down. Her pussy begins to stretch..")

		saynn("[say=eliza]Ahhh-h..[/say]")

		saynn("The first egg appears.")

		saynn("Just the tip at first. Eliza's breath hitches, her eyes going wide. Then, with a wet, sucking sound, it pushes further. Her entire body shudders.")

		saynn("[say=eliza]..ohhh fuck..[/say]")

		saynn("About half of the egg is visible, its most girthy part is now stretching her pussy. Eliza's muscles clench around it, trying to push it out.")

		saynn("And then.. it finally slides out.")

		saynn("A thick, wet pop echoes in the cell as the egg drops onto the floor between her spread legs. It's beautiful.. in a weird way.. green and shiny from the girl's pussy juices.. The tentacles watch the scene too as it unfolds.")

		saynn("[say=eliza]Hah.. ah..[/say]")

		saynn("Eliza's belly was still full.")

		saynn("Another contraction.. This time both of her holes twitch. And so you watch as a second egg begins to appear.. but not from her pussy. Her tailhole begins to spread.")

		saynn("[say=eliza]W-wait.. It's coming out from my.. Ahh-h..[/say]")

		saynn("She doesn't finish, the egg stretches her tight ring wide.. before popping free, landing beside the first.")

		saynn("Eliza's entire body convulses, her pussy squirts.. a sudden gush of clear fluid that splashes onto the floor.")

		saynn("[say=eliza]F-fuck.. ah.. why are they so big.. getting them in was easier..[/say]")

		saynn("She chuckles to herself, breathing deeply. Until the next egg starts sliding out of her pussy. It happens faster this time, the round object dropping onto the floor with a wet slap.")

		saynn("[say=eliza]Mmmh..[/say]")

		saynn("Another one from her ass. Then two from her pussy in a row, one right after the other, each one leaving her gasping.. and gaping.")

		saynn("[say=eliza]Shit.. How many of these even are in me..[/say]")

		saynn("You don't remember exactly.. so you redirect the question towards the tentacles by looking at them and nodding. They react by raising their tips.. and so you count them.")

		saynn("[say=pc]They show.. uh.. six? Or maybe seven. At least six or seven.[/say]")

		saynn("[say=eliza]Now is really not the time for this shit.. There is clearly more than that in me.. Ahh-h..[/say]")

		saynn("Eliza's pussy spawns another shower of juices as her pussy and tailhole both lay an egg almost at the same time. Another few follow soon after, sliding out of her gaping holes, joining the pile.")

		saynn("At least now her belly is visibly deflating.")

		saynn("[say=eliza]Fuck-k-k~..[/say]")

		saynn("The rest of the eggs slide out of her swiftly, one after another, from both her holes. The last egg is followed by her passionate cry.. Her stretched pussy suddenly starts clenching around nothing, her whole body locking up, legs shaking, toes curling. She would squirt again.. if there was anything to squirt with, poor kitty got dehydrated completely by this point.")

		saynn("After that, she just throws her head back and gives up, panting heavily.")

		saynn("[say=eliza]..how.. many..[/say]")

		saynn("[say=pc]I see.. fifteen.[/say]")

		saynn("Her paw drops onto her empty belly, pressing softly. Suddenly, she is giggling.. and then laughing loudly.")

		saynn("[say=eliza]..hah.. Haha.. Hahahh.. f-fuck.. no fucking way..[/say]")

		addButton("Continue", "See what happens next", "after_birth_cuddle")
	if(state == "after_birth_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="eliza", bodyState={}, npcBodyState={exposedCrotch=true}})
		saynn("Eliza just rests in your embrace, still trying to recover her breath. Her fur down there.. her inner thighs are all damp. She just keeps rubbing her belly.. until one of the tentacles decides to help with that, causing the feline to flinch away.")

		saynn("[say=eliza]Nope!.. I've made enough little tentacle monsters for one life..[/say]")

		saynn("[say=pc]I think it just wants to touch you.[/say]")

		saynn("She sighs.. and just lets the tentacles do their thing. One of them rubs her belly.. another one reaches up to her head and gives her a few pats.. a third one is stroking her waist.")

		saynn("[say=eliza]..I'm keeping the eggs..[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("She bumps you with her elbow.")

		saynn("[say=eliza]I've suffered enough so I deserve to keep all of them.. Make your own yourself..[/say]")

		saynn("[say=pc]Not even one?[/say]")

		saynn("She sighs.")

		saynn("[say=eliza]..fine, you can have one.. I can be generous.[/say]")

		saynn("A little memento of your adventures with Eliza.")

		saynn("She just keeps resting in your hands after that.")

		saynn("[say=eliza]You know.. this might have been more intense than surviving an explosion.. This might be the most intense thing I've ever experienced.[/say]")

		saynn("Her laugh illuminates the cell again.")

		saynn("[say=pc]It sure looked like that.[/say]")

		saynn("[say=eliza]I gotta go clean myself up..[/say]")

		addButton("Continue", "See what happens next", "about_to_leave")
	if(state == "about_to_leave"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You help Eliza to get up. The tentacles are quick to help fix her ponytail and start dressing her up.")

		saynn("[say=eliza]Well.. that's not a first for these clothes anymore anyway.. It's not like I'm gonna go out there naked. That'd be weird.[/say]")

		saynn("She starts picking up the eggs that.. she made. She hands you one of the eggs.")

		saynn("[say=eliza]Treasure it. Or eat it the moment I leave. But if you get poisoned, don't come to me.[/say]")

		saynn("A few of the eggs fit into her large labcoat pockets.. but the rest she has to carry in her arms, a whole pile of them.")

		saynn("[say=eliza]See you around.[/say]")

		saynn("The tentacles wave her goodbye.")

		saynn("[say=eliza]You can fuck pretty well, I will give you that. Hah..[/say]")

		saynn("The tendrils curve back.. and their tips land on top of themselves. It's like they're being shy.")

		saynn("She looks at you again.")

		saynn("[say=eliza]I'm gonna turn around. If you push me into them again.. I will murder you. Okay~?[/say]")

		saynn("You nod.")

		saynn("[say=pc]As fun as it was, one time is probably enough.[/say]")

		saynn("[say=eliza]Good {pc.boy}.[/say]")

		saynn("And just like that, she steps out of your cell.")

		saynn("Your hands play with the egg. You don't even want to remove the shell from this one. Hopefully it won't grow up.. without that growth accelerator thingie..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_rushes_in"):
		processTime(5*60)

	if(_action == "do_catch"):
		processTime(3*60)

	if(_action == "after_birth_cuddle"):
		processTime(5*60)
		getCharacter("eliza").cancelPregnancy(false, true)

	if(_action == "about_to_leave"):
		processTime(3*60)
		GM.pc.getInventory().addItemID("PlantEggEliza")
		addMessage("You received a tentacle egg!")

	setState(_action)
