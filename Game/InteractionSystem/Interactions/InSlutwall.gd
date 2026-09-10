extends "res://Game/InteractionSystem/Interactions/InStocks.gd"

var useCount:int = 0
var tips:int = 0

func _init():
	id = "InSlutwall"
	slutwallMode = true

func doEquipLockedRestraintOnStart():
	getCharByRole("inmate").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("SlutwallStatic"))

func showStuckText():
	saynn("{inmate.You} {inmate.youAre} stuck in the slutwall. {inmate.YouHe} {inmate.youAreHeIs} completely helpless with {inmate.yourHis} {inmate.thick} {butt} sticking out, free for anyone to fuck..")
	saynn("The tipbox has "+getTipsAmountString()+".. There is an automatic mechanism that would unlock {inmate.youHim} automatically at 10 credits..")

func canEscapeThisInteraction() -> bool:
	return !getCharByRole("inmate").getInventory().hasLockedStaticRestraints() || (tips >= 10)

func onEscapeLockedRestraints():
	if(tips > 0):
		if(getRolePawn("inmate").isPlayer()):
			GM.pc.addCredits(int(tips))
			addMessage("You got "+getTipsAmountString()+" from the tipbox! Nice!")
		elif(getRolePawn("inmate").isSlaveToPlayer()):
			GM.pc.addCredits(int(tips))
			addMessage("Your slave "+getRoleChar("inmate").getName()+" earned you "+getTipsAmountString()+" by being in a slutwall! Nice!")
	getRoleChar("inmate").getInventory().clearStaticRestraints()

func about_to_use_text():
	if(inmateOfferedSelf):
		saynn("{user.You} {user.youVerb('agree')} to use {inmate.you}..")
		sayLine("user", "TalkSexOfferSelfAccept", {main="user", target="inmate"})
	else:
		saynn("{user.You} {user.youVerb('approach', 'approaches')} the slutwall, about to use {inmate.you}..")

	addAction("continue", "Continue", "Start the sex!", "default", 1.0, 600, {start_sex=["user", "inmate", SexType.SlutwallSex, {SexMod.DisableDynamicJoiners: true}],})

func about_to_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		var _sexResult:SexEngineResult = getSexResult(_args)
		sendSlaveryActivityEvent("inmate", "slutwallUsed", {sex=_sexResult})
		doRepEvent("inmate", "befuckedslutwall")
		setState("after_use", "user")


func after_use_text():
	saynn("{user.name} has finished using {inmate.you}..")
	saynn("The tipbox currently has.. "+getTipsAmountString()+" in it. {inmate.name} will be able to escape at 10 credits..")

	addAction("leave", "Leave", "Time to go", "default", 1.0, 60, {})
	if(!getRolePawn("user").isPlayer() || GM.pc.getCredits() > 0):
		addAction("leave_a_tip", "Leave a tip", "Leave a single credit as a tip", "help", 2.0, 60, {})
	if(!getRolePawn("user").isPlayer() || GM.pc.getCredits() >= 5):
		addAction("leave_a_big_tip", "Leave a Big Tip", "Leave whole 5 credits!", "help", 0.4, 60, {})
	if(tips > 0):
		addAction("steal_tips", "Steal tips", "Take all the credits for yourself! They won't be happy about it..", "punishMean", (0.1+(0.1*(tips-9)) if tips >= 9 else 0.05), 60, {})

