extends Control

var skillID = null
var tabName = "bad tab"
onready var nameLabel = $ScrollContainer/VBoxContainer/PanelContainer/VBoxContainer/NameLabel
onready var levelBar = $ScrollContainer/VBoxContainer/PanelContainer/VBoxContainer/LevelBar
onready var descLabel = $ScrollContainer/VBoxContainer/PanelContainer/VBoxContainer/DescLabel
onready var tiersContainer = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer/TiersContainer
onready var perksLabel = $ScrollContainer/VBoxContainer/PanelContainer/VBoxContainer/PerksLabel
onready var perkNameLabel = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/PerkNameLabel
onready var perkDescLabel = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/PerkDescLabel
onready var perkRequirmentsLabel = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/PerkRequirementsLabel
onready var unlockPerkButton = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/UnlockPerkButton

var perksTierScene = preload("res://UI/SkillsUI/PerksTierContainer.tscn")

var selectedPerkID

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
	tabName = skill.getShortName()
	descLabel.text = skill.getVisibleDescription()
	
	levelBar.setTextLeft("Level "+str(skill.getLevel()))
	levelBar.setText(str(skill.getExperience())+" / "+str(skill.getRequiredExperienceNextLevel())+" exp")
	levelBar.setProgressBarValue(skill.getLevelProgress())
	
	updatePerks()

func getTabName():
	return tabName

func updatePerks():
	Util.delete_children(tiersContainer)
	
	perksLabel.text = "Free perk points: "+str(GM.pc.getSkillsHolder().getFreePerkPoints(skillID))
	
	var skill: SkillBase = GM.pc.getSkillsHolder().getSkill(skillID)
	var tiers = skill.getPerkTiers()
	
	var i = 0
	for tierData in tiers:
		var perksTierUI = perksTierScene.instance()
		tiersContainer.add_child(perksTierUI)
		perksTierUI.setSkillAndTier(skill, tierData, i)
		i += 1
		
		perksTierUI.connect("perkClicked", self, "onPerkButton")

func onPerkButton(perkID):
	selectedPerkID = perkID
	updatePerkText()

func updatePerkText():
	var perkID = selectedPerkID
	if(perkID == null || perkID == ""):
		return
	var perk: PerkBase = GlobalRegistry.getPerk(perkID)
	
	perkNameLabel.text = perk.getVisibleName()
	if(GM.pc.getSkillsHolder().hasPerk(perkID)):
		perkNameLabel.text += " (Learned)"
	
	perkDescLabel.bbcode_text = perk.getVisibleDescription()
	var extraText = perk.getMoreDescription()
	if(extraText!=""):
		perkDescLabel.bbcode_text += "\n\n"+extraText
	
	var reqText = "Requirements:\n"
	var perkCost = perk.getCost()
	if(perkCost == 1):
		reqText += str(perkCost)+" perk point"
	else:
		reqText += str(perkCost)+" perk points"
	
	perkRequirmentsLabel.bbcode_text = reqText
	
	if(GM.pc.getSkillsHolder().hasPerk(perkID) || !GM.pc.getSkillsHolder().canUnlockPerk(perkID)):
		unlockPerkButton.disabled = true
	else:
		unlockPerkButton.disabled = false
	

func _on_UnlockPerkButton_pressed():
	if(selectedPerkID == null || selectedPerkID == ""):
		return
	
	if(GM.pc.getSkillsHolder().hasPerk(selectedPerkID) || !GM.pc.getSkillsHolder().canUnlockPerk(selectedPerkID)):
		return
	
	GM.pc.getSkillsHolder().addPerk(selectedPerkID)
	updatePerks()
	updatePerkText()
