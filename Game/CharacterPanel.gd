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

func setLust(newlust: int):
	lustLabel.text = "Lust: "+str(newlust)
	
func setPain(newpain: int):
	painLabel.text = "Pain: "+str(newpain)

func getStatusEffectsPanel():
	return statusEffectsPanel

func setStamina(newstamina: int):
	staminaLabel.text = "Stamina: "+str(newstamina)

func setColor(newcolor):
	nameLabel.self_modulate = newcolor
