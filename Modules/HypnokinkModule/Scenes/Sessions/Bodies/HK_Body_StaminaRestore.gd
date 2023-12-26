extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionBodyBase.gd"

func _init():
	sceneID = HK_Sessions.BodyStaminaRestore
	
func _initScene(_args = []):
	onBody()

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		
		saynn("[say=vion]Forget for a moment where you are. Let your physical body fade from your thoughts. Disassociate from the present. As your current surroundings fade from your thoughts, instead imagine yourself in a worn, yet well maintained airlock. There is a pleasant scent in the air, familiar but not distracting.[/say]")

		saynn("You do your best to envision the scene. Little details form and fade at the edges of your imagination as your focus slides over them. A familiar display on that wall. A spacesuit rack on the other. A seat in the corner. A control panel next to the door.")

		saynn("[say=vion]At your side, there's a sturdy storage box. Take all your cares and your worries, all your troubles and anxieties, and place them in the box. They'll be safe in there until you need to take up their burden again. Until that time comes, you can just leave them in there.[/say]")

		saynn("You watch yourself as you store your problems deep within the box, one at a time. They are misshapen, dark things, and you are careful not to cut yourself on their sharp edges. In they go, one after another, and soon enough your hands are empty and the box is full.")

		saynn("[say=vion]Now... close the lid.[/say]")

		saynn("It snaps shut with a satisfying click, the edges hissing as they self-seal until the contents are needed again.")

		saynn("[say=vion]Already the memories of your problems are fading away, dissapearing from your mind. Now, push the box aside and leave it behind. You don't need it right now. It's time to step outside for a while.[/say]")

		saynn("You open a locker and take out a zero-g pack. You put it on, then reach for the gravity controls and flip the switch. Your body grow lighter, then weightless. Soon enough you're gently floating. The airlock cycles, venting the air. The door in front of you opens.")

		saynn("[say=vion]Go outside, out into that empty space, deeper into a relaxing trance. Floating away. Whichever part of the universe you always wanted to visit, there you are.[/say]")
		
		saynn("You look around, taking in the sights.")
		
		saynn("[say=vion]Here, in the void, nothing can reach you. Nothing can trouble you. You'll return in time, but that time is not now. For now... just relax. Free and content. Just drift.[/say]")
		
		addButton("Continue", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterBody()
		GM.pc.addStamina(GM.pc.getMaxStamina())
		return

	setState(_action)

