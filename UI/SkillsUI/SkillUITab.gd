extends Control

var skillID = null
var tabName = "bad tab"
onready var nameLabel = $ScrollContainer/HBoxContainer/PanelContainer/VBoxContainer/NameLabel
onready var levelBar = $ScrollContainer/HBoxContainer/PanelContainer/VBoxContainer/LevelBar
onready var descLabel = $ScrollContainer/HBoxContainer/PanelContainer/VBoxContainer/DescLabel

func _ready():
	pass

func setSkillID(newskillid):
	skillID = newskillid
	
	updateInfo()

func updateInfo():
	if(skillID == null):
		return
	var skill: SkillBase = GM.pc.getSkillsHolder().getSkill(skillID)
	if(skill == null):
		return
	
	nameLabel.text = skill.getVisibleName()
	tabName = skill.getVisibleName()
	descLabel.text = skill.getVisibleDescription()
	
	levelBar.setTextLeft("Level "+str(skill.getLevel()))
	levelBar.setText(str(skill.getExperience())+" / "+str(skill.getRequiredExperienceNextLevel())+" exp")
	levelBar.setProgressBarValue(skill.getLevelProgress())

func getTabName():
	return tabName