func after_use_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		doRemoveRole("user")
		setState("", "inmate")
	if(_id == "leave_a_tip"):
		if(getRolePawn("user").isPlayer()):
			addMessage("You left a tip!")
			GM.pc.addCredits(-1)
		setState("after_tip", "inmate")
		tips += 1
		if(getRolePawn("inmate").isPlayer()):
			addMessage("You got a tip!")
		affectAffection("user", "inmate", 0.05)
	if(_id == "leave_a_big_tip"):
		if(getRolePawn("user").isPlayer()):
			addMessage("You left a huge ass tip!")
			GM.pc.addCredits(-5)
		setState("after_tip", "inmate")
		tips += 5
		if(getRolePawn("inmate").isPlayer()):
			addMessage("You got a huge ass tip!")
		affectAffection("user", "inmate", 0.1)
	if(_id == "steal_tips"):
		if(getRolePawn("user").isPlayer()):
			addMessage("You took all the tips!")
			GM.pc.addCredits(tips)
		setState("after_steal_tips", "inmate")
		tips = 0
		if(getRolePawn("inmate").isPlayer()):
			addMessage("Your tips got stolen!")
		affectAffection("inmate", "user", -0.2)



func about_to_shout_text():
	saynn("{inmate.You} {inmate.youVerb('wiggle')} {inmate.yourHis} body and {inmate.thick} butt, trying to catch anyone's attention..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 180, {})

func about_to_shout_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		getCharByRole("inmate").addStamina(20)
		var ignoreList:Array = []
		for charID in saverCooldowns:
			ignoreList.append(charID)
		if(!shoutForInterruptions("inmate", 4, 4, 0.5, "You notice "+getCharByRole("inmate").getName()+" wiggling their ass in the slutwall..", ignoreList)):
			setState("after_shout", "inmate")
			checkSleep()


func after_tip_text():
	saynn("Just before leaving, {user.name} decides to add to the tipbox..")
	sayLine("user", "SlutwallAddTip", {main="user", target="inmate"})
	saynn("The tipbox now has.. "+getTipsAmountString()+" in it. {inmate.name} will be able to get "+("it" if(tips == 1) else "to them")+".. after freeing {inmate.himself}..")

	addAction("continue", "Continue", "See what happens next..", "default", 1.0, 60, {})

func after_tip_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("user")
		setState("", "inmate")


func after_steal_tips_text():
	saynn("{user.name} decides to break into the tipbox and take all of it!")
	sayLine("user", "SlutwallStealCredits", {main="user", target="inmate"})
	saynn("Wow..")

	addAction("continue", "Continue", "Wow.. Here go your creds..", "default", 1.0, 60, {})

func after_steal_tips_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "continue"):
		doRemoveRole("user")
		setState("", "inmate")


func getAnimData() -> Array:
	if(getState() in ["save_saved", "free_slave"]):
		return [StageScene.Duo, "stand", {pc="inmate", npc="saver"}]
	if(getState() in ["about_to_save", "refusable_save_using_stamina", "refusable_save_using_key", "refused_save", "refused_save_offered_self", "save_after_help"]):
		return [StageScene.SlutwallSex, "tease", {pc="inmate", npc="saver"}]
	if(getState() in ["about_to_use", "after_use", "after_tip"]):
		return [StageScene.SlutwallSex, "tease", {pc="inmate", npc="user"}]
	return [StageScene.Slutwall, "idle", {pc="inmate"}]

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "inmate"):
		if(getState() in ["about_to_use", "after_use"]):
			return "{inmate.name} is being used by {user.name}.."
		if(getState() in ["about_to_save", "refusable_save_using_stamina", "refusable_save_using_key", "save_after_help"]):
			return "{inmate.name} is being saved by {saver.name}.."
		return "{inmate.name} is stuck in a slutwall.."
	if(_role == "user"):
		return "{user.name} is using {inmate.name}."
	if(_role == "saver"):
		return "{saver.name} is trying to free {inmate.name} from the slutwall."
	return .getPreviewLineForRole(_role)

func getTipsAmountString() -> String:
	return (str(tips)+" credit"+("" if(tips == 1) else "s"))

func saveData():
	var data = .saveData()

	data["useCount"] = useCount
	data["tips"] = tips
	return data

func loadData(_data):
	.loadData(_data)

	useCount = SAVE.loadVar(_data, "useCount", 0)
	tips = SAVE.loadVar(_data, "tips", 0)

