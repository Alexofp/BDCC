extends PawnInteractionBase

func _init():
	id = "PunishInteraction"

func processTime(_howMuch:int):
	pass

func start(_pawns:Dictionary, _args:Dictionary):
	involvedPawns = {punisher = _pawns["punisher"], target = _pawns["target"]}
	setState("", "punisher")
	setLocation(getRolePawn("punisher").getLocation())

func init_text():
	return "[say=punisher]What should I do with you, hm?[/say]"

func init_actions():
	return [
		{
			id = "stocks",
			name = "Stocks",
			desc = "Do something",
			actionText = "{punisher.name} CLIPS A LEASH TO {target.name}'s NECK!",
			score = 1.0,
			args = {},
			time = 30,
		},
		{
			id = "sex",
			name = "Sex",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func init_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "stocks"):
		setState("stocks", "punisher")
	if(_id == "sex"):
		setState("beforesex", "target")

func beforesex_text():
	return "Gonna sex!"

func beforesex_actions():
	return [
		{
			id = "sex",
			name = "Sex..",
			desc = "Do something",
			score = 0.0,
			args = {},
			time = 30,
			start_sex = ["punisher", "target"],
		},
	]

func beforesex_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "sex"):
		var _sexResult = getSexResult(_args)
		
		setState("", "punisher")

func stocks_text():
	return "Pulls towards the stocks"

func stocks_actions():
	if(getLocation() != "main_punishment_spot"):
		return [
			{
				id = "gostocks",
				name = "Walk!",
				desc = "Do something",
				score = 1.0,
				args = {},
				time = 30,
			},
		]
	return [
		{
			id = "lockstocks",
			name = "Lock them up!",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 60,
		},
	]

func stocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "gostocks"):
		goTowards("main_punishment_spot")
		
	if(_id == "lockstocks"):
		#stopMe()
		affectAffection("target", "punisher", -0.1)
		setState("instocks", "punisher")

func instocks_text():
	return "Locks into stocks"

func instocks_actions():
	return [
		{
			id = "leave",
			name = "Time to go",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func instocks_do(_id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "leave"):
		stopMe()

func getAnimData() -> Array:
	if(getState() == "stocks"):
		if(getLocation() != "main_punishment_spot"):
			return [StageScene.Duo, "walk", {pc="target", npc="punisher", npcAction="walk", flipNPC=true, bodyState={leashedBy="punisher"}}]
	
	return [StageScene.Duo, "stand", {pc="target", npc="punisher"}]
