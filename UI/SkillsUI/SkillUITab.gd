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
onready var unlockPerkButton = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/UnlockPerkButton
onready var togglePerkButton = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/TogglePerkButton

var perksTierScene = preload("res://UI/SkillsUI/PerksTierContainer.tscn")

var selectedPerkID

func _ready():
	unlockPerkButton.visible = false
	togglePerkButton.visible = false

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
	
	if(skill.scripted()):
		levelBar.setTextLeft("")
		levelBar.setText("")
		levelBar.setProgressBarValue(0)
	else:
		levelBar.setTextLeft("Level "+str(skill.getLevel()))
		levelBar.setText(str(skill.getExperience())+" / "+str(skill.getRequiredExperienceNextLevel())+" exp")
		levelBar.setProgressBarValue(skill.getLevelProgress())
	
	updatePerks()

func getTabName():
	return tabName

func updatePerks():
	Util.delete_children(tiersContainer)
	
	var skill: SkillBase = GM.pc.getSkillsHolder().getSkill(skillID)
	if(skill == null):
		return
	
	if(skill.scripted()):
		perksLabel.text = ""
	else:
		perksLabel.text = "Free perk points: "+str(GM.pc.getSkillsHolder().getFreePerkPoints(skillID))
	
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
	elif(GM.pc.getSkillsHolder().isPerkDisabled(perkID)):
		perkNameLabel.text += " (Disabled)"
	
	perkDescLabel.bbcode_text = perk.getVisibleDescription()
	var extraText = perk.getMoreDescription()
	if(extraText!=""):
		perkDescLabel.bbcode_text += "\n\n"+extraText
	
	if(perk.unlockable()):
		var reqText = "Requirements:\n"
		var perkCost = perk.getCost()
		if(perkCost == 1):
			if(GM.pc.getSkillsHolder().getFreePerkPoints(perk.getSkillGroup()) >= perkCost):
				reqText += str(perkCost)+" perk point"
			else:
				reqText += "[color=red]"+str(perkCost)+" perk point[/color]"
		else:
			if(GM.pc.getSkillsHolder().getFreePerkPoints(perk.getSkillGroup()) >= perkCost):
				reqText += str(perkCost)+" perk points"
			else:
				reqText += "[color=red]"+str(perkCost)+" perk points[/color]"
				
		var requiredPerks = perk.getRequiredPerks()
		for requiredPerkID in requiredPerks:
			var requiredperk: PerkBase = GlobalRegistry.getPerk(requiredPerkID)
			if(requiredperk == null):
				continue
			if(GM.pc.hasPerk(requiredPerkID)):
				reqText += "\n"+str(requiredperk.getVisibleName())+" perk"
			else:
				reqText += "\n[color=red]"+str(requiredperk.getVisibleName())+" perk[/color]"
		
		perkRequirmentsLabel.bbcode_text = reqText
	else:
		perkRequirmentsLabel.bbcode_text = ""
	
	unlockPerkButton.visible = false
	togglePerkButton.visible = false
	if(GM.pc.getSkillsHolder().hasPerkDisabledOrNot(perkID)):
		if(perk.toggleable()):
			togglePerkButton.visible = true
	else:
		if(perk.unlockable()):
			unlockPerkButton.visible = true
			if(GM.pc.getSkillsHolder().canUnlockPerk(perkID)):
				unlockPerkButton.disabled = false
			else:
				unlockPerkButton.disabled = true
	

func _on_UnlockPerkButton_pressed():
	GlobalTooltip.resetTooltips()
	if(selectedPerkID == null || selectedPerkID == ""):
		return
	
	if(GM.pc.getSkillsHolder().hasPerk(selectedPerkID) || !GM.pc.getSkillsHolder().canUnlockPerk(selectedPerkID)):
		return
	
	GM.pc.getSkillsHolder().addPerk(selectedPerkID)
	GlobalRegistry.getPerk(selectedPerkID).runOnceWhenLearned()
	updatePerks()
	updatePerkText()


func _on_TogglePerkButton_pressed():
	GlobalTooltip.resetTooltips()
	if(selectedPerkID == null || selectedPerkID == ""):
		return
	
	GM.pc.getSkillsHolder().togglePerk(selectedPerkID)
	updatePerks()
	updatePerkText()
