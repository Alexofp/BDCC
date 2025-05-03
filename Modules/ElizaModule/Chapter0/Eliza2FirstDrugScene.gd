extends SceneBase

func _init():
	sceneID = "Eliza2FirstDrugScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Hey, I got one of those weird..[/say]")

		saynn("Before you can finish your sentence, Doctor Quinn leans over the counter and covers your mouth.")

		saynn("[say=eliza]Tshhh![/say]")

		saynn("Despite trying to be quiet, her actions draw attention from every nurse in the lobby. The feline offers them a polite smile and then just presses a button under her counter, opening the staff-only doors.")

		saynn("She whispers into your ear..")

		saynn("[say=eliza]Come inside, quickly.[/say]")

		saynn("That's a request you can fulfill. The feline narrows her eyes while you're trying to hold yourself from chuckling.")

		saynn("[say=eliza]..before I bap you![/say]")

		addButton("Biolab", "See what she wants to do", "in_biolab")
	if(state == "in_biolab"):
		aimCameraAndSetLocName("med_researchlab")
		GM.pc.setLocation("med_researchlab")
		saynn("You follow the white corridor and enter the research lab. Doctor Quinn is already there, preparing her equipment.")

		saynn("[say=eliza]I gave your collar access to this area. But don't venture in too deep, nurses will still kick your butt if they see you.[/say]")

		saynn("She is giving you access? Sounds a lot like she trusts you. You plant your butt on the table in the middle of the room and wait for her.")

		saynn("[say=pc]Does that mean what I think it means?[/say]")

		saynn("Quinn looks back over her shoulder and smirks, flashing her fangs for a split second.")

		saynn("[say=eliza]You're on some very thin ice right now~. Be careful or you might drown.[/say]")

		saynn("[say=pc]What if I can swim?[/say]")

		saynn("You hear a chuckle.")

		saynn("[say=eliza]You're not swimming your way out of this one~.[/say]")

		saynn("Doctor Quinn finishes preparing one of the big machines and turns back to you.")

		saynn("[say=eliza]Show me the goods.[/say]")

		saynn("Your hand produces a pill. The feline analyzes it with her sharp eyes.")

		saynn("[say=eliza]Yeah. Perfect.[/say]")

		saynn("She puts on some latex gloves and grabs the pill off of your hand before placing it inside a huge machine that takes the whole corner of the lab.")

		saynn("[say=eliza]Let's do some science![/say]")

		saynn("The machine begins doing its job, blinking lights and spinning its internal components. As it hums to life, you hear a faint hiss of escaping steam and the high-pitched whir of scanning lasers.")

		saynn("Quinn stands with her arms crossed, tapping a claw on her elbow as the machine does its work. Then, with a loud beep, the results flash up on a nearby monitor.")

		saynn("[say=eliza]Huh.. interesting. This is very interesting.[/say]")

		saynn("She gestures for you to join her, her tail flicking with excitement. The screen displays a complex molecular structure, highlighted in red and black.")

		saynn("[say=eliza]The primary components? Sulfur-based compounds.. an unusual polymerized protein.. and.. oh, this is fancy.. something resembling bio-alchemical traces. Weird mix.. but I kinda love it.[/say]")

		saynn("She narrows her eyes, studying the structure further while her paw begins to press buttons on the keyboard.")

		saynn("[say=eliza]Let me unroll this polynucleotide chain. Ohh.. Wow. I already know what it will do~. Do you?[/say]")

		saynn("Hearing all that lingo leaves you quite confused.")

		saynn("[say=pc]No idea.[/say]")

		saynn("Quinn smirks and scritches you under the chin lightly with a claw.")

		saynn("[say=eliza]Well, it's a transformation pill. They all mess with your DNA but that doesn't mean much on its own. You gotta look deeper, find patterns..[/say]")

		saynn("[say=pc]I think I will leave this part up to you. What kind of patterns do you see?[/say]")

		saynn("She stares into the computer screen and tilts her head to the side a bit.")

		saynn("[say=eliza]Some of the chains match.. DNA of your typical horns. And those..[/say]")

		saynn("She points somewhere on the screen.")

		saynn("[say=eliza]Those are hooves. And a tail..[/say]")

		saynn("Quinn grabs her chin.")

		saynn("[say=eliza]Hah.. I think this drug will turn you into a demon.. Well.. Half-demon. A hybrid of sorts.[/say]")

		saynn("A demon? There is no way a single pill can do that.")

		saynn("[say=pc]You're joking, right?[/say]")

		saynn("Quinn raises a brow.")

		saynn("[say=eliza]I don't joke about chemistry. Since we don't have records of such a drug, I can give it a name myself! Let's call it..[/say]")

		saynn("She pauses for effect, a mischievous glint in her eye.")

		saynn("[say=eliza]DemoniX! Sounds fitting, doesn't it?[/say]")

		saynn("[say=pc]Sure. But what now?[/say]")

		saynn("She snaps off her gloves and tosses them in the bin, already moving toward her chemistry station.")

		saynn("[say=eliza]Since we managed to reverse-engineer it, we can now try to make it! And you're going to help me, assistant~.[/say]")

		saynn("Her feline eyes catch yours.")

		saynn("[say=eliza]What? You're gonna be working in this lab, look closely now![/say]")

		saynn("Looks like you have earned the title of an assistant!")

		addButton("Continue", "See what happens next", "brewing_process")
	if(state == "brewing_process"):
		saynn("[say=pc]I'm watching closely, Doctor Quinn.[/say]")

		saynn("[say=eliza]Good.[/say]")

		saynn("She pulls out a series of vials and places two large beakers on the table, both filled with something.. white.")

		saynn("[say=eliza]I can spare some of my reserves this time. But if you're gonna be brewing your own samples, you're gonna need to provide these yourself.[/say]")

		saynn("Only now you notice the labels on the beakers.. very interesting labels. Apparently they contain.. semen and breast milk.")

		saynn("[say=pc]Really?[/say]")

		saynn("She smiles.")

		saynn("[say=eliza]What's the problem~? Surprised? Yeah, breast milk is incredibly valuable for our nursery and frozen seed can be used for artificial impregnation.. but these base fluids are also perfect for synthesizing complex organic compounds. They're abundant and rich in proteins, fats and enzymes.[/say]")

		saynn("Turning cum and milk into drugs.. interesting.. Those tasks that you had to do make more sense now.")

		saynn("[say=eliza]Let's do some chemistry, Doctor Quinn style![/say]")

		saynn("She begins by filling a vial with some milk and carefully placing it into a little centrifuge. After pressing a button, the centrifuge begins to spin furiously.")

		saynn("[say=eliza]First, we extra the protein strands from the milk.. Casein, specifically. See it as a.. binding agent.[/say]")

		saynn("As the centrifuge spins, you notice how the milk begins to separate into distinct layers. After that's done, Quinn carefully siphons off the protein-rich layer into its own beaker.")

		saynn("Next, she moves to the semen sample. She places it inside a different machine.")

		saynn("[say=eliza]It's a plasma separator. It can extract nucleic acids and bio-alchemical marks that we will need to emulate the pill's unique transformative properties.[/say]")

		saynn("All of that sounds super complicated.. but it does seem to be too hard to do. You just let machines do their work..")

		saynn("The plasma separator produces a faint glow as it isolates specific molecules. Doctor Quinn extras them into a vial and combines them with the milk proteins in a third machine.")

		saynn("[say=eliza]This is a chemical assembler. Final step![/say]")

		saynn("She inputs the molecular structure of the newly scanned drug and presses a button. And so the machine begins to assemble the component atom by atom, mimicking the original pill's structure.")

		saynn("[say=eliza]A little sulfur for stability.. a hint of magic-bound polymer chains.. and there we go![/say]")

		saynn("The machine spits out a single pill, gleaming in its casing. Quinn holds it up to the light, admiring her work while speaking to herself.")

		saynn("[say=eliza]If I wasn't stuck here in this hole, I'd make for a good drug lord.. queen?[/say]")

		saynn("She turns to you, her smirk widening into a grin that flashes her sharp feline fangs.")

		saynn("[say=eliza]One perfectly brewed DemoniX pill. Now, let's see who is brave.. or stupid.. enough to test it.[/say]")

		saynn("She winks at you and purrs softly.")

		saynn("[say=eliza]Feeling lucky, inmate~? Wanna do something for science?[/say]")

		saynn("[say=pc]Isn't that dangerous?[/say]")

		saynn("[say=eliza]Well.. it's safe because it's not permanent.. Until you make it permanent. Our body actually has a backup of its DNA stored. So you can always return to your old self through certain procedures.. unless that backup got cleared too~. Then you're fucked~.[/say]")

		saynn("Wow. Sounds safe indeed.")

		addButton("Eat it", "Being a half-demon sounds fun! The pill will probably not work if you are already a demon or have other transformations already happening..", "eat_pill")
		addButton("Refuse", "You'd rather not risk it", "no_eat")
		addButton("Make her eat it", "(Submissive sex) Ask if she is brave enough to try her own product. She will probably become horny and dominant.. very dominant..", "make_her_eat")
	if(state == "no_eat"):
		saynn("[say=pc]I'm good. Can I just have that pill maybe?[/say]")

		saynn("She twists the drug in her paw, an unsatisfied curiosity sparkling in her eyes.")

		saynn("[say=eliza]Ummm.. nah.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=eliza]I used my materials so it's only fair. If you want to have one, you can just make it now, assistant~.[/say]")

		saynn("Eliza gasps softly.")

		saynn("[say=eliza]Right! This is my lab.. but I will let you use it for now. There is a lot of equipment here, try not to break anything![/say]")

		saynn("She pockets that pill that she made and turns out, showing you her chemistry station.")

		saynn("[say=eliza]There is where you can brew drugs, just like I did right now. You will have to supply the base fluids yourself. Donating them in the nursery sends some here but you can just fill the tanks directly.. or let me milk you~.[/say]")

		saynn("She then shows you some big machines and a computer.")

		saynn("[say=eliza]Leave the drug scanning to me, it's quite a tricky procedure.. especially with our old equipment. But if you get enough science points, you can actually upgrade it.[/say]")

		saynn("Science points.. you remember the nursery bounties giving you some.")

		saynn("[say=pc]Science points?[/say]")

		saynn("She shrugs.")

		saynn("[say=eliza]It's.. entropy mumbo jumbo nonsense, I have no idea how it works. But we can use it to upgrade our equipment and unlock new drugs and prototypes.[/say]")

		saynn("Prototypes.. that sounds interesting.")

		saynn("[say=pc]And how do I earn those science points?[/say]")

		saynn("[say=eliza]Well, by doing bounties and letting me scan new suspicious pills.[/say]")

		saynn("She scritches her chin.")

		saynn("[say=eliza]Oh yeah, we can also extra useful research data from transformations themselves. Come to me when you think that your transformation has reached its final stage and then I can scan the result! That would give us a lot of science points![/say]")

		saynn("[say=pc]What if I don't want to try these pills on myself?[/say]")

		saynn("Eliza hums.")

		saynn("[say=eliza]Feed them to someone else then. And then bring that person to me~.[/say]")

		saynn("So you just have to find a test subject..")

		saynn("[say=pc]Alright. It's a lot so far.[/say]")

		saynn("Eliza smiles and walks up to you, her paws land on your shoulders.")

		saynn("[say=eliza]Poke around, it's not quantum physics~. Just try not to trash the place.. or I will come find you. And you don't want me to come after you~.[/say]")

		saynn("So threatening.. but also.. you can't hide your chuckle.")

		saynn("[say=eliza]Fuck, I did it again![/say]")

		saynn("Eliza steps back and spreads her arms.")

		saynn("[say=eliza]I will go back to my boring ass work shift now. Let me know if you find something interesting![/say]")

		saynn("And just like that, she leaves you alone.. in her lab.")

		saynn("Time to do some science.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "make_her_eat"):
		saynn("Your mind is still quite cloudy.. but you're trying to focus..")

		saynn("[say=pc]Didn't you say that it should take a while for effects to manifest?[/say]")

		saynn("She hums.. and then shrugs.")

		saynn("[say=eliza]That's how it should work.. Maybe something is accelerating the process for me. Might be the other drugs that I accidentally breathe in sometimes during work~.[/say]")

		saynn("Right..")

		addButton("Continue", "See what happens next", "end_tutorial")
	if(state == "eat_no_effect"):
		saynn("What could go wrong.. You grab the pill from Eliza's paw.. and throw it into your mouth.")

		saynn("[say=eliza]So eager~. I love the enthusiasm.[/say]")

		saynn("You steady your breathing and try to focus on yourself.. So far.. you don't feel any different.")

		saynn("[say=pc]How long does it take?[/say]")

		saynn("Eliza shrugs.")

		saynn("[say=eliza]DNA alteration is not a fast process.. It happens in stages too.. not gradual.. but in jumps.[/say]")

		saynn("Time passes slowly when you're so focussed.. seconds feel like minutes.")

		saynn("[say=eliza]But I think you should have felt something by now. Do you?[/say]")

		saynn("You can't say that you do.. so you shake your head.")

		saynn("[say=eliza]Aw. Not every pill is gonna work on everyone, our body is smart enough to refuse the DNA changes that it can't support. Maybe you're just already too much of a demon~.[/say]")

		saynn("You shrug.")

		saynn("[say=eliza]Or maybe your body is already being transformed by something else, hard for me to tell.. with just my eyes.[/say]")

		addButton("Continue", "See what happens next", "end_tutorial")
	if(state == "end_tutorial"):
		saynn("[say=eliza]Anyway! This is my lab.. but I will let you use it for now. There is a lot of equipment here, try not to break anything! Be a good assistant.[/say]")

		saynn("She turns out, showing you her chemistry station.")

		saynn("[say=eliza]There is where you can brew drugs, just like I did right now. You will have to supply the base fluids yourself. Donating them in the nursery sends some here but you can just fill the tanks directly.. or let me milk you~.[/say]")

		saynn("She then shows you some big machines and a computer.")

		saynn("[say=eliza]Leave the drug scanning to me, it's quite a tricky procedure.. especially with our old equipment. But if you get enough science points, you can actually upgrade it.[/say]")

		saynn("Science points.. you remember the nursery bounties giving you some.")

		saynn("[say=pc]Science points?[/say]")

		saynn("She shrugs.")

		saynn("[say=eliza]It's.. entropy mumbo jumbo nonsense, I have no idea how it works. But we can use it to upgrade our equipment and unlock new drugs and prototypes.[/say]")

		saynn("Prototypes.. that sounds interesting.")

		saynn("[say=pc]And how do I earn those science points?[/say]")

		saynn("[say=eliza]Well, by doing bounties and letting me scan new suspicious pills.[/say]")

		saynn("She scritches her chin.")

		saynn("[say=eliza]Oh yeah, we can also extra useful research data from transformations themselves. Come to me when you think that your transformation has reached its final stage and then I can scan the result! That would give us a lot of science points![/say]")

		saynn("[say=pc]What if I don't want to try these pills on myself?[/say]")

		saynn("Eliza hums.")

		saynn("[say=eliza]Feed them to someone else then. And then bring that person to me~.[/say]")

		saynn("So you just have to find a test subject..")

		saynn("[say=pc]Alright. It's a lot so far.[/say]")

		saynn("Eliza smiles and walks up to you, her paws land on your shoulders.")

		saynn("[say=eliza]Poke around, it's not quantum physics~. Just try not to trash the place.. or I will come find you. And you don't want me to come after you~.[/say]")

		saynn("So threatening.. but also.. you can't hide your chuckle.")

		saynn("[say=eliza]Fuck, I did it again![/say]")

		saynn("Eliza steps back and spreads her arms.")

		saynn("[say=eliza]I will go back to my boring ass work shift now. Let me know if you find something interesting![/say]")

		saynn("And just like that, she leaves you alone.. in her lab.")

		saynn("Time to do some science.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "eat_has_effect"):
		saynn("What could go wrong.. You grab the pill from Eliza's paw.. and throw it into your mouth.")

		saynn("[say=eliza]So eager~. I love the enthusiasm.[/say]")

		saynn("You steady your breathing and try to focus on yourself.. So far.. you don't feel any different.")

		saynn("[say=pc]How long does it take?[/say]")

		saynn("Eliza shrugs.")

		saynn("[say=eliza]DNA alteration is not a fast process.. It happens in stages too.. not gradual.. but in jumps.[/say]")

		saynn("Time passes slowly when you're so focussed.. seconds feel like minutes.")

		saynn("[say=eliza]But I think you should have felt something by now. Do you?[/say]")

		saynn("In fact.. yeah.. a slight itch.. near your forehead. You scratch it.. but the feeling doesn't go away. Your butt feels a bit funny too.")

		saynn("[say=pc]I think I do..[/say]")

		saynn("[say=eliza]Great~. I'd love to watch it but, like I said, it's a process.. might take hours.. or days.[/say]")

		saynn("All you can do is wait it seems..")

		saynn("[say=eliza]I've read that some transformations can be accelerated. You will have to figure it out yourself.[/say]")

		addButton("Continue", "See what happens next", "end_tutorial")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_biolab"):
		processTime(5*60)

	if(_action == "brewing_process"):
		processTime(5*60)
		GM.main.SCI.doUnlockTF("Demonification")

	if(_action == "eat_pill"):
		processTime(10*60)
		if(!GM.pc.getTFHolder().canStartTransformation("Demonification")):
			setState("eat_no_effect")
		else:
			GM.pc.getTFHolder().startTransformation("Demonification")
			setState("eat_has_effect")
		return

	if(_action == "no_eat"):
		processTime(3*60)

	if(_action == "make_her_eat"):
		runScene("ElizaDrugTestDemoniXScene")

	if(_action == "end_tutorial"):
		processTime(3*60)

	setState(_action)
