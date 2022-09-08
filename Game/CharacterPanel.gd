extends VBoxContainer

onready var nameLabel = $NameLabel
onready var statusEffectsPanel = $StatusEffectsPanel
onready var staminaBar = $StaminaBar
onready var painBar = $PainBar
onready var lustBar = $LustBar
onready var levelBar = $LevelBar

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

func updateFromCharacter(character: BaseCharacter):
	setName(character.getName())
	setPain(character.getPain(), character.painThreshold())
	setLust(character.getLust(), character.lustThreshold())
	setStamina(character.getStamina(), character.getMaxStamina())
	setColor(character.getChatColor())
	levelBar.setProgressBarValue(character.getSkillsHolder().getLevelProgress())
	levelBar.setText(str(character.getSkillsHolder().getLevel()))
