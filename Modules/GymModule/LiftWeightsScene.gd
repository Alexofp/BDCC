extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "LiftWeightsScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.ApproachedWeightsBench)):
		endScene()
		return

func _run():

	if(state == ""):
		saynn("You approach one of the free benches. Painted metal of the frame received some scratches over the years and the padding of the seat isn’t as soft but they look alright overall. The only strange thing you notice is that all the dumbbells and barbells are leashed to the floor with a thick chain each.")

		saynn("You take a seat on the bench, deciding what you wanna do.")
		
		if(GM.pc.hasEffect(StatusEffect.WorkOut) || GM.pc.hasEffect(StatusEffect.WorkOutLight)):
			addDisabledButton("Light workout", "You already did a work out recently")
			addDisabledButton("Heavy workout", "You already did a work out recently")
		else:
			addButtonWithChecks("Light workout", "Do some dumbbell exercises", "light_workout", [], [ButtonChecks.HasStamina])
			addButtonWithChecks("Heavy workout", "Grab a heavy barbell", "heavy_workout", [], [ButtonChecks.HasStamina, [ButtonChecks.StatCheck, Stat.Strength, 10]])
		addButton("Leave", "You don't wanna do anything", "endthescene")
		GM.ES.triggerRun(Trigger.ApproachedWeightsBench)

	if(state == "light_workout"):
		# (if low strength)
		if(GM.pc.getStat(Stat.Strength) < 10):
			saynn("Your strength isn’t enough to lift super heavy things so you decide not to push yourself. You grab a pair of dumbbells and prepare yourself by straightening your posture and tensing your core muscles.")

			saynn("You try to hold your upper arms still as you begin to curl one of the weights up to your shoulder level. After that, you slowly exhale and return it back to the starting position. Then you repeat the same but with the other weight.")

			saynn("You do about 10 reps of these before you find yourself panting. You take a little breather and do another set. You look around, the few inmates around are mostly busy doing the same, pushing their body to the limit.")

			saynn("You finish your sets and set the dumbbells back where they were. Nothing like some exercises to make that blood flow faster.")

		# (if high strength)
		else:
			saynn("You have quite a powerful muscle set but that doesn’t mean you can’t push yourself more while doing something lighter. You lie down on the bench and grab a dumbbell into each hand before moving your arms to the side of each shoulder and pointing your palms away from you, hands tightly holding the weights.")

			saynn("You quickly grab some air and begin extending your elbows as you exhale and press the weights above your chest. There, you hold your arms straight for a few seconds before slowly bringing them down to the starting position.")

			saynn("You repeat this exercise about 10 times before pausing for a minute or two and doing 2 more sets. By the end of it you feel blood rushing throughout your body. You finish your exercises and set the dumbbells back where they were.")
		addButton("Leave", "Nice", "endthescene")

	if(state == "heavy_workout"):
		# (strength >= 10)

		saynn("You decide to try some very heavy exercises to test your body. You lie on the bench and grasp the bar with your hands shoulder-width apart while your feet are flat on the ground. Your hands remove the heavy barbell from its resting spot and lower it to your chest. You hold it there for a second and drive your feet hard into the floor while pressing the bar back up.")

		saynn("It’s not safe to do bench presses without a spotter but you just about manage. Better than putting your life into the hands of some convict.")

		saynn("You do reps until you start feeling yourself panting a lot. Then you take a breather and do some more sets.")

		saynn("Eventually, you stop and put the bar up to its resting spot before raising yourself to the sitting position. Yeahh, you feel blood rushing through your body to bring oxygen to your muscles.")

		addButton("Leave", "Nice", "endthescene")


func _react(_action: String, _args):
	if(_action == "light_workout"):
		processTime(60*10)
		GM.pc.addStamina(-30)
		GM.pc.addEffect(StatusEffect.WorkOutLight)
	
	if(_action == "heavy_workout"):
		processTime(60*20)
		GM.pc.addStamina(-40)
		GM.pc.addEffect(StatusEffect.WorkOut)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

