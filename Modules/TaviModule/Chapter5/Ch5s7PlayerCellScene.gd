extends SceneBase

func _init():
	sceneID = "Ch5s7PlayerCellScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("Darkness.. All you see is yourself. "+str("Still wearing your uniform.. " if !GM.pc.isFullyNaked() else "")+"Still wearing that firm collar around your neck.")

		saynn("You look down at your hands and see them covered in bruises, little cuts, wounds..")

		saynn("Was it worth it?")

		saynn("[say=pc]Body will heal. I can't stop now.[/say]")

		saynn("It's not about giving up.. It's about accepting yourself..")

		saynn("[say=pc]Who are you?[/say]")

		saynn("No reaction.. Oops, the ground under your feet has disappeared, causing you to start falling.. into the deep abyss..")

		addButton("Wake up", "Only dead sleep forever", "do_wakeup")
	if(state == "do_wakeup"):
		aimCameraAndSetLocName("solitary_cell")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		saynn("You slowly open your eyes.. and find yourself chained to the ceiling.. in a dimly lit room that's behind the transparent glass.. It must be solitary.")

		saynn("Your head.. hurts a little. But that's okay.")

		saynn("Your eyes quickly scan the room.. there is only you.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence! AlphaCorp hopes that you are enjoying your stay here. Even if the road to reeducation is never easy.")

		saynn("[say=pc]Hello? Anyone?[/say]")

		saynn("You tug on the chains a little. Nah, cutting off your hands would be easier than struggling out of these ones. Makes you wonder why they leave obvious flaws in other restraints.")

		addButton("Wait", "See what happens next", "skar_walks_in")
	if(state == "skar_walks_in"):
		addCharacter("skar")
		playAnimation(StageScene.HangingDuo, "idle", {npc="skar", bodyState={naked=true}})
		saynn("Time passes..")

		saynn("You notice Skar patrolling the corridor behind the glass, making sure all the punished inmates are still there.")

		saynn("[say=pc]Hey.[/say]")

		saynn("His ears perk. He returns back to your room and stops near the glass, just watching you silently while you can't even cover yourself.")

		saynn("It's probably better to pick the right words, the guy can go away at any moment..")

		addButton("How long?", "Ask about the length of your punishment", "how_long_punishment")
		addButton("Tavi?", "Where is Tavi", "where_is_tavi")
	if(state == "how_long_punishment"):
		saynn("[say=pc]How long are you gonna keep me here?[/say]")

		saynn("He doesn't say anything. The guy is either ignoring you.. Or doesn't wanna say anything.")

		saynn("[say=pc]You gonna pull out your torture devices soon? Like last time?[/say]")

		saynn("Again, he is completely silent. Might as well try to be more mean with him. Who cares at this point..")

		addButton("Captain", "Talk about the captain's speech", "roast_skar")
	if(state == "where_is_tavi"):
		saynn("[say=pc]Where is Tavi?[/say]")

		saynn("He doesn't say anything. The guy is either ignoring you.. Or doesn't wanna say anything.")

		saynn("[say=pc]She is being tortured, isn't she? While I'm stuck here.[/say]")

		saynn("Again, he is completely silent. Might as well try to be more mean with him. Who cares at this point..")

		addButton("Captain", "Talk about the captain's speech", "roast_skar")
	if(state == "roast_skar"):
		saynn("You roll your eyes and sigh audibly.")

		saynn("[say=pc]Hope you're happy. The captain has won.[/say]")

		saynn("Skar furrows his brows slightly.")

		saynn("[say=pc]Yeah, you don't look happy. Why not? Didn't you want this war to end?[/say]")

		saynn("He is motionless, just crossing his arms.")

		saynn("[say=pc]Oh, right. I think you realized it already. Your captain doesn't care about the war. He is not trying to end it sooner. He just wants to profit off of it. Not even for credits, he got all the credits in the world. You know what he wants?[/say]")

		saynn("Skar doesn't break eye contact with you. He just.. stares.")

		saynn("[say=pc]Power. He wants more control. That's why he encourages inmates to.. fuck. And even staff. Just so he can send more troops in the future, earn himself a fancy shiny medal.[/say]")

		saynn("You can hear a subtle growling coming from him. But that's about it. At some points he starts walking away though.")

		saynn("[say=pc]You realize how many more Skars there are gonna be in the world? Broken lives? I think you do. And I think you just don't care anymore.[/say]")

		saynn("Skar stops and looks away for a second.. before leaving you alone.")

		saynn("That.. felt good.. Letting everything out like that. The guy wasn't gonna free you anyway. The best thing he can do.. is not stand in your way.")

		saynn("But what now..")

		addButton("Rest", "Might as well just gather more strength..", "do_rest_again")
	if(state == "do_rest_again"):
		removeCharacter("skar")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		playAnimation(StageScene.Sleeping, "idle")
		saynn("You spend the whole day in solitary. Skar never showed up again so you were just left alone with your thoughts. Whatever they wanted to do with Tavi.. they probably did it..")

		saynn("Sometime during the night some guards find you and unchain you from the ceiling before bringing you to your cell. You didn't quite see who it was. But at least the bed is much more comfy than.. a metal hook.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence!")

		addButton("Wake up", "Time to do something", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_wakeup"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		processTime(60*83)

	if(_action == "skar_walks_in"):
		processTime(30*60)

	if(_action == "do_rest_again"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		addMessage("New task added")

	setState(_action)
