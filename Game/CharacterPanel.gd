extends VBoxContainer

onready var nameLabel = $NameLabel
onready var statusEffectsPanel = $StatusEffectsPanel
onready var staminaBar = $StaminaBar
onready var painBar = $PainBar
onready var lustBar = $HBoxContainer/LustBar
onready var levelBar = $LevelBar

onready var consciousnessBar = $ConsciousnessBar
onready var arousalBar = $HBoxContainer/ArousalBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setName(newname: String):
	nameLabel.text = newname

func setLust(newlust: int, maxlust: int = 100):
	lustBar.setProgressBarValueInt(newlust, maxlust)
	lustBar.setText( str(newlust) + " / " + str(maxlust) )
	
func setPain(newpain: int, maxpain: int = 100):
	painBar.setProgressBarValueInt(newpain, maxpain)
	painBar.setText( str(newpain) + " / " + str(maxpain) )

func getStatusEffectsPanel():
	return statusEffectsPanel

func setStamina(newstamina: int, maxstamina: int = 100):
	staminaBar.setProgressBarValueInt(newstamina, maxstamina)
	staminaBar.setText( str(newstamina) + " / " + str(maxstamina) )

func setColor(newcolor):
	nameLabel.self_modulate = newcolor

func updateFromCharacterID(charID):
	var character = GlobalRegistry.getCharacter(charID)
	if(character == null):
		setName("BAD: "+str(charID))
		return
	updateFromCharacter(character)

func updateFromCharacter(character: BaseCharacter):
	if(character == null):
		setName("BAD CHARACTER")
		return
	
	setName(character.getName())
	setPain(character.getPain(), character.painThreshold())
	setLust(character.getLust(), character.lustThreshold())
	setStamina(character.getStamina(), character.getMaxStamina())
	setColor(character.getChatColor())
	levelBar.setProgressBarValue(character.getSkillsHolder().getLevelProgress())
	levelBar.setText(str(character.getSkillsHolder().getLevel()))

	character.updateEffectPanel(statusEffectsPanel)

	var arousal = character.getArousal()
	if(arousal > 0.0):
		arousalBar.visible = true
		arousalBar.setProgressBarValue(arousal)
		arousalBar.setText( str(Util.roundF(arousal*100.0))+"%" )
		lustBar.setText( str(Util.roundF(character.getLustLevel()*100.0))+"%" )
	else:
		arousalBar.visible = false
		arousalBar.setProgressBarValue(0.0)

	var consciousness = character.getConsciousness()
	if(consciousness < 1.0):
		levelBar.visible = false
		consciousnessBar.visible = true
		consciousnessBar.setProgressBarValue(consciousness)
		consciousnessBar.setText( str(Util.roundF(consciousness*100.0))+"%" )
	else:
		levelBar.visible = true
		consciousnessBar.visible = false
		consciousnessBar.setProgressBarValue(1.0)
