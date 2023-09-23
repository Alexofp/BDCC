extends Control

onready var skillsContainer = $ScrollContainer/VBoxContainer/SkillsContainer
onready var basePerksInfo = $ScrollContainer/VBoxContainer/BasePerksInfo
onready var basePerksLabel = $ScrollContainer/VBoxContainer/BasePerksInfo/BasePerksLabel
var skillOverviewPanelScene = preload("res://UI/SkillsUI/SkillOverviewPanel.tscn")

signal openPerksButton(skillID)
signal openBasePerks

func updateSkills():
	Util.delete_children(skillsContainer)
	
	var skills = GM.pc.getSkillsHolder().getSkills()
	for skillID in skills:
		var skillPanel = skillOverviewPanelScene.instance()
		skillsContainer.add_child(skillPanel)
		skillPanel.setSkillID(skillID)
		skillPanel.connect("perksButton", self, "onPerksButton")
	
	var basePerksAmount = GM.pc.getSkillsHolder().getVisibleBasePerksIDs().size()
	if(basePerksAmount == 0):
		basePerksInfo.visible = false
	else:
		basePerksLabel.text = "You have "+str(basePerksAmount)+" base perk"+("s" if basePerksAmount > 1 else "")
		basePerksInfo.visible = true

func _on_SkillsOverviewTab_visibility_changed():
	if(visible):
		updateSkills()

func onPerksButton(skillID):
	emit_signal("openPerksButton", skillID)

func _on_BasePerksButton_pressed():
	emit_signal("openBasePerks")
