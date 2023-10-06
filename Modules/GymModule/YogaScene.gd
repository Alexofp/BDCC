extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "YogaScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.ApproachedYogaMats)):
		endScene()
		return

func _run():

	if(state == ""):
		saynn("You approach the little carpets that are laid down on the floor. Nothing complicated about them but at least they look soft enough. Much better deal than doing yoga on the cold floor.")

		saynn("You step onto one of the unoccupied mats and prepare yourself.")

		if(GM.pc.hasEffect(StatusEffect.Yoga)):
			addDisabledButton("Simple poses", "You already did yoga recently")
		else:
			addButtonWithChecks("Simple poses", "Train your agility a bit", "simple_poses", [], [ButtonChecks.HasStamina])
		addButton("Leave", "You don't feel like doing yoga", "endthescene")
		GM.ES.triggerRun(Trigger.ApproachedYogaMats)

	if(state == "simple_poses"):
		playAnimation(StageScene.Yoga, "dog")
		
		saynn("No need to do anything complicated, sometimes simple is all you need.")

		saynn("You stand straight with your feet together and arms at your side. You make sure to ground your feet completely, yoga requires full body awareness and balance. Then you straighten your {pc.thick} legs and tense up your thigh muscles. As you inhale, you arch your back and extend your arms high up and then out.")

		saynn("Open chest, open heart.. you feel your whole being engaged. Even though it might look like you are just.. standing, all of your muscles are working hard to keep you at balance. After some time like that, you release your arms and instead position behind your back, palms connected, as you hold this new pose, again feeling your thighs and back working hard. So liberating.")

		saynn("Then you switch to a downward-facing dog pose, spreading your legs and leaning forward, using your hands for support.")

		saynn("You slowly exhale and let your body relax. That felt good.")
		addButton("Leave", "Nice", "endthescene")


func _react(_action: String, _args):
	if(_action == "simple_poses"):
		processTime(60*20)
		GM.pc.addStamina(-20)
		GM.pc.addEffect(StatusEffect.Yoga)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

