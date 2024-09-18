extends PawnInteractionBase

func _init():
	id = "NurseSave"

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("nurse", _pawns["nurse"])
	doInvolvePawn("inmate", _pawns["inmate"])
	setState("", "nurse")

func init_text():
	saynn("{nurse.name} arrives and checks {inmate.your} state..")
	saynn("After that, {nurse.he} {nurse.verb('unfold')} a stretcher and begins securing the unconscious person onto it..")

	addAction("medbay", "To medbay", "Time to go..", "default", 1.0, 120, {})

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "medbay"):
		setState("moving_to_medical", "nurse")


func moving_to_medical_text():
	saynn("{nurse.name} pushes the stretcher with {inmate.you} on it to the medical wing!")

	addAction("medbay", "To medbay", "Push push push", "default", 1.0, 60, {})

func moving_to_medical_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "medbay"):
		goTowards("medical_hospitalwards")
		if(getLocation() == "medical_hospitalwards"):
			setState("in_wards", "nurse")


func in_wards_text():
	saynn("{nurse.name} places {inmate.you} in one of the hospital beds for recovery..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 120, {})

func in_wards_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		if(getRolePawn("inmate").isPlayer()):
			setState("in_wards_pc", "inmate")
			doRemoveRole("nurse")
		else:
			var inpawn = getRolePawn("inmate")
			stopMe()
			inpawn.deleteMe()


func in_wards_pc_text():
	saynn("Time to rest..")

	addAction("rest", "Rest", "Try to recover..", "default", 1.0, 90, {})

func in_wards_pc_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "rest"):
		setState("in_wards_pc2", "inmate")


func in_wards_pc2_text():
	saynn("The nurse leaves you when one of the doctors arrive..")
	saynn("They check you and then inject you with some kind of syringe..")
	saynn("You're slowly recovering..")

	addAction("rest", "Rest", "Try to rest..", "default", 1.0, 3600, {})

func in_wards_pc2_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "rest"):
		setState("in_wards_pc3", "inmate")
		var theChar = getRoleChar("inmate")
		theChar.addPain(-theChar.getPain())
		theChar.addStamina(theChar.getMaxStamina())
		setLocation("med_lobbyne")


func in_wards_pc3_text():
	saynn("Eventually you come to senses..")
	saynn("When you do, nurses bring you back into the medical lobby and send you off..")

	addAction("go", "Go", "It's time to go..", "default", 1.0, 60, {})

func in_wards_pc3_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "go"):
		stopMe()


func getAnimData() -> Array:
	if(getState() in ["in_wards", "in_wards_pc", "in_wards_pc2", "in_wards_pc3"]):
		return [StageScene.Sleeping, "sleep", {pc="inmate"}]
	if(getState() == ""):
		return [StageScene.SexStart, "defeated", {pc="nurse", npc="inmate"}]
	return [StageScene.Solo, "jog", {pc="nurse"}]
	
func getPreviewLineForRole(_role:String) -> String:
	if(_role == "inmate"):
		return "{inmate.name} is unconscious and being transported to medical by {nurse.name}.."
	if(_role == "nurse"):
		return "{nurse.name} is pushing a stretcher with {inmate.name} to medical."
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	if(_role == "nurse"):
		return RoomStuff.PawnActivity.Help
	else:
		return RoomStuff.PawnActivity.Unconscious

