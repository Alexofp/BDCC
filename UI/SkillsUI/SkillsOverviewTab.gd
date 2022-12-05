extends Control

onready var skillsContainer = $ScrollContainer/VBoxContainer/SkillsContainer
var skillOverviewPanelScene = preload("res://UI/SkillsUI/SkillOverviewPanel.tscn")

signal openPerksButton(skillID)

func updateSkills():
	Util.delete_children(skillsContainer)
	
	var skills = GM.pc.getSkillsHolder().getSkills()
	for skillID in skills:
		var skillPanel = skillOverviewPanelScene.instance()
		skillsContainer.add_child(skillPanel)
		skillPanel.setSkillID(skillID)
		skillPanel.connect("perksButton", self, "onPerksButton")

func _on_SkillsOverviewTab_visibility_changed():
	if(visible):
		updateSkills()

func onPerksButton(skillID):
	emit_signal("openPerksButton", skillID)
