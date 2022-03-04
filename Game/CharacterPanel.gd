extends VBoxContainer

onready var painLabel = $PainLabel
onready var lustLabel = $LustLabel
onready var nameLabel = $NameLabel
onready var staminaLabel = $StaminaLabel
onready var statusEffectsPanel = $StatusEffectsPanel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setName(newname: String):
	nameLabel.text = newname

func setLust(newlust: int, maxlust: int = 100):
	lustLabel.text = "Lust: "+str(newlust) + "/" + str(maxlust)
	
func setPain(newpain: int, maxpain: int = 100):
	painLabel.text = "Pain: "+str(newpain) + "/" + str(maxpain)

func getStatusEffectsPanel():
	return statusEffectsPanel

func setStamina(newstamina: int, maxstamina: int = 100):
	staminaLabel.text = "Stamina: "+str(newstamina) + "/" + str(maxstamina)

func setColor(newcolor):
	nameLabel.self_modulate = newcolor
