extends SceneBase

func _init():
	sceneID = "_LoaderTestScene"

func _run():
	if(state == ""):
		saynn("Hello world!")

		addButton("Add buff", "Add test buff", "add_buff")
		addButton("Add exp", "Add test skill exp", "add_skill_exp")
		addButton("Okay", "End this scene", "endthescene")

func _react(_action: String, _args):
	if(_action == "add_buff"):
		GM.pc.skillsHolder.addPerk("NewTestBuffPerk")
		setState("")
		return;
		
	if(_action == "add_skill_exp"):
		GM.pc.skillsHolder.addSkillExperience("TestSkill", 10)
		setState("")
		return;
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
